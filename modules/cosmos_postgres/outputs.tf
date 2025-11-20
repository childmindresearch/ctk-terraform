output "cluster_id" {
  value       = azurerm_cosmosdb_postgresql_cluster.cluster.id
  description = "The ID of the Cosmos DB PostgreSQL cluster."
}

output "cluster_name" {
  value       = azurerm_cosmosdb_postgresql_cluster.cluster.name
  description = "The name of the Cosmos DB PostgreSQL cluster."
}

output "host" {
  value       = azurerm_cosmosdb_postgresql_cluster.cluster.servers[0].fqdn
  description = "The connection endpoint for the Cosmos DB PostgreSQL cluster."
}

output "administrator_login" {
  value       = "citus"
  description = "The administrator login name (always 'citus' for Cosmos DB PostgreSQL)."
}

output "port" {
  value       = "5432"
  description = "The PostgreSQL port."
}

output "database_name" {
  value       = var.database_name
  description = "The database name."
}

output "administrator_password" {
  value       = var.administrator_password
  description = "The administrator password."
  sensitive   = true
}
