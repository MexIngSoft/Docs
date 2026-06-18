# Estandar de decision de API reutilizable

## Objetivo

Definir el arbol de decision antes de crear una API nueva.

## Lectura obligatoria

Antes de crear API nueva revisar:

- `01_core_erp/apis/api-responsibility-matrix.md`
- `01_core_erp/architecture/project-api-dependency-matrix.md`
- `03_standards/architecture/api-gateway-standard.md`
- `01_core_erp/apis/api-decision-matrix.md`
- `01_core_erp/apis/reusable-api-contracts.md`

## Arbol de decision

| Funcionalidad | API |
|---|---|
| Usuarios/permisos | Auth |
| Routing/proxy/frontera | Gateway General |
| Productos/categorias/marcas | Catalog |
| Stock/almacenes | Inventory |
| Precios/descuentos | Pricing |
| Proveedores | Supplier |
| Compras | Procurement |
| Ventas/cotizaciones | Sales |
| Busqueda | Search |
| Documentos | Document |
| Notificaciones | Notification |
| Visibilidad | FeatureVisibility |
| Importaciones/sync | ETL |
| Fiscalidad compartida | Fiscal |
| Direcciones/regiones | Address |

Si encaja en una API compartida, no crear API nueva.

Solo crear API especializada si no encaja en ninguna API compartida vigente y
existe logica exclusiva del dominio.
