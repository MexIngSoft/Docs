# Proceso futuro de carrito, pedido y compra

## Estado

No entra primero. Fase posterior al catalogo, pricing, cotizacion y JobCron basico.

## Flujo futuro

1. Agregar producto.
2. Validar si es vendible.
3. Validar precio.
4. Validar stock.
5. Congelar snapshot.
6. Convertir carrito en cotizacion.
7. Convertir cotizacion en orden.
8. Reflejar en JobCron.
9. Manejar cancelacion.
10. Manejar cambios de precio.

## Reglas

- Si producto es `quoteOnly`, no va directo a carrito.
- Si producto es `sellable`, puede ir a carrito.
- Web no calcula precios.
- Pricing valida precio.
- Inventory valida disponibilidad.
- Quote/Sales guarda snapshot.

## Pendientes

- Confirmar si carrito entra en MVP posterior o fase comercial avanzada.
- Definir Cart API real.
- Definir checkout y pagos.
