# REFAPART Address API Usage

## Objetivo

Definir como REFAPART usa `API.PY.DJANGO.Address` sin duplicar catalogos de
direcciones.

## Regla principal

REFAPART usa Address API para ciudad del cliente, direccion de entrega,
direccion de recoleccion, ubicacion de proveedor, origen/destino logistico,
perfil de cliente, checkout, pedido, tracking y direccion fiscal futura.

## Datos locales permitidos

| Campo | Uso |
|---|---|
| `AddressId` | Referencia a Address API. |
| `CityLabel` | Texto operativo visible. |
| `StateLabel` | Texto operativo visible. |
| `PostalCode` | Busqueda y filtros. |
| `ShortAddressText` | Snapshot breve para historial. |

## Referencias requeridas

| Referencia | Uso | Estado |
|---|---|---|
| `CustomerAddressId` | Perfil cliente. | PENDIENTE_DE_DEFINIR |
| `ShippingAddressId` | Entrega. | PENDIENTE_DE_DEFINIR |
| `BillingAddressId` | Facturacion futura. | PENDIENTE_DE_DEFINIR |
| `SupplierAddressId` | Proveedor. | PENDIENTE_DE_DEFINIR |
| `PickupAddressId` | Recoleccion. | PENDIENTE_DE_DEFINIR |
| `DeliveryAddressId` | Destino logistico. | PENDIENTE_DE_DEFINIR |
| `FiscalAddressId` | Perfil fiscal futuro. | PENDIENTE_DE_DEFINIR |

## Rutas web relacionadas

| Ruta | Estado |
|---|---|
| `/cuenta/direcciones` | EXISTE_EN_CODIGO |
| `/cuenta/facturacion` | EXISTE_EN_CODIGO |
| `/checkout` | EXISTE_EN_CODIGO |

## Pendientes

- PENDIENTE_DE_DEFINIR: conectar selector real de Address API en checkout.
- PENDIENTE_DE_DEFINIR: sincronizar referencias de address en API REFAPART.
- PENDIENTE_DE_DEFINIR: definir `BillingProfile` cuando el modulo fiscal este activo.
