# Agent especializado RefaPart

## Alcance

Web RefaPart, API RefaPart, Auth, Gateway, Address, busqueda, solicitudes,
checkout, cotizador, proveedor y administracion.

## Lectura canonica

- `Docs/02_projects/refapart/README.md`
- `Docs/02_projects/refapart/frontend.md`
- `Docs/02_projects/refapart/api-contracts.md`
- `Docs/02_projects/refapart/database.md`
- `Docs/02_projects/refapart/frontend/code-actions-map.md`

## Reglas

- RefaPart consume Gateway General.
- Permisos globales se asignan en JobCron/Auth, no en pantalla local propia.
- Payments queda bloqueado sin contrato.

## Validacion

- `npm run lint` y `npm run build` en web.
- `python manage.py check` en APIs afectadas.
