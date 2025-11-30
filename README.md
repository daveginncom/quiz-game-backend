# Quiz Game Backend

A production-ready REST API for a quiz game application built with **Spring Boot 4.0**, **PostgreSQL**, and **Flyway** for database migrations. The application is containerized and deployed to **Azure Container Apps** using **Terraform** for infrastructure as code.

## 🏗️ Architecture

- **Backend**: Spring Boot 4.0 (Java 21)
- **Database**: PostgreSQL with Flyway migrations
- **Infrastructure**: Azure Container Apps, Azure Container Registry, Azure Database for PostgreSQL
- **CI/CD**: GitHub Actions with automated testing and deployment
- **IaC**: Terraform for Azure infrastructure provisioning

## 🚀 Quick Start

### Prerequisites

- Java 21
- Maven 3.9+
- Docker (for local PostgreSQL)
- Azure CLI (for deployment)
- Terraform 1.6+ (for infrastructure)

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/daveginncom/quiz-game-backend.git
   cd quiz-game-backend
   ```

2. **Start PostgreSQL**
   ```bash
   cd quizapp
   docker-compose up -d
   ```

3. **Run the application**
   ```bash
   ./mvnw spring-boot:run
   ```

4. **Test the API**
   ```bash
   curl http://localhost:8080/api/quizzes
   ```

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
- `POSTGRES_ADMIN_PASSWORD` - PostgreSQL admin password

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

- PostgreSQL connections require SSL
- Secrets stored in Azure Container App environment
- Firewall rules restrict database access
- GitHub Actions uses service principal with limited permissions
- Tests run on pull requests to prevent merging broken code

See [CI/CD Security Best Practices](.github/workflows/README.md#security-best-practices) for production hardening.

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
- **PostgreSQL won't start**: Check Docker is running (`docker ps`)
- **Migrations fail**: Reset database with `docker-compose down -v && docker-compose up -d`
- **Tests fail**: Ensure H2 is in test dependencies and `@ActiveProfiles("test")` is present

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
