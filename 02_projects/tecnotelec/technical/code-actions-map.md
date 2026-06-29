# Mapa de acciones de codigo - Tecno Telec

## Estado

VIGENTE_PARCIAL

## Objetivo

Mapear las acciones reales y pendientes de Tecno Telec para distinguir la web
MVP existente de las integraciones que deben pasar por Gateway y APIs
reutilizables.

## Alcance

- Web: `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec`.
- API especializada: `Docker.API.PY/API.PY.DJANGO.TecnoTelec`.
- Gateway: `Docker.API.PY/API.PY.DJANGO.Gateway`.

## Mapas relacionados

- `frontend/code-actions-map.md`
- `api/code-actions-map.md`
- `backend/00_gateway_product_endpoints.md`
- `tasks/01_required_apis.md`
- `tasks/03_required_frontend_views.md`
- `tasks/05_mvp_scope.md`
- `tasks/08_productive_launch_plan.md`

## Acciones principales

| Codigo de accion | Nombre visible | Tipo | Proyecto | Modulo | Frontend ruta | Frontend archivo | Servicio frontend | Gateway route | API destino | Endpoint API | Metodo HTTP | Permiso requerido | Modelos/tablas afectadas | Estados UI | Errores esperados | Validacion minima | Documento canonico relacionado | Estado | Ultima revision |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| TECNOTELEC.SOLUTIONS.LIST | Listar soluciones | page | Tecno Telec | Soluciones | `/soluciones` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/soluciones/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/lib/gateway-solutions.ts` | `GET /api/v1/projects/TECNOTELEC/solutions` | TecnoTelec API | PENDIENTE_DE_VALIDAR | GET | Publico | PENDIENTE_DE_DEFINIR | loading / empty / error / success | Gateway/API no disponible, fallback temporal | `npm run lint`; `python manage.py check` | `solutions/01_dynamic_solution_technical_design.md` | vigente_parcial | 2026-06-29 |
| TECNOTELEC.CATALOG.LIST | Listar catalogo publico | page | Tecno Telec | Catalogo | `/catalogo` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/catalogo/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/lib/gateway-catalog.ts` | `GET /api/v1/projects/TECNOTELEC/catalog` | Catalog/Pricing/Supplier | PENDIENTE_DE_VALIDAR | GET | Publico | PENDIENTE_DE_DEFINIR | loading / empty / error / success | Catalog/Pricing no disponible, productos sin precio | `npm run lint`; validar contrato Gateway | `catalog/00_public_catalog_process.md` | vigente_parcial | 2026-06-29 |
| TECNOTELEC.QUOTE.REQUEST | Solicitar cotizacion consultiva | form | Tecno Telec | Cotizaciones | `/cotizador/[solution]` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/cotizador/[solution]/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/cotizador/[solution]/actions.ts` | `POST /api/v1/projects/TECNOTELEC/quotes` | Sales API | PENDIENTE_DE_IMPLEMENTAR | POST | Publico/Auth opcional | PENDIENTE_DE_DEFINIR | loading / error / success | Validacion de formulario, Sales no disponible | `npm run lint`; validar contrato Sales | `quotes/02_quote_implementation_scope_analysis.md` | pendiente | 2026-06-29 |
| TECNOTELEC.AUTH.LOGIN | Login portal | page | Tecno Telec | Auth | `/login` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/login/page.tsx` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | Auth API | PENDIENTE_DE_DEFINIR | POST | PENDIENTE_DE_DEFINIR | Auth User/Application | loading / error / success | Auth no conectado | Definir flujo antes de produccion | `auth/00_user_process.md` | pendiente | 2026-06-29 |

## Pendientes reales

- Crear o confirmar agent especifico Tecno Telec MVP antes de ampliar alcance.
- Validar contratos reales Gateway para soluciones, catalogo y cotizaciones.
- Conectar Auth solo cuando el flujo de portal requiera permisos reales.
