# Auth Core

## Objetivo

Documentar autenticacion reutilizable del ERP.

## Alcance

- Usuarios.
- Roles.
- Permisos.
- Sesiones.
- Dispositivos.
- Tokens.
- Politicas de seguridad.

## Documentos operativos

- `user-application-traceability.md`: identifica de que aplicacion/web viene
  cada usuario registrado y documenta el comando seguro para eliminar usuarios
  Auth.

## Regla

Auth Core no debe contener permisos unicos de una empresa; esos viven en `02_projects/<proyecto>`.
