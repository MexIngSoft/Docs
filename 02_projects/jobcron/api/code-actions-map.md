# Mapa API de acciones de codigo - JobCron

## Estado

VIGENTE_PARCIAL

## API Django

| Codigo de accion | Endpoint API | Archivo | Metodo HTTP | Modelos/tablas | Permiso | Estado |
|---|---|---|---|---|---|---|
| JOBCRON.FEATURE_AVAILABILITY.LIST | `GET /api/features/` | `Docker.API.PY/API.PY.DJANGO.JobCron/features/views.py` | GET | `Feature`, `FeatureAvailabilityAudit` | PENDIENTE_DE_DEFINIR | vigente_parcial |
| JOBCRON.FEATURE_AVAILABILITY.UPDATE | `POST /api/features/operations/` | `Docker.API.PY/API.PY.DJANGO.JobCron/features/views.py` | POST | `Feature`, `FeatureAvailabilityAudit` | PENDIENTE_DE_DEFINIR | vigente_parcial |
| JOBCRON.ADMIN.OVERVIEW.VIEW | `GET /api/jobcron/admin/overview` | `Docker.API.PY/API.PY.DJANGO.JobCron/features/views.py -> admin_overview` | GET | `FeatureAvailability`, `OperationalRecord` | `jobcron.overview.read` | vigente_api; pendiente UI dinamica |
| JOBCRON.SEARCH.PUBLIC | PENDIENTE_DE_IMPLEMENTAR | PENDIENTE_DE_DEFINIR | GET | Search API | `jobcron.search.read` | pendiente |

## APIs reutilizadas o descartadas

- Auth: requerido para panel administrativo.
- Gateway General: requerido para consumo desde frontend productivo.
- Search: reutilizable para busqueda autorizada.
- FeatureVisibility/FeatureAvailability: no crear API duplicada si JobCron ya
  cubre visibilidad de capacidades.

## Riesgos

- `db.sqlite3` debe permanecer solo como artefacto local si existe; la base
  canonica publicada debe seguir el estandar documentado.
