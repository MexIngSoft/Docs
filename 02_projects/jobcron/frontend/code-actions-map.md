# Mapa frontend de acciones de codigo - JobCron

## Estado

VIGENTE_PARCIAL

## Rutas y acciones

| Ruta | Accion | Archivo principal | Componentes/servicios | Gateway/API | Estado |
|---|---|---|---|---|---|
| `/` | JOBCRON.WEB.HOME.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/page.tsx` | `components/module-card.tsx`, `lib/public-site.ts` | `N/A` | vigente |
| `/admin` | JOBCRON.ADMIN.OVERVIEW.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/page.tsx` | `components/admin-header.tsx`, `lib/modules.ts` | `GET /api/v1/projects/JOBCRON/admin/overview` pendiente | pendiente |
| `/admin/feature-availability` | JOBCRON.FEATURE_AVAILABILITY.LIST | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/feature-availability/page.tsx` | `lib/feature-availability.ts` | JobCron API `features` | vigente_parcial |
| `/admin/feature-availability` | JOBCRON.FEATURE_AVAILABILITY.UPDATE | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/components/operation-create-form.tsx` | `lib/feature-availability.ts` | JobCron API `features` | vigente_parcial |
| `/login` | JOBCRON.AUTH.LOGIN | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/login/page.tsx` | PENDIENTE_DE_DEFINIR | Auth/Gateway pendiente | pendiente |

## Validacion

- `npm run lint` en `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron`.
- `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron`.

## Pendientes

- Integrar Auth real al panel.
- Evitar presentar FeatureAvailability como productivo hasta cerrar permisos.
