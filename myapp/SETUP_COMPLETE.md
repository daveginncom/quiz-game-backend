# PostgreSQL + Flyway Setup Complete! 🎉

## What's Been Set Up

### ✅ **Flyway Migration System**
The best tool for managing database migrations with `.sql` files in Java. It:
- Runs migrations automatically on startup
- Tracks which migrations have been applied
- Ensures migrations run in order
- Is production-ready and widely used

### ✅ **Database Structure**
Your migration files are in: `src/main/resources/db/migration/`

**V1__Create_quiz_tables.sql** - Creates:
- `quizzes` table (id, title, timestamps)
- `questions` table (id, quiz_id, question_text, order)
- `choices` table (id, question_id, choice_text, is_correct, order)
- Indexes for performance

**V2__Insert_sample_quiz.sql** - Inserts:
- British America quiz with 5 sample questions

### ✅ **JPA Entities**
Updated your models to work with the database:
- `@Entity` annotations
- Foreign key relationships
- Automatic timestamp management
- JSON serialization configured

### ✅ **Spring Data JPA**
Created `QuizRepository` that provides:
- `findAll()` - Get all quizzes
- `findById(id)` - Get quiz by ID
- `save()` - Create/update quiz
- `deleteById()` - Delete quiz
- All with zero SQL code needed!

## How to Use

### Adding a New Migration

1. Create file: `V3__Your_description_here.sql`
2. Write SQL:
   ```sql
   ALTER TABLE quizzes ADD COLUMN category VARCHAR(100);
   ```
3. Restart app - migration runs automatically!

### Migration Naming Rules

**Pattern:** `V{number}__{description}.sql`

✅ Good examples:
- `V3__Add_quiz_categories.sql`
- `V4__Add_user_authentication.sql`  
- `V5__Create_scores_table.sql`

❌ Bad examples:
- `add_categories.sql` (missing V prefix and version)
- `V3-Add-categories.sql` (use underscores, not hyphens)
- `v3__add_categories.sql` (V must be uppercase)

### Important Rules

1. **Never modify existing migrations** after they run
2. **Always use sequential version numbers**
3. **Test migrations locally first**
4. **Include rollback notes** in comments if needed

## Configuration

In `application.properties`:

```properties
# Database connection
spring.datasource.url=jdbc:postgresql://localhost:5433/postgres
spring.datasource.username=vscode

# Flyway
spring.flyway.enabled=true
spring.flyway.locations=classpath:db/migration
spring.flyway.baseline-on-migrate=true
```

## Helpful Commands

```bash
# Start PostgreSQL
sudo service postgresql start

# View migration status
./mvnw flyway:info

# Run migrations manually
./mvnw flyway:migrate

# Validate migrations
./mvnw flyway:validate
```

## Why Flyway?

✅ **Simple** - Just write SQL files
✅ **Automatic** - Runs on app startup
✅ **Reliable** - Tracks what's been applied
✅ **Version Control** - Migrations live with your code
✅ **Team-Friendly** - Everyone gets same database state
✅ **Production-Ready** - Used by thousands of companies

## Alternative: Liquibase

Flyway is simpler, but Liquibase offers:
- XML/YAML/JSON formats (not just SQL)
- Better rollback support
- More complex change management

For your use case (simple SQL migrations), **Flyway is the better choice**.

## Next Steps

1. **Add more quizzes** via migration files
2. **Add features** like categories, user scores, etc.
3. **Keep migrations focused** - one logical change per file
4. **Commit migrations** with code changes

## Resources

- [Flyway Documentation](https://flywaydb.org/documentation/)
- [Spring Boot Flyway Guide](https://docs.spring.io/spring-boot/docs/current/reference/html/howto.html#howto.data-initialization.migration-tool.flyway)
- Migration examples in `FLYWAY_GUIDE.md`
