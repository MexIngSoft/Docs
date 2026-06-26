# Trazabilidad de usuario por aplicacion Auth

## Objetivo

Definir como saber a que web, proyecto o aplicacion pertenece cada usuario
registrado en `API.PY.DJANGO.Auth` y como eliminar un usuario de forma segura
cuando sea necesario en ambiente local o administrativo.

## Clasificacion

- Ubicacion principal: `01_core_erp/auth`
- Ubicaciones secundarias:
  - `03_standards/database`: aplica a PostgreSQL y schema `"Auth"`.
  - `03_standards/auth`: aplica al flujo Web -> Gateway -> Auth.

## Regla principal

Cada usuario Auth pertenece a una aplicacion por:

```text
"Auth"."UserAccounts"."ApplicationId"
```

Ese campo referencia conceptualmente a:

```text
"Auth"."Applications"."Id"
```

La aplicacion se identifica por:

```text
"Auth"."Applications"."Code"
```

Ejemplos de `Code`:

```text
REFAPART
MEXINGSOF
DOCUCORE
FISCORA
IMAGRAFITY
JOBCRON
LEXNOVA
TECNOTELEC
```

## Como se asigna la aplicacion al registrar

Las webs no deben registrar usuarios directamente contra Auth.

Flujo oficial:

```text
Web -> Gateway General -> Auth
```

La web envia:

```text
X-Application-Code: <APPLICATION_CODE>
```

o el payload incluye:

```json
{
  "ApplicationCode": "REFAPART"
}
```

El serializer de Auth resuelve ese codigo contra `"Auth"."Applications"` y
asigna:

```text
UserAccounts.ApplicationId = Applications.Id
```

## Consulta para saber de que web/API es cada usuario

Consulta general:

```sql
SELECT
  u."Id" AS "UserId",
  u."Email",
  u."FirstName",
  u."LastName",
  u."IsActive",
  u."IsStaff",
  u."IsSuperuser",
  u."ApplicationId",
  a."Code" AS "ApplicationCode",
  a."Name" AS "ApplicationName"
FROM "Auth"."UserAccounts" u
LEFT JOIN "Auth"."Applications" a
  ON a."Id" = u."ApplicationId"
ORDER BY a."Code", u."Email";
```

Consulta por email:

```sql
SELECT
  u."Id" AS "UserId",
  u."Email",
  u."ApplicationId",
  a."Code" AS "ApplicationCode",
  a."Name" AS "ApplicationName"
FROM "Auth"."UserAccounts" u
LEFT JOIN "Auth"."Applications" a
  ON a."Id" = u."ApplicationId"
WHERE lower(u."Email") = lower('correo@ejemplo.com');
```

Consulta por aplicacion:

```sql
SELECT
  u."Id" AS "UserId",
  u."Email",
  u."FirstName",
  u."LastName",
  u."IsActive"
FROM "Auth"."UserAccounts" u
JOIN "Auth"."Applications" a
  ON a."Id" = u."ApplicationId"
WHERE a."Code" = 'REFAPART'
ORDER BY u."Email";
```

## Script seguro para eliminar usuario

La eliminacion se debe hacer con comando Django para respetar cascadas del ORM.

Ruta:

```text
Docker.API.PY/API.PY.DJANGO.Auth/user/management/commands/delete_auth_user.py
```

Dry-run obligatorio por defecto:

```powershell
docker exec api-multiproyecto sh -lc "/usr/src/api/start.sh manage auth delete_auth_user --email correo@ejemplo.com --application-code REFAPART"
```

Eliminar realmente:

```powershell
docker exec api-multiproyecto sh -lc "/usr/src/api/start.sh manage auth delete_auth_user --email correo@ejemplo.com --application-code REFAPART --confirm"
```

No ejecutar el comando directo con `python manage.py` dentro del contenedor si
el shell no tiene `DB_NAME`, `DB_USER` y `DB_PASSWORD`; usar `start.sh manage`
porque carga el bloque `AUTH_DB_*` correcto.

Sin `--confirm`, el comando solo muestra:

- Id;
- Email;
- nombre;
- aplicacion;
- estado activo;
- staff;
- superuser.

## Protecciones del comando

- Requiere `--email`.
- Permite `--application-code` para evitar borrar un usuario equivocado.
- Si `ApplicationCode` no existe, falla.
- Si no encuentra usuario, falla.
- Si encuentra mas de un usuario, falla y pide acotar por aplicacion.
- No permite borrar superusers.
- Usa transaccion atomica.
- Reporta registros eliminados por cascada.

## Relaciones afectadas por cascada

Al borrar un usuario, Django elimina o desconecta datos relacionados segun el
modelo:

| Tabla | Comportamiento |
|---|---|
| `"Auth"."UserRoles"` | Cascade. |
| `"Auth"."UserPermissions"` | Cascade. |
| `"Auth"."UserDevices"` | Cascade. |
| `"Auth"."UserSessions"` | Cascade por usuario. |
| `"Auth"."RefreshTokens"` | Cascade por usuario. |
| `"Auth"."PasswordHistory"` | Cascade. |
| `"Auth"."MfaMethods"` | Cascade. |
| `"Auth"."RecoveryCodes"` | Cascade. |
| `"Auth"."UserSocialAccounts"` | Cascade. |
| `"Auth"."EmailDeliveryLogs"` | `UserId` queda `NULL`. |
| `"Auth"."LoginAttempts"` | `UserId` queda `NULL`. |
| `"Auth"."AccessAuditEvents"` | `UserId` queda `NULL`. |

## Cuándo no borrar

No borrar si:

- el usuario tiene actividad productiva;
- existen pedidos, expedientes, documentos, facturacion o trazas legales en
  otras APIs;
- se necesita auditoria historica;
- es superuser o cuenta administrativa.

En esos casos usar desactivacion:

```sql
UPDATE "Auth"."UserAccounts"
SET "IsActive" = false
WHERE lower("Email") = lower('correo@ejemplo.com');
```

## Pendientes reales

- PENDIENTE_DE_DEFINIR: endpoint administrativo via Gateway para consultar
  usuarios por `ApplicationCode` sin acceso directo a base de datos.
- PENDIENTE_DE_DEFINIR: politica productiva de borrado por cumplimiento legal
  y retencion de datos por proyecto.
