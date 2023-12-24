output "client_certificate" {
  value       = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  description = "This output gives clinet certificate"
  sensitive   = true
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "This output gives the information about kube config"
  sensitive   = true
}

output "resource_group" {
  value       = azurerm_resource_group.rg.id
  description = "This output gives the information about resource group"
}