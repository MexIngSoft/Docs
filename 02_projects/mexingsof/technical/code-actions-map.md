# Mapa de acciones de codigo - MexIngSof

## Estado

VIGENTE_PARCIAL

## Objetivo

Ubicar las acciones reales de la web corporativa MexIngSof y separar lo que ya
existe en codigo de lo que debe moverse a Gateway, JobCron o APIs reutilizables.

## Alcance

- Proyecto: `mexingsof`.
- Web: `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof`.
- API propia activa: no existe API Django propia documentada para MexIngSof.
- Gateway: rutas registradas en `Docs/01_core_erp/apis/gateway-route-registry.md`.

## Mapas relacionados

- `frontend/code-actions-map.md`
- `api/code-actions-map.md`
- `README.md`
- `frontend.md`
- `api-contracts.md`
- `local-runbook.md`
- `productive-launch.md`

## Decisiones

- La web MexIngSof mantiene su implementacion Next.js actual para MVP.
- Las acciones publicas y administrativas que hoy viven en rutas internas
  `app/api/*` deben considerarse temporales hasta conectarse a Gateway/JobCron.
- No se crea API nueva para MexIngSof sin descartar primero JobCron, Catalog,
  Sales, Notification y Gateway.

## Acciones principales

| Codigo de accion | Nombre visible | Tipo | Proyecto | Modulo | Frontend ruta | Frontend archivo | Servicio frontend | Gateway route | API destino | Endpoint API | Metodo HTTP | Permiso requerido | Modelos/tablas afectadas | Estados UI | Errores esperados | Validacion minima | Documento canonico relacionado | Estado | Ultima revision |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| MEXINGSOF.WEB.HOME.VIEW | Pagina corporativa | page | MexIngSof | Web corporativa | `/` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/page.tsx` | `N/A` | `N/A` | `N/A` | `N/A` | GET | Publico | `N/A` | loading / success | Error de render Next.js | `npm run lint`, `npm run build` | `frontend.md` | vigente | 2026-06-29 |
| MEXINGSOF.CONTACT.SUBMIT | Enviar lead de contacto | form | MexIngSof | Leads | `/` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/components/ContactForm.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/contact/route.ts` | `POST /api/v1/projects/MEXINGSOF/leads` | JobCron API | PENDIENTE_DE_IMPLEMENTAR | POST | Publico con anti-abuso; admin via Auth | Prisma local temporal; destino canonico PENDIENTE_DE_DEFINIR en JobCron | loading / error / success | Gateway no disponible, validacion de formulario, persistencia temporal fallida | `npm run lint`; validar contrato Gateway antes de produccion | `api-contracts.md` | pendiente | 2026-06-29 |
| MEXINGSOF.PRODUCTS.LIST | Listar productos/servicios | endpoint | MexIngSof | Servicios | `/` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/components/SolutionsSection.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/products/route.ts` | `GET /api/v1/projects/MEXINGSOF/services` | JobCron API o Catalog | PENDIENTE_DE_DEFINIR | GET | Publico | Prisma local temporal; Catalog/JobCron pendiente | loading / empty / error / success | Catalog/JobCron no definido, datos vacios | `npm run lint`; validar `api-contracts.md` | `api-contracts.md` | pendiente | 2026-06-29 |
| MEXINGSOF.ADMIN.LEADS.UPDATE_STATUS | Actualizar estado de lead | button | MexIngSof | Admin leads | `/admin/leads` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/admin/leads/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/contact-leads/[id]/route.ts` | PENDIENTE_DE_DEFINIR | JobCron API/Auth | PENDIENTE_DE_DEFINIR | PATCH | PENDIENTE_DE_DEFINIR | Prisma local temporal; tabla destino PENDIENTE_DE_DEFINIR | loading / error / success | Auth admin no definido, lead inexistente | `npm run lint`; definir Auth admin antes de produccion | `tasks/00_mvp_gap_report.md` | pendiente | 2026-06-29 |
| MEXINGSOF.ADMIN.PRODUCTS.MANAGE | Administrar productos/servicios | page | MexIngSof | Admin productos | `/admin/products` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/admin/products/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/products/route.ts` | PENDIENTE_DE_DEFINIR | Catalog o JobCron API | PENDIENTE_DE_DEFINIR | GET/POST/PATCH/DELETE | PENDIENTE_DE_DEFINIR | Prisma local temporal; Catalog/JobCron pendiente | loading / empty / error / success | Auth admin no definido, producto inexistente | `npm run lint`; definir contrato API | `productive-launch.md` | pendiente | 2026-06-29 |

## Pendientes reales

- Definir si los leads corporativos viven en JobCron CRM o en una API comercial
  compartida.
- Migrar el almacenamiento temporal Prisma local a contrato Gateway/JobCron.
- Definir Auth del panel admin antes de produccion.
- Definir dominio final de despliegue inicial.
