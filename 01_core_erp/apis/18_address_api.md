# Address API

API Core reutilizable para geografia, autocompletado y direcciones. No conoce
clientes, proveedores, almacenes ni proyectos.

```text
GET    /api/address/countries
GET    /api/address/states?countryId=
GET    /api/address/municipalities?stateId=
GET    /api/address/suggest?postalCode=
GET    /api/address/streets?settlementId=&query=
POST   /api/address/streets
POST   /api/address/addresses
GET    /api/address/addresses/{id}
PATCH  /api/address/addresses/{id}
DELETE /api/address/addresses/{id}
```
