# Mapa frontend de acciones de codigo - Tecno Telec

## Estado

VIGENTE_PARCIAL

## Rutas y acciones

| Ruta | Accion | Archivo principal | Componentes/servicios | Gateway/API | Estado |
|---|---|---|---|---|---|
| `/` | TECNOTELEC.WEB.HOME.VIEW | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/page.tsx` | `components/site-header.tsx`, `components/solution-card.tsx` | `N/A` | vigente |
| `/soluciones` | TECNOTELEC.SOLUTIONS.LIST | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/soluciones/page.tsx` | `lib/gateway-solutions.ts`, `lib/solutions.ts` | `GET /api/v1/projects/TECNOTELEC/solutions` | vigente_parcial |
| `/soluciones/[slug]` | TECNOTELEC.SOLUTIONS.DETAIL | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/soluciones/[slug]/page.tsx` | `components/solution-card.tsx` | `GET /api/v1/projects/TECNOTELEC/solutions` | vigente_parcial |
| `/catalogo` | TECNOTELEC.CATALOG.LIST | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/catalogo/page.tsx` | `components/catalog-browser.tsx`, `lib/gateway-catalog.ts` | `GET /api/v1/projects/TECNOTELEC/catalog` | vigente_parcial |
| `/catalogo/[slug]` | TECNOTELEC.CATALOG.DETAIL | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/catalogo/[slug]/page.tsx` | `components/product-card.tsx` | `GET /api/v1/projects/TECNOTELEC/catalog` | vigente_parcial |
| `/cotizador` | TECNOTELEC.QUOTE.START | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/cotizador/page.tsx` | `components/quote-stepper-preview.tsx` | PENDIENTE_DE_DEFINIR | vigente_parcial |
| `/cotizador/[solution]` | TECNOTELEC.QUOTE.REQUEST | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/cotizador/[solution]/page.tsx` | `components/solution-quote-request-form.tsx`, `app/cotizador/[solution]/actions.ts` | `POST /api/v1/projects/TECNOTELEC/quotes` | pendiente |
| `/login` | TECNOTELEC.AUTH.LOGIN | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/login/page.tsx` | PENDIENTE_DE_DEFINIR | Auth/Gateway pendiente | pendiente |

## Validacion

- `npm run lint` en `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec`.
- `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec`.
