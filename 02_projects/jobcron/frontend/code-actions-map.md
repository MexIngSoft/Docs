# Mapa frontend de acciones de codigo - JobCron

## Estado

VIGENTE_PARCIAL

## Rutas y acciones

| Ruta | Accion | Archivo principal | Componentes/servicios | Gateway/API | Estado |
|---|---|---|---|---|---|
| `/` | JOBCRON.WEB.HOME.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/page.tsx` | `components/module-card.tsx`, `lib/public-site.ts` | `N/A` | vigente |
| `/admin` | JOBCRON.ADMIN.OVERVIEW.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/page.tsx` | `components/admin-header.tsx`, `lib/modules.ts` | `GET /api/v1/projects/JOBCRON/admin/overview` implementado en API; UI combina datos API y fallback documentado | vigente_parcial |
| `/admin/usuarios` | JOBCRON.IDENTITY.USERS.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/usuarios/page.tsx` | `components/identity-access-panel.tsx`, `lib/identity-client.ts` | `GET/PATCH/POST/DELETE /api/v1/admin/identity/users/*` via Gateway hacia Auth | vigente |
| `/admin/roles` | JOBCRON.IDENTITY.ROLES.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/roles/page.tsx` | `components/identity-access-panel.tsx`, `lib/identity-client.ts` | `GET/PATCH /api/v1/admin/identity/roles/*` via Gateway hacia Auth | vigente |
| `/admin/permisos` | JOBCRON.IDENTITY.PERMISSIONS.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/permisos/page.tsx` | `components/identity-access-panel.tsx`, `lib/identity-client.ts` | `GET /api/v1/admin/identity/permissions/` via Gateway hacia Auth | vigente |
| `/admin/feature-availability` | JOBCRON.FEATURE_AVAILABILITY.LIST | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/feature-availability/page.tsx` | `lib/feature-availability.ts` | JobCron API `features` | vigente_parcial |
| `/admin/feature-availability` | JOBCRON.FEATURE_AVAILABILITY.UPDATE | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/components/operation-create-form.tsx` | `lib/feature-availability.ts` | JobCron API `features` | vigente_parcial |
| `/login` | JOBCRON.AUTH.LOGIN | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/login/page.tsx` | `app/login/LoginForm.tsx`, `lib/auth-client.ts` | `POST /api/v1/auth/login/` y `GET /api/v1/auth/me/permissions/` | vigente |
| `/admin/cambiar-contrasena` | JOBCRON.AUTH.REQUIRED_PASSWORD_CHANGE | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/cambiar-contrasena/page.tsx` | `ChangePasswordForm.tsx`, `lib/auth-client.ts` | `POST /api/v1/auth/password/change-required/` | vigente |

## Validacion

- `npm run lint` en `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron`.
- `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron`.

## Pendientes

- Evitar presentar FeatureAvailability como productivo hasta cerrar permisos.
- Definir MFA obligatorio y politica productiva de alta/baja de super admins.
