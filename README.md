# docker-basic-project

This project demonstrates fundamental Docker concepts by containerizing a minimal Node.js HTTP server.
The focus is on understanding Docker images, containers, runtime configuration, logging, and health checks.

The application itself is intentionally simple. The goal is to show correct Docker usage, not application complexity.

---

## Project Goals

- Understand the difference between **Docker images** and **containers**
- Build a Docker image from a Dockerfile
- Run containers with proper port mapping
- Configure applications at **runtime** using environment variables
- Work with Docker logs and detached containers
- Use Docker **HEALTHCHECK** to determine service health

---

## Prerequisites

- Docker Desktop (Linux containers)
- No local Node.js installation required

---

## Project Structure
```
docker-basic-project/
├── app/
│ ├── server.js
│ └── package.json
├── Dockerfile
├── .dockerignore
└── README.md
```

---

## Application Overview

The application is a simple HTTP server that responds with a text message.
It reads the port from the `PORT` environment variable and falls back to `3000` if none is provided.

This allows the same Docker image to be reused with different runtime configurations.

---

## Dockerfile Overview

Key aspects of the Dockerfile:

- Uses `node:20-alpine` for a small and reproducible base image
- Runs the application inside the container
- Exposes port `3000` for documentation purposes
- Uses a **HEALTHCHECK** to verify that the HTTP service is reachable

---

## Build the Docker Image

```
docker build -t docker-basic-project:1.1 .
```

Explanation:

- `docker build` creates a Docker image

- `-t` assigns a name and version tag

- The version tag allows reproducible builds and clear image versioning.

- `.` defines the build context (current directory)

---

## Run the Container (Default Configuration)

```
docker run --rm -p 3000:3000 docker-basic-project:1.1
```

- Maps container port 3000 to host port 3000

- `--rm` automatically removes the container after it stops

Open in browser:

http://localhost:3000

---

## Run the Container with Custom Port (Runtime Configuration)

```
docker run --rm -e PORT=8080 -p 8080:8080 docker-basic-project:1.1
```

- `-e PORT=8080` sets the port at runtime

- The image itself remains unchanged

- Demonstrates separation of build-time and run-time configuration

---

## Run in Detached Mode and View Logs

```
docker run -d -p 3000:3000 --name docker-basic-project docker-basic-project:1.1
```

View logs:

```
docker logs docker-basic-project
```

Follow logs:

```
docker logs -f docker-basic-project
```

Stop and remove container:

```
docker stop docker-basic-project
docker rm docker-basic-project
```

---

## Health Check

The container defines a Docker `HEALTHCHECK` that periodically sends an HTTP request to the application.

Docker distinguishes between:

- Process running

- Service healthy

Check container status:

```
docker ps
```

Example output:

Up 2 minutes (healthy)

The health check verifies that the HTTP endpoint is reachable, not just that the Node.js process is running.

---

## Why Health Checks Matter

- Detect non-functional services

- Enable orchestration tools to react correctly

- Prevent traffic from being sent to broken containers

- Provide production-ready container behavior

---

## Key Concepts Demonstrated

- Docker image vs container

- Runtime configuration via environment variables

- Port mapping

- Container logging

- Health checks for service availability

- Clean and minimal Docker setup




