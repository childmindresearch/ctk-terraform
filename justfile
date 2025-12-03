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


