# SYSCOM Brands API

## Objetivo

Descargar marcas disponibles en SYSCOM hacia `Supplier.SupplierBrands` y publicarlas despues hacia `Catalog.Brands`.

Las marcas ayudan a normalizar productos, filtrar catalogo, agrupar por fabricante y mostrar logos cuando el proveedor los entrega.

## Endpoints

```http
GET https://developers.syscom.mx/api/v1/marcas
GET https://developers.syscom.mx/api/v1/marcas/{id}
```

Headers:

```http
Authorization: Bearer {{access_token}}
Accept: application/json
```

## Response lista esperado

```json
[
  {
    "id": "hikvision",
    "nombre": "HIKVISION"
  }
]
```

## Response detalle esperado

```json
{
  "descripcion": "Hikvision es el principal proveedor...",
  "titulo": "HIKVISION Digital Technology Co., Ltd. is",
  "logo": "https://ftp3.syscom.mx/usuarios/fotos/logotipos/hikvision.png",
  "categorias": [
    {
      "nombre": "Camaras IP y NVRs",
      "id": "214",
      "imagen": "https://...",
      "cantidad": 728
    }
  ]
}
```

## Campos recibidos

| Campo SYSCOM | Tipo recibido | Destino inicial | Uso |
|---|---|---|---|
| `id` | string / integer | `SupplierBrand.ExternalId` | Identificador externo de marca. |
| `nombre` | string | `SupplierBrand.Name` | Nombre visible. |
| `descripcion` | string | `SupplierBrand.RawData` | Descripcion comercial. |
| `titulo` | string | `SupplierBrand.RawData` | Titulo informativo. |
| `logo` | string URL | `SupplierBrand.RawData` | Logo. |
| `categorias` | array | `SupplierBrand.RawData` | Categorias donde participa. |

## Destinos

| Etapa | Proyecto | Tabla |
|---|---|---|
| Sync | `API.PY.DJANGO.Supplier` | `"Supplier"."SupplierBrands"` |
| Publish | `API.PY.DJANGO.Catalog` | `"Catalog"."Brands"` |

## Modelo de entrada: SupplierBrand

| Campo | Tipo Django | Tipo PostgreSQL | Nulo | Descripcion |
|---|---|---|---:|---|
| `Id` | `UUIDField` | `uuid` | No | PK interna. |
| `Supplier` | `ForeignKey(Supplier)` | `uuid` | No | Proveedor. |
| `ExternalId` | `CharField(80)` | `varchar(80)` | No | `id` de SYSCOM. |
| `IdBrand` | `UUIDField` | `uuid` | Si | Marca interna publicada en `Catalog`. |
| `Name` | `CharField(250)` | `varchar(250)` | No | Nombre limpio. |
| `RawData` | `JSONField` | `jsonb` | No | Respuesta original. |
| `IsActive` | `BooleanField` | `boolean` | No | Activa/inactiva. |
| `LastSeenAt` | `DateTimeField` | `timestamptz` | No | Ultima vez vista. |
| `CreatedAt` | `DateTimeField` | `timestamptz` | No | Auditoria. |

Restriccion recomendada:

```text
Unique(Supplier, ExternalId)
```

## Mapeo campo a campo

| SYSCOM | SupplierBrands | Catalog.Brands |
|---|---|---|
| `id` | `ExternalId` | `ExternalId` si existe. |
| `nombre` | `Name` | `Name`. |
| detalle completo | `RawData` | Descripcion, logo u otros campos si el modelo los soporta. |
| marca publicada | `IdBrand` | `Id`. |

## Reglas importantes

- La descarga de marca no debe crear categorias.
- Si el detalle de marca trae categorias, deben relacionarse solo cuando esas categorias ya existan en `Supplier.SupplierCategories` y hayan sido publicadas.
- Marcas raras como `0`, `1`, `null` o `sinmarca` pueden guardarse en `Supplier`; la visibilidad se decide en `Catalog` o frontend.
- No usar `nombre` como llave unica porque puede repetirse o variar por proveedor.

## Frecuencia recomendada

| Proceso | Frecuencia |
|---|---:|
| Lista de marcas | Diario |
| Detalle de marcas | Semanal |
| Reintento marcas fallidas | Diario limitado |
