# CTK Terraform Infrastructure

This repository manages the Azure infrastructure for the CTK project using Terraform.

## Architecture

The infrastructure is organized into three main components:

- **`shared/`**: Shared resources used by all environments (ACR)
- **`dev/`**: Development environment
- **`prod/`**: Production environment

## Prerequisites

### Required

- **Terraform ≥ 1.0** — [Install](https://developer.hashicorp.com/terraform/install)
- **Azure CLI** — [Install](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli); authenticate before running any commands:
  ```bash
  az login
  ```
- **just** — command runner used for all deployment commands ([github.com/casey/just](https://github.com/casey/just))

### Azure State Backend

Terraform state is stored in Azure Blob Storage. You need read/write access to the storage container for `terraform init` to succeed:

- **Resource group**: `rg-tfstate`
- **Storage account**: `stctktfstateprod`
- **Container**: `tfstate`

### Optional (development / documentation)

- **terraform-docs** — regenerates module documentation (`just docs`)
- **pre-commit** — git hook that auto-runs terraform-docs on `.tf` file changes
- **Graphviz (`dot`)** — required for `just graph` to produce PNG architecture diagrams

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

