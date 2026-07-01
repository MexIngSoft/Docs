# Entrada unica Codex

## Estado

ACTIVE

## Objetivo

Definir el punto unico de entrada para Codex antes de leer agents, documentacion o codigo. Este documento prevalece sobre otros documentos operativos cuando haya diferencias de orden de lectura o flujo de ejecucion.

## Orden unico de lectura

1. `Docs/README.md`
2. `Docs/_meta/codex-entrypoint.md`
3. `Docs/_meta/active-work-index.md`
4. `Docs/agents/AGENT_GLOBAL_RULES.md`
5. `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md` solo si se ejecutan agents.
6. `Docs/agents/_index.md` solo si se ejecutan agents.
7. Context Pack minimo del dominio afectado.
8. Documentacion canonica del proyecto, API, estandar o integracion afectada.
9. `Docs/00_audit/10_development_gap_analysis.md` solo si toca cierre MVP, APIs faltantes o brechas de desarrollo.

## Cuando usar agents

Usar `Docs/agents/AGENTS-*.md` cuando el usuario pida explicitamente ejecutar agents, reagrupar agents, limpiar agents, cerrar pendientes acumulados o actualizar `EXECUTION_REPORT.md`.

## Cuando no usar agents

No usar agents para tareas directas sin agents, correcciones puntuales, explicaciones o validaciones aisladas. En esos casos aplicar `Docs/03_standards/documentation-first-workflow.md`.

## Instrucciones nuevas

Las instrucciones nuevas o ambiguas se pegan en `Docs/agents/instructions/inbox.md` y se clasifican con `classifier.md` y `routing-matrix.md`.

## Agentes especializados

Usar `Docs/agents/specialized/` para seleccionar lectura minima, repos afectados, validaciones y criterio de cierre por dominio.

## Context Pack minimo

El Context Pack se selecciona desde `Docs/_meta/active-work-index.md`, `Docs/03_standards/operations/context-packs.md` y `Docs/00_audit/codex-context-map.md`.

## Fuentes no vigentes

No usar como fuente vigente: `_archive` sin justificacion, agents cerrados o vacios, roadmaps sin MVP, documentos `FUTURE_OR_PENDING` para produccion, ni bocetos temporales si contradicen estandar o mockup aprobado.

## Prevalencia en contradicciones

1. Arquitectura: `Docs/03_standards/architecture/*`
2. API/Core: `Docs/01_core_erp/apis/00_api_index.md` y contratos canonicos.
3. Proyecto: `Docs/02_projects/<project>/README.md` y mapas de acciones.
4. DB: `Docs/03_standards/database/postgresql-project-users-and-schemas.md`
5. Docker: `Docs/03_standards/docker/jobcron-official-docker-architecture.md`
6. Codex/agents: este documento.

Registrar contradicciones en `Docs/_meta/contradiction-resolution-log.md`.

## Criterio de cierre

Un trabajo se cierra solo si esta documentado, implementado si aplica, validado con comandos disponibles, reportado y sin pendientes resolubles localmente.

## Validaciones minimas

- Web: `npm run lint` y `npm run build` si existen.
- API Django: `python manage.py check` y compilacion Python disponible.
- Docker: `docker compose config --quiet` si se toca infraestructura.
- Nginx: `nginx -t` si se toca Nginx.
- Documentacion: rutas/enlaces tocados existen y no duplican canonicos.

## Reporte final esperado

Reportar Context Pack, archivos leidos/modificados, APIs reutilizadas, validaciones, contradicciones, decisiones, pendientes reales, riesgos, agents completados/limpiados/parciales/bloqueados y repos con commit/push si aplica.
