# Facturacion y devoluciones

## Objetivo

Definir el tratamiento base para facturacion, pagos, reembolsos y devoluciones.

## Facturacion

En Mexico, el ERP debe contemplar datos fiscales como:

- RFC.
- Razon social.
- Regimen fiscal.
- Uso CFDI.
- Metodo y forma de pago.
- Direccion fiscal cuando aplique.

La integracion fiscal puede vivir como `Billing API` o como modulo interno de `Sales` al inicio.

## Devoluciones

Tipos:

```text
PARTIAL_RETURN
FULL_RETURN
EXCHANGE
REFUND
WARRANTY_RETURN
```

## Reglas de devolucion

- Toda devolucion debe relacionarse con una venta.
- Si el producto vuelve a inventario, `Inventory` debe registrar movimiento de reingreso.
- Si hay reembolso, `Sales` debe registrar el movimiento financiero.
- Si hubo factura, `Billing` debe contemplar cancelacion o nota de credito segun aplique.

## Pendientes

```text
PENDIENTE_DE_DEFINIR:
- Proveedor PAC/facturacion.
- Politica de devoluciones por empresa.
- Tiempos maximos de devolucion.
```

