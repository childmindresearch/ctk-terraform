# Architecture Diagrams

This directory contains [D2](https://d2lang.com/) diagrams that document the Azure infrastructure for the CTK project.

## Overview

The diagrams are organized into modular files:

- **`main.d2`** - The main diagram showing the complete production architecture with proper encapsulation (resources grouped by their containers)
- **`icons.d2`** - Centralized icon definitions for all Azure services
- **`shared.d2`** - Shared resources (Container Registry within shared resource group)
- **`identity.d2`** - Microsoft Entra ID authentication
- **`container_environment.d2`** - Container App Environment (legacy, now consolidated in main.d2)
- **`container_apps.d2`** - Container apps (legacy, now consolidated in main.d2)
- **`network.d2`** - Virtual Network (legacy, now consolidated in main.d2)
- **`database.d2`** - Database resources (legacy, now consolidated in main.d2)
- **`supporting_services.d2`** - Supporting services (legacy, now consolidated in main.d2)

## Diagram Structure

The main diagram uses **container-based encapsulation** to show relationships:
- **Production Resource Group** contains all production resources
- **Container App Environment** contains all container apps (webapp, cloai_service, ctk_functions, languagetool)
- **Virtual Network** contains all subnets (container apps, database, storage)
- **Shared Resource Group** contains the shared Azure Container Registry

This structure makes it clear which resources are contained within which environments, rather than having individual boxes for everything.

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
2. Compiles `main.d2` to `architecture.png`
3. Uploads the PNG as a workflow artifact
4. Posts the diagram as an image in PR comments

To build locally, install [D2](https://d2lang.com/) and run:

```bash
d2 diagrams/main.d2 diagrams/output/architecture.png
```

## Architecture Notes

- These diagrams focus on the **production environment** only
- Icons are from [Terrastruct Icons](https://icons.terrastruct.com/)
- Only the most important connections between services are shown for clarity
- The diagrams provide a high-level overview, not an exhaustive representation
- **Container-based layout** shows encapsulation (apps inside environments, resources inside resource groups)

## Updating Diagrams

When making infrastructure changes:

1. Update `main.d2` (most changes will be here now that everything is consolidated)
2. If adding a new Azure service, add its icon to `icons.d2` first
3. Commit and push your changes
4. The workflow will automatically regenerate the diagram
5. Review the updated diagram in the PR comment or workflow artifacts
