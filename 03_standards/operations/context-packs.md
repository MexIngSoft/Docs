> Nota operativa: el orden de lectura vigente y la resolucion de contradicciones para Codex viven en `Docs/_meta/codex-entrypoint.md`. Cualquier orden local de este documento queda subordinado a esa entrada unica.
# Context Packs oficiales para Codex

## CP-00 - Preflight obligatorio

Codex siempre debe leer primero:

- `README.md`
- `.codex-context.yml`
- `00_audit/codex-context-map.md`
- `03_standards/operations/context-packs.md`

Antes de implementar debe declarar:

- tipo de tarea;
- Context Pack elegido;
- documentos que va a leer;
- documentos que no va a leer.

## CP-01 - Bug pequeno frontend

Usar para:

- corregir boton;
- corregir formulario;
- corregir estilos;
- corregir validaciones visuales.

Leer solo:

- `README.md`
- `02_projects/<project>/frontend/`
- `03_standards/frontend/`
- `01_core_erp/apis/reusable-api-contracts.md`

No leer:

- Docker;
- integraciones;
- otros proyectos;
- `_archive`.

## CP-02 - Nueva pantalla frontend

Leer:

- `README.md`
- `02_projects/<project>/frontend/`
- `02_projects/<project>/business/`
- `03_standards/frontend/`
- `01_core_erp/apis/reusable-api-contracts.md`

## CP-03 - API reutilizable existente

Leer:

- `README.md`
- `01_core_erp/apis/`
- `01_core_erp/database/`
- `03_standards/backend/`
- `03_standards/database/`

Prohibido crear API nueva si Auth, Catalog, Inventory, Pricing, Supplier,
Procurement, Sales, Search, Document, Notification, FeatureVisibility, ETL,
Fiscal o Address ya cubren el caso.

## CP-04 - Nueva API

Leer:

- `README.md`
- `01_core_erp/apis/`
- `01_core_erp/architecture/`
- `01_core_erp/database/`
- `03_standards/backend/`
- `03_standards/database/`

Antes de crear debe justificar:

- por que no sirve una API existente;
- que dominio nuevo representa;
- que proyecto la consume;
- que tablas necesita;
- que endpoints expone.

## CP-05 - Docker

Leer:

- `README.md`
- `03_standards/operations/`
- `03_standards/docker/`
- Dockerfiles reales;
- docker-compose reales.

Reglas:

- no crear Docker nuevo fuera del estandar;
- no crear red nueva por proyecto;
- usar `jobcron_network`;
- no usar SQLite;
- usar PostgreSQL.

## CP-06 - Integracion externa

Usar para proveedores externos.

Leer:

- `README.md`
- `04_integrations/<provider>/`
- `01_core_erp/apis/reusable-api-contracts.md`
- `03_standards/security/`
- `03_standards/operations/`

Reglas:

- no mezclar modelo externo con modelo interno;
- crear mapper;
- crear sync;
- crear logs;
- crear manejo de errores.

## CP-07 - Proyecto completo

Usar para revisar o cerrar un proyecto completo sin mezclarlo con otros
proyectos.

Leer:

- `README.md`
- `02_projects/<project>/`
- `01_core_erp/apis/reusable-api-contracts.md`
- `01_core_erp/apis/api-decision-matrix.md`
- `03_standards/`

No leer:

- `_archive`;
- documentos historicos;
- proyectos no relacionados, salvo dependencia explicita.

## CP-08 - Mapa de acciones de codigo

Usar para:

- crear o actualizar `technical/code-actions-map.md`;
- vincular acciones frontend con Gateway, APIs, permisos y tablas;
- registrar acciones nuevas o pendientes durante desarrollo.

Leer:

- `README.md`;
- `03_standards/code-actions/code-actions-map-standard.md`;
- `02_projects/<project>/README.md`;
- frontend/API/documentos canonicos del proyecto afectado;
- contratos Gateway/API relacionados.

Reglas:

- no inventar endpoints activos;
- si falta informacion real, usar `PENDIENTE_DE_DEFINIR`;
- no marcar como vigente una accion conceptual;
- no duplicar acciones ya documentadas.

