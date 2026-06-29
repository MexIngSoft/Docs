# REFAPART Address API Usage

## Objetivo

Definir como REFAPART usa `API.PY.DJANGO.Address` sin duplicar catalogos de
direcciones.

## Regla principal

REFAPART usa Address API para ciudad del cliente, direccion de entrega,
direccion de recoleccion, ubicacion de proveedor, origen/destino logistico,
perfil de cliente, checkout, pedido, tracking y direccion fiscal futura.

El consumo debe pasar por Gateway General:

```text
WEB.NJ.NEXT.RefaPart
-> API.PY.DJANGO.Gateway /api/v1/core/address/api/address/<endpoint>
-> API.PY.DJANGO.Address /api/address/<endpoint>
```

Configuracion Gateway requerida:

```text
ADDRESS_API_BASE_URL=http://api-multiproyecto:8026
```

Rutas confirmadas:

| Uso | Ruta Gateway | Ruta Address API |
|---|---|---|
| Paises | `/core/address/api/address/countries` | `/api/address/countries` |
| Estados | `/core/address/api/address/states?countryId=` | `/api/address/states?countryId=` |
| Municipios | `/core/address/api/address/municipalities?stateId=` | `/api/address/municipalities?stateId=` |
| Sugerencia por CP | `/core/address/api/address/suggest?postalCode=` | `/api/address/suggest?postalCode=` |
| Calles | `/core/address/api/address/streets?settlementId=&query=` | `/api/address/streets?settlementId=&query=` |
| Alta direccion | `/core/address/api/address/addresses` | `/api/address/addresses` |

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
| `CustomerAddressId` | Perfil cliente. | PENDIENTE_UI_API_REFAPART |
| `ShippingAddressId` | Entrega. | PENDIENTE_UI_API_REFAPART |
| `BillingAddressId` | Facturacion futura. | PENDIENTE_MODULO_FISCAL |
| `SupplierAddressId` | Proveedor. | PENDIENTE_UI_API_REFAPART |
| `PickupAddressId` | Recoleccion. | PENDIENTE_UI_API_REFAPART |
| `DeliveryAddressId` | Destino logistico. | PENDIENTE_UI_API_REFAPART |
| `FiscalAddressId` | Perfil fiscal futuro. | PENDIENTE_MODULO_FISCAL |

## Rutas web relacionadas

| Ruta | Estado |
|---|---|
| `/cuenta/direcciones` | EXISTE_EN_CODIGO |
| `/cuenta/facturacion` | EXISTE_EN_CODIGO |
| `/checkout` | EXISTE_EN_CODIGO |

## Pendientes

- Conectar selector real de Address API en checkout y cuenta.
- Sincronizar referencias `AddressId` en API REFAPART sin copiar catalogos.
- Definir `BillingProfile` cuando el modulo fiscal este activo.
