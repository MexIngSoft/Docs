# Contratos API REFAPART

## Estado

Auth via Gateway central ACTIVE; contratos comerciales FUTURE_OR_PENDING.

## Base futura

```text
NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:8025/api/v1
```

## Endpoints publicos esperados

| Metodo | Ruta | Uso |
|---|---|---|
| `GET` | `/parts` | Buscar piezas publicables. |
| `GET` | `/parts/{id}` | Consultar detalle publicable. |
| `POST` | `/search-requests` | Crear solicitud de pieza. |
| `GET` | `/quotations/{id}` | Ver cotizacion visible para cliente. |
| `POST` | `/orders` | Crear pedido desde cotizacion aceptada. |
| `GET` | `/orders/{id}/tracking` | Consultar seguimiento publico. |

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

## Eventos hacia JobCron

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
