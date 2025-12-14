# Quiz Game Backend

A production-ready REST API for a quiz game application built with **Spring Boot 4.0**, **PostgreSQL**, and **Flyway** for database migrations. The application is containerized and deployed to **Azure Container Apps** using **Terraform** for infrastructure as code.

## 🏗️ Architecture

- **Backend**: Spring Boot 4.0 (Java 21)
- **Database**: PostgreSQL with Flyway migrations
- **Infrastructure**: Azure Container Apps, Azure Container Registry, Azure Database for PostgreSQL, Azure Key Vault
- **Security**: Managed Identity with Azure Key Vault for zero-knowledge secret management
- **CI/CD**: GitHub Actions with automated testing and deployment
- **IaC**: Terraform for Azure infrastructure provisioning

## 🔐 Security Highlights

This application implements **zero-knowledge secret management**:

- 🎲 **Auto-Generated Passwords**: Terraform generates secure 32-character PostgreSQL passwords
- 🔒 **Azure Key Vault**: All secrets stored centrally with RBAC and audit logging
- 🆔 **Managed Identity**: Container App authenticates without credentials
- 🚫 **No Human Access**: Database password never known to developers or operators
- 📝 **Full Audit Trail**: All Key Vault access logged to Azure Monitor

**Result**: No `POSTGRES_ADMIN_PASSWORD` GitHub Secret needed!

See [Key Vault Implementation Guide](KEY_VAULT_IMPLEMENTATION.md) for complete details.

## 🚀 Quick Start

### Prerequisites

- **Docker** and **Visual Studio Code** with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- **OR** Java 21, Maven 3.9+, and PostgreSQL 16+ (for non-containerized development)
- **Azure CLI** (for deployment)
- **Terraform 1.6+** (for infrastructure)

### Local Development

#### Option 1: Azure Dev Container (Recommended)

This repository includes a complete Dev Container configuration that automatically sets up Java 21, Maven, and PostgreSQL 17.

1. **Clone the repository**
   ```bash
   git clone https://github.com/daveginncom/quiz-game-backend.git
   cd quiz-game-backend
   ```

2. **Open in Dev Container**
   - Open the folder in VS Code
   - Click the notification to "Reopen in Container" (or use Command Palette: `Dev Containers: Reopen in Container`)
   - Wait for the container to build and start (first time takes a few minutes)

3. **PostgreSQL is already running!** 
   - The Dev Container automatically starts PostgreSQL 17
   - Connection details:
     - Host: `postgresdb`
     - Port: `5432`
     - Database: `postgres`
     - User: `postgres`
     - Password: `postgres`

4. **Run the application**
   ```bash
   cd quizapp
   ./mvnw spring-boot:run
   ```

5. **Test the API**
   ```bash
   curl http://localhost:8080/api/quizzes
   ```

#### Option 2: Standalone PostgreSQL Container

If you're not using Dev Containers but want to run PostgreSQL in Docker:

```bash
docker run --name quiz-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 \
  -d postgres:17
```

Then update `quizapp/src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=postgres
```

#### What Happens on Startup

The application will automatically:
- Create the database schema via Flyway migrations
- Insert sample quiz data
- Start the REST API on port 8080

## 📁 Project Structure

```
quiz-game-backend/
├── .github/workflows/     # GitHub Actions CI/CD workflows
├── infra/                 # Terraform infrastructure code
├── quizapp/               # Spring Boot application
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/      # Application source code
│   │   │   └── resources/
│   │   │       └── db/migration/  # Flyway SQL migrations
│   │   └── test/          # Unit and integration tests
│   ├── Dockerfile         # Container image definition
│   └── pom.xml            # Maven dependencies
└── README.md              # This file
```

## 📚 Documentation

### Application Documentation
- **[Application Setup Guide](quizapp/SETUP_COMPLETE.md)** - Complete setup walkthrough with Flyway configuration
- **[Database Guide](quizapp/DATABASE_README.md)** - PostgreSQL setup, schema, and migration workflow
- **[Flyway Migration Guide](quizapp/FLYWAY_GUIDE.md)** - Migration file naming conventions and best practices
- **[Spring Boot Reference](quizapp/HELP.md)** - Official Spring Boot documentation links

### Infrastructure & Deployment
- **[Infrastructure Guide](infra/README.md)** - Terraform setup, Azure resources, and deployment instructions
- **[CI/CD Workflows](.github/workflows/README.md)** - GitHub Actions setup, secrets configuration, and troubleshooting

## 🧪 Testing

The project includes comprehensive test coverage across all layers:

- **Unit Tests**: Service layer with Mockito mocks (8 tests)
- **Integration Tests**: 
  - REST API endpoints with MockMvc (8 tests)
  - Repository/JPA operations with H2 (8 tests)

**Run tests locally:**
```bash
cd quizapp
./mvnw test
```

**Test execution:**
- ✅ Runs automatically on pull requests (prevents merging failing tests)
- ✅ Runs before deployment to main branch
- ✅ Uses H2 in-memory database with PostgreSQL compatibility mode
- ✅ **No Azure dependencies required** - Tests run without Azure Key Vault SDK

### Azure Key Vault for Production Only

The application uses a Maven profile approach to keep local development simple:

- **Local Development**: Tests and app run without Azure Key Vault dependency
- **Production Deployment**: Azure Key Vault included via `-Pazure` profile during Docker build

This ensures:
- 🚀 **Fast local testing** - No Azure SDK dependencies to load
- 🔧 **Simple setup** - No Azure credentials needed for development
- ✅ **All 24 tests pass** - Integration tests work without cloud services
- 🐳 **Production-ready** - Dockerfile automatically includes Key Vault support

## 🔄 Database Migrations

All database schema changes are managed through **Flyway** versioned migrations:

### Current Schema
- **quizzes** - Quiz metadata (title, timestamps)
- **questions** - Questions linked to quizzes (text, order)
- **choices** - Multiple choice answers (text, correct flag, order)

### Adding a Migration
1. Create `V{number}__{description}.sql` in `quizapp/src/main/resources/db/migration/`
2. Write your SQL changes
3. Restart the application - Flyway runs automatically

**Example:**
```sql
-- V3__Add_quiz_categories.sql
ALTER TABLE quizzes ADD COLUMN category VARCHAR(100);
CREATE INDEX idx_quizzes_category ON quizzes(category);
```

See the [Flyway Guide](quizapp/FLYWAY_GUIDE.md) for detailed migration instructions.

## 🚢 Deployment

### Azure Deployment (Automated)

Pushing to the `main` branch triggers automatic deployment:

1. **Tests run** - All unit and integration tests must pass
2. **Infrastructure provisioned** - Terraform creates/updates Azure resources
3. **Docker image built** - Application packaged and pushed to Azure Container Registry
4. **Database migrated** - Flyway migrations run against Azure PostgreSQL
5. **Application deployed** - Container App updated with new image

### Manual Deployment

See the [Infrastructure Guide](infra/README.md) for step-by-step manual deployment instructions.

### Required Secrets

Configure these in GitHub repository settings:

- `AZURE_CREDENTIALS` - Azure service principal JSON

**Setup Command** (one-time):
```bash
# Create service principal with Contributor role
az ad sp create-for-rbac \
  --name "github-actions-quiz-app" \
  --role contributor \
  --scopes /subscriptions/{your-subscription-id} \
  --sdk-auth

# Copy the appId from the JSON output
SP_APP_ID="<appId-from-above>"

# Add User Access Administrator role (needed for Key Vault role assignments)
az role assignment create \
  --assignee $SP_APP_ID \
  --role "User Access Administrator" \
  --scope /subscriptions/{your-subscription-id}
```

**Why two roles?**
- **Contributor**: Creates Azure resources (Container Apps, Key Vault, PostgreSQL)
- **User Access Administrator**: Manages RBAC role assignments (for Key Vault access)
- This follows least privilege principle (more secure than Owner)

**Note**: The PostgreSQL password is **automatically generated** by Terraform and stored securely in Azure Key Vault. No manual password management required!

See [CI/CD Workflows](.github/workflows/README.md) for detailed secret setup.

## 🔧 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/quizzes` | Get all quizzes with questions and choices |
| GET | `/api/quizzes/{id}` | Get specific quiz by ID |
| POST | `/api/quizzes` | Create a new quiz |
| PUT | `/api/quizzes/{id}` | Update an existing quiz |
| DELETE | `/api/quizzes/{id}` | Delete a quiz |

**Example Response:**
```json
{
  "id": 1,
  "title": "British America Quiz",
  "questions": [
    {
      "id": 1,
      "question": "What were the original 13 colonies primarily located along?",
      "questionOrder": 1,
      "choices": [
        {
          "id": 1,
          "text": "The Atlantic Coast",
          "correct": true,
          "choiceOrder": 1
        }
      ]
    }
  ]
}
```

## 🛠️ Technology Stack

- **Framework**: Spring Boot 4.0 (Spring MVC, Spring Data JPA)
- **Language**: Java 21 (LTS)
- **Database**: PostgreSQL 16
- **Migrations**: Flyway 10.x
- **Build Tool**: Maven 3.9+
- **Testing**: JUnit 5, Mockito, AssertJ, H2
- **Containerization**: Docker, Azure Container Apps
- **Infrastructure**: Terraform, Azure (ACR, PostgreSQL Flexible Server, Container Apps, Log Analytics)
- **CI/CD**: GitHub Actions

## 💰 Cost Estimate

Approximate Azure monthly costs for low-traffic deployment:

- Azure Container Registry (Basic): ~$5
- PostgreSQL Flexible Server (B1ms): ~$12
- Container Apps (pay-per-use): ~$5-20
- Log Analytics (5GB free, then $2.30/GB): ~$0-5

**Total**: ~$25-40/month

See [Infrastructure Guide](infra/README.md) for cost optimization tips.

## 🔒 Security

- **Zero-Knowledge Secrets**: PostgreSQL password auto-generated by Terraform - no human ever knows it
- **Azure Key Vault**: Centralized secret management with RBAC and audit logging
- **Managed Identity**: Container App authenticates to Key Vault without credentials
- **SSL Required**: PostgreSQL connections enforce SSL/TLS
- **Auto-Generated Passwords**: 32-character passwords with complexity requirements
- **Firewall Rules**: Restrict database access to Azure services only
- **GitHub Actions**: Service principal with limited permissions
- **Continuous Testing**: Tests run on pull requests to prevent merging broken code

See [Key Vault Implementation](KEY_VAULT_IMPLEMENTATION.md) for detailed security architecture.

## 🤝 Contributing

1. Create a feature branch from `main`
2. Make your changes
3. Add tests for new functionality
4. Open a pull request (tests will run automatically)
5. Merge after approval and passing tests

## 📝 License

This project is for educational/demonstration purposes.

## 🆘 Troubleshooting

### Local Development Issues
- **Dev Container won't start**: Ensure Docker Desktop is running and you have the Dev Containers extension installed
- **PostgreSQL won't connect**: In Dev Container, use host `postgresdb`. Outside Dev Container, use `localhost`
- **Migrations fail**: The database is automatically created by the Dev Container. Check application.properties has correct connection details
- **Tests fail**: Ensure H2 is in test dependencies and `@ActiveProfiles("test")` is present
- **Port 8080 already in use**: Stop other applications or change the port in application.properties

### Deployment Issues
- **Terraform fails**: Verify Azure credentials and check [Infrastructure Guide](infra/README.md)
- **Container won't start**: Check logs in Azure Portal or use `az containerapp logs show`
- **Database connection fails**: Verify firewall rules and connection string

See specific troubleshooting sections in:
- [Database Guide](quizapp/DATABASE_README.md) for database issues
- [Infrastructure Guide](infra/README.md) for Azure deployment issues
- [CI/CD Workflows](.github/workflows/README.md) for GitHub Actions problems

## 📮 Support

For issues and questions, please open a GitHub issue in this repository.
