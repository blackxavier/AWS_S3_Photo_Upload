# Project1 Dockerized App

This repository contains a Dockerized setup for a simple Django app (Project1) with Nginx, PostgreSQL, and other services using Docker Compose.

## Services

### 1. Web (Django with Gunicorn)

- The `web` service is responsible for running the Django app using Gunicorn.
- It exposes the app on port 8000.
- It depends on the `db` service.
- Configuration details are provided in `.env.web` file.

### 2. Nginx

- The `nginx` service serves as the reverse proxy and handles static files.
- It depends on the `web` service.
- Static files are stored in the `static_volume_2` volume.

### 3. PostgreSQL (db)

- The `db` service uses the PostgreSQL 12 image.
- It stores data in the `project2-postgres_data_dev` volume.
- Configuration details are provided in `.env.prod.pg-admin` file.

### 4. PgAdmin

- The `pgadmin` service runs a PgAdmin container for managing PostgreSQL.
- It is accessible on port 5050.
- Configuration details are provided in `.env.prod.pg-admin` file.

### 5. Adminer

- The `adminer` service runs an Adminer container for managing databases.
- It is accessible on port 8080.

## How to Use

1. Clone the Repository:
   ```bash
   git clone https://github.com/blackxavier/AWS_S3_Photo_Upload.git
   git checkout dev
   cd AWS_S3_Photo_Upload
   docker compose -f docker-compose.prod.yml up --build
   ```
2. Checkout branch:

```
bash
   git checkout dev
   cd AWS_S3_Photo_Upload

```

3. Setup AWS IAM Keys

- Create access key and secret access key from your AWS account. Note that user associated with the access key should have permissions to access s3.
