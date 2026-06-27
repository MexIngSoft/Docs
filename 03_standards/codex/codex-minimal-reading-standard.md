# Estandar de lectura minima Codex

## Objetivo

Reducir lectura innecesaria y evitar decisiones tomadas desde documentos
historicos, duplicados o fuera de alcance.

## Lectura base obligatoria

1. `README.md`
2. `_meta/active-work-index.md`
3. `00_audit/codex-context-map.md`
4. `03_standards/operations/context-packs.md`

## Lectura por tipo de tarea

Usar el Context Pack documentado en `03_standards/operations/context-packs.md`.

Para mapas de acciones de codigo, usar `CP-08 - Mapa de acciones de codigo` y
leer el estandar `03_standards/code-actions/code-actions-map-standard.md`, el
proyecto afectado y los contratos frontend/Gateway/API relacionados.

## Fuentes no activas

No usar como fuente vigente:

- `_archive/**`
- `agents/_archive/**`
- reportes historicos salvo para trazabilidad;
- documentos marcados como obsoletos.

## Registro de lectura

Toda ejecucion con agents debe registrar documentos leidos en
`agents/EXECUTION_REPORT.md`.

Toda ejecucion sin agents debe reportar en la respuesta final:

- Context Pack elegido;
- documentos leidos;
- documentos fuera de alcance;
- documento canonico que prevalece.

## Prohibicion

No leer todo `Docs` sin justificar una auditoria documental.
