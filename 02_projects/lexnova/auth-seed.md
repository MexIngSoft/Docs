# Semilla Auth LexNova

## Estado

ACTIVE

## Objetivo

Definir la semilla inicial de autenticacion y autorizacion para LexNova en
`API.PY.DJANGO.Auth`.

Esta semilla permite que el Gateway de LexNova consulte Auth y reciba roles,
modulos y permisos efectivos para construir el dashboard y proteger acciones.

## Implementacion

La semilla se implementa en:

```text
Docker.API.PY/API.PY.DJANGO.Auth/access/migrations/0014_seed_lexnova_auth.py
Docker.API.PY/API.PY.DJANGO.Auth/user/migrations/0004_useraccount_must_change_password.py
```

## Password temporal

Todos los usuarios semilla usan la password temporal de desarrollo:

```text
LexNova.Temp#2026
```

Regla obligatoria:

```text
MustChangePassword = true
```

Esta password no debe usarse como password permanente ni pasar a produccion.

## Usuarios semilla

| Correo | Perfil |
|---|---|
| `cliente.restricted@lexnova.local` | `CLIENT_RESTRICTED` |
| `cliente.base@lexnova.local` | `CLIENT_BASE` |
| `cliente.plus@lexnova.local` | `CLIENT_PLUS` |
| `analyst.restricted@lexnova.local` | `ANALYST_RESTRICTED` |
| `analyst.base@lexnova.local` | `ANALYST_BASE` |
| `analyst.plus@lexnova.local` | `ANALYST_PLUS` |
| `reviewer.restricted@lexnova.local` | `REVIEWER_RESTRICTED` |
| `reviewer.base@lexnova.local` | `REVIEWER_BASE` |
| `reviewer.plus@lexnova.local` | `REVIEWER_PLUS` |
| `manager.restricted@lexnova.local` | `MANAGER_RESTRICTED` |
| `manager.base@lexnova.local` | `MANAGER_BASE` |
| `manager.plus@lexnova.local` | `MANAGER_PLUS` |
| `admin.restricted@lexnova.local` | `ADMIN_RESTRICTED` |
| `admin.base@lexnova.local` | `ADMIN_BASE` |
| `admin.root@lexnova.local` | `ADMIN_ROOT` |

## Modulos sembrados

```text
HOME
CASES
ANALYSIS
RESULTS
PROFILE
SETTINGS
ADMIN
ACCESS_CONTROL
AUDIT
```

## Permisos sembrados

```text
HOME_VIEW
HOME_VIEW_GLOBAL_STATS
HOME_VIEW_TEAM_ACTIVITY
CASE_VIEW_OWN
CASE_VIEW_ASSIGNED
CASE_VIEW_TEAM
CASE_VIEW_ALL
CASE_CREATE
CASE_EDIT
CASE_ASSIGN
CASE_UPLOAD_FILES
CASE_CHANGE_STATUS
CASE_DELETE
ANALYSIS_ACCESS
ANALYSIS_RUN_AI
ANALYSIS_EDIT_NOTES
ANALYSIS_VIEW_LOGS
ANALYSIS_SUBMIT_FOR_REVIEW
ANALYSIS_APPROVE
RESULT_VIEW
RESULT_EDIT_DRAFT
RESULT_PUBLISH
RESULT_SHARE_WITH_CLIENT
RESULT_DOWNLOAD_PDF
PROFILE_VIEW_SELF
PROFILE_EDIT_SELF
PROFILE_VIEW_ROLES
SETTINGS_ACCESS
SETTINGS_EDIT_POLICIES
SETTINGS_MANAGE_TEMPLATES
SETTINGS_MANAGE_CATALOGS
ADMIN_ACCESS
ADMIN_MANAGE_USERS
ADMIN_MANAGE_ROLES
ADMIN_MANAGE_PERMISSIONS
ADMIN_VIEW_AUDIT_LOGS
ACCESS_CONTROL_VIEW
ACCESS_CONTROL_EDIT_USER_PROFILE
ACCESS_CONTROL_EDIT_ROLE_PERMISSIONS
ACCESS_CONTROL_EDIT_USER_OVERRIDES
AUDIT_VIEW_OWN
AUDIT_VIEW_TEAM
AUDIT_VIEW_ALL
ALL_PERMISSIONS
```

## Informacion faltante

El agent pidio tablas canonicas que todavia no existen como modelos separados:

| Tabla solicitada | Estado actual |
|---|---|
| `Auth.RoleLevels` | Pendiente. Los niveles se representan hoy como roles/perfiles completos, por ejemplo `CLIENT_BASE`. |
| `Auth.UserPermissionOverrides` | Pendiente como tabla separada. El modelo actual usa `Auth.UserPermissions` con `Allow` para permisos especiales o revocados. |
| `Auth.ApplicationUserProfiles` | Pendiente. La relacion actual se resuelve con `Auth.UserRoles` + `Auth.ApplicationRoles`. |
| `Auth.AuditLogs` | Pendiente como nombre generico. El modelo actual disponible es `Auth.AccessAuditEvents`. |
| `Auth.EmailTemplates` | Pendiente como nombre generico. El modelo actual disponible es `Auth.TransactionalEmailTemplates`. |

Antes de produccion debe decidirse si se agregan esas tablas exactas o si se
declara oficialmente el mapeo actual como contrato canonico.

## Validacion local

Validado el 2026-05-17:

```text
python manage.py check
python -m compileall .
python manage.py migrate
```

Resultado confirmado en PostgreSQL:

```text
15 usuarios LexNova activos
15 perfiles LexNova con permisos asignados
MustChangePassword = true para todos los usuarios semilla
```
