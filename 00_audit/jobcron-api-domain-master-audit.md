# Auditoria maestra de APIs y dominios para JobCron

## Estado

ACTIVE

## Contexto

Documento generado por ejecucion de `Docs/agents/AGENTS-012.md` durante la
ejecucion selectiva definida por `Docs/agents/AGENTS-013.md`.

Esta auditoria no implementa codigo, migraciones, endpoints ni UI. Su objetivo
es ordenar dominios, APIs reutilizables, brechas y riesgos antes de continuar
desarrollo comercial sobre JobCron y proyectos dependientes.

## 1. Resumen ejecutivo

JobCron puede sostener una salida comercial inicial solo si se mantiene como
ERP/orquestador central y se evita convertir cada proyecto en propietario de
APIs compartidas. Las piezas reutilizables documentadas existen para Auth,
Gateway, Catalog, Inventory, Pricing, Procurement, Sales, Supplier, Document,
Fiscal, Address y Search, pero varias capacidades comerciales siguen parciales
o pendientes.

Riesgo principal: avanzar proyectos comerciales creando endpoints propios para
pagos, clientes, cotizaciones, facturacion, notificaciones o logistica cuando
esas capacidades deben vivir como APIs core/shared o contratos centralizados.

Decision: antes de crear una API nueva se debe revisar `00_api_index.md`,
`reusable-api-contracts.md`, `api-decision-matrix.md`,
`gateway-route-registry.md` y el contrato del proyecto afectado.

## 2. Documentacion leida

| Documento | Uso |
|---|---|
| `Docs/README.md` | Entrada documental y reglas de lectura. |
| `Docs/_meta/master-index.md` | Indice documental global. |
| `Docs/_meta/active-work-index.md` | Context packs activos. |
| `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md` | Reglas operativas de agents. |
| `Docs/agents/AGENT_GLOBAL_RULES.md` | Reglas globales de agents. |
| `Docs/agents/EXECUTION_REPORT.md` | Estado previo de ejecucion. |
| `Docs/00_audit/10_development_gap_analysis.md` | Brechas de desarrollo. |
| `Docs/00_audit/reusable-api-map.md` | Mapa de APIs reutilizables. |
| `Docs/00_audit/reusable-api-audit.md` | Riesgos de reutilizacion. |
| `Docs/01_core_erp/apis/00_api_index.md` | Inventario canonico de APIs. |
| `Docs/01_core_erp/apis/reusable-api-contracts.md` | Contratos reutilizables. |
| `Docs/01_core_erp/apis/api-decision-matrix.md` | Decision crear/reutilizar API. |
| `Docs/01_core_erp/apis/gateway-route-registry.md` | Rutas del Gateway General. |
| `Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md` | Consumo UI/API. |
| `Docs/02_projects/jobcron/README.md` | Alcance ERP JobCron. |
| `Docs/02_projects/refapart/README.md` | Alcance comercial REFAPART. |
| `Docs/02_projects/refapart/api-contracts.md` | Contratos REFAPART. |
| `Docs/02_projects/tecnotelec/README.md` | Alcance Tecno Telec. |
| `Docs/02_projects/tecnotelec/tasks/01_required_apis.md` | APIs requeridas Tecno Telec. |
| `Docs/02_projects/docucore/README.md` | Alcance documental DocuCore. |
| `Docs/02_projects/lexnova/README.md` | Alcance LegalTech LexNova. |
| `Docs/02_projects/leadhunter/README.md` | Alcance prospecting LeadHunter. |
| `Docs/02_projects/fiscora/README.md` | Alcance fiscal Fiscora. |
| `Docs/02_projects/mexingsof/README.md` | Alcance MexIngSof. |
| `Docs/03_standards/product/module-catalog.md` | Catalogo de modulos. |

## 3. Dominios del ERP central

| Dominio | Propietario canonico | Estado | Observacion |
|---|---|---|---|
| Identidad y acceso | Auth API | Reutilizable | No duplicar usuarios por proyecto. |
| Entrada publica | Gateway General | Reutilizable | Todas las webs deben consumir por Gateway. |
| Catalogo | Catalog API | Reutilizable parcial | Base para productos, piezas y servicios. |
| Inventario | Inventory API | Reutilizable parcial | Requiere cierre de contratos por canal. |
| Proveedores | Supplier API | Reutilizable avanzado | Base para Tecno Telec y REFAPART. |
| Precios | Pricing API | Reutilizable parcial | Faltan reglas avanzadas y calculo final. |
| Compras | Procurement API | Reutilizable parcial | Relevante para abastecimiento. |
| Ventas | Sales API | Parcial | No debe reemplazar Payment/Billing. |
| Documentos | Document API | Reutilizable | Base de DocuCore, LexNova y Fiscora. |
| Fiscal | Fiscal API | Reutilizable | Base CFDI/SAT para Fiscora y facturacion futura. |
| Direcciones | Address API | Reutilizable | REFAPART debe reutilizarla. |
| Busqueda | Search API | Reutilizable parcial | Requiere sincronizacion automatica y recovery. |
| Operacion JobCron | JobCron API | Parcial | Orquesta modulos, features y admin. |

## 4. APIs actuales reutilizables

| API | Estado documental | Uso recomendado |
|---|---|---|
| `API.PY.DJANGO.Auth` | Confirmada | Login, permisos, sesiones y roles. |
| `API.PY.DJANGO.Gateway` | Confirmada | Superficie publica unica. |
| `API.PY.DJANGO.Catalog` | Confirmada parcial | Productos, categorias y marcas. |
| `API.PY.DJANGO.Inventory` | Confirmada parcial | Stock, ubicaciones y disponibilidad. |
| `API.PY.DJANGO.Pricing` | Confirmada parcial | Listas, precios y reglas. |
| `API.PY.DJANGO.Procurement` | Confirmada parcial | Compras y abastecimiento. |
| `API.PY.DJANGO.Sales` | Confirmada parcial | Ordenes, ventas y flujo comercial base. |
| `API.PY.DJANGO.Supplier` | Confirmada avanzada | Proveedores y sincronizacion. |
| `API.PY.DJANGO.Document` | Confirmada | Archivos, OCR, transformaciones y storage. |
| `API.PY.DJANGO.Fiscal` | Confirmada | CFDI, SAT y datos fiscales. |
| `API.PY.DJANGO.Address` | Confirmada | Estados, municipios, asentamientos y CP. |
| `API.PY.DJANGO.Search` | Reutilizable parcial | Indices y busqueda transversal. |

## 5. APIs de proyecto actuales

| Proyecto | API de dominio | Estado | Regla |
|---|---|---|---|
| JobCron | `API.PY.DJANGO.JobCron` | Parcial | Orquestacion ERP y feature availability. |
| REFAPART | `API.PY.DJANGO.RefaPart` | MVP documentado | Solo dominio comercial REFAPART. |
| Tecno Telec | `API.PY.DJANGO.TecnoTelec` | Draft | Solo procesos propios de soluciones. |
| LexNova | `API.PY.DJANGO.LexNova` | Parcial | Casos, participantes y dominio legal. |
| DocuCore | `API.PY.DJANGO.DocuCore` | MVP | Producto documental, no Document API. |
| Fiscora | `API.PY.DJANGO.Fiscora` | MVP | Producto SaaS fiscal, no Fiscal API. |
| LeadHunter | `API.PY.DJANGO.LeadHunter` | Implementada | Prospecting interno operado desde JobCron. |
| MexIngSof | `API.PY.DJANGO.MexIngSof` | PENDIENTE_DE_DEFINIR | No crear sin contrato canonico. |

## 6. APIs faltantes o pendientes de decision

| Capacidad | API sugerida | Prioridad | Motivo |
|---|---|---:|---|
| Clientes/personas/empresas | Customer API | Alta | Evita duplicar clientes en REFAPART, Tecno Telec, Billing y CRM. |
| Leads/oportunidades | CRM o Lead API | Alta | MexIngSof y JobCron requieren flujo comercial central. |
| Cotizaciones | Quote API | Alta | Tecno Telec y REFAPART no deben duplicar snapshots. |
| Pagos | Payment API | Alta | REFAPART y POS requieren pasarela real. |
| Billing independiente | Billing API | Alta | Facturacion comercial no debe mezclarse con Fiscal ni Sales. |
| Notificaciones | Notification API | Alta | LexNova, REFAPART, Fiscora y JobCron requieren avisos. |
| Logistica | Logistics API | Media | Tracking y costos de envio. |
| Reglas | Rules Engine API | Alta | Pricing, disponibilidad, soluciones y promociones. |
| Carrito | Cart API | Media | Webs comerciales con compra directa. |
| Proyectos/servicios | Projects API | Alta para Tecno Telec | Cotizacion consultiva y ejecucion de servicios. |
| Suscripciones/creditos | Subscription/Credit API | Media | DocuCore, Fiscora y SaaS futuros. |
| Observabilidad | Observability API | Media | Health checks, incidentes y diagnostico. |
| Registro de software | Software Control API | Media | Solo si MexIngSof no puede reutilizar JobCron. |
| Eventos/colas | Event API | Alta | Sincronizacion entre proyectos, Search y JobCron. |

## 7. Contratos faltantes

| Contrato | Estado |
|---|---|
| Customer canonical contract | PENDIENTE_DE_DEFINIR |
| Quote snapshot contract | PENDIENTE_DE_DEFINIR |
| Payment transaction contract | PENDIENTE_DE_DEFINIR |
| Billing invoice/charge contract | PENDIENTE_DE_DEFINIR |
| Notification message contract | PENDIENTE_DE_DEFINIR |
| Logistics shipment/tracking contract | PENDIENTE_DE_DEFINIR |
| Event envelope contract | PENDIENTE_DE_DEFINIR |
| Search index sync/recovery contract | PENDIENTE_DE_DEFINIR |
| Software asset registry contract | PENDIENTE_DE_DEFINIR |

## 8. APIs parciales con riesgo de duplicidad

| API | Riesgo | Decision |
|---|---|---|
| Sales | Usarla para pagos o billing completo. | Mantenerla para ventas/ordenes; pagos y billing separados. |
| Fiscal | Usarla para todo billing comercial. | Mantener CFDI/SAT; Billing debe ser contrato propio. |
| Supplier | Duplicar proveedor por proyecto. | Reutilizar Supplier y extender solo dominio propio. |
| Catalog | Duplicar catalogos por web. | Reutilizar Catalog con extensiones de proyecto si aplica. |
| Search | Insertar datos manualmente sin recovery. | Definir contrato de sincronizacion y backfill. |
| JobCron | Convertirlo en API de todos los detalles. | Mantener orquestacion y ownership central. |

## 9. Matriz proyecto vs APIs

| Proyecto | APIs reutilizadas | APIs propias | APIs faltantes criticas |
|---|---|---|---|
| JobCron | Auth, Gateway, Search | JobCron | Customer, CRM/Lead, Notification, Event, Observability |
| REFAPART | Auth, Gateway, Address, Search, Supplier, Sales | RefaPart | Payment, Quote, Logistics, Event |
| Tecno Telec | Auth, Gateway, Catalog, Supplier, Pricing, Inventory, Sales, Search | TecnoTelec | Quote, Projects, Cart, Logistics, Rules |
| LexNova | Auth, Gateway, Document | LexNova | Notification, Billing opcional |
| DocuCore | Auth, Gateway, Document | DocuCore | Credit/Subscription, Notification |
| Fiscora | Auth, Gateway, Document, Fiscal | Fiscora | Billing, Subscription/Credit, Notification |
| LeadHunter | Auth, Gateway | LeadHunter | CRM/Lead, Notification, Event |
| MexIngSof | Auth, Gateway, JobCron, Search | PENDIENTE_DE_DEFINIR | Software Control contract si JobCron no cubre |
| Innovation Engines Repair | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | Customer, Quote, Payment, Logistics |
| Radar Empresarial | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | CRM/Lead, Search, Notification |

## 10. Decision de arquitectura recomendada

1. Gateway General sigue como unica entrada publica.
2. Auth sigue como propietario de identidad.
3. Las APIs core/shared resuelven capacidades comunes.
4. Las APIs de proyecto solo guardan reglas de negocio especificas.
5. JobCron orquesta operacion, estados y configuracion transversal.
6. Search no es fuente primaria; indexa y puede reconstruirse desde fuentes
   canonicas.
7. Fiscal no sustituye Billing.
8. Sales no sustituye Payment.

## 11. Search y recuperacion automatica

Search debe tratarse como indice derivado. Si una tabla primaria recibe datos y
Search no sincroniza por error, el sistema debe poder recuperar:

- Backfill por entidad y rango de fechas.
- Reintento idempotente por evento.
- Cola de errores de indexacion.
- Adaptadores por fuente canonica.
- Registro de `source_table`, `source_id`, `source_updated_at` y `indexed_at`.
- Comando operativo de reconstruccion por proyecto.

Contrato pendiente:

```text
PENDIENTE_DE_DEFINIR: Search index sync/recovery contract
```

## 12. Riesgos de migracion

| Riesgo | Impacto | Mitigacion |
|---|---|---|
| Crear Customer por proyecto | Datos duplicados | Definir Customer API antes de nuevos clientes. |
| Crear pagos dentro de Sales | Acoplamiento fuerte | Diseñar Payment API. |
| Usar Fiscal como Billing | Facturacion incompleta | Separar Billing de Fiscal. |
| Indexar Search sin backfill | Busquedas incompletas | Definir sync/recovery. |
| Saltar Gateway | Seguridad inconsistente | Mantener Gateway obligatorio. |
| Crear contenedores por API/proyecto | Docker inconsistente | Usar contenedores oficiales y variables de seleccion. |

## 13. APIs descartadas por duplicidad en esta auditoria

| Propuesta duplicada | API reutilizable |
|---|---|
| Catalogo REFAPART propio de estados/municipios | Address API |
| Catalogo de proveedores por proyecto | Supplier API |
| Auth por proyecto | Auth API |
| Gateway por proyecto | Gateway General |
| Documentos por LexNova/Fiscora duplicados | Document API |
| CFDI dentro de Fiscora producto | Fiscal API |
| Busqueda local por web comercial | Search API |

## 14. Orden recomendado de cierre

1. Congelar contratos existentes del Gateway General.
2. Definir Customer API.
3. Definir Quote API.
4. Definir Payment API.
5. Definir Billing API separada de Fiscal.
6. Definir Notification API.
7. Definir Event/Search sync contract.
8. Completar Logistics API.
9. Completar Rules Engine API.
10. Evaluar Software Control API solo si JobCron no cubre MexIngSof.

## 15. Decisiones tomadas

- No ejecutar codigo para `AGENTS-012.md`.
- No crear APIs nuevas en esta fase.
- Tratar Search como indice reconstruible, no fuente primaria.
- Mantener MexIngSof Software Control como control tecnico, no ERP.
- Evaluar `AGENTS-002.md`, `AGENTS-005.md` y `AGENTS-006.md` como no
  bloqueantes para esta salida selectiva mientras no exista contrato Payment,
  POS o Billing aprobado.

## 16. Pendientes reales

| Pendiente | Necesario para avanzar |
|---|---|
| Customer API | Contrato canonico y ownership. |
| Quote API | Contrato de snapshots y estados. |
| Payment API | Proveedor/pasarela y modelo de transaccion. |
| Billing API | Separacion formal contra Fiscal. |
| Notification API | Canales, plantillas y permisos. |
| Event/Search sync | Envelope, reintentos y backfill. |
| MexIngSof API | Decision si JobCron cubre o si requiere API propia. |

## 17. Riesgos detectados

- Desarrollar webs con datos temporales sin cerrar contratos de API.
- Resolver brechas comerciales en APIs de proyecto por rapidez.
- No registrar rutas del Gateway al crear nuevos endpoints.
- Crear documentacion nueva duplicada en vez de extender la canonica.
- Limpiar agents parciales o evaluados sin haber ejecutado su desarrollo.

## 18. Validaciones aplicables

Esta auditoria es documental. Validaciones requeridas:

- Existencia de rutas documentales citadas.
- Validacion de frontmatter/documentos si los scripts existen.
- `git diff --check`.

No aplican migraciones, endpoints ni builds por no haber cambios de codigo.

## 19. Cierre

Estado final de `AGENTS-012.md`: COMPLETADO DOCUMENTAL.

Puede limpiarse el contenido de `Docs/agents/AGENTS-012.md` despues de registrar
esta ejecucion en `Docs/agents/EXECUTION_REPORT.md`.
