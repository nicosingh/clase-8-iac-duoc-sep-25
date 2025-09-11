# Módulo principal para desplegar infraestructura en Azure
# Este módulo utiliza un repositorio externo para crear recursos en Azure
module "infraestructura_azure" {
  # Fuente del módulo: repositorio Git con un commit específico para garantizar consistencia
  # Se usa un hash de commit específico para evitar cambios inesperados en la infraestructura
  source = "git::https://github.com/nicosingh/terraform-azurerm-duoc-iac-sep-25.git?ref=03c55adb6449b915a92db38491a1878b5e58ff65"

  # Configuración del ambiente usando el workspace actual de Terraform
  # Esto permite tener diferentes ambientes (dev, staging, prod) usando workspaces
  ambiente = terraform.workspace

  # Nombre del grupo de recursos en Azure donde se crearán todos los recursos
  # Los grupos de recursos son contenedores lógicos para organizar recursos relacionados
  nombre_grupo_recursos = "AreaInfraestructura"

  # Identificador del proyecto para naming conventions y etiquetado
  # Ayuda a identificar y organizar recursos por proyecto específico
  nombre_proyecto = "nico-clase-8"

  # Región de Azure donde se desplegará la infraestructura
  # East US 2 es una región confiable con buena disponibilidad de servicios
  ubicacion = "eastus2"
}
