# REFAPART JobCron Events

## Objetivo

Definir eventos entre REFAPART y JobCron sin acoplar UI ni exponer operacion
interna al cliente.

## Eventos salientes

| Evento | Disparador | Estado |
|---|---|---|
| `search.requested` | Busqueda o solicitud de pieza. | PENDIENTE_DE_DEFINIR |
| `quotation.accepted` | Cliente acepta cotizacion. | PENDIENTE_DE_DEFINIR |
| `order.created` | Pedido comercial creado. | PENDIENTE_DE_DEFINIR |
| `payment.confirmed` | Pago confirmado. | PENDIENTE_DE_DEFINIR |

## Eventos entrantes

| Evento | Uso visible | Estado |
|---|---|---|
| `sourcing.started` | Busqueda en proceso. | PENDIENTE_DE_DEFINIR |
| `quotation.ready_for_customer` | Cotizacion lista. | PENDIENTE_DE_DEFINIR |
| `logistics.updated` | Tracking publico. | PENDIENTE_DE_DEFINIR |
| `piece.not_found` | Sin opcion viable. | PENDIENTE_DE_DEFINIR |

## Outbox local

Si el bus de eventos no esta implementado, REFAPART debe documentar o crear una
cola local:

| Campo |
|---|
| `EventId` |
| `EventType` |
| `ProjectCode` |
| `PayloadJson` |
| `Status` |
| `RetryCount` |
| `CreatedAt` |
| `ProcessedAt` |
| `ErrorMessage` |
