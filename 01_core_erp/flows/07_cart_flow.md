# Flujo de carrito web

```text
Cliente agrega producto
Cart API guarda carrito
Pricing API calcula precio preliminar
Inventory API valida disponibilidad preliminar
Logistics API calcula envio estimado
Rules Engine evalua condiciones
Sales API genera cotizacion u orden
```

## Reglas

- El carrito no es venta.
- Si cambia precio o stock, el carrito debe recalcularse.
- La venta final solo existe despues de `Sales`.

