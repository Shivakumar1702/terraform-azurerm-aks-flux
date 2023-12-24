resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
  tags = {
    environment = var.tag
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                      = var.cluster_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  dns_prefix                = var.dns_prefix
  automatic_channel_upgrade = var.upgrade_type

  default_node_pool {
    name                = var.node_pool_name
    node_count          = var.node_count
    vm_size             = var.vm_size
    enable_auto_scaling = var.enable_auto_scaling

  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
  }

  tags = {
    Environment = var.tag
  }

}

resource "azurerm_kubernetes_cluster_extension" "fluxext" {
  name           = "flux-ext"
  cluster_id     = azurerm_kubernetes_cluster.aks.id
  extension_type = "microsoft.flux"
}

resource "azurerm_kubernetes_flux_configuration" "fluxconf" {
  name       = var.fluxconf_name
  cluster_id = azurerm_kubernetes_cluster.aks.id
  namespace  = var.flux_namespace

  git_repository {
    url              = var.git_repo_url
    reference_type   = var.reference_type
    reference_value  = var.reference_value
    https_user       = var.git_user
    https_key_base64 = var.git_token
  }

  kustomizations {
    name = "kustomization-1"
    path = var.path
  }

  depends_on = [azurerm_kubernetes_cluster_extension.fluxext]

}