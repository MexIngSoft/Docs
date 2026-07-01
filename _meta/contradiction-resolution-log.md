# Bitacora de resolucion de contradicciones

## Estado

ACTIVE

## Uso

Registrar contradicciones reales detectadas entre agents, estandares, proyectos, APIs, Docker, DB o archivo historico. La fila debe indicar que documento prevalece y que accion se tomo.

| ID | Tema | Documento A | Documento B | Contradiccion | Prevalece | Accion | Estado |
|---|---|---|---|---|---|---|---|
| CR-20260701-001 | Limpieza de agents | Instrucciones que piden borrar/mover | `Docs/agents/AGENT_GLOBAL_RULES.md` | Algunas instrucciones piden eliminar o archivar agents; la regla vigente exige conservar `AGENTS-*.md` y vaciar contenido al cerrar. | `Docs/agents/AGENT_GLOBAL_RULES.md` | No borrar ni mover agents; limpiar solo vaciando contenido. | ACTIVO |
| CR-20260701-002 | Entrada Codex | Multiples documentos con orden de lectura | `Docs/_meta/codex-entrypoint.md` | Habia mas de un orden de entrada operativo. | `Docs/_meta/codex-entrypoint.md` | Crear entrada unica y subordinar indices operativos. | RESUELTO |
| CR-20260701-003 | SQLite | Agents/pendientes historicos | `Docs/03_standards/database/postgresql-project-users-and-schemas.md` | SQLite aparece como duda historica en algunos pendientes, pero el estandar lo prohibe. | Estandar PostgreSQL | Tratar cualquier SQLite/db.sqlite3 versionado como error a retirar. | ACTIVO |
