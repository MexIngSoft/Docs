# Instrucciones para correr agents

## Prompt recomendado

Usa esta instruccion cuando quieras ejecutar agents de forma ordenada:

```text
Ejecuta todos los archivos AGENTS-*.md ubicados en Docs/agents, en orden numerico, con el fin de que el desarrollo quede acorde a la documentacion del repositorio. Antes de implementar, lee Docs/agents/RUN_AGENTS_INSTRUCTIONS.md, Docs/README.md y la documentacion del proyecto relacionado. Ejecuta solo tareas no completadas, no reviertas cambios existentes, documenta cada resultado en Docs/agents/EXECUTION_REPORT.md, valida con build/checks disponibles y dime al final que agents quedaron completados, cuales quedaron pendientes y por que.
```

## Proceso obligatorio

1. Leer `Docs/agents/AGENTS-*.md` en orden numerico.
2. Revisar `Docs/agents/EXECUTION_REPORT.md` para no repetir trabajo ya cerrado.
3. Leer `Docs/agents/AGENT_GLOBAL_RULES.md` si existe.
4. Identificar el proyecto afectado y su documentacion canonica.
5. Detectar dependencias, tareas duplicadas, bloqueos e informacion faltante.
6. Implementar en el menor alcance funcional posible.
7. Validar con comandos locales:
   - APIs: `python manage.py check` y `python -m py_compile`.
   - Web: `npm run build`.
   - Docker: revisar compose/Dockerfile si el agent modifica infraestructura.
8. Documentar:
   - archivos creados/modificados,
   - pruebas ejecutadas,
   - pendientes reales,
   - decisiones tomadas.
9. Actualizar `Docs/agents/EXECUTION_REPORT.md`.
10. Si un agent queda completado, copiar su contenido al historico y limpiar
    el contenido del archivo original sin eliminarlo.

## Reglas

- Si un agent esta vacio, marcarlo como sin instrucciones.
- Si un agent ya fue ejecutado y no hay cambios nuevos, marcarlo como ya completado.
- Si una tarea pide una fase demasiado grande, crear MVP funcional y documentar limites.
- No borrar trabajo previo sin instruccion explicita.
- No eliminar archivos `Docs/agents/AGENTS-*.md` al cerrar una corrida; los
  completados se dejan vacios y se conserva una copia en `_archive/agents`.
- No mezclar proyectos sin necesidad.
- No inventar informacion critica; si falta, documentar bloqueo y preguntas.
- Todo agent debe respetar las reglas globales de arquitectura, UI/UX,
  producto, seguridad y validacion definidas en `AGENT_GLOBAL_RULES.md`.

## Resultado esperado del asistente

Al terminar debe responder:

```text
Agents ejecutados: N-M.
Completados: ...
Pendientes: ...
Validaciones: ...
Reporte: Docs/agents/EXECUTION_REPORT.md
```

## Limpieza estandar de agents

Al finalizar una corrida:

1. Copiar cada agent completado a `_archive/agents/<fecha>-<tema>/` para
   conservar trazabilidad.
2. Vaciar el contenido del archivo original `Docs/agents/AGENTS-XXX.md`.
3. No borrar ni mover el archivo original.
4. No limpiar agents bloqueados, parciales o pendientes.

La carpeta `Docs/agents` debe conservar siempre los placeholders
`AGENTS-*.md` para evitar que futuras corridas pierdan numeracion o contexto.
