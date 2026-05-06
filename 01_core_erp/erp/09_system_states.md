# Estados del sistema

## Objetivo

Definir estados reutilizables para que las APIs no inventen flujos incompatibles.

## Venta

```text
DRAFT
QUOTED
APPROVED
WAITING_PAYMENT
PARTIALLY_PAID
PAID
PROCESSING
SHIPPED
DELIVERED
CANCELLED
REFUNDED
```

## Cotizacion

```text
DRAFT
CALCULATED
PENDING_REVIEW
APPROVED
REJECTED
EXPIRED
CONVERTED_TO_ORDER
```

## Proyecto

```text
CREATED
IN_ANALYSIS
QUOTED
APPROVED
IN_PROGRESS
COMPLETED
CANCELLED
```

## Carrito

```text
ACTIVE
PRICE_CHANGED
WAITING_STOCK
READY_TO_CHECKOUT
CONVERTED_TO_QUOTE
CONVERTED_TO_ORDER
ABANDONED
EXPIRED
```

## Envio

```text
CREATED
QUOTED
IN_TRANSIT
OUT_FOR_DELIVERY
DELIVERED
FAILED
CANCELLED
```

## Licitacion

```text
DISCOVERED
ANALYZING
VIABLE
NOT_VIABLE
PREPARING_PROPOSAL
SUBMITTED
AWAITING_RESULT
WON
LOST
CANCELLED
```

## Regla

Cada API debe documentar sus transiciones permitidas. Ningun endpoint debe cambiar estados de forma implicita si afecta venta, pago, inventario o facturacion.

