# Agent Playground

A Ruby on Rails 8.1 web application built with PostgreSQL and the Hotwire stack.

## Requirements

- Ruby 3.2.2
- PostgreSQL 17
- Bundler

Or alternatively:

- Docker and Docker Compose

## Local Development Setup

### Option 1: Native Setup

1. **Install Ruby 3.2.2** using a version manager like [rbenv](https://github.com/rbenv/rbenv) or [asdf](https://asdf-vm.com/):

   ```sh
   rbenv install 3.2.2
   ```

2. **Install PostgreSQL 17**:

   ```sh
   # macOS (Homebrew)
   brew install postgresql@17

   # Ubuntu/Debian
   sudo apt install postgresql-17
   ```

3. **Create the database user**:

   ```sh
   createuser -s mar8
   ```

   The app expects a PostgreSQL user `mar8` with password `password` by default (configured in `config/database.yml` via `POSTGRES_USER` and `POSTGRES_PASSWORD` environment variables).

4. **Set up the application**:

   ```sh
   bin/setup
   ```

   This will install gem dependencies, prepare the database, and start the development server. To skip starting the server automatically:

   ```sh
   bin/setup --skip-server
   ```

5. **Start the development server** (if you used `--skip-server`):

   ```sh
   bin/dev
   ```

6. Visit **http://localhost:3000**. The health check endpoint is available at `/up`.

### Option 2: Docker Compose

1. **Start all services**:

   ```sh
   docker compose up
   ```

   This starts PostgreSQL and the Rails application. The `RAILS_MASTER_KEY` environment variable must be set (or available in `config/master.key`).

2. **Rebuild after changes** to the Gemfile or Dockerfile:

   ```sh
   docker compose up --build
   ```

3. **Stop and remove containers**:

   ```sh
   docker compose down
   ```

4. Visit **http://localhost:3000**.

## Running Tests

```sh
# Run unit and integration tests
bin/rails test

# Run system tests (requires a browser driver)
bin/rails test:system
```

## Linting and Security

```sh
# Ruby style checks
bin/rubocop

# Security analysis
bin/brakeman --no-pager

# Gem vulnerability audit
bin/bundler-audit

# JavaScript dependency audit
bin/importmap audit
```

You can run the full CI pipeline locally:

```sh
ruby config/ci.rb
```

## Tech Stack

- **Framework**: Rails 8.1 with Propshaft asset pipeline
- **Database**: PostgreSQL 17
- **Web Server**: Puma (with Thruster HTTP proxy in production)
- **Frontend**: Hotwire (Turbo + Stimulus) via Importmap
- **Background Jobs**: Solid Queue (database-backed)
- **Caching**: Solid Cache (database-backed)
- **WebSockets**: Solid Cable (database-backed)
- **Deployment**: Kamal with Docker

## Configuration

Key environment variables:

| Variable | Default | Description |
|---|---|---|
| `DB_HOST` | `localhost` | PostgreSQL host |
| `POSTGRES_USER` | `mar8` | PostgreSQL username |
| `POSTGRES_PASSWORD` | `password` | PostgreSQL password |
| `RAILS_MAX_THREADS` | `5` | Puma thread pool size |
| `PORT` | `3000` | Server port |
| `RAILS_MASTER_KEY` | — | Decryption key for credentials (required in production) |
