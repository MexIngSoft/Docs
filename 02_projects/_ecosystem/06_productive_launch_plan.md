# Plan de cierre productivo MexIngSof, REFAPART, Tecno Telec y JobCron

## Objetivo

Convertir la documentacion activa del agent `AGENTS-000.md` en contratos
canonicos de ejecucion para cerrar los primeros proyectos productivos sin
duplicar APIs ni romper el estandar del Gateway General.

## Context Pack

| Campo | Valor |
|---|---|
| Tipo de tarea | Cierre productivo multi-proyecto |
| Dominio afectado | `02_projects`, `01_core_erp/apis`, `03_standards/gateway` |
| Proyectos afectados | MexIngSof, REFAPART, Tecno Telec, JobCron |
| Frontends afectados | `WEB.NJ.NEXT.MexIngSof`, `WEB.NJ.NEXT.RefaPart`, `WEB.NJ.NEXT.TecnoTelec`, `WEB.NJ.NEXT.JobCron` |
| APIs afectadas | Gateway, Auth, JobCron, Catalog, Supplier, Pricing, Sales, Address, Search, Inventory, Document |
| Integraciones afectadas | Search outbox, eventos JobCron, proveedores, datos operativos |

## Prioridad de cierre

| Orden | Proyecto | Objetivo productivo | Estado documental |
|---|---|---|---|
| 1 | MexIngSof | Entrada comercial corporativa y captura de leads. | Parcial; web MVP existe y falta contrato productivo via Gateway/JobCron. |
| 2 | REFAPART | Primer vertical comercial transaccional de refacciones. | Parcial; API/web documentadas, faltan permisos, eventos y cierre operativo. |
| 3 | Tecno Telec | Segundo vertical consultivo de soluciones tecnologicas. | Parcial; documentacion amplia, falta conectar contrato productivo final. |
| 4 | JobCron | Administrador operativo comun del ecosistema. | Parcial; FeatureAvailability existe, faltan modulos operativos por proyecto. |

## Arquitectura obligatoria

```text
WEB.NJ.NEXT.<Proyecto>
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.<Proyecto o JobCron>
  -> APIs Core/Shared
  -> PostgreSQL
```

Reglas:

- Ninguna web consume Core APIs, Search, bases de datos ni proveedores externos
  de forma directa.
- Gateway no es base maestra; solo autentica, autoriza, enruta y compone
  respuestas publicas.
- Las APIs de proyecto guardan reglas propias del dominio.
- Las APIs compartidas se reutilizan antes de crear una API nueva.
- Search se alimenta por eventos/outbox y puede reconciliarse desde las tablas
  origen si hubo error de sincronizacion.

## Matriz final de APIs por proyecto

| Proyecto | Gateway | API de proyecto | APIs reutilizadas | Search | Estado |
|---|---|---|---|---|---|
| MexIngSof | `API.PY.DJANGO.Gateway` | JobCron API para leads y operacion comercial | Auth, Sales/CRM por definir, Document si aplica | Leads, servicios y contenido indexable cuando exista contrato | Parcial |
| REFAPART | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.RefaPart` | Auth, Catalog, Supplier, Pricing, Sales, Address, Inventory, Document | Productos, piezas, solicitudes, cotizaciones, ordenes | Parcial |
| Tecno Telec | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.TecnoTelec` | Auth, Catalog, Supplier, Pricing, Sales, Inventory, Document | Soluciones, productos, categorias, cotizaciones, proyectos | Parcial |
| JobCron | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.JobCron` | Auth, Catalog, Pricing, Sales, Inventory, Document, Search | Administracion, auditoria, jobs y objetos operativos autorizados | Parcial |

## Dependencias por cierre

| Dependencia | MexIngSof | REFAPART | Tecno Telec | JobCron |
|---|---|---|---|---|
| Auth v1 | Admin y panel interno | Cliente/admin/proveedor interno | Cliente/admin/ventas | Admin global |
| Gateway General | Obligatorio para produccion | Obligatorio | Obligatorio | Obligatorio |
| JobCron API | Leads y seguimiento | Operacion y eventos | Operacion y cotizacion | API propia |
| Catalog | Servicios/paquetes si se formalizan | Piezas y categorias | Productos, soluciones y componentes | Administracion |
| Supplier | No aplica inicialmente | Proveedores ocultos | Proveedores de tecnologia | Administracion |
| Pricing | Paquetes comerciales si se formalizan | Precio publico, costo interno oculto | Precio consultivo y componentes | Reglas |
| Sales | Leads/cotizaciones | Cotizacion, pedido, venta | Cotizacion consultiva | Pipeline |
| Address | Contacto/ubicacion si aplica | Direcciones cliente/envio | Direcciones cliente/proyecto | Catalogo operativo |
| Search | Leads/contenido si aplica | Busqueda de piezas y solicitudes | Busqueda de soluciones/productos | Busqueda admin |

## Contratos Gateway minimos

| Web | Ruta Gateway | Destino | Uso | Estado |
|---|---|---|---|---|
| MexIngSof | `POST /api/v1/projects/MEXINGSOF/leads` | JobCron API | Crear lead comercial desde la web. | PENDIENTE_DE_IMPLEMENTAR |
| MexIngSof | `GET /api/v1/projects/MEXINGSOF/services` | JobCron API o Catalog | Listar servicios/paquetes publicados. | PENDIENTE_DE_DEFINIR |
| REFAPART | `GET /api/v1/projects/REFAPART/parts/search` | REFAPART API/Search | Buscar piezas publicables. | Parcial |
| REFAPART | `POST /api/v1/projects/REFAPART/requests` | REFAPART API | Solicitud cuando no hay pieza visible. | Parcial |
| REFAPART | `POST /api/v1/projects/REFAPART/quotes` | REFAPART API/Sales | Crear cotizacion asistida. | Parcial |
| Tecno Telec | `GET /api/v1/projects/TECNOTELEC/solutions` | TecnoTelec API/Catalog | Listar soluciones publicadas. | Parcial |
| Tecno Telec | `GET /api/v1/projects/TECNOTELEC/catalog` | Catalog/Pricing/Supplier | Catalogo consultivo. | Parcial |
| Tecno Telec | `POST /api/v1/projects/TECNOTELEC/quotes` | Sales API | Crear solicitud de cotizacion MVP. | Parcial |
| JobCron | `GET /api/v1/projects/JOBCRON/admin/overview` | JobCron API | Dashboard operativo. | PENDIENTE_DE_IMPLEMENTAR |
| JobCron | `GET /api/v1/projects/JOBCRON/search` | Search API | Busqueda administrativa autorizada. | PENDIENTE_DE_IMPLEMENTAR |

## Datos minimos por proyecto

| Proyecto | Semillas minimas | Bloqueos reales |
|---|---|---|
| MexIngSof | Servicios, paquetes, sectores, CTAs, leads demo, estados de lead. | Dominio final, datos reales de contacto, Auth admin, API productiva de leads. |
| REFAPART | Categorias, marcas, piezas demo, proveedores internos, estados de solicitud, estados de cotizacion. | Pasarela de pago, garantias/devoluciones, proveedores autorizados reales, roles seed. |
| Tecno Telec | Soluciones, paquetes, componentes, categorias, preguntas de diagnostico, estados de cotizacion. | Reglas de surtido por canal, reglas de compatibilidad, proveedor/pricing real. |
| JobCron | Roles, permisos, features, aplicaciones, estados operativos, usuarios admin iniciales. | Decidir SaaS publico vs ERP interno, Auth real para panel, modulos operativos por proyecto. |

## Permisos minimos

| Rol | Alcance |
|---|---|
| `CUSTOMER` | Usuario final autenticado. |
| `MEXINGSOF_ADMIN` | Administrar leads, servicios y contenido corporativo. |
| `REFAPART_ADMIN` | Administrar piezas, solicitudes, cotizaciones y ordenes. |
| `REFAPART_SUPPLIER_MANAGER` | Gestionar proveedores ocultos y ofertas internas. |
| `TECNOTELEC_ADMIN` | Administrar soluciones, catalogo publicable y reglas propias. |
| `TECNOTELEC_SALES` | Gestionar diagnosticos y cotizaciones consultivas. |
| `JOBCRON_ADMIN` | Operacion global del ecosistema. |
| `JOBCRON_AUDITOR` | Lectura de auditoria y reportes sin mutacion. |

Los permisos concretos deben quedar sincronizados con Auth antes de exponer
pantallas administrativas reales.

## Search y sincronizacion

Search debe indexar documentos por:

- `project_code`
- `domain_code`
- `tenant_code`
- `entity_type`
- permisos o visibilidad
- estado de publicacion

Reglas:

- Cada API origen publica eventos por outbox cuando crea, actualiza, oculta,
  restaura o elimina entidades buscables.
- Si Search no recibe un evento, debe poder ejecutar reconciliacion desde tabla
  origen mediante endpoint interno o job autorizado.
- Si el dato solo existe en la tabla origen, la API responsable debe adaptar el
  documento indexable y enviarlo a Search sin exigir cambios manuales.
- Los errores de indexacion se registran con payload, causa, contador de
  reintentos y ultima fecha de intento.
- El frontend no consulta Search directamente; siempre lo hace por Gateway o
  API de proyecto.

## Flujos productivos obligatorios

| Flujo | Secuencia |
|---|---|
| Lead MexIngSof | Web -> Gateway -> JobCron API -> Sales/CRM -> Search opcional -> JobCron admin |
| Solicitud REFAPART | Web -> Gateway -> REFAPART API -> Supplier/Pricing/Sales -> Search -> JobCron admin |
| Cotizacion Tecno Telec | Web -> Gateway -> TecnoTelec API/Sales -> Pricing/Catalog -> JobCron admin |
| Operacion JobCron | Web JobCron -> Gateway -> Auth -> JobCron API -> Core APIs -> Search autorizado |

## Pendientes que bloquean desarrollo productivo completo

| Pendiente | Por que bloquea |
|---|---|
| Auth/roles seed definitivos | Sin permisos reales no se deben exponer admins productivos. |
| Contrato final MexIngSof leads | La web actual usa rutas Next.js MVP; produccion exige Gateway/JobCron. |
| Pasarela de pago REFAPART | Sin proveedor definido no se puede cerrar flujo transaccional. |
| Politicas REFAPART finales | Garantia, devolucion, proveedores y logistica cambian datos y permisos. |
| Surtido/canal Tecno Telec | Sin ChannelAssortment se puede publicar producto incorrecto. |
| Reglas de compatibilidad | Evita cotizaciones tecnicamente invalidas en REFAPART/Tecno Telec. |
| JobCron como SaaS o ERP interno | Cambia rutas publicas, onboarding, facturacion y permisos. |

## Criterio de cierre

Un proyecto queda productivo cuando:

1. Su web consume solo Gateway.
2. Sus rutas estan registradas en `gateway-route-registry.md`.
3. Sus datos minimos tienen seeds o fuente real.
4. Sus roles existen en Auth.
5. Sus entidades buscables sincronizan con Search o tienen reconciliacion.
6. Sus validaciones de lint/build/tests/migraciones/Docker estan documentadas.
7. Los faltantes restantes son externos y estan marcados como
   `PENDIENTE_DE_DEFINIR`.
