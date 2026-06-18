# Reporte de resolucion de contradicciones

## Objetivo

Registrar contradicciones activas detectadas y decisiones aplicadas para que la
documentacion canonica prevalezca sobre fuentes historicas o ambiguas.

## Resultado actual

No se detectaron contradicciones activas que obliguen a archivar documentos
fuente en esta ejecucion.

Las coincidencias encontradas por busqueda corresponden a:

- prohibiciones explicitas;
- menciones de `crejo` como OBSOLETO / RECHAZADO / NO USAR;
- historial en `_archive` o `agents/EXECUTION_REPORT.md`.

## Decisiones vigentes

| Tema | Documento canonico | Decision |
|---|---|---|
| Gateway | `03_standards/architecture/api-gateway-standard.md` | Gateway General unico; no Gateway/BFF por proyecto. |
| APIs | `01_core_erp/apis/reusable-api-contracts.md` | Reutilizar APIs compartidas antes de crear API especializada. |
| Nueva API | `01_core_erp/apis/api-decision-matrix.md` | Solo si ninguna API compartida cubre el dominio. |
| Docker | `03_standards/docker/jobcron-official-docker-architecture.md` | Docker por objetivo y red `jobcron_network`. |
| Base de datos | `01_core_erp/database/00_database_overview.md` | PostgreSQL obligatorio; no SQLite. |
| Proveedores | `04_integrations/` | Proveedor externo no se mezcla con modelo ERP interno. |
| Contexto Codex | `03_standards/operations/context-packs.md` | Codex trabaja por Context Pack minimo. |

## Pendientes reales

- PENDIENTE_DE_DEFINIR: revisar documentos historicos uno por uno solo si una
  tarea futura necesita trazabilidad de una decision antigua.
- PENDIENTE_DE_DEFINIR: completar documentos faltantes de proyectos e
  integraciones cuando exista owner, MVP y contrato real.
