# Indice canonico de APIs

La existencia se determina por repositorio ejecutable, migraciones y contrato,
no por una idea documental.

## Registros operativos

| Documento | Uso |
|---|---|
| `gateway-route-registry.md` | Registrar rutas Gateway, API destino, permisos, request y response. |
| `endpoint-ui-consumption-matrix.md` | Relacionar pantallas o modulos UI con endpoints Gateway para evitar mocks persistentes. |
| `api-decision-matrix.md` | Decidir API reutilizable antes de evaluar API especializada. |
| `reusable-api-contracts.md` | Mantener contratos resumidos y fronteras de APIs reutilizables. |

## Compartidas confirmadas

| API | Estado | Responsabilidad |
|---|---|---|
| Auth | ACTIVA | Identidad, usuarios, roles, permisos, sesiones y tokens. |
| Gateway | ACTIVA | Entrada central modular, sesion, routing, permisos de frontera y errores. |
| Catalog | ACTIVA | Productos, categorias, marcas y relaciones normalizadas. |
| Inventory | ACTIVA | Existencias propias, ubicaciones y movimientos. |
| Pricing | ACTIVA | Listas, precios publicables, margenes e impuestos. |
| Procurement | ACTIVA | Solicitudes y ordenes de compra, recepcion y devolucion. |
| Sales | ACTIVA | Cotizacion MVP, ordenes, pagos y estado comercial. |
| Supplier | ACTIVA | Proveedores, catalogos externos normalizados y sincronizacion. |
| Document | ACTIVA | Archivos, evidencias y procesamiento documental compartido. |
| Fiscal | ACTIVA | Datos y procesos fiscales compartidos. |
| Address | ACTIVA | Catalogo geografico y direcciones normalizadas. |

## APIs de proyecto confirmadas

| API | Estado | Proyecto |
|---|---|---|
| JobCron | ACTIVA | ERP administrador y FeatureAvailability. |
| TecnoTelec | ACTIVA | Comercio e integracion propia TecnoTelec. |
| LexNova | ACTIVA | Dominio legal. |
| DocuCore | ACTIVA | Producto documental. |
| Fiscora | ACTIVA | Producto fiscal. |
| Imagrafity | ACTIVA | Producto de personalizacion. |
| RefaPart | ACTIVA | Busqueda, demanda, cotizacion, pedido y logistica de refacciones. |
| LeadHunter | ACTIVA_INTERNA | Motor Prospecting operado desde JobCron. |

## Capacidades derivadas

Quote permanece dentro de Sales para el Core y dentro de cada API de proyecto
cuando el flujo sea especifico. Solo se separara como API con contrato y
necesidad de escalamiento aprobados.

| Capacidad | Estado |
|---|---|
| Quote API independiente | PENDIENTE_DE_DEFINIR |
| Logistics API compartida | PENDIENTE_DE_DEFINIR |
| Rules Engine API | PENDIENTE_DE_DEFINIR |
| Projects API | PENDIENTE_DE_DEFINIR |
| Cart API compartida | PENDIENTE_DE_DEFINIR |
| POS API | PENDIENTE_DE_DEFINIR |
| Billing API independiente | PENDIENTE_DE_DEFINIR |
| Notifications API | PENDIENTE_DE_DEFINIR |
| Reporting API | PENDIENTE_DE_DEFINIR |

Los pendientes no son dependencias obligatorias hasta tener contrato,
persistencia, seguridad, compose y pruebas aprobadas.
