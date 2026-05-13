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
    terraform-docs --config .terraform-docs.yaml {{justfile_directory()}}
    terraform-docs --config .terraform-docs-norecursion.yaml {{justfile_directory()}}/modules/container_apps/webapp
    terraform-docs --config .terraform-docs-norecursion.yaml {{justfile_directory()}}/modules/container_apps/ctk_functions
    terraform-docs --config .terraform-docs-norecursion.yaml {{justfile_directory()}}/modules/container_apps/cloai_service
    terraform-docs --config .terraform-docs-norecursion.yaml {{justfile_directory()}}/modules/container_apps/languagetool
    terraform-docs --config .terraform-docs-norecursion.yaml {{justfile_directory()}}/dev
    terraform-docs --config .terraform-docs-norecursion.yaml {{justfile_directory()}}/prod
    terraform-docs --config .terraform-docs-norecursion.yaml {{justfile_directory()}}/shared

