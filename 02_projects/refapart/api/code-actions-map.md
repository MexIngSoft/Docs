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
| `REFAPART.ORDER.CHECKOUT` | `/projects/REFAPART/checkout` | `marketplace.views.checkout` | POST | `RefaPartPartRequest`, `RefaPartSupplierPartOffer`, `RefaPartQuote`, `RefaPartOrder`, `RefaPartLogisticsTask`, `RefaPartAuditLog` | vigente | Checkout manual MVP; Payments real pendiente. |
| `REFAPART.ORDER.TRACKING` | `/projects/REFAPART/me/orders/{id}/tracking` | `marketplace.views.my_order_tracking` | GET | `RefaPartOrder`, `RefaPartLogisticsTask` | vigente | Tracking visible al cliente. |
| `REFAPART.ADDRESS.SEARCH` | PENDIENTE_DE_DEFINIR | `API.PY.DJANGO.Address` | GET | Address API; snapshots permitidos en REFAPART | pendiente | No duplicar catalogos geograficos en REFAPART. |
| `REFAPART.PAYMENT.REQUEST` | PENDIENTE_DE_DEFINIR | Payments API futura | POST | `RefaPartOrder`, futuro Payment | pendiente | No integrar Openpay/Mercado Pago/Stripe/BBVA directo en REFAPART. |

## Permisos

Permisos finales por rol operativo:

```text
PENDIENTE_DE_DEFINIR
```

Hasta cerrar matriz definitiva, las acciones admin deben tratarse como
protegidas por Gateway/Auth y no como seguridad solo frontend.

## Pendientes

- Definir permisos `REFAPART_ADMIN`, `REFAPART_OPERATOR`, `REFAPART_CUSTOMER`
  o equivalentes.
- Confirmar rutas Gateway Address.
- Definir contrato Payments antes de activar pagos reales.
- Validar migraciones contra `Docs/02_projects/refapart/database.md` en una
  corrida donde se permita ejecutar pruebas/API.
