# Cart API

## Objetivo

Administrar carritos web y convertirlos en cotizaciones u ordenes mediante `Sales API`.

## Responsabilidades

- Crear carrito para cliente o sesion.
- Agregar, actualizar y quitar partidas.
- Solicitar precio preliminar a `Pricing`.
- Consultar disponibilidad preliminar a `Inventory`.
- Consultar envio estimado a `Logistics`.
- Enviar el carrito a `Sales` para cotizacion o venta.

## Endpoints base

```http
POST /api/cart/carts
GET /api/cart/carts/{cart_id}
POST /api/cart/carts/{cart_id}/items
PATCH /api/cart/carts/{cart_id}/items/{item_id}
DELETE /api/cart/carts/{cart_id}/items/{item_id}
POST /api/cart/carts/{cart_id}/recalculate
POST /api/cart/carts/{cart_id}/convert-to-quote
POST /api/cart/carts/{cart_id}/convert-to-order
```

## Regla

`Cart API` no crea ventas finales por si misma. La formalizacion ocurre en `Sales API`.

