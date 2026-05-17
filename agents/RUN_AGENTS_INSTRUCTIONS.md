# Instrucciones para correr agents

## Prompt recomendado

Usa esta instruccion cuando quieras ejecutar agents de forma ordenada:

```text
Ejecuta todos los archivos AGENTS-*.md ubicados en Docs/agents, en orden numerico, con el fin de que el desarrollo quede acorde a la documentacion del repositorio. Antes de implementar, lee Docs/agents/RUN_AGENTS_INSTRUCTIONS.md, Docs/README.md y la documentacion del proyecto relacionado. Ejecuta solo tareas no completadas, no reviertas cambios existentes, documenta cada resultado en Docs/agents/EXECUTION_REPORT.md, valida con build/checks disponibles y dime al final que agents quedaron completados, cuales quedaron pendientes y por que.
```

## Proceso obligatorio

1. Leer `Docs/agents/AGENTS-*.md` en orden numerico.
2. Revisar `Docs/agents/EXECUTION_REPORT.md` para no repetir trabajo ya cerrado.
3. Identificar el proyecto afectado y su documentacion canonica.
4. Implementar en el menor alcance funcional posible.
5. Validar con comandos locales:
   - APIs: `python manage.py check` y `python -m py_compile`.
   - Web: `npm run build`.
   - Docker: revisar compose/Dockerfile si el agent modifica infraestructura.
6. Documentar:
   - archivos creados/modificados,
   - pruebas ejecutadas,
   - pendientes reales,
   - decisiones tomadas.
7. Actualizar `Docs/agents/EXECUTION_REPORT.md`.

## Reglas

- Si un agent esta vacio, marcarlo como sin instrucciones.
- Si un agent ya fue ejecutado y no hay cambios nuevos, marcarlo como ya completado.
- Si una tarea pide una fase demasiado grande, crear MVP funcional y documentar limites.
- No borrar trabajo previo sin instruccion explicita.
- No mezclar proyectos sin necesidad.

## Resultado esperado del asistente

Al terminar debe responder:

```text
Agents ejecutados: N-M.
Completados: ...
Pendientes: ...
Validaciones: ...
Reporte: Docs/agents/EXECUTION_REPORT.md
```
