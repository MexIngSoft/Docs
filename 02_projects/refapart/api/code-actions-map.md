# Mapa API de acciones de codigo REFAPART

## Estado

ACTIVE_MVP

## Proyecto API

```text
Docker.API.PY/API.PY.DJANGO.RefaPart
```

## Archivos principales

```text
marketplace/urls.py
marketplace/views.py
marketplace/models.py
```

## Acciones API

| Codigo de accion | Gateway route | Endpoint API / vista | Metodo | Modelos/tablas afectadas | Estado | Notas |
|---|---|---|---|---|---|---|
| `REFAPART.QUOTE.SEARCH_PART` | `/projects/REFAPART/search` | `marketplace.views.search` | POST | `RefaPartSearchQueryLog`, `RefaPartPartRequest` | vigente | Normaliza busqueda, rankea productos y crea demanda si no hay resultados. |
| `REFAPART.QUOTE.CREATE_REQUEST` | `/projects/REFAPART/requests` | `marketplace.views.requests_create` | POST | `RefaPartPartRequest`, `RefaPartAuditLog` | vigente | Crea solicitud de pieza desde formulario publico. |
| `REFAPART.QUOTE.SEND_TO_SUPPLIERS` | `/projects/REFAPART/admin/part-requests/{id}/supplier-message` | `marketplace.views.supplier_message` | POST | `RefaPartSupplierMessage`, `RefaPartAuditLog` | vigente | Prepara contacto interno; no expone proveedor al cliente. |
| `REFAPART.SUPPLIER.INTERNAL_RESPONSE` | `/projects/REFAPART/admin/part-requests/{id}/offers` | `marketplace.views.offers` | POST | `RefaPartSupplierPartOffer`, `RefaPartPartRequest`, `RefaPartAuditLog` | vigente | Registra respuesta/oferta de proveedor interno. |
| `REFAPART.QUOTE.CREATE_QUOTE` | `/projects/REFAPART/admin/part-requests/{id}/quote` | `marketplace.views.quote_create` | POST | `RefaPartQuote`, `RefaPartSupplierPartOffer`, `RefaPartAuditLog` | vigente | Genera cotizacion interna publicable. |
| `REFAPART.QUOTE.SEND_QUOTE` | `/projects/REFAPART/admin/part-requests/{id}/quote/send` | `marketplace.views.quote_send` | POST | `RefaPartQuote`, `RefaPartPartRequest`, `RefaPartAuditLog` | vigente | Prepara mensaje al cliente; no sustituye notificacion formal futura. |
| `REFAPART.ORDER.CREATE` | `/projects/REFAPART/admin/part-requests/{id}/order` | `marketplace.views.order_create` | POST | `RefaPartOrder`, `RefaPartLogisticsTask`, `RefaPartAuditLog` | vigente | Crea pedido operativo desde cotizacion. |
| `REFAPART.ORDER.CHECKOUT` | `/projects/REFAPART/checkout` | `marketplace.views.checkout` | POST | `RefaPartPartRequest`, `RefaPartSupplierPartOffer`, `RefaPartQuote`, `RefaPartOrder.ShippingAddressId`, `RefaPartLogisticsTask`, `RefaPartAuditLog` | vigente | Checkout manual MVP; requiere `shippingAddressId` creado en Address API. Payments real pendiente. |
| `REFAPART.ORDER.TRACKING` | `/projects/REFAPART/me/orders/{id}/tracking` | `marketplace.views.my_order_tracking` | GET | `RefaPartOrder`, `RefaPartLogisticsTask` | vigente | Tracking visible al cliente. |
| `REFAPART.ADDRESS.SEARCH` | `/core/address/api/address/suggest?postalCode=`, `/core/address/api/address/addresses` | `API.PY.DJANGO.Address` | GET/POST | Address API; `RefaPartOrder.ShippingAddressId` como referencia | vigente | UI REFAPART consume Address via Gateway y no copia catalogos geograficos. |
| `REFAPART.PAYMENT.REQUEST` | PENDIENTE_DE_DEFINIR | Payments API futura | POST | `RefaPartOrder`, futuro Payment | pendiente | No integrar Openpay/Mercado Pago/Stripe/BBVA directo en REFAPART sin contrato/owner/proveedor. |

## Permisos

Permisos operativos sembrados en Auth:

```text
Rol: REFAPART_ADMIN
Permisos: CanViewPartRequests, CanAssignPartRequests, CanContactSuppliers,
CanRegisterSupplierResponse, CanViewSupplierPrices, CanEditFinalPrice,
CanGenerateQuote, CanSendCustomerQuote, CanConvertQuoteToOrder,
CanManageSuppliers, CanManageProducts, CanViewSearchLogs,
CanViewDemandDashboard, CanManageOrders, CanManageLogistics,
CanClosePartRequest.
```

Los roles especializados `REFAPART_QUOTER`, `REFAPART_SUPPLIER_MANAGER`,
`REFAPART_LOGISTICS`, `REFAPART_FINANCE` y `REFAPART_SUPPORT` permanecen
documentados como matriz de negocio, pero no tienen seed productivo observado.
Las acciones admin deben seguir protegidas por Gateway/Auth y no solo por UI.

## Pendientes

- Definir permisos `REFAPART_ADMIN`, `REFAPART_OPERATOR`, `REFAPART_CUSTOMER`
  o equivalentes.
- Definir contrato de libreta persistente de direcciones de cliente si el
  perfil necesita listar direcciones guardadas entre sesiones.
- Definir contrato Payments antes de activar pagos reales.
- Validar migraciones contra `Docs/02_projects/refapart/database.md` en una
  corrida donde se permita ejecutar pruebas/API.
