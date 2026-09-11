# The High Screen — WordPress

A headless WordPress implementation of **The High Screen**, a former sports and entertainment publication originally active from 2014–2015.

This repository is part of a larger project to preserve and modernize The High Screen using different web development architectures. The **Jekyll implementation is the flagship version of the project** and serves as the primary archive and reference implementation for the site's history, preserved content, and broader modernization effort.

This repository approaches the same content from a different direction: WordPress provides the content management system and REST API, while a separate React and Bootstrap frontend handles presentation. The complete environment is containerized with Docker Compose and served through Apache.

## About the Project

The High Screen was originally built with WordPress and hosted using traditional shared web hosting. After the publication became inactive, maintaining paid hosting and an aging WordPress installation no longer made practical sense.

The site was eventually migrated to Jekyll and GitHub Pages, allowing its articles to remain available as a static archive without requiring a database or traditional application server. That Jekyll implementation has since become the primary version of The High Screen project.

Rather than duplicate the complete history here, this repository focuses on the architecture and development workflow specific to the WordPress implementation.

Instead of restoring the original WordPress site as a traditional WordPress frontend, this version uses WordPress as a **headless CMS**. Content is managed through the familiar WordPress administrative interface and exposed through the built-in WordPress REST API. A separate frontend retrieves that content and renders the public site.

## Architecture

The application is divided into three primary services:

- **Apache frontend** — serves the public HTML, CSS, JavaScript, Bootstrap, and React application.
- **WordPress** — provides the CMS, administrative interface, PHP application layer, and REST API.
- **MariaDB** — stores the WordPress database and archived site content.

Docker Compose manages all three services on a shared internal Docker network.

The frontend Apache server is the only service exposed directly to the host. It also acts as a reverse proxy for WordPress resources such as the REST API and administrative interface.

The resulting request flow is:

```text
Browser
   |
   | localhost:8080
   v
Apache Frontend
   |
   |-- /, *.html, /assets/*
   |      -> Static React/Bootstrap frontend
   |
   |-- /wp-json/*
   |-- /wp-admin/*
   |-- /wp-login.php
   |-- /wp-content/*
   |-- /wp-includes/*
   |      -> Reverse proxy to WordPress
   |
   v
WordPress
   |
   v
MariaDB
```

This allows both the public frontend and WordPress backend to share the same origin while keeping WordPress itself isolated from the host network.

## Technology Stack

This implementation currently uses:

- **WordPress 7.1**
- **PHP 8.3**
- **MariaDB 11.8**
- **Apache HTTP Server 2.4**
- **WordPress REST API**
- **React 18**
- **Bootstrap 5.3.8**
- **Vanilla JavaScript**
- **Docker**
- **Docker Compose**

React is used without JSX, Node.js, npm, or a frontend build process. The application uses the React UMD builds and `React.createElement()` to keep the frontend lightweight and portable.

## Headless WordPress Implementation

WordPress is intentionally kept focused on content management.

Editors and administrators continue to use the standard WordPress interface for:

- Posts
- Pages
- Authors and users
- Categories
- Media
- Other CMS administration

The public-facing site does not use a custom WordPress theme. Instead, the frontend retrieves content from the built-in WordPress REST API.

Examples of resources used by the frontend include:

```text
/wp-json/wp/v2/posts
/wp-json/wp/v2/pages
/wp-json/wp/v2/categories
/wp-json/wp/v2/users
```

The React application uses these resources to dynamically build the site.

The current frontend includes:

- Latest article listings
- Individual article pages
- Category archives
- Dynamic category navigation
- Standard WordPress pages

Article and category content is retrieved directly from WordPress rather than being duplicated in the frontend.

## Apache Reverse Proxy

The frontend runs in its own Apache container.

Apache serves the files under `frontend/` while proxying WordPress-specific requests to the internal WordPress container.

For example:

```text
/
    -> frontend/index.html

/post.html?id=123
    -> frontend/post.html

/category.html?slug=features
    -> frontend/category.html

/wp-json/wp/v2/posts
    -> WordPress REST API

/wp-admin/
    -> WordPress administration
```

This provides a single public origin for both the frontend and API.

As a result, frontend JavaScript can make requests such as:

```javascript
fetch("/wp-json/wp/v2/posts?per_page=12&_embed");
```

without requiring a separate API hostname, port, or cross-origin configuration.

## Repository Structure

```text
the-high-screen-wordpress/
├── apache/
│   ├── Dockerfile
│   └── ths-proxy.conf
│
├── backend/
│   └── uploads.ini
│
├── db-init/
│   ├── 01-wp-users.sql
│   ├── 02-wp-usermeta.sql
│   ├── 03-wp-posts.sql
│   ├── 04-wp-postmeta.sql
│   ├── 05-wp-terms.sql
│   ├── 06-wp-term-taxonomy.sql
│   ├── 07-wp-termmeta.sql
│   ├── 08-wp-term-relationships.sql
│   ├── 09-wp-comments.sql
│   ├── 10-wp-commentmeta.sql
│   ├── 11-wp-links.sql
│   └── 12-wp-options.sql
│
├── frontend/
│   ├── assets/
│   │   ├── css/
│   │   └── js/
│   ├── category.html
│   ├── index.html
│   ├── page.html
│   └── post.html
│
├── .env
├── docker-compose.yml
└── README.md
```

### `apache/`

Contains the configuration for the public Apache frontend.

The Dockerfile extends the standard Apache 2.4 image by enabling the required proxy modules and loading the project's reverse-proxy configuration.

### `backend/`

Contains configuration specific to the WordPress/PHP backend.

WordPress itself is supplied by the official Docker image rather than being stored in the repository.

### `db-init/`

Contains the SQL seed used to reconstruct the WordPress database when a new MariaDB volume is initialized.

### `frontend/`

Contains the public-facing application, including HTML pages, CSS, Bootstrap, React, and application JavaScript.

## Database Seed

The repository includes a database seed containing the archived WordPress content and configuration.

When MariaDB creates a new database volume, the SQL files under `db-init/` are mounted into:

```text
/docker-entrypoint-initdb.d
```

MariaDB processes these files during its initial setup.

The seed reconstructs the existing WordPress installation, including:

- Archived articles
- Authors and users
- Categories and taxonomy
- WordPress configuration
- Supporting WordPress database records

This allows a new environment to start as an already-configured copy of The High Screen rather than presenting the normal WordPress installation wizard.

Database initialization occurs only when the MariaDB data volume is empty. Restarting an existing environment does not repeatedly import the SQL seed.

## Running Locally

### Requirements

Install:

- Git
- Docker Desktop or another Docker installation with Docker Compose support

No local installation of WordPress, PHP, MariaDB, Apache, Node.js, or npm is required.

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

1. Build the Apache frontend image.
2. Pull the required WordPress and MariaDB images.
3. Create the Docker network and persistent volumes.
4. Initialize MariaDB.
5. Import the included WordPress database seed on the first run.
6. Start WordPress after MariaDB becomes healthy.
7. Start the Apache frontend and reverse proxy.

The initial startup may take longer while MariaDB imports the database seed.

Once initialization is complete, open the site in a browser at:

```text
http://localhost:8080/
```

The WordPress administration interface is available at:

```text
http://localhost:8080/wp-admin/
```

The REST API is available through the same Apache frontend:

```text
http://localhost:8080/wp-json/wp/v2/
```

## Stopping the Environment

Stop and remove the running containers with:

```bash
docker compose down
```

The MariaDB database and WordPress files are stored in Docker volumes and remain available for the next startup.

Start the environment again with:

```bash
docker compose up -d
```

## Resetting the Environment

To completely reset the local installation and reconstruct it from the repository's database seed:

```bash
docker compose down -v
docker compose up -d
```

The `-v` option removes the persistent Docker volumes.

**Warning:** This deletes changes made to the local WordPress installation and database. MariaDB will import the original SQL seed again when the environment is recreated.

This is useful for testing whether the repository can provision a clean copy of The High Screen from scratch.

## Frontend Development

The `frontend/` directory is bind-mounted into the Apache container:

```text
./frontend -> /usr/local/apache2/htdocs
```

Changes to HTML, CSS, and JavaScript files therefore do not normally require rebuilding the Docker image. Save the frontend files and refresh the browser.

The frontend API base is configured in:

```text
frontend/assets/js/config.js
```

The application currently uses a relative REST API path:

```javascript
window.thsConfig = {
    apiBase: "/wp-json/wp/v2/"
};
```

Because Apache proxies `/wp-json/` to WordPress, the frontend does not need to know the internal WordPress container address.

Changes to the Apache Dockerfile or proxy configuration require rebuilding the frontend image:

```bash
docker compose build frontend
docker compose up -d
```

## Relationship to the Other Implementations

The High Screen modernization project uses multiple implementations to explore different approaches to web application architecture.

| Implementation | Purpose |
| --- | --- |
| **Jekyll** | Flagship implementation and static archive using Markdown, generated JSON, and React |
| **WordPress** | Headless CMS implementation using WordPress, MariaDB, REST APIs, Apache, and React |
| **Django** | Full-stack/headless implementation using Python, Django, a relational database, REST APIs, and React |

The goal is not simply to maintain three copies of the same website. Each repository demonstrates a different approach to storing, managing, serving, and presenting the same underlying publication.

The Jekyll repository remains the primary location for the historical context and preservation work surrounding The High Screen.

## Project Status

This repository is currently a **representative working implementation** of the headless WordPress architecture.

The core architecture is functional:

- Docker-based local environment
- Seeded MariaDB database
- Standard WordPress administrative backend
- WordPress REST API
- Separate Apache frontend
- Apache reverse proxy
- React-driven article listings
- Individual article rendering
- Dynamic category navigation and archives
- Shared Bootstrap-based visual design

Some frontend rendering and presentation issues remain, particularly where archived WordPress HTML is rendered by the newer frontend. These are considered ongoing refinement work rather than blockers for demonstrating the overall architecture.

The current implementation is intended to demonstrate how The High Screen can use WordPress as a conventional CMS for editors while presenting its content through an independently developed frontend.