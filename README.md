# Mar8

A Ruby on Rails 8.1 web application using SQLite3, Hotwire (Turbo + Stimulus), and the Solid stack (Solid Cache, Solid Queue, Solid Cable).

## Prerequisites

- Ruby 3.2.2
- Bundler
- SQLite3

## Local Development Setup

### Native Setup

1. **Install dependencies and prepare the database:**

   ```sh
   bin/setup --skip-server
   ```

   This installs gems, prepares the database, and clears old logs/tempfiles.

2. **Start the development server:**

   ```sh
   bin/dev
   ```

   The app will be available at [http://localhost:3000](http://localhost:3000).

   Alternatively, `bin/setup` (without `--skip-server`) will run both steps and start the server automatically.

### Docker Setup

Requires Docker and Docker Compose.

1. **Set the Rails master key:**

   ```sh
   export RAILS_MASTER_KEY=$(cat config/master.key)
   ```

2. **Start the app:**

   ```sh
   docker compose up
   ```

   The app will be available at [http://localhost:3000](http://localhost:3000).

3. **Rebuild after Gemfile or Dockerfile changes:**

   ```sh
   docker compose up --build
   ```

4. **Stop and remove containers:**

   ```sh
   docker compose down
   ```

## Running Tests

```sh
bin/rails test          # Unit and integration tests
bin/rails test:system   # System tests (requires a browser driver)
```

## CI

Run the full CI suite locally:

```sh
bin/ci
```

This runs:

- `bin/rubocop` — Ruby style checks
- `bin/bundler-audit` — Gem vulnerability audit
- `bin/importmap audit` — JavaScript dependency audit
- `bin/brakeman` — Security analysis
- `bin/rails test` — Test suite
- Seed verification

## Database

The app uses SQLite3 with separate databases for the Solid stack services (cache, queue, cable). Common database commands:

```sh
bin/rails db:prepare    # Create and migrate
bin/rails db:reset      # Drop, recreate, and seed
bin/rails db:seed       # Load seed data
```

## Deployment

The app is deployed as a Docker container using [Kamal](https://kamal-deploy.org). See `config/deploy.yml` for the deployment configuration.
