module "infraestructura_azure" {
  source = "git::https://github.com/nicosingh/terraform-azurerm-duoc-iac-sep-25.git?ref=03c55adb6449b915a92db38491a1878b5e58ff65"

  ambiente              = "desarrollo"
  nombre_grupo_recursos = "AreaInfraestructura"
  nombre_proyecto       = "nico-clase-8"
  ubicacion             = "eastus2"
}
