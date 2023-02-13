resource "azurerm_resource_group" "dev-env-resource-group" {
  name     = "dev-env-resource-group"
  location = "eastus"
}
# terraform import azurerm_resource_group.dev-env-resource-group /subscriptions/50d2bf63-13d4-467a-beae-283dd8d9727e/resourceGroups/dev-env-resource-group

resource "azurerm_container_registry" "DevcontainerRegistry33dev2" {
  name                = "DevcontainerRegistry33dev2"
  resource_group_name = azurerm_resource_group.dev-env-resource-group.name
  location            = azurerm_resource_group.dev-env-resource-group.location
  sku                 = "Premium"
}

resource "azurerm_role_assignment" "example" {
  principal_id                     = "cb603d69-1252-4049-8429-6a6f8d97da49"
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.DevcontainerRegistry33dev2.id
  skip_service_principal_aad_check = true
}


## attaching acr to AKS type below inside the AKS
#az aks update -n CLUSTERNAME -g RESOURCEGROUPNAME --attach-acr ECRCONTAINERNAMEONLY
##Check if AKS can connect to your ACR with below command
#az aks check-acr --resource-group dev-env-resource-group --name devops-cluster-aks --acr devcontainerregistry33dev2.azurecr.io