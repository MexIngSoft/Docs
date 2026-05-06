# Modelo de datos: POS

## Schema

```text
POS
```

## Tablas principales

```text
POS.CashRegisters
POS.POSSession
POS.POSTickets
POS.POSTicketItems
POS.CashMovements
POS.CashCuts
```

## Relaciones

- `POSSession.CashierUserId` apunta a `Auth`.
- `POSTickets.SalesOrderId` apunta a `Sales`.
- `POSTicketItems.ProductId` apunta a `Catalog`.

