# Mapa de APIs reutilizables

## Objetivo

Mapear necesidades funcionales a APIs reutilizables antes de crear o modificar
una API especializada.

## Regla principal

No se crea una API nueva si una API compartida cubre la responsabilidad. Una
API especializada solo se documenta cuando hay logica exclusiva del dominio.

## Matriz

| Necesidad funcional | API reutilizable | Entidad principal | Endpoint esperado | Proyecto consumidor | Notas |
|---|---|---|---|---|---|
| Identidad, usuarios, roles, permisos, sesiones | Auth | User, Role, Permission, Session | PENDIENTE_DE_DEFINIR | Todos con login | Consumida via Gateway General |
| Entrada unica, sesion, routing, errores | Gateway General | Route, Application, SessionContext | PENDIENTE_DE_DEFINIR | Todas las webs | Frontend no consume APIs internas |
| Productos, categorias, marcas, especificaciones | Catalog | Product, Category, Brand | PENDIENTE_DE_DEFINIR | TecnoTelec, Refapart, Imagrafity | Catalogo compartido |
| Stock, ubicaciones, movimientos | Inventory | StockItem, Warehouse, Movement | PENDIENTE_DE_DEFINIR | TecnoTelec, Refapart | No duplicar en proyecto |
| Listas de precio, margenes, impuestos | Pricing | PriceList, ProductPrice | PENDIENTE_DE_DEFINIR | TecnoTelec, Refapart, Imagrafity | Precios compartidos |
| Proveedores y catalogos externos normalizados | Supplier | Supplier, SupplierProduct | PENDIENTE_DE_DEFINIR | TecnoTelec, Refapart | No mezclar proveedor con ERP |
| Compras, recepciones, devoluciones proveedor | Procurement | PurchaseOrder, Receipt | PENDIENTE_DE_DEFINIR | TecnoTelec, Refapart | Flujo compartido |
| Cotizaciones, ordenes, pagos, devoluciones | Sales | Quote, Order, Payment | PENDIENTE_DE_DEFINIR | TecnoTelec, Refapart | Quote MVP vive en Sales |
| Busqueda transversal | Search | SearchDocument, SearchIndex | PENDIENTE_DE_DEFINIR | Todos si aplica | No reemplaza Catalog |
| Archivos y procesamiento documental | Document | File, DocumentArtifact | PENDIENTE_DE_DEFINIR | DocuCore, LexNova, Fiscora | Capacidad transversal |
| Datos fiscales compartidos | Fiscal | FiscalDocument, TaxProfile | PENDIENTE_DE_DEFINIR | Fiscora, proyectos fiscales | No duplicar CFDI base |
| Direcciones y catalogo geografico | Address | Address, Region | PENDIENTE_DE_DEFINIR | Refapart, ventas | API compartida |
| Notificaciones | Notification | Notification, Template | PENDIENTE_DE_DEFINIR | Todos si aplica | Pendiente de contrato |
| Visibilidad de modulos | FeatureVisibility | FeatureFlag, ApplicationFeature | PENDIENTE_DE_DEFINIR | JobCron, Gateway | Control de capacidades |
| Integracion proveedor Syscom | Supplier + `04_integrations/syscom` | SupplierProduct | PENDIENTE_DE_DEFINIR | TecnoTelec, Refapart | Proveedor externo no es modelo interno |
| Logica exclusiva Refapart | API especializada Refapart | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | Refapart | Solo si no encaja en API compartida |
| Logica exclusiva LexNova | API especializada LexNova | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | LexNova | Solo si no encaja en Document/Auth/Search |
| Logica exclusiva Fiscora | API especializada Fiscora | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | Fiscora | Solo si no encaja en Fiscal/Document |
| Logica exclusiva Imagrafity | API especializada Imagrafity | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | Imagrafity | Solo si no encaja en Catalog/Pricing |

## Validacion antes de crear API

1. Revisar `01_core_erp/apis/00_api_index.md`.
2. Revisar esta matriz.
3. Revisar `03_standards/architecture/api-gateway-standard.md`.
4. Documentar por que ninguna API compartida cubre el caso.
5. Usar `PENDIENTE_DE_DEFINIR` si falta contrato real.
