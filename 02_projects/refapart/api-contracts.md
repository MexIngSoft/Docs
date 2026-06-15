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

## Errores

El Gateway central debe normalizar errores sin exponer trazas internas:

```json
{
  "code": "REFAPART_SEARCH_VALIDATION_ERROR",
  "message": "Revisa marca, modelo, anio o pieza solicitada.",
  "field": "pieceName"
}
```
