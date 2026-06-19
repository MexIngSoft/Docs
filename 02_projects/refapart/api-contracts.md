# Contratos API REFAPART

## Estado

Auth y contratos comerciales MVP ACTIVE mediante Gateway central.

## Base canonica

```text
NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:8025/api/v1
```

## Endpoints publicos implementados

| Metodo | Ruta | Uso |
|---|---|---|
| `GET` | `/projects/REFAPART/products` | Listar piezas publicadas. |
| `GET` | `/projects/REFAPART/products/{slug}` | Consultar detalle. |
| `POST` | `/projects/REFAPART/search` | Buscar, normalizar errores y registrar demanda sin resultado. |
| `GET` | `/projects/REFAPART/search/suggestions?q=` | Obtener sugerencias. |
| `POST` | `/projects/REFAPART/requests` | Publicar solicitud de pieza. |
| `POST` | `/projects/REFAPART/checkout` | Crear pedido manual desde pieza publicable. |

## Endpoints operativos implementados

| Metodo | Ruta | Uso |
|---|---|---|
| `GET` | `/projects/REFAPART/admin/part-requests` | Bandeja de solicitudes. |
| `GET/PATCH` | `/projects/REFAPART/admin/part-requests/{id}` | Detalle y estado. |
| `POST` | `/projects/REFAPART/admin/part-requests/{id}/supplier-message` | Preparar contacto WhatsApp. |
| `POST` | `/projects/REFAPART/admin/part-requests/{id}/offers` | Registrar oferta. |
| `POST` | `/projects/REFAPART/admin/part-requests/{id}/quote` | Crear cotizacion. |
| `POST` | `/projects/REFAPART/admin/part-requests/{id}/order` | Crear pedido. |
| `GET/POST` | `/projects/REFAPART/admin/suppliers` | Consultar o registrar proveedores. |
| `GET` | `/projects/REFAPART/admin/dashboard` | Indicadores de demanda. |
| `GET` | `/projects/REFAPART/admin/products` | Productos publicables. |
| `GET` | `/projects/REFAPART/admin/search-logs` | Logs de busqueda. |
| `GET` | `/projects/REFAPART/admin/quotes` | Cotizaciones. |
| `GET` | `/projects/REFAPART/admin/orders` | Pedidos. |
| `GET/PATCH` | `/projects/REFAPART/admin/logistics` | Logistica y tracking interno. |
| `GET` | `/projects/REFAPART/admin/audit` | Auditoria operativa. |

## Endpoints privados cliente requeridos

| Metodo | Ruta | Uso | Estado |
|---|---|---|---|
| `GET` | `/projects/REFAPART/me/requests` | Solicitudes del cliente. | PENDIENTE |
| `GET` | `/projects/REFAPART/me/quotes` | Cotizaciones del cliente. | PENDIENTE |
| `GET` | `/projects/REFAPART/me/orders` | Pedidos del cliente. | PENDIENTE |
| `GET` | `/projects/REFAPART/me/orders/{id}/tracking` | Tracking visible. | PENDIENTE |
| `POST` | `/projects/REFAPART/quotes/{id}/accept` | Aceptar cotizacion. | PENDIENTE |
| `POST` | `/projects/REFAPART/quotes/{id}/reject` | Rechazar cotizacion. | PENDIENTE |

## Endpoints admin requeridos

| Metodo | Ruta | Uso | Estado |
|---|---|---|---|
| `GET` | `/projects/REFAPART/admin/part-requests/{id}` | Detalle de solicitud. | IMPLEMENTADO_CON_GET_PATCH |
| `PATCH` | `/projects/REFAPART/admin/part-requests/{id}` | Cambiar estado o asignacion. | IMPLEMENTADO_CON_GET_PATCH |
| `POST` | `/projects/REFAPART/admin/part-requests/{id}/assign` | Asignar cotizador. | PENDIENTE |
| `PATCH` | `/projects/REFAPART/admin/suppliers/{id}` | Actualizar proveedor. | PENDIENTE |
| `GET` | `/projects/REFAPART/admin/search-logs` | Consultar logs de busqueda. | IMPLEMENTADO |
| `GET` | `/projects/REFAPART/admin/demand` | Demanda no satisfecha. | PENDIENTE |
| `GET` | `/projects/REFAPART/admin/orders` | Pedidos operativos. | IMPLEMENTADO |
| `GET` | `/projects/REFAPART/admin/logistics` | Seguimiento logistico. | IMPLEMENTADO |

## Auth implementado

| Metodo | Ruta | Uso |
|---|---|---|
| `POST` | `/auth/login/` | Iniciar sesion con cookies HttpOnly. |
| `POST` | `/auth/logout/` | Cerrar sesion. |
| `POST` | `/auth/refresh/` | Renovar access token. |
| `GET` | `/auth/me/` | Obtener usuario actual. |
| `GET` | `/auth/me/permissions/` | Obtener roles y permisos REFAPART. |
| `POST` | `/auth/register/` | Crear cliente con rol `CUSTOMER`. |
| `POST` | `/auth/password/reset/` | Solicitar recuperacion. |
| `POST` | `/auth/password/reset/confirm/` | Confirmar nueva contrasena. |

## Eventos hacia JobCron pendientes

| Evento | Disparador |
|---|---|
| `search.requested` | Cliente busca o publica una pieza. |
| `quotation.accepted` | Cliente acepta cotizacion. |
| `order.created` | Se crea pedido comercial. |
| `payment.confirmed` | Se confirma pago del cliente. |

## Eventos recibidos desde JobCron

| Evento | Uso visible |
|---|---|
| `sourcing.started` | Mostrar busqueda en proceso. |
| `quotation.ready_for_customer` | Crear o actualizar cotizacion visible. |
| `logistics.updated` | Actualizar tracking publico. |
| `piece.not_found` | Informar que no se encontro opcion viable. |

## Address API reutilizada

REFAPART debe consumir direcciones mediante Gateway General hacia
`API.PY.DJANGO.Address`. No debe crear catalogo propio de estados, municipios,
asentamientos o codigos postales.

Referencia del proyecto:

```text
integrations/00_address_api_usage.md
```

## Errores

El Gateway central debe normalizar errores sin exponer trazas internas:

```json
{
  "code": "REFAPART_SEARCH_VALIDATION_ERROR",
  "message": "Revisa marca, modelo, anio o pieza solicitada.",
  "field": "pieceName"
}
```
