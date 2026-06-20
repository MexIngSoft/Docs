# Indice operativo de trabajo activo

## Estado

ACTIVE

## Objetivo

Dar una ruta rapida para trabajar sobre la documentacion y el desarrollo sin
leer todo `Docs` cada vez.

Este documento traduce la idea del agent de "Core, Shared, Meta, Agents y
Templates" a la estructura canonica real del repositorio.

## Regla de entrada rapida

Antes de desarrollar o reordenar documentacion:

1. Leer `Docs/README.md`.
2. Leer `Docs/_meta/master-index.md`.
3. Leer este documento.
4. Identificar el Context Pack minimo en `Docs/00_audit/codex-context-map.md`.
5. Leer solo los documentos canonicos del dominio afectado.
6. Revisar `Docs/00_audit/10_development_gap_analysis.md` si la tarea toca
   pendientes, APIs faltantes o cierre de MVP.

## Equivalencias operativas

| Concepto de trabajo | Ruta canonica | Uso |
|---|---|---|
| Core | `Docs/01_core_erp` | Reglas, APIs, base de datos, flujos y arquitectura reutilizable. |
| Shared | `Docs/03_standards` + `Docs/_meta` + `Docs/templates` | Estandares, indices, plantillas y reglas de trabajo. |
| Meta | `Docs/_meta` | Indices, relaciones, calidad, inventarios y mapas de navegacion. |
| Agents | `Docs/agents` | Instrucciones temporales de ejecucion y reporte. |
| Projects | `Docs/02_projects` | Documentacion especifica por empresa, producto o vertical. |
| Integrations | `Docs/04_integrations` | Proveedores externos, APIs de terceros y ETLs. |
| Future | `Docs/pendientes` | Ideas grandes o modulos sin MVP cerrado. |
| Archive | `Docs/_archive` | Fuentes historicas y evidencia conservada. |

## Gobierno global obligatorio

Para que los proyectos salgan con mejor base, toda fase nueva debe revisar:

| Documento | Uso |
|---|---|
| `Docs/agents/AGENT_GLOBAL_RULES.md` | Marco comun para agents, autonomia, bloqueos y validacion. |
| `Docs/03_standards/global-governance.md` | Gobierno del ecosistema y criterios para iniciar proyectos. |
| `Docs/03_standards/frontend/ui-ux-standard.md` | Mobile first, mockups aprobados, UX por dominio y cierre UI. |
| `Docs/03_standards/architecture/api-gateway-standard.md` | Regla Frontend -> Gateway -> API -> Core/Shared. |
| `Docs/03_standards/auth/web-auth-login-standard.md` | Login web via Gateway General y excepciones documentadas. |
| `Docs/03_standards/auth/auth-versioning-standard.md` | Versionado Auth y compatibilidad entre proyectos. |
| `Docs/03_standards/gateway/central-gateway-standard.md` | Entrada unica versionada para frontends y registro de proyectos. |
| `Docs/02_projects/_ecosystem/gateway-matrix.md` | Estado vigente y retiro de Gateways por proyecto. |
| `Docs/03_standards/product/product-strategy.md` | Clasificacion y monetizacion de modulos. |
| `Docs/03_standards/product/module-catalog.md` | Catalogo global de modulos core, shared, comerciales e internos. |
| `Docs/03_standards/operations/module-lifecycle-and-feature-flags.md` | Estados de desarrollo y visibilidad segura por proyecto, tenant y region. |
| `Docs/00_audit/codex-context-map.md` | Context Pack minimo por tipo de tarea para ahorrar contexto. |
| `Docs/00_audit/reusable-api-map.md` | Mapa de necesidades funcionales contra APIs reutilizables. |
| `Docs/00_audit/reusable-api-audit.md` | Auditoria de cobertura y faltantes reales de APIs reutilizables. |
| `Docs/01_core_erp/apis/reusable-api-contracts.md` | Contratos resumidos de APIs reutilizables. |
| `Docs/01_core_erp/apis/api-decision-matrix.md` | Matriz para evitar APIs duplicadas. |
| `Docs/01_core_erp/apis/gateway-route-registry.md` | Registro de rutas Gateway para evitar rutas inventadas o consumo directo de APIs. |
| `Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md` | Matriz de consumo endpoint a modulo UI para evitar mocks persistentes. |
| `Docs/03_standards/operations/context-packs.md` | Context Packs oficiales para Codex. |
| `Docs/03_standards/operations/codex-execution-standard.md` | Flujo estandar para pedir y ejecutar tareas Codex. |
| `Docs/03_standards/operations/codex-anti-patterns.md` | Vicios prohibidos para Codex. |
| `Docs/03_standards/operations/project-docker-dependency-map.md` | Mapa Docker de dependencias y scripts por proyecto. |
| `Docs/_meta/project-operational-inventory.md` | Inventario operativo minimo por proyecto, scripts, puertos, bloqueos y pruebas. |
| `Docs/03_standards/database/postgresql-project-users-and-schemas.md` | Reglas y estado PostgreSQL de bases, usuarios, schemas y migraciones por proyecto. |
| `Docs/03_standards/codex/codex-minimal-reading-standard.md` | Lectura minima obligatoria. |
| `Docs/03_standards/codex/codex-anti-vices-checklist.md` | Checklist anti-vicios. |
| `Docs/03_standards/codex/codex-skills-standard.md` | Estandar de skills reutilizables para flujos Codex repetibles. |
| `Docs/03_standards/api/api-decision-record-standard.md` | Bloqueo formal para APIs nuevas o especializadas sin decision documentada. |
| `Docs/03_standards/api/address-api-standard.md` | Uso reutilizable de Address API para direcciones y catalogos geograficos. |
| `Docs/03_standards/frontend/address-form-standard.md` | Formularios de direccion via Gateway General y Address API. |
| `Docs/03_standards/backend/reusable-api-consumption-standard.md` | Consumo backend de APIs reutilizables sin duplicar responsabilidades. |
| `Docs/03_standards/codex/codex-change-budget-standard.md` | Presupuesto de lectura y modificacion para reducir cambios innecesarios. |
| `Docs/03_standards/codex/codex-documentation-diff-standard.md` | Cambios documentales minimos, exactos y trazables. |
| `Docs/03_standards/codex/codex-output-report-standard.md` | Estandar de salida obligatoria para cierres Codex. |
| `Docs/03_standards/architecture/shared-library-registry.md` | Registro real de librerias compartidas y faltantes. |
| `Docs/.codex/skills/reusable-api-decision/SKILL.md` | Skill para decidir API compartida o especializada solo si aplica. |
| `Docs/.codex/skills/api-contract-first/SKILL.md` | Skill para contrato API antes de codigo. |
| `Docs/.codex/skills/docker-jobcron/SKILL.md` | Skill para Docker por objetivo con `jobcron_network`. |

## Ruta rapida por tipo de tarea

| Tarea | Leer primero | Despues leer |
|---|---|---|
| Cerrar MVP o brecha de desarrollo | `00_audit/10_development_gap_analysis.md` | Proyecto afectado, APIs involucradas y estandares aplicables. |
| Crear/modificar API core | `01_core_erp/apis/00_api_index.md` | Documento de API especifica, DB relacionada, arquitectura y testing. |
| Crear/modificar proyecto | `02_projects/_ecosystem/04_process_convergence_and_conflicts.md` | README del proyecto, tasks, decisions y frontend/API propios. |
| Crear/modificar Auth/login web | `03_standards/auth/web-auth-login-standard.md` | Matrices API/Gateway, Auth core, Gateway central y plan `auth-migration.md`. |
| Trabajar Fiscora | `02_projects/fiscora/README.md` | `architecture.md`, `api-contracts.md`, `tasks/*`, `database/cfdi-data-model.md`. |
| Trabajar DocuCore | `02_projects/docucore/README.md` | `mvp-roadmap.md`, `api-contracts.md`, `document-intelligence.md`, `database.md`. |
| Trabajar LexNova | `02_projects/lexnova/README.md` | `legal-process-data-model.md`, `document-intelligence.md`, `document-api-integration-review.md`. |
| Trabajar REFAPART | `02_projects/refapart/README.md` | `architecture.md`, `frontend.md`, `visual-identity.md`, `api-contracts.md`, `database.md`, `local-runbook.md`. |
| Trabajar Tecno Telec | `02_projects/tecnotelec/AGENTE.md` | `tasks/*`, `backend/*`, `frontend/*`, `quotes/*`, `solutions/*`. |
| Trabajar JobCron | `02_projects/jobcron/README.md` | `01_tecnotelec_admin_process.md`, `ui/*`, Core APIs relacionadas. |
| Trabajar Imagrafity | `02_projects/imagrafity/README.md` | `architecture.md`, `api-contracts.md`, `database.md`, `frontend.md`, `security.md`. |
| Trabajar seguridad/Auth | `01_core_erp/auth/README.md` | `01_core_erp/apis/01_auth_api.md`, `architecture/04_security.md`, `03_standards/security/*`. |
| Trabajar frontend | `03_standards/frontend/README.md` | Frontend del proyecto y checklist pre-development. |
| Trabajar Git/publicacion | `03_standards/operations/git-repository-map.md` | Git branch governance, release flow y execution reports. |
| Trabajar integraciones | `04_integrations/README.md` | Carpeta del proveedor y estandar de integracion. |

## Prioridad de lectura por proyecto activo

| Prioridad | Proyecto | Motivo |
|---|---|---|
| P0 | Docs + repos modificados | Hay cambios locales y decisiones de publicacion pendientes. |
| P1 | Fiscora/Fiscal | Tiene parser CFDI iniciado y necesita cerrar Web -> Gateway -> Fiscal. |
| P1 | DocuCore/Document API | Es capacidad transversal para OCR, archivos y artefactos. |
| P1 | LexNova | Depende de DocuCore para documento legal, OCR, secciones y revision humana. |
| P1 | Tecno Telec/JobCron | Necesita cerrar gateway, catalogo, pricing, permisos y datos reales. |
| P2 | Core ERP faltante | Quote, Rules, Projects, Billing, Notifications, Logistics, Cart. |
| P3 | Proyectos futuros | Clientix, Datara, Rutexa, Stockara, Pagora y demas hasta tener MVP/owner. |

## Regla para documentos futuros

No convertir un proyecto `FUTURE_OR_PENDING` en implementacion hasta tener:

- owner;
- MVP;
- API responsable;
- datos compartidos;
- datos aislados;
- permisos;
- integraciones externas;
- orden de desarrollo.

## Regla para evitar duplicacion

- Si afecta varias empresas: documentar en `01_core_erp` o `03_standards`.
- Si afecta una marca/producto: documentar en `02_projects/<proyecto>`.
- Si afecta proveedor externo: documentar en `04_integrations/<proveedor>`.
- Si es decision historica o fuente: archivar en `_archive`.
- Si es instruccion temporal: usar `Docs/agents` y luego limpiar.

## Resultado esperado de uso

Cada nueva tarea debe poder responder rapidamente:

1. Que documento canonico rige?
2. Que proyecto/API toca?
3. Que queda fuera?
4. Que informacion falta?
5. Que validacion aplica?
6. Donde se reporta el resultado?
