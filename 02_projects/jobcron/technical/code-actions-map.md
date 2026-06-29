# Mapa de acciones de codigo - JobCron

## Estado

VIGENTE_PARCIAL

## Objetivo

Mapear acciones de JobCron que impactan al ERP central y a los proyectos
REFAPART, MexIngSof, Tecno Telect y futuras webs.

## Alcance

- Web: `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron`.
- API: `Docker.API.PY/API.PY.DJANGO.JobCron`.
- Gateway: `Docker.API.PY/API.PY.DJANGO.Gateway`.
- Red Docker canonica: `jobcron_network`.

## Mapas relacionados

- `frontend/code-actions-map.md`
- `api/code-actions-map.md`
- `feature-availability.md`
- `api-contracts.md`
- `database.md`
- `operational-admin-center.md`

## Acciones principales

| Codigo de accion | Nombre visible | Tipo | Proyecto | Modulo | Frontend ruta | Frontend archivo | Servicio frontend | Gateway route | API destino | Endpoint API | Metodo HTTP | Permiso requerido | Modelos/tablas afectadas | Estados UI | Errores esperados | Validacion minima | Documento canonico relacionado | Estado | Ultima revision |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| JOBCRON.FEATURE_AVAILABILITY.LIST | Ver disponibilidad de modulos | page | JobCron | FeatureAvailability | `/admin/feature-availability` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/feature-availability/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/lib/feature-availability.ts` | PENDIENTE_DE_DEFINIR | JobCron API | `GET /api/features/` | GET | PENDIENTE_DE_DEFINIR | `features.models.Feature`, `FeatureAvailabilityAudit` | loading / empty / error / success | API no disponible, Auth no integrado | `python manage.py check`; `npm run lint` | `feature-availability.md` | vigente_parcial | 2026-06-29 |
| JOBCRON.FEATURE_AVAILABILITY.UPDATE | Activar/desactivar modulo | form | JobCron | FeatureAvailability | `/admin/feature-availability` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/components/operation-create-form.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/lib/feature-availability.ts` | PENDIENTE_DE_DEFINIR | JobCron API | `POST /api/features/operations/` | POST | PENDIENTE_DE_DEFINIR | `features.models.Feature`, `FeatureAvailabilityAudit` | loading / error / success | Validacion de payload, modulo inexistente, Auth no integrado | `python manage.py check`; `npm run lint` | `operational-admin-center.md` | vigente_parcial | 2026-06-29 |
| JOBCRON.ADMIN.OVERVIEW.VIEW | Panel operativo | page | JobCron | Admin | `/admin` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/lib/modules.ts` | `GET /api/v1/projects/JOBCRON/admin/overview` | JobCron API | `GET /api/jobcron/admin/overview` | GET | `jobcron.overview.read` | `FeatureAvailability`, `OperationalRecord` | loading / empty / error / success | Gateway/API no disponible, Auth no integrado | `python manage.py check`; test `features.tests.OperationalRecordTests.test_admin_overview_exposes_operational_summary` | `api-contracts.md` | vigente_api; pendiente_consumo_ui | 2026-06-29 |
| JOBCRON.SEARCH.PUBLIC | Busqueda autorizada | service | JobCron | Search | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | `GET /api/v1/projects/JOBCRON/search` | Search API | PENDIENTE_DE_IMPLEMENTAR | GET | `jobcron.search.read` | PENDIENTE_DE_DEFINIR | loading / empty / error / success | Search no sincronizado, permiso faltante | Validar contrato Search | `../../01_core_erp/apis/gateway-route-registry.md` | pendiente | 2026-06-29 |

## Riesgos

- Existe `db.sqlite3` en el repositorio local de JobCron API; debe validarse
  que sea solo artefacto local y no base canonica.
- Auth real para panel administrativo sigue pendiente.
- La ruta `JOBCRON.ADMIN.OVERVIEW.VIEW` ya existe en API y Gateway la puede
  enrutar; falta conectar la UI `/admin` para consumirla en lugar de datos
  estaticos de `lib/modules.ts`.
