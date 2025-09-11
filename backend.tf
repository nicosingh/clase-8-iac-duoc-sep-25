terraform {
  # Configuracion del Backend omitida intencionalmente.
  # Para inicializar, usar terraform init con los siguientes flags:
  #
  # terraform init \
  #   -backend-config="resource_group_name=AreaInfraestructura" \
  #   -backend-config="storage_account_name=testiacduoc2025" \
  #   -backend-config="container_name=terraform-state" \
  #   -backend-config="key=terraform.tfstate"

  # Tambien puedes crear un archivo backend.tfvars con esas keys
  #
  # resource_group_name  = "AreaInfraestructura"
  # storage_account_name = "testiacduoc2025"
  # container_name       = "terraform-state"
  # key                  = "terraform.tfstate"
  #
  # Y leerlas desde el comando 'terraform init':
  #
  # terraform init -backend-config=backend.tfvars
  #
  # (los valores de cada flag/variable son de ejemplo.
  #  Setea tus propios valores para tu entorno especifico)
  backend "azurerm" {}
}
