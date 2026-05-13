default_env := "dev"

init env=default_env *args='':
    terraform -chdir="./{{env}}" init {{args}}

plan env=default_env *args='':
    terraform -chdir="./{{env}}" plan {{args}}

apply env=default_env *args='':
    terraform -chdir="./{{env}}" apply {{args}}

plapply env=default_env:
    just plan {{env}} --out ./{{env}}.plan
    just apply {{env}} ./{{env}}.plan

destroy env=default_env *args='':
    terraform -chdir="./{{env}}" destroy {{args}}

graph env=default_env *args='':
    terraform -chdir="./{{env}}" graph {{args}} | dot -Tpng -o terraform-graph-{{env}}.png

# Generate README.md documentation for all Terraform modules and environments
docs:
    #!/usr/bin/env bash
    set -euo pipefail
    for dir in \
        shared \
        dev \
        prod \
        modules/resource_group \
        modules/container_registry \
        modules/storage_account \
        modules/key_vault \
        modules/log_analytics \
        modules/application_insights \
        modules/virtual_network \
        modules/cosmos_postgres \
        modules/container_app_environment \
        modules/active_directory_app_registration \
        modules/environment \
        modules/container_apps/webapp \
        modules/container_apps/ctk_functions \
        modules/container_apps/cloai_service \
        modules/container_apps/languagetool; do
        echo "Generating docs for $dir..."
        terraform-docs --config .terraform-docs.yaml "$dir"
    done
    echo "Done."

