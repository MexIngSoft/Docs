# Billing API

## Objetivo

Gestionar datos fiscales, facturacion, notas de credito y relacion con documentos comerciales.

## Responsabilidades

- Guardar perfiles fiscales de clientes.
- Relacionar facturas con ventas.
- Registrar estatus de documentos fiscales.
- Administrar cancelaciones o notas de credito cuando aplique.
- Exponer informacion fiscal a `Sales` y proyectos.

## Endpoints base

```http
POST /api/billing/tax-profiles
GET /api/billing/tax-profiles/{profile_id}
POST /api/billing/invoices
GET /api/billing/invoices/{invoice_id}
POST /api/billing/invoices/{invoice_id}/cancel
POST /api/billing/credit-notes
```

## Pendientes

```text
PENDIENTE_DE_DEFINIR:
- Proveedor fiscal.
- Alcance CFDI.
- Politica de facturacion por empresa.
```

