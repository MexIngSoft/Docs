# Errores y consistencia

## Objetivo

Definir que debe pasar cuando una API falla dentro de un flujo distribuido.

## Casos criticos

- Falla `Pricing` al recalcular un carrito.
- Falla `Inventory` al reservar o descontar stock.
- Falla `Logistics` al cotizar envio.
- Falla `Supplier` durante sincronizacion.
- Falla `Sales` al convertir una cotizacion a orden.
- Falla `Billing` despues del pago.

## Estrategias permitidas

```text
RETRY
RETRY_LATER
INTERMEDIATE_STATE
COMPENSATION
MANUAL_REVIEW
CANCEL_OPERATION
```

## Estados intermedios sugeridos

```text
PENDING_PRICE_RECALCULATION
PENDING_STOCK_CONFIRMATION
PENDING_SHIPPING_QUOTE
PENDING_BILLING
PENDING_MANUAL_REVIEW
```

## Reglas

- Ninguna API debe ocultar una falla que afecte dinero, inventario o documentos fiscales.
- Todo error operativo debe guardar trazabilidad.
- Las operaciones con pago o inventario requieren idempotencia.
- Los reintentos deben tener limite y quedar en auditoria.

