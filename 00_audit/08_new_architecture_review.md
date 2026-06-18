# Revision nueva arquitectura Tecno Telec + JobCron

## Objetivo

Validar la documentacion actual contra la regla principal:

```text
Web Tecno Telec
  -> TecnoTelec Gateway API
  -> Core APIs necesarias
  -> TecnoTelec API solo para configuracion propia
  -> JobCron administra todo
```

## Documentos existentes

| Area | Documento | Estado |
|---|---|---|
| Arquitectura general | `01_core_erp/architecture/07_project_api_pattern.md` | Listo como patron base. |
| Gateway Tecno Telec | `01_core_erp/apis/09_gateway_api.md` | Draft, requiere endpoints publicos detallados. |
| TecnoTelec API | `01_core_erp/apis/10_tecnotelec_api.md` | Draft, debe limitarse a configuracion propia. |
| Catalog API | `01_core_erp/apis/02_catalog_api.md` | Parcial. |
| Pricing API | `01_core_erp/apis/04_pricing_api.md` | Parcial, con plan Pricing First. |
| Supplier API | `01_core_erp/apis/03_supplier_api.md` | Parcial/avanzado para proveedor. |
| Quote API | `01_core_erp/apis/05_quote_api.md` | Falta implementacion, documentado como necesario. |
| Sales API | `01_core_erp/apis/06_sales_api.md` | Parcial. |
| Frontend Tecno Telec | `02_projects/tecnotelec/frontend` | Boceto y especificacion visual listos como base. |
| Tareas Tecno Telec | `02_projects/tecnotelec/tasks` | Base existente. |
| JobCron | `02_projects/jobcron/README.md` | Base, requiere proceso administrativo Tecno Telec. |

## Documentos listos

- Identidad, servicios y propuesta de valor de Tecno Telec.
- Patron de API por proyecto.
- Blueprint visual y maqueta web Tecno Telec.
- Plan Pricing First.
- Reglas de visibilidad de catalogo.
- Estrategia multi-proveedor.

## Documentos incompletos

| Documento | Falta |
|---|---|
| `01_core_erp/apis/09_gateway_api.md` | Contratos publicos por pantalla/producto. |
| `01_core_erp/apis/05_quote_api.md` | Decision final si Quote sera API separada o parte inicial de Sales. |
| `02_projects/jobcron/README.md` | Proceso concreto para administrar Tecno Telec. |
| `02_projects/tecnotelec/frontend/01_routes.md` | Ya tiene rutas, falta enlazarlas a contratos Gateway reales. |

## Procesos repetidos

No hay duplicidad grave. La version canonica corregida usa Gateway General y queda en `01_core_erp/architecture/09_tecnotelec_gateway_corrected_pattern.md`.

## Procesos contradictorios

| Punto | Contradiccion | Version correcta |
|---|---|---|
| Ruta de PDF JobCron | La instruccion indica `archivo/images/jobcron/`, pero el repo conserva `_archive/image/jobcron/especificaciones cron.pdf`. | Usar la ruta archivada como fuente encontrada y documentar que la ruta solicitada no existe. |
| Frontend directo a APIs core | Algunas tablas de rutas dicen Gateway/Core como referencia de dominio. | La Web solo consume Gateway; Core APIs son consumidas por Gateway. |

## APIs necesarias

- `tecnotelec-gateway-api`.
- `tecnotelec-api`.
- `catalog-api`.
- `pricing-api`.
- `supplier-api`.
- `inventory-api`.
- `quote-api` o `sales-api` para snapshots.
- `auth-api`.
- `notifications-api`.
- `documents-api` para anexos.

## APIs que no deben usarse todavia

- `pos-api`: fase posterior.
- `government-tender-api`: futuro salvo alcance explicito.
- `billing-api`: posterior a decision fiscal.
- Chat/IA: futuro, no entra en MVP.

## Dependencias por proceso

| Proceso | Depende de |
|---|---|
| Publicacion de productos | Gateway, Catalog, Pricing, Supplier, Inventory, TecnoTelec API. |
| Detalle de producto | Gateway, Catalog, Pricing, Supplier, Inventory. |
| Precios visibles | Pricing API; Gateway solo adapta. |
| Cotizacion | Gateway, TecnoTelec API, Catalog, Pricing, Quote/Sales. |
| Seguimiento administrativo | JobCron. |
| Contenido visual propio | TecnoTelec API administrado desde JobCron. |

## Pendientes visuales

- Imagenes finales de productos, categorias y marcas.
- Placeholder assets definitivos.
- Numero WhatsApp y datos reales de contacto.
- Aviso de privacidad.

## Pendientes del boceto de JobCron

Existe PDF alterno en `_archive/image/jobcron/especificaciones cron.pdf`. No se encontro `archivo/images/jobcron/` en la documentacion actual.

## Pendientes de APIs para mostrar productos

- Contratos reales Gateway `/products`.
- Fuente Inventory API para stock visible.
- Decision de visibilidad de proveedor.
- Endpoint de galeria/360.
- Manejo de SAT cuando aplique.

## Pendientes de endpoints publicos

Documentados en `02_projects/tecnotelec/backend/00_gateway_product_endpoints.md`; falta implementacion real.

## Inventario real de rutas

El estado real encontrado en codigo queda registrado en `00_audit/09_api_routes_inventory.md`.

## Pendientes de frontend Web Tecno Telec

- Conectar mockup Next.js a Gateway real.
- Sustituir datos mock por contratos.
- Crear assets placeholder locales.
- Validar estados vacio/error/loading con datos reales.
