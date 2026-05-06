# Flujo de punto de venta

```text
Cajero abre caja
Cajero escanea o agrega producto
POS API crea ticket
Pricing API obtiene precio
Inventory API valida stock local
Cliente paga
Sales API registra venta
Inventory API descuenta stock
POS API genera ticket y corte
```

## Reglas

- Cada ticket pagado debe relacionarse con una orden en `Sales`.
- El cierre de caja debe cuadrar pagos, devoluciones y movimientos.

