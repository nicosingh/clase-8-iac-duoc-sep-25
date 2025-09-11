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

## Pipelines de CI/CD con GitHub Actions

Este proyecto implementa una estrategia completa de CI/CD utilizando GitHub Actions para automatizar los despliegues de infraestructura y el mantenimiento del código. Los pipelines están organizados en tres flujos principales:

### 🚀 Pipeline de Despliegue (`terraform-apply.yml`)

**Trigger**: Se ejecuta automáticamente en:
- Push a la rama `main`
- Pull requests hacia `main`
- Ejecución manual (`workflow_dispatch`)

**Flujo de trabajo**:
1. **Desarrollo**: Despliega automáticamente en el ambiente de desarrollo
   - Ejecuta `terraform plan` y `terraform apply`
   - Guarda el plan como artefacto por 30 días
2. **Plan Producción**: Genera el plan para producción (requiere aprobación del ambiente de desarrollo)
3. **Producción**: Aplica los cambios en producción con aprobación manual requerida

**Características**:
- Separación de ambientes con workspaces de Terraform
- Artefactos de planes para trazabilidad
- Ambientes protegidos con aprobaciones manuales

### 🗑️ Pipeline de Destrucción (`terraform-destroy.yml`)

**Trigger**: Ejecución manual únicamente con selección de ambiente

**Funcionalidad**:
- Permite destruir infraestructura en ambientes específicos
- Requiere selección manual del ambiente (desarrollo/producción)
- Ejecuta `terraform destroy` de forma segura

### 🔧 Pipeline de Auto-correcciones (`auto-fixes.yml`)

**Trigger**: Se ejecuta en:
- Push a cualquier rama
- Pull requests hacia cualquier rama

**Funcionalidades automatizadas**:
- **Formateo de código**: Aplica `terraform fmt` recursivamente
- **Documentación automática**: Actualiza el README.md con `terraform-docs`
- **Commits automáticos**: Pushea las correcciones usando el bot de GitHub Actions

### ⚙️ Acciones Personalizadas (Custom Actions)

#### `azure-login`
- **Propósito**: Autentica con Azure usando device code
- **Ubicación**: `.github/actions/azure-login/`
- **Funcionalidad**: Instala Azure CLI y ejecuta login interactivo

#### `terraform-init-and-workspace`
- **Propósito**: Inicializa Terraform y gestiona workspaces
- **Ubicación**: `.github/actions/terraform-init-and-workspace/`
- **Parámetros**:
  - `backend-tfvars`: Configuración del backend
  - `workspace-name`: Nombre del workspace a usar
- **Funcionalidad**:
  - Instala Terraform v1.13.0
  - Crea configuración del backend dinámicamente
  - Inicializa Terraform con backend remoto
  - Selecciona o crea workspace según ambiente

### 🔐 Configuración de Ambientes

Los pipelines utilizan:
- **Variables de repositorio**: `BACKEND_TFVARS` para configuración del backend
- **Ambientes protegidos**: `produccion` con regla de aprobación
- **Ambientes no protegidos**: `desarrollo` no cuenta con regla de aprobación, y se despliega automáticamente por cada push en este repositorio

### 📊 Artefactos y Trazabilidad

- Los planes de Terraform se guardan como artefactos con retención de 30 días
- Commits automáticos documentados con prefijo `ci:`
- Historial completo de despliegues por ambiente

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
