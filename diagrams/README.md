# Architecture Diagrams

This directory contains [D2](https://d2lang.com/) diagrams that document the Azure infrastructure for the CTK project.

## Overview

The diagrams are organized into modular files, each representing a specific component of the architecture:

- **`main.d2`** - The main diagram that imports and connects all components
- **`icons.d2`** - Centralized icon definitions for all Azure services
- **`shared.d2`** - Shared resources (Container Registry)
- **`network.d2`** - Virtual Network and subnets
- **`database.d2`** - Cosmos PostgreSQL database with private endpoint
- **`container_environment.d2`** - Container App Environment
- **`container_apps.d2`** - All container applications (webapp, cloai_service, ctk_functions, languagetool)
- **`supporting_services.d2`** - Supporting services (Key Vault, Storage Account, Log Analytics, Application Insights)
- **`identity.d2`** - Microsoft Entra ID authentication

## Icon Management

All Azure service icons are defined centrally in `icons.d2` as classes. Each diagram file imports this file using `...@icons` and references icons via the `class` attribute. This approach:

- **Eliminates duplication** - Each icon URL is defined once
- **Improves maintainability** - Update an icon in one place to change it everywhere
- **Enhances consistency** - All diagrams use the same icon set

Example usage:
```d2
...@icons

my_resource: My Resource {
  class: resource_group
}
```

## Building Diagrams

The diagrams are automatically built by the GitHub Actions workflow whenever D2 files are modified. The workflow:

1. Installs the D2 CLI
2. Compiles `main.d2` to `architecture.svg`
3. Uploads the SVG as a workflow artifact
4. Posts the diagram as a comment on pull requests

To build locally, install [D2](https://d2lang.com/) and run:

```bash
d2 diagrams/main.d2 diagrams/output/architecture.svg
```

## Architecture Notes

- These diagrams focus on the **production environment** only
- Icons are from [Terrastruct Icons](https://icons.terrastruct.com/)
- Only the most important connections between services are shown for clarity
- The diagrams provide a high-level overview, not an exhaustive representation

## Updating Diagrams

When making infrastructure changes:

1. Update the relevant D2 file(s) in this directory
2. If adding a new Azure service, add its icon to `icons.d2` first
3. Commit and push your changes
4. The workflow will automatically regenerate the diagram
5. Review the updated diagram in the PR comment or workflow artifacts
