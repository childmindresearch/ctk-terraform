default_env := "dev"

# Show this help message
default:
    @just --list --unsorted

# Initialise the Terraform working directory for the given environment
init env=default_env *args='':
    terraform -chdir="./{{env}}" init {{args}}

# Generate and show an execution plan for the given environment
plan env=default_env *args='':
    terraform -chdir="./{{env}}" plan {{args}}

# Apply the changes required to reach the desired state for the given environment
apply env=default_env *args='':
    terraform -chdir="./{{env}}" apply {{args}}

# Plan then immediately apply for the given environment
plapply env=default_env:
    just plan {{env}} --out ./{{env}}.plan
    just apply {{env}} ./{{env}}.plan

# Destroy all managed infrastructure for the given environment
destroy env=default_env *args='':
    terraform -chdir="./{{env}}" destroy {{args}}

# Render the Terraform dependency graph as a PNG for the given environment
graph env=default_env *args='':
    terraform -chdir="./{{env}}" graph {{args}} | dot -Tpng -o terraform-graph-{{env}}.png

# Print the latest release tag for each CTK service repository
version:
    #!/usr/bin/env bash
    set -euo pipefail
    repos=(
        "childmindresearch/ctk-webapp"
        "childmindresearch/ctk-functions"
        "childmindresearch/cloai-service"
    )
    for repo in "${repos[@]}"; do
        tag=$(gh api "repos/${repo}/tags" --jq '.[0].name')
        printf "%-40s %s\n" "${repo}" "${tag}"
    done


