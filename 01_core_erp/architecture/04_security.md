# Seguridad

## Objetivo

Definir reglas base de seguridad para APIs y frontend.

## Principios

- Auth API es duena de usuarios, roles y permisos.
- Auth API tambien debe ser duena de sesiones, dispositivos, MFA, intentos de
  login, refresh tokens hasheados y auditoria de accesos.
- Auth no guarda datos comerciales o fiscales del cliente.
- Gateway valida acceso para frontend.
- APIs internas no deben confiar ciegamente en datos del cliente.
- Secretos fuera de Git.
- Logs sin tokens ni passwords.

## Roles iniciales

- Admin.
- Vendedor.
- Tecnico.
- Cliente.

## Permisos iniciales

- Ver precios publicos.
- Ver costos reales.
- Crear cotizaciones.
- Autorizar descuentos.
- Convertir cotizacion a orden.
- Administrar reglas.
- Ejecutar sincronizaciones.

## Pendiente

Modelo final RBAC/ABAC: `PENDIENTE_DE_DEFINIR`.

Pendientes especificos de Auth:

- Revocacion automatica de sesiones y refresh tokens al cambiar password.
- Flujo publico de enrolamiento/verificacion MFA y generacion de codigos de
  recuperacion.
- Bloqueo por intentos fallidos y rate limit por IP/usuario.
- Auditoria de accesos y alertas por dispositivo o ubicacion inusual.

Implementado en Auth:

- `ApplicationCode` en login/permisos para soportar multi-app.
- Registro de sesiones, dispositivos, refresh tokens hasheados, intentos de
  login y auditoria de accesos.
- Tablas y endpoints administrativos para MFA y codigos de recuperacion.
- Tablas custom PascalCase para login social con Google y Facebook:
  `SocialProviders`, `UserSocialAccounts` y `SocialLoginAttempts`.
- Correos transaccionales multi-app sobre Djoser con
  `ApplicationEmailSettings`, `TransactionalEmailTemplates` y
  `EmailDeliveryLogs`.
- Revocacion automatica de sesiones y refresh tokens cuando cambia el password
  por flujos Djoser.
