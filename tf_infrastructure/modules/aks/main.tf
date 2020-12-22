# Creates the main AKS
resource "azurerm_kubernetes_cluster" "AKS" {
  name                = "fgr-aks-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "fgr-aks-${var.environment}"

  default_node_pool {
    name                = "area1"
    vm_size             = "Standard_B2s"
    enable_auto_scaling = true
    type                = "VirtualMachineScaleSets"
    max_count           = lookup(var.auto_scaling_max_count, var.environment)
    min_count           = lookup(var.auto_scaling_min_count, var.environment)
    node_count          = lookup(var.auto_scaling_default_node_count, var.environment)
    node_labels         = { app : "area1" }

  }

  network_profile {
    network_plugin = "azure"
  }

  node_resource_group = "${var.resource_group_name}-nodes"

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "platform_nodes" {
  name                  = "area2"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.AKS.id
  vm_size               = "Standard_B2s"
  enable_auto_scaling   = true
  max_count             = lookup(var.auto_scaling_max_count, var.environment)
  min_count             = lookup(var.auto_scaling_min_count, var.environment)
  node_count            = lookup(var.auto_scaling_default_node_count, var.environment)
  node_labels           = { app : "area2" }

}