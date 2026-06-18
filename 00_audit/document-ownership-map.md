# Mapa de propiedad documental

## Objetivo

Definir el dueno logico de los documentos activos para evitar duplicidad,
contradicciones y lecturas excesivas.

## Regla principal

Un documento activo debe tener un solo dueno logico. Si otro documento cubre el
mismo tema, debe enlazar al canonico o moverse a `_archive` cuando sea fuente
historica.

## Mapa canonico

| Documento | Dueno logico | Tipo | Estado | Reemplaza o complementa |
|---|---|---|---|---|
| `README.md` | Equipo documental | Indice raiz | Canonico | Punto de entrada general |
| `_meta/active-work-index.md` | Equipo documental | Meta | Canonico | Ruta rapida operativa |
| `_meta/master-index.md` | Equipo documental | Meta | Canonico | Inventario navegable |
| `00_audit/codex-context-map.md` | Equipo documental | Auditoria | Canonico | Reduce contexto por tarea |
| `00_audit/document-ownership-map.md` | Equipo documental | Auditoria | Canonico | Define duenos documentales |
| `00_audit/reusable-api-map.md` | Equipo documental | Auditoria | Canonico | Mapea necesidades a APIs reutilizables |
| `01_core_erp/apis/00_api_index.md` | Equipo Core ERP | Nucleo | Canonico | Lista de APIs vigentes |
| `01_core_erp/apis/reusable-api-contracts.md` | Equipo Core ERP | Nucleo | Canonico | Contratos reutilizables resumidos |
| `01_core_erp/architecture/00_general_architecture.md` | Equipo Core ERP | Nucleo | Canonico | Arquitectura general vigente |
| `01_core_erp/architecture/07_project_api_pattern.md` | Equipo Core ERP | Nucleo | Canonico | Consumo de APIs por proyecto |
| `03_standards/architecture/api-gateway-standard.md` | Equipo plataforma | Estandar | Canonico | Gateway General y API especializada |
| `03_standards/operations/codex-execution-standard.md` | Equipo documental | Estandar | Canonico | Como pedir y ejecutar tareas Codex |
| `03_standards/operations/codex-anti-patterns.md` | Equipo documental | Estandar | Canonico | Vicios prohibidos |
| `03_standards/operations/git-repository-map.md` | Equipo plataforma | Estandar | Canonico | Repositorios y publicacion |
| `03_standards/docker.md` | Equipo plataforma | Estandar | Canonico | Docker local |
| `03_standards/docker/jobcron-official-docker-architecture.md` | Equipo plataforma | Estandar | Canonico | Docker oficial JobCron |
| `04_integrations/<proveedor>/*` | Equipo integraciones | Integracion | Canonico por proveedor | Contratos externos |
| `_archive/**` | Equipo documental | Archivo | Historico | Fuente no vigente |

## Pendientes

- PENDIENTE_DE_DEFINIR: owner nominal por equipo o usuario para cada proyecto.
- PENDIENTE_DE_DEFINIR: documento que reemplaza cada fuente historica antigua.
