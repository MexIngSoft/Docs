# Estandar de ejecucion Codex

## Objetivo

Definir como pedir, ejecutar, validar y reportar tareas para que Codex use
menos contexto y respete la arquitectura documental.

## Regla principal

Codex no implementa hasta identificar primero el Context Pack minimo de la
tarea.

## Flujo obligatorio

1. Leer `README.md`.
2. Leer `_meta/active-work-index.md`.
3. Identificar el tipo de tarea.
4. Seleccionar el Context Pack minimo desde `00_audit/codex-context-map.md`.
5. Leer solo documentos canonicos relacionados.
6. Detectar si la tarea pertenece a nucleo, proyecto, estandar, integracion o archivo.
7. Implementar el menor cambio seguro.
8. Validar con comandos disponibles.
9. Reportar decisiones, faltantes y validaciones.

## Que no debe leer por defecto

- Todo `Docs`.
- `_archive/**`, salvo auditoria historica.
- `agents/_archive/**`, salvo trazabilidad.
- Proyectos no afectados.
- Integraciones externas no relacionadas.

## Validacion por tipo

| Tipo | Validacion minima |
|---|---|
| Documentacion | `python scripts/build_master_index.py`, `python scripts/validate_frontmatter.py`, `git diff --check` |
| Frontend | `npm run lint` y `npm run build` si existen |
| API Django | `python manage.py check` y compilacion Python disponible |
| Docker | `docker compose config --quiet` sobre los compose modificados |
| Seguridad | Busqueda de secretos y revision de documentos de seguridad relacionados |

## Reporte

Cuando se usan agents, actualizar `agents/EXECUTION_REPORT.md`.

Cuando no se usan agents, reportar en la respuesta final:

- Context Pack usado.
- Documentos leidos.
- Documentos fuera de alcance.
- Archivos modificados.
- Decisiones.
- Validaciones.
- Faltantes con `PENDIENTE_DE_DEFINIR`.

## Reglas de publicacion

- Publicar por repositorio, no desde `Workspace.Comercial` como monorepo.
- Usar mensajes de commit en ingles.
- Respetar ramas persistentes `dev`, `pro` y `main`.
- No subir secretos reales.
