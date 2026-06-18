# Instrucciones raiz para Codex

## Lectura base

Antes de implementar, Codex debe leer:

1. `README.md`
2. `_meta/active-work-index.md`
3. `agents/AGENT_GLOBAL_RULES.md`
4. `00_audit/codex-context-map.md`
5. `03_standards/operations/context-packs.md`

## Regla principal

Codex no implementa hasta identificar el Context Pack minimo de la tarea.

## Prohibiciones

- No crear API nueva sin revisar `01_core_erp/apis/api-decision-matrix.md` y
  `01_core_erp/apis/reusable-api-contracts.md`.
- No crear Gateway/BFF por proyecto.
- No crear Auth por proyecto.
- No crear Docker por proyecto.
- No usar SQLite ni archivos `db.sqlite3`.
- No usar `crejo`; la red oficial es `jobcron_network`.
- No leer `_archive` como fuente activa.
- No implementar endpoints sin contrato documentado o `PENDIENTE_DE_DEFINIR`.

## Agents

Si la tarea viene de `Docs/agents/AGENTS-*.md`, actualizar
`Docs/agents/EXECUTION_REPORT.md` y, al cerrar un agent, vaciar su contenido
sin borrar ni mover el archivo.
