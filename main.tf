resource "azurerm_resource_group" "example" {
  name     = "nastya_group"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "nastya-aks-cluster"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "nastya-aks-cluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_resource_provider_registration" "register-service" {
  name = "Microsoft.ContainerService"
}