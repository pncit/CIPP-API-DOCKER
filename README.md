# CIPP-API Docker Setup

This repository provides Docker assets to run the existing **CIPP-API** Azure Functions
application on any server without Azure dependencies. The stack uses the official
Azure Functions v4 PowerShell image and the Azurite storage emulator.

## Services

The supplied `docker-compose.yml` starts three containers:

- **azurite** – local Azure Storage emulator (blob, queue, table) on ports `10000-10002`.
- **cippapi** – Azure Functions host running the CIPP-API code.
- **nginx** – reverse proxy exposing the Functions host on `http://localhost:7071`.

A simple health-check endpoint is available at `GET /upmon` and returns `200 OK`.

## Prerequisites

- [Docker](https://www.docker.com/) and Docker Compose.
- Environment variables for the Function app configuration. Create a `.env` file
  in the repository root and supply the following keys:

```
FUNCTIONS_WORKER_RUNTIME=
FUNCTIONS_WORKER_RUNTIME_VERSION=
AzureWebJobsStorage=
ApplicationID=
ApplicationSecret=
RefreshToken=
TenantID=
DEV_SKIP_BPA_TIMER=
DEV_SKIP_DOMAIN_TIMER=
SetFromProfile=
FUNCTIONS_EXTENSION_VERSION=
```

Values remain unchanged from the original implementation. Secrets should be
managed according to your security practices.

## Usage

Build and start the stack:

```bash
docker compose up --build
```

The API will be available at [http://localhost:7071](http://localhost:7071).
Verify availability via the health-check endpoint:

```bash
curl http://localhost:7071/upmon
```

Logs from the Functions runtime are written to stdout. Azurite and Nginx use
their default logging behavior.

## Notes

These Docker assets are intended for local development or testing. Production
hardening (TLS, scaling, secure secret storage) is outside the scope of this
setup.

