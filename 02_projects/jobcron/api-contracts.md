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
