terraform {
  backend "azurerm" {
    resource_group_name  = "AreaInfraestructura"
    storage_account_name = "clase8iacduoc2025"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
