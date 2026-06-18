# REFAPART Permissions Matrix

## Objetivo

Definir roles y permisos operativos para REFAPART mas alla del rol base
`CUSTOMER`.

## Roles

| Rol | Uso |
|---|---|
| CUSTOMER | Cliente final. |
| REFAPART_ADMIN | Administracion completa REFAPART. |
| REFAPART_QUOTER | Cotizador operativo. |
| REFAPART_SUPPLIER_MANAGER | Gestion de proveedores. |
| REFAPART_LOGISTICS | Logistica y seguimiento. |
| REFAPART_FINANCE | Pagos, margenes y conciliacion. |
| REFAPART_SUPPORT | Atencion y seguimiento de cliente. |

## Permisos

| Permiso | CUSTOMER | ADMIN | QUOTER | SUPPLIER_MANAGER | LOGISTICS | FINANCE | SUPPORT |
|---|---|---|---|---|---|---|---|
| CanViewPartRequests | No | Si | Si | No | No | No | Si |
| CanAssignPartRequests | No | Si | No | No | No | No | No |
| CanContactSuppliers | No | Si | Si | Si | No | No | No |
| CanRegisterSupplierResponse | No | Si | Si | Si | No | No | No |
| CanViewSupplierPrices | No | Si | Si | Si | No | Si | No |
| CanEditFinalPrice | No | Si | No | No | No | Si | No |
| CanGenerateQuote | No | Si | Si | No | No | Si | No |
| CanSendCustomerQuote | No | Si | Si | No | No | No | Si |
| CanConvertQuoteToOrder | Si | Si | No | No | No | Si | No |
| CanManageSuppliers | No | Si | No | Si | No | No | No |
| CanAuthorizeSuppliers | No | Si | No | Si | No | No | No |
| CanManageProducts | No | Si | No | No | No | No | No |
| CanViewSearchLogs | No | Si | Si | No | No | No | Si |
| CanViewDemandDashboard | No | Si | Si | No | No | No | Si |
| CanManageOrders | No | Si | No | No | Si | Si | Si |
| CanManageLogistics | No | Si | No | No | Si | No | No |
| CanManagePayments | No | Si | No | No | No | Si | No |
| CanClosePartRequest | No | Si | Si | No | No | No | Si |
| CanViewInternalCosts | No | Si | No | No | No | Si | No |
| CanViewMargins | No | Si | No | No | No | Si | No |

## Pendientes

- PENDIENTE_DE_DEFINIR: sincronizacion exacta con Auth.
- PENDIENTE_DE_DEFINIR: seed productivo de roles.
