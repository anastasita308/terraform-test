provider "azurerm" {
  features {}
  subscription_id                 = "bdbe8cd3-fcbe-49e5-8c57-df0c049cf67a"
  resource_provider_registrations = "none"
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks-cluster.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks-cluster.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks-cluster.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks-cluster.kube_config.0.cluster_ca_certificate)
}