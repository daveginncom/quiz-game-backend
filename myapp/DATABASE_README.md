# Quiz Game Backend - PostgreSQL Setup

## Overview

This application uses **Flyway** for database migrations with PostgreSQL. All database schema changes are managed through versioned SQL files.

## Quick Start

### 1. Start PostgreSQL Database

```bash
cd /workspaces/java-postgres/myapp
docker-compose up -d
```

This starts a PostgreSQL container with:
- Database: `quizdb`
- User: `postgres`
- Password: `postgres`
- Port: `5432`

### 2. Build and Run the Application

```bash
./mvnw clean package
java -jar target/myapp-0.0.1-SNAPSHOT.jar
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

## Configuration

Database settings in `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/quizdb
spring.datasource.username=postgres
spring.datasource.password=postgres

spring.flyway.enabled=true
spring.flyway.locations=classpath:db/migration
spring.flyway.baseline-on-migrate=true
```

## Troubleshooting

### PostgreSQL not connecting
```bash
# Check if container is running
docker ps

# View container logs
docker logs quiz-postgres

# Restart container
docker-compose restart
```

### Migration failed
```bash
# View Flyway schema history
docker exec -it quiz-postgres psql -U postgres -d quizdb -c "SELECT * FROM flyway_schema_history;"

# If needed, repair Flyway metadata
./mvnw flyway:repair
```

### Reset database completely
```bash
docker-compose down -v
docker-compose up -d
./mvnw spring-boot:run
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
