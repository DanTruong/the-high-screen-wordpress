# The High Screen — WordPress

A WordPress implementation of **The High Screen**, a former sports and entertainment publication originally active from 2014–2015.

This repository is part of a larger project to preserve and modernize The High Screen using different web development architectures. The **Jekyll implementation is the flagship version of the project** and serves as the primary archive and reference implementation for the site's history, preserved content, and overall modernization effort.

This repository explores the same site from a different perspective: rebuilding The High Screen as a **WordPress-based CMS application** using PHP, MariaDB, Docker, and eventually a React front end.

## About the Project

The High Screen was originally built on WordPress and hosted using traditional shared web hosting. After the publication became inactive, maintaining paid hosting and an aging WordPress installation no longer made practical sense.

The site was eventually migrated to Jekyll and GitHub Pages, allowing its articles to remain available as a static archive without requiring a database or traditional web server.

That Jekyll implementation has since become the primary version of The High Screen project.

Rather than duplicate the complete project history here, see the **The High Screen — Jekyll** repository for additional background on the original publication, its preservation, and the broader modernization project.

This repository returns The High Screen to WordPress as a modern development exercise. Instead of simply restoring the original installation, the goal is to demonstrate how the archived content can be represented through a reproducible WordPress development environment and used as the backend for a modern web application.

## WordPress Implementation

This version uses:

- **WordPress 7.1**
- **PHP 8.3**
- **MariaDB 11.8**
- **Docker**
- **Docker Compose**
- **Bootstrap 5.3.8**
- **React** *(planned front-end integration)*

WordPress and MariaDB run as separate Docker containers connected through a dedicated Docker network.

The repository also includes a database seed containing the archived WordPress content and configuration. When the environment is created from scratch, MariaDB automatically imports the included SQL files.

This restores the WordPress database with the site's existing:

- Posts
- Authors and users
- Categories and taxonomy
- WordPress configuration

As a result, a fresh Docker environment starts as an already-configured copy of The High Screen rather than presenting the normal WordPress installation wizard.

## Relationship to the Jekyll Version

The Jekyll repository should be considered the **flagship implementation and primary archive of The High Screen**.

The repositories serve different purposes:

| Implementation | Purpose |
| --- | --- |
| **Jekyll** | Flagship version and static archive of the original publication |
| **WordPress** | CMS implementation using WordPress, PHP, MariaDB, and Docker |
| **Django** | Full-stack implementation using Python, Django, and a relational database |

The objective is not to maintain three separate copies of the project's documentation. Shared historical context and preservation details belong primarily with the Jekyll project, while this repository documents the architecture and development workflow specific to the WordPress implementation.

## Running Locally

The WordPress environment is designed to run locally using Docker Compose. Docker Compose manages both the WordPress application and its MariaDB database, allowing the complete environment to be started without manually installing PHP, MariaDB, or WordPress.

### Requirements

Install:

- Git
- Docker Desktop or another Docker installation with Docker Compose support

Docker Desktop includes Docker Compose on Windows and macOS.

### Clone the Repository

```bash
git clone <repository-url>
cd the-high-screen-wordpress
```

### Start the Environment

Run:

```bash
docker compose up -d
```

Docker Compose will:

1. Pull the required WordPress and MariaDB images.
2. Create the WordPress and database containers.
3. Create the required Docker network and persistent volumes.
4. Initialize MariaDB.
5. Import the included WordPress database on the first run.
6. Start WordPress after the database becomes available.

Once initialization has completed, open:

```text
http://localhost:8080
```

The High Screen should load directly without requiring the normal WordPress setup process.

The WordPress administration interface is available at:

```text
http://localhost:8080/wp-admin/
```

## Stopping the Environment

To stop and remove the running containers:

```bash
docker compose down
```

The database and WordPress files are stored in Docker volumes, so they remain available the next time the environment is started.

Start it again with:

```bash
docker compose up -d
```

## Resetting the Environment

To completely reset the local environment and rebuild it from the repository's original database seed:

```bash
docker compose down -v
docker compose up -d
```

The `-v` option removes the persistent Docker volumes.

**Warning:** This deletes changes made to the local WordPress database and restores the site from the included SQL seed the next time the containers are created.

This command is useful when testing whether the repository can successfully provision The High Screen from scratch.

## Database Initialization

The MariaDB container mounts the repository's `db-init` directory into:

```text
/docker-entrypoint-initdb.d
```

On the first creation of the database volume, MariaDB processes the SQL files in that directory and reconstructs the WordPress database.

The SQL seed represents an already-installed WordPress site. This is what allows the Docker environment to bypass WordPress's initial site configuration screen.

Database initialization only occurs when the MariaDB data volume is empty. Restarting an existing environment does **not** repeatedly import the SQL files.

## Development Direction

The WordPress installation currently provides the CMS and database layer for this implementation of The High Screen.

A future phase of the project will use the **WordPress REST API** to expose content to a React-based front end. WordPress will remain responsible for content management while React handles presentation and interaction.

This allows the project to demonstrate a modern **headless WordPress architecture** while preserving the same underlying content represented by the flagship Jekyll implementation.

## Project Status

The Docker-based WordPress environment and database provisioning process are complete.

Planned development includes:

- WordPress REST API integration
- React front-end development
- Shared visual design with the other implementations
- WordPress-specific theme and CMS customization

For the complete history and archival implementation of The High Screen, refer to the **The High Screen — Jekyll** project.