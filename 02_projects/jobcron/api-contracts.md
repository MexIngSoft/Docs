# Contratos API JobCron

## Base

```text
Docker.API.PY/API.PY.DJANGO.JobCron
```

## Health

```http
GET /api/jobcron/health/
```

Respuesta:

```json
{
  "service": "JobCron",
  "status": "ok"
}
```

## FeatureAvailability publico

```http
GET /api/features/availability/?project=docucore&country=MX&region=JAL&environment=internal
```

Parametros:

| Parametro | Uso |
|---|---|
| `project` | Filtra por proyecto: `docucore`, `lexnova`, `tecnotelec`. |
| `country` | Pais ISO usado para reglas geograficas. |
| `region` | Estado/region opcional. |
| `environment` | `public`, `development` o `internal`. |

Respuesta:

```json
{
  "project": "docucore",
  "features": [
    {
      "feature_key": "docucore.dashboard",
      "status": "released",
      "enabled": true,
      "can_show_public": true,
      "can_show_development": true,
      "can_show_internal": true,
      "can_show": true
    }
  ]
}
```

## Administracion

```http
GET /api/features/admin/
POST /api/features/admin/
GET /api/features/admin/{feature_key}/
PATCH /api/features/admin/{feature_key}/
GET /api/features/audit/
```

El MVP permite administrar reglas y auditar cambios. La autenticacion real se
integrara con Auth; mientras tanto el contrato queda listo para protegerse por
Gateway o middleware.

## Regla de seguridad

Una feature visible en frontend no autoriza automaticamente la ejecucion en
backend. Cada API sensible debe validar sus propias reglas antes de ejecutar.

## Identity & Access administrativo

JobCron expone la consola operativa, pero no duplica Auth. El backend fuente
para usuarios, roles y permisos sigue siendo:

```text
API.PY.DJANGO.Auth
```

Endpoints Auth existentes:

```http
GET/POST/PATCH /api/access/roles/
GET/POST/PATCH /api/access/permissions/
GET/POST/PATCH /api/access/role-permissions/
GET/POST/PATCH /api/access/user-permissions/
GET/POST/PATCH /api/access/application-roles/
GET/POST/PATCH /api/access/application-permissions/
```

Contratos Gateway vigentes para la consola JobCron:

```http
GET    /api/v1/admin/identity/users/
PATCH  /api/v1/admin/identity/users/{id}/
POST   /api/v1/admin/identity/users/{id}/roles/
DELETE /api/v1/admin/identity/users/{id}/roles/{roleId}/
GET    /api/v1/admin/identity/roles/
PATCH  /api/v1/admin/identity/roles/{id}/permissions/
GET    /api/v1/admin/identity/permissions/
```

Reglas:

- Requiere Auth administrativo.
- Requiere auditoria de cambio.
- Requiere filtro por `ApplicationCode`.
- No permite hard delete de usuarios productivos sin politica de retencion.
- Para RefaPart, `REFAPART_ADMIN` y `CanManageProducts` controlan productos.

Estado:

- Implementado en Gateway como `/api/v1/admin/identity/*`.
- Implementado en Auth sobre `/api/access/identity/users/*`,
  `/api/access/roles/*` y `/api/access/permissions/*`.
- Consumido por JobCron web en `/admin/usuarios`, `/admin/roles` y
  `/admin/permisos`.
