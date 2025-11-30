# Quiz Game Backend - PostgreSQL Setup

## Overview

This application uses **Flyway** for database migrations with PostgreSQL. All database schema changes are managed through versioned SQL files.

## Quick Start

### Using Azure Dev Container (Recommended)

If you're using the Dev Container (VS Code with Dev Containers extension):

**PostgreSQL is already running!** The Dev Container automatically starts PostgreSQL 17 with these settings:
- Host: `postgresdb`
- Port: `5432`
- Database: `postgres`
- User: `postgres`
- Password: `postgres`

Just run the application:
```bash
cd /workspaces/java-postgres/quizapp
./mvnw spring-boot:run
```

### Using Standalone PostgreSQL Container

If you're not using Dev Containers:

```bash
docker run --name quiz-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 \
  -d postgres:17
```

Update `application.properties` to use `localhost` instead of `postgresdb`:
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/postgres
```

### Build and Run the Application

```bash
cd /workspaces/java-postgres/quizapp
./mvnw clean package
java -jar target/quizapp-0.0.1-SNAPSHOT.jar
```

On startup, Flyway will automatically:
- Create the database schema (quizzes, questions, choices tables)
- Insert sample quiz data

### 3. Test the API

```bash
# Get all quizzes
curl http://localhost:8080/api/quizzes

# Get specific quiz
curl http://localhost:8080/api/quizzes/1
```

## Database Migrations

### Migration Files Location
`src/main/resources/db/migration/`

### Current Migrations
- **V1__Create_quiz_tables.sql** - Creates tables and indexes
- **V2__Insert_sample_quiz.sql** - Inserts British America quiz data

### Adding New Migrations

1. Create a new file following the naming pattern: `V{number}__{description}.sql`
   
   Example: `V3__Add_quiz_categories.sql`

2. Write your SQL changes:
   ```sql
   ALTER TABLE quizzes ADD COLUMN category VARCHAR(100);
   CREATE INDEX idx_quizzes_category ON quizzes(category);
   ```

3. Restart the application - Flyway runs migrations automatically on startup

### Migration Best Practices

✅ **DO:**
- Use sequential version numbers (V1, V2, V3...)
- Keep migrations focused on one logical change
- Test migrations locally before committing
- Include rollback notes in comments

❌ **DON'T:**
- Modify existing migration files after they've been applied
- Skip version numbers
- Put multiple unrelated changes in one migration
- Forget to commit migration files

## Database Schema

### Tables

**quizzes**
- `id` - Primary key
- `title` - Quiz title
- `created_at` - Timestamp
- `updated_at` - Timestamp

**questions**
- `id` - Primary key
- `quiz_id` - Foreign key to quizzes
- `question_text` - The question
- `question_order` - Display order
- `created_at` - Timestamp

**choices**
- `id` - Primary key
- `question_id` - Foreign key to questions
- `choice_text` - Answer choice text
- `is_correct` - Boolean flag
- `choice_order` - Display order
- `created_at` - Timestamp

## Flyway Commands

You can run Flyway commands directly from the command line:

```bash
# View migration status
./mvnw flyway:info

# Run migrations manually
./mvnw flyway:migrate

# Validate migrations
./mvnw flyway:validate

# Clean database (DANGEROUS - removes all data!)
./mvnw flyway:clean
```

**Note:** These commands use the Flyway Maven plugin configuration in `pom.xml`. If you're **not using Dev Containers**, you need to update the database URL in `pom.xml`:

```xml
<plugin>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-maven-plugin</artifactId>
    <configuration>
        <!-- Change 'postgresdb' to 'localhost' for standalone PostgreSQL -->
        <url>jdbc:postgresql://localhost:5432/postgres</url>
        <user>postgres</user>
        <password>postgres</password>
    </configuration>
</plugin>
```

## Configuration

### Application Configuration

Database settings in `src/main/resources/application.properties` (used by Spring Boot at runtime):

**For Dev Container:**
```properties
spring.datasource.url=jdbc:postgresql://postgresdb:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=postgres

spring.flyway.enabled=true
spring.flyway.locations=classpath:db/migration
spring.flyway.baseline-on-migrate=true
```

**For Standalone PostgreSQL:**
```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=postgres

spring.flyway.enabled=true
spring.flyway.locations=classpath:db/migration
spring.flyway.baseline-on-migrate=true
```

### Maven Plugin Configuration

Flyway CLI commands (`./mvnw flyway:*`) use the configuration in `pom.xml`:

**For Dev Container (default):**
```xml
<plugin>
    <groupId>org.flywaydb</groupId>
    <artifactId>flyway-maven-plugin</artifactId>
    <configuration>
        <url>jdbc:postgresql://postgresdb:5432/postgres</url>
        <user>postgres</user>
        <password>postgres</password>
    </configuration>
</plugin>
```

**For Standalone PostgreSQL:**
- Change `postgresdb` to `localhost` in the `<url>` element in `pom.xml`

## Troubleshooting

### Using Dev Container

**PostgreSQL connection fails:**
```bash
# Check if PostgreSQL container is running
docker ps | grep postgresdb

# View PostgreSQL logs
docker logs postgresdb

# Restart the Dev Container
# Use Command Palette: "Dev Containers: Rebuild Container"
```

### Using Standalone PostgreSQL

**PostgreSQL not connecting:**
```bash
# Check if container is running
docker ps | grep quiz-postgres

# View container logs
docker logs quiz-postgres

# Restart container
docker restart quiz-postgres

# Or recreate completely
docker rm -f quiz-postgres
docker run --name quiz-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 \
  -d postgres:17
```

### General Troubleshooting

**Migration failed:**
```bash
# View Flyway schema history
docker exec -it postgresdb psql -U postgres -d postgres -c "SELECT * FROM flyway_schema_history;"

# If needed, repair Flyway metadata
cd /workspaces/java-postgres/quizapp
./mvnw flyway:repair
```

**Reset database completely (Dev Container):**
```bash
# This will delete all data and restart fresh
docker volume rm java-postgres_postgres-data
# Then rebuild the Dev Container
```

## Development Workflow

1. Make schema changes via new migration files
2. Test locally with `docker-compose up -d`
3. Verify migrations run successfully
4. Commit both code and migration files together
5. Deploy - Flyway will auto-migrate production database

## Additional Resources

- [Flyway Documentation](https://flywaydb.org/documentation/)
- [Spring Boot + Flyway Guide](https://docs.spring.io/spring-boot/docs/current/reference/html/howto.html#howto.data-initialization.migration-tool.flyway)
