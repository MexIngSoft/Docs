# Mapa API de acciones de codigo - MexIngSof

## Estado

PENDIENTE_DE_MIGRAR_A_GATEWAY

## Objetivo

Documentar las rutas API temporales que existen dentro de la web MexIngSof y
su destino canonico esperado para no crear APIs duplicadas.

## Rutas temporales existentes

| Codigo de accion | Ruta actual | Archivo actual | Destino canonico | Estado |
|---|---|---|---|---|
| MEXINGSOF.CONTACT.SUBMIT | `POST /api/contact` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/contact/route.ts` | `POST /api/v1/projects/MEXINGSOF/leads` hacia JobCron API | pendiente |
| MEXINGSOF.PRODUCTS.LIST | `GET /api/products` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/products/route.ts` | `GET /api/v1/projects/MEXINGSOF/services` hacia JobCron API o Catalog | pendiente |
| MEXINGSOF.ADMIN.LEADS.UPDATE_STATUS | `PATCH /api/contact-leads/[id]` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/contact-leads/[id]/route.ts` | PENDIENTE_DE_DEFINIR con Auth admin | pendiente |
| MEXINGSOF.ADMIN.PRODUCTS.MANAGE | `POST/PATCH/DELETE /api/products` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/products/route.ts` | Catalog o JobCron API | pendiente |

## APIs reutilizadas o descartadas

- Gateway General: obligatorio para produccion.
- JobCron API: candidato para CRM, leads y administracion operativa.
- Catalog: candidato para servicios/productos publicados.
- Auth: obligatorio para panel admin.
- API nueva MexIngSof: descartada por ahora; no hay dominio que justifique API
  especializada si JobCron/Catalog/Auth cubren el caso.
