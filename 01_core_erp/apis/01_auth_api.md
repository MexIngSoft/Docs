# Auth API

## Responsabilidad

Gestionar usuarios, roles, permisos, autenticacion y validacion de tokens.
Auth solo debe saber quien es el usuario, como entra y que puede hacer.
No debe guardar datos comerciales, fiscales, direcciones, sucursales ni
preferencias de cliente por proyecto.

## Estado en codigo

Existe como:

```text
API.PY.DJANGO.Auth
```

El codigo actual usa:

- Django.
- Djoser.
- JWT personalizado.
- Apps `user`, `access` y `roles`.
- Modelos Auth ampliados para aplicaciones, sesiones, dispositivos, refresh
  tokens hasheados, MFA, codigos de recuperacion, intentos de login y auditoria
  de accesos.
- Tablas custom de login social para Google y Facebook, separadas de las tablas
  tecnicas `social_auth_*`.
- Plantillas transaccionales custom por aplicacion sobre los procesos de correo
  que Djoser ya dispara.

## Endpoints reales detectados

Desde `config/urls.py`:

```text
/admin/
/api/
/api/auth/
/api/access/
```

Desde `user/urls.py`:

```text
POST /api/auth/jwt/create/
POST /api/auth/jwt/refresh/
POST /api/auth/jwt/verify/
POST /api/auth/logout/
GET/POST /api/auth/o/{provider}/
```

Desde `access/urls.py`:

```text
GET /api/access/me/permissions/
GET/POST /api/access/applications/
GET/POST /api/access/modules/
GET/POST /api/access/actions/
GET/POST /api/access/roles/
GET/POST /api/access/permissions/
GET/POST /api/access/role-permissions/
GET/POST /api/access/user-permissions/
GET/POST /api/access/application-roles/
GET/POST /api/access/application-permissions/
GET/POST /api/access/devices/
GET/POST /api/access/sessions/
GET /api/access/refresh-tokens/
GET /api/access/password-history/
GET /api/access/login-attempts/
GET/POST /api/access/mfa-methods/
GET /api/access/recovery-codes/
GET /api/access/audit-events/
GET/POST /api/access/social-providers/
GET/POST /api/access/social-accounts/
GET /api/access/social-login-attempts/
GET/POST /api/access/application-email-settings/
GET/POST /api/access/email-templates/
GET /api/access/email-delivery-logs/
```

Alias administrativo:

```text
GET/POST /api/roles/
GET/POST /api/permissions/
GET/POST /api/applications/
```

Rutas Djoser:

```text
/api/users/
/api/users/me/
```

Las rutas exactas de Djoser dependen de la configuracion instalada.

## Modelos reales detectados

Schema propietario:

```text
"Auth"
```

Regla de escritura:

- Las tablas de identidad, roles, permisos y acceso viven en `"Auth"`.
- Las tablas tecnicas de Django/Djoser/social-auth/sessions viven en `public`.
- Las tablas ajenas a Auth no deben moverse a `"Auth"`; deben quedarse en
  `public` o en el schema de su API propietaria.
- El codigo debe declarar `db_table` con schema para las tablas Auth propias,
  porque depender solo del `search_path` puede terminar creando tablas en
  `public` en ambientes distintos.
- El `search_path` de Auth debe ser `public,"Auth"` para que las tablas de
  framework se creen en `public`; las tablas custom Auth se fuerzan con
  `db_table = '"Auth"."TablaPascalCase"'`.
- Las columnas de tablas custom Auth deben usar PascalCase. La PK se llama
  `Id`; las FK terminan en `Id`, por ejemplo `UserId`, `RoleId`,
  `PermissionId` y `ApplicationId`.

User:

- `"Auth"."UserAccounts"`.

Access:

- `"Auth"."Modules"`.
- `"Auth"."Actions"`.
- `"Auth"."Permissions"`.
- `"Auth"."RolePermissions"`.
- `"Auth"."UserPermissions"`.

Roles:

- `"Auth"."Roles"`.
- `"Auth"."UserRoles"`.

Tablas tecnicas de Django/Djoser:

- Deben quedar en `public`, incluyendo `django_migrations`,
  `django_content_type`, `auth_group`, `auth_permission`, `django_session`,
  `social_auth_*` y tablas intermedias generadas por Django.
- No deben reclasificarse como Auth aunque se usen durante autenticacion.

Social Auth custom:

- `"Auth"."SocialProviders"`.
- `"Auth"."UserSocialAccounts"`.
- `"Auth"."SocialLoginAttempts"`.

Proveedores habilitados:

```text
GOOGLE   -> google-oauth2
FACEBOOK -> facebook
```

Las tablas `social_auth_*` son tecnicas del paquete `social-auth-app-django` y
permanecen en `public`. Las tablas custom anteriores son las tablas publicables
de Auth y siguen PascalCase.

## Procesos Djoser

Djoser cubre correctamente:

| Proceso | Endpoint | Estado Auth |
|---|---|---|
| Registro de usuario | `POST /api/users/` | Implementado con serializer custom para rol, `idApp` y `ApplicationCode`. |
| Confirmacion de cuenta | `POST /api/users/activation/` | Implementado con correo custom por aplicacion. |
| Reenvio de activacion | `POST /api/users/resend_activation/` | Implementado por Djoser; usa correo de activacion custom. |
| Recuperacion de password | `POST /api/users/reset_password/` y `POST /api/users/reset_password_confirm/` | Implementado con correo custom. |
| Cambio de password autenticado | `POST /api/users/set_password/` | Implementado; Auth revoca sesiones/tokens y guarda historial. |
| Cambio/reset de email | `POST /api/users/set_email/`, `POST /api/users/reset_email/`, `POST /api/users/reset_email_confirm/` | Implementado por Djoser con clases de email custom. |
| Usuario actual | `GET/PATCH /api/users/me/` | Implementado por Djoser. |
| Social auth | `GET/POST /api/auth/o/{provider}/` | Implementado para Google/Facebook con tablas custom sociales. |

Procesos del agent que Djoser no cubre de forma nativa:

| Proceso | Motivo | Estado |
|---|---|---|
| MFA / codigo de verificacion | Djoser no trae flujo MFA completo. | Tablas y plantillas listas; falta endpoint de enrolamiento/verificacion. |
| Nuevo dispositivo | Djoser no dispara evento dedicado. | Auth registra dispositivos; falta alerta automatica por plantilla. |
| Cuenta bloqueada | Djoser no trae politica de bloqueo/rate limit. | Documentado como control pendiente. |
| Invitacion a organizacion/proyecto | Es dominio Tenant/Organization/Project. | Plantilla lista; falta API propietaria que dispare invitacion. |
| Alertas de riesgo | Requiere motor de reglas/riesgo. | Pendiente. |

## Correos por aplicacion

Tablas custom:

```text
"Auth"."ApplicationEmailSettings"
"Auth"."TransactionalEmailTemplates"
"Auth"."EmailDeliveryLogs"
```

`ApplicationEmailSettings` guarda nombre comercial, logo, color, remitente,
dominio y URL base de redireccion por aplicacion.

`TransactionalEmailTemplates` guarda asunto, cuerpo texto y cuerpo HTML por:

```text
ApplicationId + ActionCode + LanguageCode + Channel
```

`EmailDeliveryLogs` registra envios exitosos o fallidos.

Consulta operativa:

```text
GET /api/access/email-templates/
GET /api/access/application-email-settings/
GET /api/access/email-delivery-logs/
```

Preview visual:

```text
GET /api/access/email-templates/preview/?application_code=TECNOTELEC&action_code=VERIFY_ACCOUNT
GET /api/access/email-templates/preview/?application_code=LEXNOVA&action_code=VERIFY_ACCOUNT
GET /api/access/email-templates/preview/?application_code=JOBCRON&action_code=VERIFY_ACCOUNT
```

El preview devuelve `text/html` por defecto para abrirlo directo en navegador.
Con `response_format=json` devuelve asunto, texto y HTML renderizados.

Decision de plantilla:

- Codigo: `API.PY.DJANGO.Auth/auth/custom_email.py`.
- Entrada: `ApplicationCode`, `application_code` o header
  `X-Application-Code`.
- Filtro: aplicacion activa + `ActionCode` + `LanguageCode=es-MX` +
  `Channel=EMAIL`.
- Enlace: si existe `ApplicationEmailSettings.RedirectBaseUrl`, el link se
  arma hacia el frontend de esa web; si no, se usa el dominio recibido por
  Djoser.
- Fallback: `templates/djoser/email/activation.html` y
  `templates/djoser/email/password_reset.html`, solo para compatibilidad si no
  hay fila activa en `"Auth"."TransactionalEmailTemplates"`.

Las plantillas sembradas estan personalizadas por web para `TECNOTELEC`,
`LEXNOVA` y `JOBCRON` usando los colores y tono documentados en sus proyectos.
`IMAGRAFITY` y `ERP_ADMIN` conservan una plantilla administrativa neutral hasta
que exista sistema visual propio.

## Modelo objetivo Auth

Tablas implementadas para cerrar el alcance base de Auth:

```text
"Auth"."Applications"
"Auth"."ApplicationRoles"
"Auth"."ApplicationPermissions"
"Auth"."UserSessions"
"Auth"."UserDevices"
"Auth"."RefreshTokens"
"Auth"."PasswordHistory"
"Auth"."LoginAttempts"
"Auth"."MfaMethods"
"Auth"."RecoveryCodes"
"Auth"."AccessAuditEvents"
```

Regla multi-app implementada:

- Todo login o consulta de permisos debe poder recibir/derivar
  `ApplicationCode`.
- Un mismo usuario puede existir una sola vez y tener roles diferentes por
  aplicacion.
- Ejemplos de `ApplicationCode`: `TECNOTELEC`, `LEXNOVA`, `JOBCRON`,
  `IMAGRAFITY`, `ERP_ADMIN`.
- `GET /api/access/me/permissions/` acepta `application_code` o
  `X-Application-Code`.
- Si una aplicacion tiene mapeos en `ApplicationRoles` o
  `ApplicationPermissions`, la respuesta se filtra por esa aplicacion; si no
  hay mapeos, conserva compatibilidad con los roles/permisos actuales.

Regla de sesiones y tokens implementada:

- Los refresh tokens no se guardan en texto plano; se guardan como hash.
- Login exitoso registra `LoginAttempts`, `UserDevices`, `UserSessions`,
  `RefreshTokens` y `AccessAuditEvents`.
- Al cambiar password se deben revocar sesiones y refresh tokens activos.
  La tabla ya existe; la automatizacion de revocacion queda como siguiente
  mejora.
- Los dispositivos marcados como confiables deben invalidarse si hay cambio de
  password, MFA o riesgo de cuenta.

Regla de seguridad implementada parcialmente:

- MFA y codigos de recuperacion tienen tablas y endpoints administrativos.
- Historial de passwords guarda el hash inicial al crear usuario.
- Intentos de login y auditoria de accesos se registran desde login JWT.
- Bloqueo por intentos fallidos, rate limit, alertas y reautenticacion sensible
  quedan como controles pendientes de flujo.

## Endpoints administrativos implementados

- `GET/POST/PATCH /api/access/roles/`.
- `GET/POST/PATCH /api/access/permissions/`.
- `GET/POST/PATCH /api/access/role-permissions/`.
- `GET/POST/PATCH /api/access/user-permissions/`.
- `GET/POST/PATCH /api/access/application-roles/`.
- `GET/POST/PATCH /api/access/application-permissions/`.

Todos requieren usuario admin (`IsAdminUser`).

## Contrato minimo de verificacion JWT

Request:

```json
{
  "token": "jwt"
}
```

Response esperada:

```json
{
  "is_valid": true,
  "user_id": "uuid",
  "email": "user@example.com",
  "permissions": []
}
```

El contrato real debe validarse contra `CustomTokenVerifyView` antes de consumirlo desde gateway.

## Relacion con Gateway

`tecnotelec-gateway-api` debe usar Auth para:

- Login.
- Refresh.
- Verify.
- Logout.
- Consulta de usuario actual.
- Consulta de permisos.

Gateway no debe guardar passwords ni emitir tokens por su cuenta.

## Pendiente

Modelo final de permisos por tenant: `PENDIENTE_DE_DEFINIR`.

Controles pendientes de implementar:

- Revocacion automatica de sesiones y refresh tokens al cambiar password.
- Bloqueo por intentos fallidos.
- Rate limit por IP y usuario.
- Alertas por nuevo dispositivo o ubicacion/IP inusual.
- Reautenticacion para acciones sensibles.
- Flujos publicos de enrolamiento/verificacion MFA y generacion de codigos de
  recuperacion.

## Cambios documentados en codigo

- `UserAccount`, `Roles`, `UserRoles`, `Modules`, `Actions`, `Permissions`,
  `RolePermissions` y `UserPermissions` declaran schema `"Auth"`.
- `Applications`, `ApplicationRoles`, `ApplicationPermissions`,
  `UserSessions`, `UserDevices`, `RefreshTokens`, `PasswordHistory`,
  `LoginAttempts`, `MfaMethods`, `RecoveryCodes` y `AccessAuditEvents` fueron
  agregadas al schema `"Auth"`.
- `SocialProviders`, `UserSocialAccounts` y `SocialLoginAttempts` fueron
  agregadas para normalizar Google/Facebook con PascalCase.
- `ApplicationEmailSettings`, `TransactionalEmailTemplates` y
  `EmailDeliveryLogs` fueron agregadas para correos transaccionales multi-app.
- `set_password` y `reset_password_confirm` de Djoser disparan revocacion de
  sesiones/tokens y registro de historial cuando cambia el hash del password.
- Se reparo el schema para dejar tablas tecnicas en `public` y tablas custom
  Auth en `"Auth"` con PascalCase.
- Se normalizaron columnas custom Auth a PascalCase, evitando columnas
  publicables como `id`, `UserID` o `RoleID`.
- Se corrigio la representacion de roles/permisos de usuario para usar
  `email`, porque el modelo Auth no usa `username`.
- Se agrego seed idempotente de aplicaciones, roles base y acciones comunes.
