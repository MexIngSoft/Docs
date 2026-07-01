# Indice de agents activos

## Objetivo

Evitar que Codex tenga que leer todos los `AGENTS-*.md` para clasificar una
tarea nueva. Este indice define donde entra cada instruccion y que archivo debe
leerse despues del pre-flight obligatorio.

## Regla principal

1. Leer `RUN_AGENTS_INSTRUCTIONS.md`, `AGENT_GLOBAL_RULES.md` y
   `EXECUTION_REPORT.md`.
2. Leer este indice.
3. Clasificar la tarea con `instructions/classifier.md`.
4. Enrutarla con `instructions/routing-matrix.md`.
5. Leer solo el agent especializado aplicable.

## Agents numericos

| Agent | Estado | Uso actual |
|---|---|---|
| `AGENTS-000.md` | ACTIVO_PARCIAL | Pendientes historicos grandes; no ejecutar sin clasificar primero. |
| `AGENTS-001.md` | ACTIVO_PARCIAL | Pendientes absorbidos por Auth/JobCron/RefaPart; revisar solo si el reporte lo exige. |
| `AGENTS-002.md` | CERRADO_REPORTADO | Base de datos/migraciones ya reportadas; no reabrir sin informacion nueva. |
| `AGENTS-003.md` | ACTIVO_PARCIAL | Auditoria documental de codigo. |
| `AGENTS-004.md` | ACTIVO_PARCIAL | MexIngSof. |
| `AGENTS-005.md` | ACTIVO_PARCIAL | JobCron/POS/Core. |
| `AGENTS-006.md` | EN_EJECUCION | Orquestacion de reorganizacion documental y cierre preproduccion. |
| `AGENTS-007.md` a `AGENTS-029.md` | SIN_INSTRUCCIONES | Placeholders vacios. |
| `AGENTS-030.md` | BACKLOG_ACTIVO | Concentrador de pendientes P0-P5. |
| `AGENTS-031.md` | ORQUESTADOR | Orden maestro creado desde `AGENTS-006.md`. |

## Especializados

Leer `Docs/agents/specialized/*.md` solo si el clasificador lo indica.

## Bandeja

Las instrucciones nuevas o ambiguas se registran en
`Docs/agents/instructions/inbox.md` antes de convertirlas en tareas ejecutables.
