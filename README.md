# CTK Terraform Infrastructure

This repository manages the Azure infrastructure for the CTK project using Terraform.

## Architecture

The infrastructure is organized into three main components:

- **`shared/`**: Shared resources used by all environments (ACR)
- **`dev/`**: Development environment
- **`prod/`**: Production environment

### Architecture Diagrams

The architecture is documented using [D2 diagrams](https://d2lang.com/) located in the `diagrams/` directory. These diagrams are automatically built and updated when changes are made to the D2 files.

- **Main Diagram**: `diagrams/main.d2` - Complete production architecture overview
- **Module Diagrams**: Individual component diagrams in `diagrams/` directory
  - `shared.d2` - Shared resources (ACR)
  - `network.d2` - Virtual network and subnets
  - `database.d2` - Cosmos PostgreSQL database
  - `container_environment.d2` - Container App Environment
  - `container_apps.d2` - Web app and microservices
  - `supporting_services.d2` - Key Vault, Storage, Monitoring
  - `identity.d2` - Azure AD authentication

The diagrams are automatically compiled to SVG on every pull request and available as workflow artifacts.

## Deployment Order

**IMPORTANT**: You must deploy the shared infrastructure first, then the environment-specific infrastructure.

### 1. Deploy Shared Infrastructure

The shared infrastructure includes the Azure Container Registry that both dev and prod environments use.

```bash
just init shared
just plan shared -out ./shared.plan
just apply shared ./shared.plan
```

### 2. Deploy Environment-Specific Infrastructure

After the shared infrastructure is deployed, you can deploy dev and prod environments.

#### Development Environment

```bash
just init dev
just plan dev -out ./dev.plan
just apply dev ./dev.plan
```

#### Production Environment

```bash
just init prod
just plan prod -out ./prod.plan
just apply prod ./prod.plan
```

## Shared Resources

### Azure Container Registry (ACR)

- **Name**: `acrctkshared`
- **Resource Group**: `rg-ctk-shared`
- **Purpose**: Stores container images for all environments

Both dev and prod environments pull images from this shared registry using:

- System-assigned managed identities
- AcrPull role assignments
