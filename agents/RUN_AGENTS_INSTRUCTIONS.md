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
10. Si un agent queda completado, limpiar el contenido del archivo original sin
    eliminarlo ni moverlo.

## Reglas

- Si un agent esta vacio, marcarlo como sin instrucciones.
- Si un agent ya fue ejecutado y no hay cambios nuevos, marcarlo como ya completado.
- Si una tarea pide una fase demasiado grande, crear MVP funcional y documentar limites.
- No borrar trabajo previo sin instruccion explicita.
- No eliminar ni mover archivos `Docs/agents/AGENTS-*.md` al cerrar una
  corrida. Los completados se dejan vacios en su ruta original.
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

1. Vaciar el contenido del archivo original `Docs/agents/AGENTS-XXX.md`.
2. No borrar ni mover el archivo original.
3. No limpiar agents bloqueados, parciales o pendientes.
4. Registrar en `EXECUTION_REPORT.md` que el agent quedo cerrado y limpio.

La carpeta `Docs/agents` debe conservar siempre los placeholders
`AGENTS-*.md` para evitar que futuras corridas pierdan numeracion o contexto.
