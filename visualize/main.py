import diagrams
from diagrams.azure import (
    compute,
    database,
    storage,
    network,
    security,
    devops,
    monitor,
)

with diagrams.Diagram(
    "CTK Terraform Infrastructure",
    filename="ctk_terraform_architecture",
    show=False,
    direction="TB",
    graph_attr={
        "fontsize": "16",
        "bgcolor": "white",
        "pad": "0.5",
    },
):
    with diagrams.Cluster("Shared Infrastructure"):
        with diagrams.Cluster("rg-ctk-shared"):
            shared_acr = devops.Repos("Azure Container\nRegistry\nacrctkshared")

    environments = {}

    for env_name in ["Production", "Development"]:
        env_short = "prod" if env_name == "Production" else "dev"

        environments[env_short] = {}

        with diagrams.Cluster(f"{env_name} Environment"):
            with diagrams.Cluster(f"rg-ctk-{env_short}"):
                with diagrams.Cluster(f"Virtual Network (vnet-ctk-{env_short})"):
                    environments[env_short]["vnet"] = network.VirtualNetworks(
                        "VNet\n10.0.0.0/16"
                    )

                    with diagrams.Cluster("Subnets"):
                        environments[env_short]["subnet_apps"] = network.Subnets(
                            "Container Apps\nSubnet"
                        )
                        environments[env_short]["subnet_db"] = network.Subnets(
                            "Database\nSubnet"
                        )
                        environments[env_short]["subnet_storage"] = network.Subnets(
                            "Storage\nSubnet"
                        )

                environments[env_short]["logs"] = monitor.Monitor(
                    "Log Analytics\nWorkspace"
                )
                environments[env_short]["kv"] = security.KeyVaults(
                    "Key Vault\n(Secrets)"
                )
                environments[env_short]["storage"] = storage.StorageAccounts(
                    "Storage Account\n(Blob Storage)"
                )

                with diagrams.Cluster("Database Infrastructure"):
                    environments[env_short]["postgres"] = (
                        database.DatabaseForPostgresqlServers("Cosmos DB\nPostgreSQL")
                    )
                    environments[env_short]["pe"] = network.PrivateEndpoint(
                        "Private\nEndpoint"
                    )
                    environments[env_short]["dns"] = network.DNSZones(
                        "Private DNS Zone\npostgres.cosmos.azure.com"
                    )

                with diagrams.Cluster(f"Container App Environment (cae-ctk-{env_short})"):
                    environments[env_short]["webapp"] = compute.ContainerInstances(
                        "Web App\n(Public)"
                    )
                    environments[env_short]["cloai"] = compute.ContainerInstances(
                        "CLOAI Service\n(Internal)"
                    )
                    environments[env_short]["functions"] = compute.ContainerInstances(
                        "CTK Functions\n(Internal)"
                    )
                    environments[env_short]["languagetool"] = (
                        compute.ContainerInstances("LanguageTool\n(Internal)")
                    )

    for env_short in ["prod", "dev"]:
        env = environments[env_short]

        shared_acr >> diagrams.Edge(label="pull images") >> env["webapp"]
        shared_acr >> diagrams.Edge(label="pull images") >> env["cloai"]
        shared_acr >> diagrams.Edge(label="pull images") >> env["functions"]

        env["logs"] >> diagrams.Edge(label="logs") >> env["webapp"]
        env["logs"] >> diagrams.Edge(label="logs") >> env["cloai"]
        env["logs"] >> diagrams.Edge(label="logs") >> env["functions"]
        env["logs"] >> diagrams.Edge(label="logs") >> env["languagetool"]

        env["kv"] >> diagrams.Edge(label="secrets") >> env["cloai"]
        env["kv"] >> diagrams.Edge(label="secrets") >> env["functions"]
        env["kv"] >> diagrams.Edge(label="DB password") >> env["postgres"]

        env["storage"] >> diagrams.Edge(label="blob storage") >> env["webapp"]

        env["postgres"] >> diagrams.Edge(label="private link") >> env["pe"]
        env["pe"] >> env["subnet_db"]
        env["dns"] >> diagrams.Edge(label="DNS resolution") >> env["vnet"]

        env["webapp"] >> diagrams.Edge(label="read/write") >> env["postgres"]
        env["functions"] >> diagrams.Edge(label="read/write") >> env["postgres"]

        env["webapp"] >> diagrams.Edge(label="grammar check") >> env["languagetool"]
        env["functions"] >> diagrams.Edge(label="AI requests") >> env["cloai"]
        env["functions"] >> diagrams.Edge(label="grammar check") >> env["languagetool"]

        env["subnet_apps"] >> env["webapp"]
        env["subnet_storage"] >> env["kv"]
        env["subnet_storage"] >> env["storage"]
