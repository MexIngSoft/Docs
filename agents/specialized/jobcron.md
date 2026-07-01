# Agent especializado JobCron

## Alcance

Centro administrativo, usuarios, roles, permisos, FeatureAvailability,
dashboard ERP y gobierno de proyectos.

## Lectura canonica

- `Docs/02_projects/jobcron/README.md`
- `Docs/02_projects/jobcron/operational-admin-center.md`
- `Docs/02_projects/jobcron/frontend/code-actions-map.md`

## Reglas

- JobCron opera permisos, pero Auth es autoridad.
- Los modulos no disponibles deben marcarse como diseno, beta, interno o
  bloqueado.
- El panel no debe duplicar responsabilidades de APIs especializadas.

## Validacion

- `npm run lint` y `npm run build`.
- Auth/Gateway checks para identidad.
