# Mapa frontend de acciones de codigo - MexIngSof

## Estado

VIGENTE_PARCIAL

## Objetivo

Mapear rutas y componentes Next.js reales de la web MexIngSof para evitar que
las acciones queden escondidas en componentes o rutas internas.

## Rutas y acciones

| Ruta | Accion | Archivo principal | Componentes/servicios | Gateway/API | Estado |
|---|---|---|---|---|---|
| `/` | MEXINGSOF.WEB.HOME.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/page.tsx` | `app/components/HeroSection.tsx`, `SolutionsSection.tsx`, `ContactForm.tsx` | `N/A` | vigente |
| `/` | MEXINGSOF.CONTACT.SUBMIT | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/components/ContactForm.tsx` | `app/api/contact/route.ts` | `POST /api/v1/projects/MEXINGSOF/leads` pendiente | pendiente |
| `/admin/leads` | MEXINGSOF.ADMIN.LEADS.UPDATE_STATUS | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/admin/leads/page.tsx` | `LeadStatusControl.tsx`, `app/api/contact-leads/[id]/route.ts` | PENDIENTE_DE_DEFINIR | pendiente |
| `/admin/products` | MEXINGSOF.ADMIN.PRODUCTS.MANAGE | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/admin/products/page.tsx` | `ProductAdminTable.tsx`, `app/api/products/route.ts` | PENDIENTE_DE_DEFINIR | pendiente |

## Validacion

- `npm run lint` en `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof`.
- `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof`.

## Riesgos

- El panel admin no debe considerarse productivo hasta integrar Auth.
- Las rutas internas `app/api/*` no sustituyen Gateway General para produccion.
