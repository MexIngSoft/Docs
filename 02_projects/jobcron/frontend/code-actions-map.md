# Mapa frontend de acciones de codigo - JobCron

## Estado

VIGENTE_PARCIAL

## Rutas y acciones

| Ruta | Accion | Archivo principal | Componentes/servicios | Gateway/API | Estado |
|---|---|---|---|---|---|
| `/` | JOBCRON.WEB.HOME.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/page.tsx` | `components/module-card.tsx`, `components/quick-access-card.tsx`, `lib/public-site.ts` | `POST /api/v1/auth/login/` para acceso rapido; registro publico por admision/contacto | vigente |
| `/admin` | JOBCRON.ADMIN.OVERVIEW.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/page.tsx` | `components/admin-header.tsx`, `lib/modules.ts` | `GET /api/v1/projects/JOBCRON/admin/overview` implementado en API; UI combina datos API y fallback documentado | vigente_parcial |
| `/admin/usuarios` | JOBCRON.IDENTITY.USERS.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/usuarios/page.tsx` | `components/identity-access-panel.tsx`, `lib/identity-client.ts` | `GET/PATCH/POST/DELETE /api/v1/admin/identity/users/*` via Gateway hacia Auth | vigente |
| `/admin/roles` | JOBCRON.IDENTITY.ROLES.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/roles/page.tsx` | `components/identity-access-panel.tsx`, `lib/identity-client.ts` | `GET/PATCH /api/v1/admin/identity/roles/*` via Gateway hacia Auth; edita `DisplayName` y `Description` | vigente |
| `/admin/permisos` | JOBCRON.IDENTITY.PERMISSIONS.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/permisos/page.tsx` | `components/identity-access-panel.tsx`, `lib/identity-client.ts` | `GET /api/v1/admin/identity/permissions/` via Gateway hacia Auth | vigente |
| `/admin/feature-availability` | JOBCRON.FEATURE_AVAILABILITY.LIST | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/feature-availability/page.tsx` | `lib/feature-availability.ts` | JobCron API `features` | vigente_parcial |
| `/admin/feature-availability` | JOBCRON.FEATURE_AVAILABILITY.UPDATE | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/components/operation-create-form.tsx` | `lib/feature-availability.ts` | JobCron API `features` | vigente_parcial |
| `/login` | JOBCRON.AUTH.LOGIN | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/login/page.tsx` | `app/login/LoginForm.tsx`, `lib/auth-client.ts` | `POST /api/v1/auth/login/` y `GET /api/v1/auth/me/permissions/` | vigente |
| `/admin/cambiar-contrasena` | JOBCRON.AUTH.REQUIRED_PASSWORD_CHANGE | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/cambiar-contrasena/page.tsx` | `ChangePasswordForm.tsx`, `lib/auth-client.ts` | `POST /api/v1/auth/password/change-required/` | vigente |

## Decisiones de acceso web

- La pagina publica `/` contiene el acceso rapido operativo reutilizando el
  mismo `LoginForm` de `/login`; no debe existir un segundo formulario estatico.
- El CTA superior no debe duplicar login. Queda reservado para admision,
  contacto o solicitud comercial.
- El registro publico no crea usuarios administradores directos; debe enviarse
  como admision/contacto hasta que exista un flujo productivo aprobado.
- La URL de Gateway para navegador en desarrollo debe ser
  `http://localhost:8025/api/v1`. No usar `http://localhost/api/gateway` en
  JobCron web.
- La sidebar administrativa debe tener scroll propio. El contenido de trabajo
  debe desplazarse de forma independiente para no perder navegacion lateral.
- En `/admin/usuarios`, la guia de asignacion debe iniciar visible y poder
  plegarse hacia un icono/boton de ayuda.
- La asignacion de roles y permisos especiales debe estar en la fila del
  usuario afectado, no como un selector global ambiguo.
- `X-Application-Code=JOBCRON` identifica al operador. El filtro de datos se
  envia con `?application_code=<APP>`.

## Validacion

- `npm run lint` en `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron`.
- `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron`.
- CORS/preflight desde `http://localhost:3000` contra
  `POST /api/v1/auth/login/`.
- Login real del super admin de desarrollo contra Gateway con
  `X-Application-Code: JOBCRON`.
- `GET /api/v1/admin/identity/users/` debe listar todos los usuarios visibles
  de Auth; `?application_code=REFAPART` debe filtrar solo RefaPart.
- `POST/DELETE /api/v1/admin/identity/users/{id}/roles/` y
  `/permissions/` deben respetar `?application_code=<APP>`.

## Pendientes

- Evitar presentar FeatureAvailability como productivo hasta cerrar permisos.
- Definir MFA obligatorio y politica productiva de alta/baja de super admins.
