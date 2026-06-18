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
| `00_audit/reusable-api-audit.md` | Equipo documental | Auditoria | Canonico | Audita cobertura de APIs reutilizables |
| `00_audit/contradiction-resolution-report.md` | Equipo documental | Auditoria | Canonico | Reporta contradicciones activas y decisiones |
| `01_core_erp/apis/00_api_index.md` | Equipo Core ERP | Nucleo | Canonico | Lista de APIs vigentes |
| `01_core_erp/apis/api-decision-matrix.md` | Equipo Core ERP | Nucleo | Canonico | Decide si una necesidad usa API existente |
| `01_core_erp/apis/reusable-api-contracts.md` | Equipo Core ERP | Nucleo | Canonico | Contratos reutilizables resumidos |
| `01_core_erp/architecture/00_general_architecture.md` | Equipo Core ERP | Nucleo | Canonico | Arquitectura general vigente |
| `01_core_erp/architecture/07_project_api_pattern.md` | Equipo Core ERP | Nucleo | Canonico | Consumo de APIs por proyecto |
| `03_standards/architecture/reusable-api-decision-standard.md` | Equipo plataforma | Estandar | Canonico | Arbol de decision para APIs reutilizables |
| `03_standards/architecture/shared-libraries-standard.md` | Equipo plataforma | Estandar | Canonico | Librerias compartidas backend/frontend |
| `03_standards/api/api-contract-first-standard.md` | Equipo plataforma | Estandar | Canonico | API contract first |
| `03_standards/architecture/api-gateway-standard.md` | Equipo plataforma | Estandar | Canonico | Gateway General y API especializada |
| `03_standards/operations/context-packs.md` | Equipo documental | Estandar | Canonico | Context Packs oficiales |
| `03_standards/operations/codex-execution-standard.md` | Equipo documental | Estandar | Canonico | Como pedir y ejecutar tareas Codex |
| `03_standards/operations/codex-anti-patterns.md` | Equipo documental | Estandar | Canonico | Vicios prohibidos |
| `03_standards/codex/codex-minimal-reading-standard.md` | Equipo documental | Estandar | Canonico | Lectura minima Codex |
| `03_standards/codex/codex-anti-vices-checklist.md` | Equipo documental | Estandar | Canonico | Checklist anti-vicios |
| `03_standards/codex/codex-skills-standard.md` | Equipo documental | Estandar | Canonico | Skills reutilizables Codex |
| `.codex/skills/reusable-api-decision/SKILL.md` | Equipo documental | Skill | Canonico | Decision API reutilizable/especializada |
| `.codex/skills/api-contract-first/SKILL.md` | Equipo plataforma | Skill | Canonico | Contrato API antes de codigo |
| `.codex/skills/docker-jobcron/SKILL.md` | Equipo plataforma | Skill | Canonico | Docker JobCron por objetivo |
| `03_standards/operations/git-repository-map.md` | Equipo plataforma | Estandar | Canonico | Repositorios y publicacion |
| `03_standards/docker.md` | Equipo plataforma | Estandar | Canonico | Docker local |
| `03_standards/docker/jobcron-official-docker-architecture.md` | Equipo plataforma | Estandar | Canonico | Docker oficial JobCron |
| `templates/api-contract-template.md` | Equipo documental | Plantilla | Canonico | Plantilla contract first |
| `templates/api-specialized-justification-template.md` | Equipo documental | Plantilla | Canonico | Justificacion de API especializada |
| `templates/frontend-module-template.md` | Equipo documental | Plantilla | Canonico | Modulo frontend |
| `templates/etl-contract-template.md` | Equipo documental | Plantilla | Canonico | Contrato ETL |
| `04_integrations/<proveedor>/*` | Equipo integraciones | Integracion | Canonico por proveedor | Contratos externos |
| `_archive/**` | Equipo documental | Archivo | Historico | Fuente no vigente |

## Pendientes

- PENDIENTE_DE_DEFINIR: owner nominal por equipo o usuario para cada proyecto.
- PENDIENTE_DE_DEFINIR: documento que reemplaza cada fuente historica antigua.
