# Agent especializado auth

## Alcance

Auth central, sesiones, usuarios, roles, permisos, activacion, reset password, eventos Auth, plantillas y entrega de correo.

## Cuando usarlo

- Cuando una tarea toque directamente este dominio.
- Cuando el clasificador o la matriz de enrutamiento lo seleccionen.
- Cuando un agent general derive trabajo concreto a este dominio.

## Cuando no usarlo

- Si la tarea pertenece a otro dominio canonico.
- Si solo es una pregunta de explicacion y no requiere cambios.
- Si el tema esta en `_archive` sin justificacion vigente.

## Lectura minima

1. `Docs/_meta/codex-entrypoint.md`
2. `Docs/_meta/active-work-index.md`
3. `Docs/agents/AGENT_GLOBAL_RULES.md`
4. Context Pack del dominio.
5. Documento canonico del proyecto/API/estandar afectado.

## Documentos prohibidos

- Agents cerrados o vacios.
- `_archive` como fuente vigente sin justificacion.
- Roadmaps `FUTURE_OR_PENDING` para implementar produccion.
- Documentos duplicados si existe canonico mas reciente.

## Repositorios afectados

- `Docs` siempre si se documentan decisiones.
- Repos de API/Web/Docker/Nginx segun la matriz del Context Pack.

## APIs afectadas

- Revisar Auth, Gateway y APIs reutilizables antes de crear o modificar API especializada.
- No crear API nueva si una API core/shared cubre el caso.

## Webs afectadas

- Solo las webs declaradas por el Context Pack o por el agent activo.
- Mantener identidad visual y configuracion por proyecto.

## Base de datos afectada

- PostgreSQL es obligatorio.
- Prohibido SQLite/db.sqlite3 versionado o activo.
- No duplicar tablas entre bases/schemas sin ADR.

## Nginx/Docker si aplica

- Validar `docker compose config --quiet` si se toca compose/Dockerfile.
- Validar `nginx -t` si se toca Nginx.
- Mantener red y nombres canonicos documentados.

## Tareas documentales

- Actualizar mapa de acciones o documento canonico afectado.
- Registrar contradicciones en `Docs/_meta/contradiction-resolution-log.md`.
- Registrar resultado en `Docs/agents/EXECUTION_REPORT.md` si se ejecuta agent.

## Tareas de desarrollo

- Implementar solo tareas pendientes o incompletas.
- Reutilizar patrones existentes.
- Evitar mocks persistentes cuando exista backend real.
- Normalizar errores dev/prod si aplica.

## Validaciones

- Web: `npm run lint`, `npm run build` si existen.
- API: `python manage.py check`, compilacion Python si aplica.
- Docker: `docker compose config --quiet` si aplica.
- Nginx: `nginx -t` si aplica.
- Documentacion: rutas tocadas existen y no duplican canonicos.

## Criterio de cierre

- Documentacion actualizada.
- Desarrollo aplicado o bloqueo formal registrado.
- Validaciones ejecutadas o imposibilidad exacta documentada.
- Sin pendientes genericos.

## Bloqueos permitidos

- `BLOQUEADO_POR_DECISION`
- `BLOQUEADO_POR_CREDENCIALES`
- `BLOQUEADO_POR_INFRAESTRUCTURA`
- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
- `FUERA_DE_ALCANCE_PREPRODUCCION`
