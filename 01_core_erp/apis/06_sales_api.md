# Sales API

## Responsabilidad

Formalizar ventas, ordenes, pagos, anticipos, devoluciones y estados comerciales.

## Endpoints minimos

- `POST /orders`
- `GET /orders/{id}`
- `POST /orders/{id}/payments`
- `POST /orders/{id}/cancel`
- `POST /orders/{id}/refund`

## Regla

Sales no disena soluciones ni calcula precios desde cero.
