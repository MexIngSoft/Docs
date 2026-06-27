# Address API Standard

## Objetivo

Definir `API.PY.DJANGO.Address` como fuente reutilizable para direcciones,
codigos postales, estados, municipios, asentamientos y normalizacion de
direcciones del ecosistema.

## Regla principal

Ningun proyecto debe crear catalogos propios de paises, estados, municipios,
colonias, codigos postales o direcciones si la responsabilidad pertenece a
Address API.

Repositorio canonico:

```text
https://github.com/MexIngSoft/API.PY.DJANGO.Address.git
```

El consumo debe hacerse mediante Gateway General. Las webs no deben llamar
directamente a Address API desde navegador.

## Consumidores previstos

- REFAPART.
- Clientes.
- Facturacion futura.
- Logistica.
- Pedidos.
- Proveedores.
- Cotizaciones.
- Envios.
- Cualquier proyecto que requiera direcciones.

## Endpoints esperados

| Endpoint | Estado local observado |
|---|---|
| `GET /countries` | EXISTE_EN_CODIGO |
| `GET /states?countryId=` | EXISTE_EN_CODIGO |
| `GET /municipalities?stateId=` | EXISTE_EN_CODIGO |
| `GET /suggest?postalCode=` | EXISTE_EN_CODIGO |
| `GET /streets?settlementId=&query=` | EXISTE_EN_CODIGO |
| `POST /streets` | EXISTE_EN_CODIGO |
| `POST /addresses` | EXISTE_EN_CODIGO |
| `GET /addresses/{id}` | EXISTE_EN_CODIGO |
| `PATCH /addresses/{id}` | EXISTE_EN_CODIGO |
| `GET /postal-codes/{postalCode}` | PENDIENTE_DE_DEFINIR |
| `GET /settlements?postalCode=` | PENDIENTE_DE_DEFINIR |
| `POST /addresses/normalize` | PENDIENTE_DE_DEFINIR |
| `POST /addresses/validate` | PENDIENTE_DE_DEFINIR |

## Modelo minimo

Address API debe cubrir:

- `Country`
- `State`
- `Municipality`
- `City`
- `PostalCode`
- `Settlement`
- `Street`
- `ExteriorNumber`
- `InteriorNumber`
- `Reference`
- `Latitude`
- `Longitude`
- `NormalizedAddress`
- `AddressType`
- `OwnerType`
- `OwnerId`
- `IsDefault`
- `IsFiscal`
- `IsShipping`
- `IsPickup`
- `IsActive`
- `CreatedAt`
- `UpdatedAt`

## Tipos de direccion

- `Shipping`
- `Billing`
- `Pickup`
- `Supplier`
- `Customer`
- `Fiscal`
- `Warehouse`

## Integracion

Los proyectos consumidores pueden guardar referencias operativas:

```text
AddressId
CityLabel
StateLabel
PostalCode
ShortAddressText
```

No deben copiar el catalogo completo de Address API.
