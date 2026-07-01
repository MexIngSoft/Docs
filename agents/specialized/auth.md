# Agent especializado Auth

## Alcance

Usuarios, login, registro, activacion, reset, sesiones, roles, permisos,
plantillas de correo y errores Auth.

## Lectura canonica

- `Docs/03_standards/auth/web-auth-login-standard.md`
- `Docs/03_standards/auth/web-auth-event-standard.md`
- `Docs/03_standards/auth/auth-email-template-standard.md`
- `Docs/01_core_erp/auth/README.md`
- `Docs/01_core_erp/apis/01_auth_api.md`

## Reglas

- Auth es autoridad de identidad.
- No crear Auth por proyecto.
- `Name` de rol es codigo tecnico; `DisplayName` y `Description` son para UI.
- No mostrar errores tecnicos al usuario final en produccion.

## Validacion

- `python manage.py check` en Auth.
- Endpoint via Gateway cuando Docker esta arriba.
