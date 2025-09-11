# Configuracion del proveedor de Azure Resource Manager
# Se configura sin registros automaticos de proveedores de recursos
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = "bb1ccac7-d7f8-47bf-82c2-f223185cfab9"
}
