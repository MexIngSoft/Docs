# Modelo de datos: Billing

## Schema

```text
Billing
```

## Tablas principales

```text
Billing.TaxProfiles
Billing.Invoices
Billing.InvoiceItems
Billing.CreditNotes
Billing.BillingEvents
```

## Relaciones

- `TaxProfiles.CustomerId` apunta a cliente.
- `Invoices.SalesOrderId` apunta a `Sales`.
- `CreditNotes.InvoiceId` apunta a factura.

