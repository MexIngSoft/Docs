# Modelo de punto de venta

## Objetivo

`POS` controla ventas fisicas rapidas, caja, tickets y cortes. Usa `Sales` como libro comercial final.

## Responsabilidad

- Registrar venta rapida en mostrador.
- Identificar cajero, caja y sucursal.
- Calcular precios con `Pricing`.
- Validar y descontar inventario local con `Inventory`.
- Registrar pago inmediato.
- Generar ticket y corte de caja.
- Administrar devoluciones de mostrador.

## No debe hacer

- Reemplazar `Sales API` como registro comercial central.
- Guardar catalogo propio.
- Definir reglas de descuento sin autorizacion.
- Administrar proveedores.

## Entidades base

```text
CashRegister
- Id
- BranchId
- Name
- Status
```

```text
POSSession
- Id
- CashRegisterId
- CashierUserId
- OpeningAmount
- ClosingAmount
- Status
- OpenedAt
- ClosedAt
```

```text
POSTicket
- Id
- POSSessionId
- SalesOrderId
- TicketNumber
- Total
- PaymentMethod
- Status
```

## Estados

```text
SESSION_OPEN
SESSION_CLOSED
TICKET_DRAFT
TICKET_PAID
TICKET_CANCELLED
TICKET_REFUNDED
```

## Regla central

Una venta POS pagada debe terminar registrada en `SalesOrder`, aunque el usuario opere desde una pantalla de caja.

