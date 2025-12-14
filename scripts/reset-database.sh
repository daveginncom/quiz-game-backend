#!/bin/bash

# Reset the local PostgreSQL database by dropping all objects and re-running Flyway migrations
# This is useful during development when iterating on migration scripts

set -e

cd "$(dirname "$0")/../quizapp"

echo "🗑️  Cleaning database (dropping all objects)..."
./mvnw flyway:clean -Dflyway.cleanDisabled=false -q 2>&1 | grep -v "^WARNING:" || true

echo "🔄 Running all migrations..."
./mvnw flyway:migrate -q 2>&1 | grep -v "^WARNING:" || true

echo "✅ Database reset complete!"
