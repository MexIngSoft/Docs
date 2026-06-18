# Mapa de contexto Codex

## Objetivo

Definir paquetes minimos de lectura para que Codex trabaje sin leer todo el
repositorio, sin duplicar APIs y sin mezclar nucleo, proyecto, estandar o
integracion externa.

## Regla principal

Codex no implementa hasta identificar primero el Context Pack minimo de la
tarea.

El catalogo canonico de Context Packs vive en:

```text
03_standards/operations/context-packs.md
```

## Orden base de lectura

1. `README.md`
2. `03_standards/operations/context-packs.md`
3. `00_audit/document-ownership-map.md`
4. `_meta/active-work-index.md`
5. `_meta/master-index.md`
6. Documentos canonicos del dominio afectado.
7. Estandares tecnicos aplicables.

## Context Pack minimo por tipo de tarea

| Tarea | Leer solo |
|---|---|
| Frontend | `README.md`, `02_projects/<proyecto>/frontend/*`, `03_standards/frontend/*`, `01_core_erp/apis/reusable-api-contracts.md` |
| API nucleo | `README.md`, `01_core_erp/apis/*`, `01_core_erp/database/*`, `03_standards/operations/django-api-project-compliance.md`, `03_standards/database/*` |
| Integracion externa | `README.md`, `04_integrations/<proveedor>/*`, `01_core_erp/apis/reusable-api-contracts.md`, `03_standards/security/*`, `03_standards/operations/*` |
| Docker | `README.md`, `03_standards/operations/git-repository-map.md`, `03_standards/docker.md`, `03_standards/docker/*`, compose y Dockerfiles reales del repo objetivo |
| Proyecto especifico | `README.md`, `02_projects/<proyecto>/*`, `01_core_erp/apis/reusable-api-contracts.md`, estandares relacionados |
| Agents | `README.md`, `agents/RUN_AGENTS_INSTRUCTIONS.md`, `agents/AGENT_GLOBAL_RULES.md`, `03_standards/operations/standard-request-prompts.md`, agent activo |

Para detalle operativo usar `03_standards/operations/context-packs.md`.

## Documentos historicos o de baja prioridad

Estos documentos se leen solo cuando se investigan decisiones historicas o
contradicciones:

- `_archive/**`
- `agents/_archive/**`
- `00_audit/99_final_review.md`
- `00_audit/07_recommended_documentation_strategy.md`
- `agents/EXECUTION_REPORT.md` excepto cuando la tarea usa agents.

## Reglas de ahorro de contexto

- No leer todos los proyectos si la tarea afecta uno solo.
- No leer proveedores externos si no hay integracion externa.
- No leer frontend si la tarea es puramente API o base de datos.
- No leer Docker si no se modifican compose, Dockerfile, redes o variables.
- No cargar archivos historicos como fuente vigente.
- No implementar antes de seleccionar Context Pack.
- No crear API nueva sin revisar `01_core_erp/apis/reusable-api-contracts.md`.
- No crear Docker nuevo sin revisar el estandar Docker vigente.

## Validacion esperada

Al cerrar una tarea, documentar:

- Context Pack usado.
- Documentos fuera de alcance.
- Documento canonico que prevalece.
- Validaciones ejecutadas.
- Faltantes con `PENDIENTE_DE_DEFINIR`.
