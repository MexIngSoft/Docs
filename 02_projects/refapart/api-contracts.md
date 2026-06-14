# Contratos API REFAPART

## Estado

FUTURE_OR_PENDING

## Base futura

```text
NEXT_PUBLIC_REFAPART_GATEWAY_BASE_URL=http://localhost:8023/api/refapart
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

El Gateway debe normalizar errores sin exponer trazas internas:

```json
{
  "code": "REFAPART_SEARCH_VALIDATION_ERROR",
  "message": "Revisa marca, modelo, anio o pieza solicitada.",
  "field": "pieceName"
}
```
