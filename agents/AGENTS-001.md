Claro. Este sería el **agente para Codex** enfocado solo en construir el módulo completo de **Direcciones**, sin usar `tb`, usando schemas y nomenclatura SQL Server.

Eres un agente de Codex encargado de construir el módulo completo de direcciones del ERP JobCron.

Objetivo:
Crear el módulo Address como API independiente y reutilizable para JobCron, RefaPart y futuros proyectos. Debe reemplazar la arquitectura antigua basada en tablas tipo `tbPais`, `tbEstado`, `tbMunicipio`, `tbCodigoPostal`, `tbAsentamiento`, `tbCalle`, `tbUbicacion`, `tbDireccion`, etc., usando nomenclatura SQL Server moderna.

Reglas obligatorias:

* No usar prefijo `tb`.
* No usar snake_case.
* No usar camelCase.
* Usar PascalCase.
* Usar schema `[Address]`.
* Toda tabla debe ser singular.
* Toda PK debe llamarse `[Id]`.
* Toda FK debe terminar en `Id`.
* Usar `UNIQUEIDENTIFIER` para Id.
* Usar `DATETIME2(0)` para fechas.
* Usar `BIT` para booleanos.
* Usar `NVARCHAR`.
* Usar constraints con nombres explícitos.
* Usar índices con prefijos `IX_`, `UX_`, `PK_`, `FK_`.

Crear el schema:

```sql
CREATE SCHEMA [Address];
```

Crear estas tablas principales:

```text
[Address].[Country]
[Address].[State]
[Address].[Municipality]
[Address].[City]
[Address].[PostalCode]
[Address].[SettlementType]
[Address].[Settlement]
[Address].[Zone]
[Address].[StreetType]
[Address].[Street]
[Address].[AddressType]
[Address].[AddressStatus]
[Address].[Address]
[Address].[AddressSuggestionLog]
```

Equivalencia desde la base anterior:

```text
tbPais                -> [Address].[Country]
tbEstado              -> [Address].[State]
tbMunicipio           -> [Address].[Municipality]
tbCiudad              -> [Address].[City]
tbCodigoPostal        -> [Address].[PostalCode]
tbTipoAsentamiento    -> [Address].[SettlementType]
tbAsentamiento        -> [Address].[Settlement]
tbZona                -> [Address].[Zone]
tbTipoCalle           -> [Address].[StreetType]
tbCalle               -> [Address].[Street]
tbTipoDireccion       -> [Address].[AddressType]
tbEstadoDireccion     -> [Address].[AddressStatus]
tbDireccion           -> [Address].[Address]
tbUbicacion           -> integrar en [Address].[Address] con Latitude/Longitude
```

Campos mínimos por tabla:

```sql
[Address].[Country]
- Id
- CountryName
- IsoCode2
- IsoCode3
- PhoneCode
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[State]
- Id
- CountryId
- StateName
- StateCode
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[Municipality]
- Id
- StateId
- MunicipalityName
- MunicipalityCode
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[City]
- Id
- MunicipalityId
- CityName
- IsMainCity
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[PostalCode]
- Id
- CountryId
- StateId
- MunicipalityId
- PostalCodeValue
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[SettlementType]
- Id
- SettlementTypeName
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[Settlement]
- Id
- PostalCodeId
- SettlementTypeId
- SettlementName
- ZoneId NULL
- CityId NULL
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[Zone]
- Id
- ZoneName
- ZoneCode NULL
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[StreetType]
- Id
- StreetTypeName
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[Street]
- Id
- SettlementId
- StreetTypeId NULL
- StreetName
- NormalizedStreetName
- IsVerified
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy

[Address].[AddressType]
- Id
- AddressTypeCode
- AddressTypeName
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy
```

Valores iniciales para `[Address].[AddressType]`:

```text
SHIPPING
BILLING
INSTALLATION
WAREHOUSE
BRANCH
SUPPLIER
CUSTOMER
PICKUP
DELIVERY
```

Tabla principal:

```sql
[Address].[Address]
- Id
- AddressTypeId
- AddressStatusId
- CountryId
- StateId
- MunicipalityId
- CityId NULL
- PostalCodeId
- SettlementId NULL
- StreetId NULL
- StreetTypeId NULL
- StreetName
- ExteriorNumber
- InteriorNumber NULL
- CrossStreetOne NULL
- CrossStreetTwo NULL
- References NULL
- Latitude NULL
- Longitude NULL
- FullAddress
- NormalizedAddress
- IsDefault
- IsVerified
- IsActive
- CreatedAt
- CreatedBy
- UpdatedAt
- UpdatedBy
- DeletedAt NULL
- DeletedBy NULL
```

Estados para `[Address].[AddressStatus]`:

```text
DRAFT
INCOMPLETE
VALIDATED
VERIFIED
REJECTED
ARCHIVED
```

Crear tabla de sugerencias:

```sql
[Address].[AddressSuggestionLog]
- Id
- InputPostalCode NULL
- InputText NULL
- SuggestedCountryId NULL
- SuggestedStateId NULL
- SuggestedMunicipalityId NULL
- SuggestedCityId NULL
- SuggestedSettlementId NULL
- SuggestedStreetId NULL
- ConfidenceScore DECIMAL(5,2) NULL
- Source
- CreatedAt
- CreatedBy
```

Comportamiento dinámico requerido:

1. Si el usuario captura código postal, devolver país, estado, municipio, ciudad y asentamientos sugeridos.
2. Si el usuario selecciona asentamiento, sugerir calles existentes de esa colonia/asentamiento.
3. Si la calle no existe, permitir capturarla y guardarla como no verificada.
4. Si se capturan latitud y longitud, guardarlas en `[Address].[Address]`.
5. Generar automáticamente `FullAddress`.
6. Generar automáticamente `NormalizedAddress` para búsquedas.
7. Permitir que una dirección sea usada por clientes, proveedores, sucursales, almacenes, puntos de recolección y puntos de entrega.
8. No crear FK directa hacia Customer, Supplier o Warehouse dentro de Address si pertenecen a otros dominios. Para relaciones externas usar tabla puente en el dominio correspondiente o contratos API.

Endpoints mínimos de la API:

```text
GET    /address/countries
GET    /address/states?countryId=
GET    /address/municipalities?stateId=
GET    /address/postal-codes/{postalCode}/suggestions
GET    /address/settlements?postalCodeId=
GET    /address/streets?settlementId=&query=
POST   /address/streets
POST   /address/addresses
GET    /address/addresses/{id}
PATCH  /address/addresses/{id}
DELETE /address/addresses/{id}
```

Endpoint principal de autocompletado:

```text
GET /address/suggest?postalCode=42000
```

Debe responder:

```json
{
  "postalCode": "42000",
  "country": {},
  "state": {},
  "municipality": {},
  "cities": [],
  "settlements": [],
  "zones": [],
  "suggestedStreets": []
}
```

Criterios de aceptación:

* No existe ninguna tabla con prefijo `tb`.
* Todas las tablas están bajo schema `[Address]`.
* Todas las tablas usan PascalCase.
* Existen índices para búsquedas por código postal, asentamiento y calle.
* Existe `FullAddress`.
* Existe `NormalizedAddress`.
* El módulo puede ser usado por Customer, Supplier, Logistics, Billing, Warehouse y RefaPart.
* No se mezclan responsabilidades de otros módulos dentro de Address.
* La documentación final debe incluir diccionario de tablas, campos, índices y relaciones.

Y la regla clave para que no se contamine: **Address no debe saber si la dirección es de cliente, proveedor o almacén; solo guarda direcciones limpias y geografía.** Las relaciones se hacen desde `Customer`, `Supplier`, `Warehouse` o `Logistics`.
