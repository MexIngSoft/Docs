# Modelo de ventas

## Objetivo

Controlar el ciclo comercial desde cotizacion hasta orden, pago y entrega.

## Conceptos

- `Quote`: propuesta/precio congelado.
- `SalesOrder`: venta formal.
- `Invoice`: documento fiscal o comercial.
- `Payment`: dinero recibido.
- `Cart`: intencion de compra web.
- `POS`: venta fisica rapida.

## Estados de venta

- `CREATED`.
- `WAITING_PAYMENT`.
- `PARTIALLY_PAID`.
- `PAID`.
- `PROCESSING`.
- `SHIPPED`.
- `DELIVERED`.
- `CANCELLED`.
- `REFUNDED`.

## Regla

Ni Cart, ni Projects, ni Pricing deben crear ventas finales. Sales formaliza la operacion.
