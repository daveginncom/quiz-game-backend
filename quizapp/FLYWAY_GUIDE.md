# Flyway Migration File Naming Convention

Flyway uses versioned migration files with a specific naming pattern:

## Pattern: `V{version}__{description}.sql`

- **V** - Prefix (uppercase V)
- **{version}** - Version number (e.g., 1, 2, 1.1, 2023.11.29)
- **__** - Double underscore separator
- **{description}** - Description (spaces replaced with underscores)
- **.sql** - File extension

## Examples:
- `V1__Create_quiz_tables.sql`
- `V2__Insert_sample_quiz.sql`
- `V3__Add_user_authentication.sql`
- `V4__Add_quiz_categories.sql`

## Migration Types:

### Versioned Migrations (V)
- Run once in order
- Cannot be modified after applied
- Used for schema changes and data migrations

### Repeatable Migrations (R)
- Run whenever their checksum changes
- Pattern: `R__{description}.sql`
- Used for views, procedures, functions

## Best Practices:

1. **Never modify applied migrations** - Create a new migration instead
2. **Use sequential versions** - V1, V2, V3...
3. **Keep migrations focused** - One logical change per migration
4. **Test rollback strategies** - Have a plan to undo changes
5. **Use transactions** - Most DDL in PostgreSQL is transactional

## Adding New Migrations:

To add a new migration:
1. Create a new file in `src/main/resources/db/migration/`
2. Name it with the next version number
3. Write your SQL statements
4. Restart the application (Flyway runs on startup)

## Flyway Commands (via Maven):

These commands use the Flyway Maven plugin configuration in `pom.xml`:

```bash
# See migration status
./mvnw flyway:info

# Migrate to latest version
./mvnw flyway:migrate

# Validate migrations
./mvnw flyway:validate

# Clean database (use with caution!)
./mvnw flyway:clean
```

**Important:** If you're not using Dev Containers, update the database URL in `pom.xml` from `postgresdb` to `localhost`:

```xml
<configuration>
    <url>jdbc:postgresql://localhost:5432/postgres</url>
    <!-- Change postgresdb ↑ to localhost for standalone PostgreSQL -->
</configuration>
```

These CLI commands are separate from Spring Boot's automatic migrations - the app still runs migrations on startup using `application.properties`.
