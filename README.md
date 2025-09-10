# clase-8-iac-duoc-sep-25

## Descripción

Este repositorio implementa infraestructura como código (IaC) en Microsoft Azure utilizando Terraform. 

El proyecto despliega una infraestructura base en Azure para un entorno de desarrollo, utilizando un módulo personalizado que centraliza la configuración de recursos comunes. La infraestructura se gestiona de forma automatizada y versionada, permitiendo despliegues consistentes y reproducibles.

**Características principales:**
- Entorno de desarrollo configurado para el proyecto Azure
- Utiliza un módulo reutilizable para la infraestructura de Azure
- Backend remoto configurado en Azure Storage para el estado de Terraform
- Configuración específica para una región de Azure

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.13.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.41.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_infraestructura_azure"></a> [infraestructura\_azure](#module\_infraestructura\_azure) | git::https://github.com/nicosingh/terraform-azurerm-duoc-iac-sep-25.git | 03c55adb6449b915a92db38491a1878b5e58ff65 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Contribución

Para contribuir a este proyecto:

1. **Fork** el repositorio y clónalo localmente
2. Crea una nueva **rama** para tu funcionalidad: `git checkout -b feature/nueva-funcionalidad`
3. **Configura tu entorno** con las credenciales de Azure apropiadas
4. Realiza tus **cambios** y asegúrate de comentar el código Terraform
5. **Valida** los cambios con `terraform plan` antes de commitear
6. **Commitea** tus cambios con mensajes descriptivos
7. **Push** a tu rama: `git push origin feature/nueva-funcionalidad`
8. Crea un **Pull Request** describiendo los cambios realizados

**Nota importante**: Antes de hacer cambios, asegúrate de que tu configuración de backend apunte a un Storage Account de prueba para evitar conflictos con el entorno de producción.

