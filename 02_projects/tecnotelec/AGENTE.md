# Agente de desarrollo Tecno Telec

## Objetivo

Guiar el desarrollo de Tecno Telec usando la documentacion existente del ERP modular.

Este documento resume lo ya realizado, lo pendiente y el orden recomendado para convertir la documentacion en implementacion.

## Estado general

Tecno Telec esta documentado como proyecto sobre el nucleo ERP, no como marketplace generico.

El foco es vender soluciones tecnologicas, proyectos consultivos, cotizaciones, instalacion, soporte y productos integrados desde proveedores.

## Ya realizado

| Area | Estado | Documento base |
| --- | --- | --- |
| Identidad de negocio | Realizado | `business/00_tecnotelec_identity.md` |
| Objetivos | Realizado | `business/01_objectives.md` |
| FODA | Realizado | `business/02_foda.md` |
| Modelo de negocio | Realizado | `business/03_business_model.md` |
| Servicios | Realizado | `business/04_services.md` |
| Segmentos de cliente | Realizado | `business/05_customer_segments.md` |
| Propuesta de valor | Realizado | `business/06_value_proposition.md` |
| Rutas frontend | Realizado como especificacion | `frontend/01_routes.md` |
| Layout y componentes | Realizado como especificacion | `frontend/02_layout.md`, `frontend/03_components.md` |
| Sistema visual | Propuesto | `frontend/05_design_system.md` |
| Propuesta de interfaz | Propuesta | `frontend/09_interface_proposal.md` |
| APIs requeridas | Realizado como inventario | `tasks/01_required_apis.md` |
| Tablas requeridas | Realizado como inventario | `tasks/02_required_tables.md` |
| Vistas requeridas | Realizado como inventario | `tasks/03_required_frontend_views.md` |
| Orden de desarrollo | Realizado como base | `tasks/04_development_order.md` |
| Alcance MVP | Realizado como base | `tasks/05_mvp_scope.md` |
| Plan Pricing First | Realizado como base | `tasks/06_pricing_first_plan.md` |
| ADR gateway | Aceptado | `decisions/adr_0001_api_gateway_name.md` |
| ADR ERP modular | Aceptado | `decisions/adr_0002_modular_erp_strategy.md` |
| ADR catalogo proveedor | Aceptado | `decisions/adr_0003_supplier_catalog_strategy.md` |
| ADR cotizacion a orden | Aceptado | `decisions/adr_0004_quote_to_order_flow.md` |
| ADR rules engine | Aceptado | `decisions/adr_0005_rules_engine_strategy.md` |
| ADR API propia Tecno Telec | Aceptado | `decisions/adr_0006_project_api_boundary.md` |

## Pendiente principal

| Pendiente | Prioridad | Documento base |
| --- | --- | --- |
| Confirmar alcance MVP | Alta | `tasks/00_pending_tasks.md` |
| Conectar `tecnotelec-gateway-api` | Alta | `tasks/01_required_apis.md` |
| Conectar `tecnotelec-api` | Alta | `tasks/01_required_apis.md` |
| Crear o cerrar decision `quote-api` vs `sales-api` | Alta | `tasks/00_pending_tasks.md` |
| Crear `rules-engine-api` | Alta | `tasks/01_required_apis.md` |
| Completar `catalog-api` | Alta | `tasks/01_required_apis.md` |
| Completar `pricing-api` | Alta | `tasks/01_required_apis.md` |
| Completar `sales-api` | Alta | `tasks/01_required_apis.md` |
| Definir permisos finales | Alta | `tasks/00_pending_tasks.md` |
| Implementar vistas frontend Tecno Telec | Alta | `tasks/03_required_frontend_views.md` |
| Definir CFDI/facturacion | Media | `tasks/00_pending_tasks.md` |
| Definir Cart API | Media | `tasks/00_pending_tasks.md` |
| Definir POS API | Baja | `tasks/00_pending_tasks.md` |
| Definir GovernmentTender API para MVP o futuro | Baja | `tasks/00_pending_tasks.md` |

## Orden recomendado

1. Cerrar alcance MVP documentado en `tasks/05_mvp_scope.md`.
2. Confirmar contratos entre Supplier, Catalog y Pricing.
3. Estabilizar `supplier-api`.
4. Completar `catalog-api`.
5. Completar `pricing-api` empezando por listas `PUBLIC` y `SPECIAL_BUYER`.
6. Conectar `tecnotelec-api` con persistencia y permisos internos.
7. Conectar `tecnotelec-gateway-api` con `tecnotelec-api`.
8. Definir `quote-api` o integrar cotizacion inicial en `sales-api`.
9. Crear `rules-engine-api` basico.
10. Implementar frontend de inicio, soluciones, contacto y cotizador.
11. Agregar WhatsApp directo con medicion de conversion.
12. Agregar captura de leads.
13. Agregar carrito y checkout si entran en fase posterior.
14. Agregar Logistics.
15. Agregar Billing/CFDI.
16. Agregar chat en sitio como fase futura.
17. Agregar POS y GovernmentTender como fases posteriores si se confirma alcance.

## APIs existentes o parciales

| API | Estado documental | Accion |
| --- | --- | --- |
| `auth-api` | Existe/parcial | Cerrar roles y permisos. |
| `supplier-api` | Existe/avanzado | Documentar endpoints internos y estabilizar sync/publish. |
| `catalog-api` | Existe/parcial | Completar productos, categorias, marcas y kits. |
| `pricing-api` | Existe/parcial | Completar calculo, listas y reglas. |
| `sales-api` | Existe/parcial | Completar ordenes, pagos, devoluciones y cotizaciones si aplica. |

## APIs faltantes

| API | Prioridad | Motivo |
| --- | --- | --- |
| `tecnotelec-gateway-api` | Alta | Existe como draft; falta conectar orquestacion real. |
| `tecnotelec-api` | Alta | Existe como draft; falta conectar persistencia administrativa y contratos finales. |
| `quote-api` | Alta | Cotizaciones y snapshots si se separa de Sales. |
| `rules-engine-api` | Alta | Reglas configurables. |
| `projects-api` | Alta | Soluciones consultivas. |
| `logistics-api` | Media | Envios, tracking y costos. |
| `cart-api` | Media | Carrito web. |
| `billing-api` | Media | CFDI y documentos fiscales. |
| `documents-api` | Media | Anexos y evidencias. |
| `notifications-api` | Media | Mensajes, eventos y reintentos. |
| `pos-api` | Baja | Punto de venta fisico. |
| `government-tender-api` | Baja | Licitaciones. |

## Frontend requerido

Prioridad alta:

- `/`
- `/soluciones`
- `/soluciones/[slug]`
- `/cotizador`
- `/cotizador/[solution]`
- `/login`
- `/contacto`

Prioridad media:

- `/carrito`
- `/checkout`
- `/mi-cuenta`
- `/admin`
- `/dashboard`

Futuro:

- `/licitaciones`
- Chat en sitio.

Transversal MVP:

- Boton directo a WhatsApp de la empresa.
- Captura de leads.
- Medicion de conversiones.

## Reglas de arquitectura

- El frontend no debe consumir APIs core directamente.
- El frontend debe pasar por `tecnotelec-gateway-api`.
- El Gateway orquesta precios, pero no calcula ni guarda reglas permanentes de precio.
- La logica de precio vive en `pricing-api`.
- Las reglas propias de Tecno Telec deben vivir en `tecnotelec-api`.
- Las reglas reutilizables deben vivir en APIs core.
- Las APIs deben conservar fronteras para poder separarse a bases propias.
- Las referencias entre bases deben preferir contratos API/eventos; `postgres_fdw` queda como herramienta de lectura o transicion.

## Criterio para avanzar

Antes de implementar una pieza, verificar:

1. Documento fuente en `Docs`.
2. Owner del dominio.
3. API responsable.
4. Base/schema responsable.
5. Contrato con otras APIs.
6. Estado: existente, parcial, faltante o futuro.

Si algo no existe en la documentacion actual, marcar:

```txt
No encontrado en la documentacion actual.
```
