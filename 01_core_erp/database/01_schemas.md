# Schemas

| Schema | Estado | Responsable |
|---|---|---|
| Auth | EXISTE | Auth API |
| Supplier | EXISTE | Supplier API |
| Catalog | EXISTE/PARCIAL | Catalog API |
| Pricing | EXISTE/PARCIAL | Pricing API |
| Inventory | EXISTE/PARCIAL | Inventory API |
| Procurement | EXISTE/PARCIAL | Procurement API |
| Sales | EXISTE/PARCIAL | Sales API |
| Quote | FALTA | Quote API |
| Logistics | FALTA | Logistics API |
| Rules | FALTA | Rules Engine API |
| Projects | FALTA | Projects API |
| Cart | FALTA | Cart API |
| POS | FALTA | POS API |
| GovernmentTender | FALTA | GovernmentTender API |
| Documents | FALTA | Documents API |
| Billing | FALTA | Billing API |
| Notifications | FALTA | Notifications API |

## Regla Auth

El schema `"Auth"` es propietario de tablas de identidad, acceso, roles,
permisos, sesiones, tokens y seguridad de cuenta.

Tablas Auth actualmente documentadas en codigo:

```text
"Auth"."UserAccounts"
"Auth"."Roles"
"Auth"."UserRoles"
"Auth"."Modules"
"Auth"."Actions"
"Auth"."Permissions"
"Auth"."RolePermissions"
"Auth"."UserPermissions"
```

Las tablas que no pertenezcan a identidad, autenticacion, autorizacion o
seguridad de cuenta no deben moverse a `"Auth"`. Deben permanecer en `public`
solo si son tecnicas compartidas o vivir en el schema de su API propietaria.

Tambien deben quedarse en `public` las tablas tecnicas del framework:

```text
auth_group
auth_group_permissions
auth_permission
django_admin_log
django_content_type
django_migrations
django_session
social_auth_*
user_useraccount_groups
user_useraccount_user_permissions
```

Estas tablas existen por Django/Djoser/social-auth o por relaciones internas de
framework; no son tablas custom publicables de Auth.

Las tablas custom dentro de `"Auth"` deben seguir el estandar de publicacion:

- Tablas en PascalCase.
- Columnas en PascalCase.
- PK como `Id`.
- FK como `<Entidad>Id`, por ejemplo `UserId`, `RoleId`, `PermissionId`.

## Tablas Auth implementadas

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
"Auth"."SocialProviders"
"Auth"."UserSocialAccounts"
"Auth"."SocialLoginAttempts"
"Auth"."ApplicationEmailSettings"
"Auth"."TransactionalEmailTemplates"
"Auth"."EmailDeliveryLogs"
```

Estas tablas ya tienen modelos y migraciones en `API.PY.DJANGO.Auth`. No deben
mezclarse con datos de Customer, Tenant, Sales o Projects.

## Social Auth

Las tablas tecnicas `social_auth_*` pertenecen al framework y viven en `public`.
Para publicar y operar datos normalizados de redes sociales dentro de Auth se
usan tablas custom en PascalCase:

```text
"Auth"."SocialProviders"
"Auth"."UserSocialAccounts"
"Auth"."SocialLoginAttempts"
```

Proveedores vigentes:

```text
GOOGLE
FACEBOOK
```

## Correos transaccionales

Las plantillas multi-app de Auth viven en:

```text
"Auth"."ApplicationEmailSettings"
"Auth"."TransactionalEmailTemplates"
"Auth"."EmailDeliveryLogs"
```

Estas tablas tambien siguen PascalCase para tablas y columnas. Las plantillas
son configuracion custom de Auth; no pertenecen a Djoser internamente aunque se
usen para renderizar correos disparados por Djoser.
