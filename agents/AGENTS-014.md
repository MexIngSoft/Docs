## FASE 13 — Carrito, pedido y compra

Crear:

02_projects/tecnotelec/cart/00_cart_future_process.md

No entra primero.

Debe documentarse para fase posterior:

1. Agregar producto.
2. Validar si es vendible.
3. Validar precio.
4. Validar stock.
5. Congelar snapshot.
6. Convertir carrito en cotización.
7. Convertir cotización en orden.
8. Reflejar en JobCron.
9. Manejar cancelación.
10. Manejar cambios de precio.

Regla:
Si producto es quoteOnly, no va directo a carrito.
Si producto es sellable, sí puede ir a carrito.