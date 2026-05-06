# SYSCOM Categories API

## Objetivo

Descargar la estructura de categorias de SYSCOM para guardarla primero en `Supplier.SupplierCategories` y publicarla despues hacia `Catalog.Categories`.

Las categorias son necesarias porque los productos de SYSCOM vienen asociados a una jerarquia:

```text
Nivel 1 -> Categoria raiz
Nivel 2 -> Subcategoria
Nivel 3 -> Categoria hoja / familia final
```

## Endpoints

```http
GET https://developers.syscom.mx/api/v1/categorias
GET https://developers.syscom.mx/api/v1/categorias/{id}
```

Headers:

```http
Authorization: Bearer {{access_token}}
Accept: application/json
```

## Response raiz esperado

```json
[
  {
    "id": "22",
    "nombre": "Videovigilancia",
    "nivel": 1
  }
]
```

## Response por ID esperado

```json
{
  "id": "65811",
  "nombre": "Cableado Estructurado",
  "nivel": "1",
  "origen": [],
  "subcategorias": [
    {
      "id": "65812",
      "nombre": "Cable",
      "nivel": "2"
    }
  ]
}
```

## Campos recibidos

| Campo SYSCOM | Tipo recibido | Destino inicial | Uso |
|---|---|---|---|
| `id` | string / integer | `SupplierCategory.ExternalId` | Identificador externo unico por proveedor. |
| `nombre` | string | `SupplierCategory.Name` | Nombre de la categoria. |
| `nivel` | string / integer | `SupplierCategory.Level` | Nivel jerarquico. |
| `origen` | array | `SupplierCategory.RawData` | Camino/origen si viene. |
| `subcategorias` | array | Registros hijos | Se transforma en mas `SupplierCategories`. |

## Destinos

| Etapa | Proyecto | Tabla |
|---|---|---|
| Sync | `API.PY.DJANGO.Supplier` | `"Supplier"."SupplierCategories"` |
| Publish | `API.PY.DJANGO.Catalog` | `"Catalog"."Categories"` |

## Modelo de entrada: SupplierCategory

| Campo | Tipo Django | Tipo PostgreSQL | Nulo | Descripcion |
|---|---|---|---:|---|
| `Id` | `UUIDField` | `uuid` | No | PK interna. |
| `Supplier` | `ForeignKey(Supplier)` | `uuid` | No | Proveedor. |
| `ExternalId` | `CharField(80)` | `varchar(80)` | No | `id` de SYSCOM. |
| `ParentExternalId` | `CharField(80)` | `varchar(80)` | Si | Categoria padre externa. |
| `IdCategory` | `UUIDField` | `uuid` | Si | Categoria interna publicada en `Catalog`. |
| `Name` | `CharField(250)` | `varchar(250)` | No | Nombre limpio. |
| `Level` | `IntegerField` | `integer` | No | Nivel jerarquico. |
| `RawData` | `JSONField` | `jsonb` | No | Respuesta original. |
| `IsActive` | `BooleanField` | `boolean` | No | Activa/inactiva. |
| `LastSeenAt` | `DateTimeField` | `timestamptz` | No | Ultima vez vista. |
| `CreatedAt` | `DateTimeField` | `timestamptz` | No | Auditoria. |

Restriccion recomendada:

```text
Unique(Supplier, ExternalId)
```

## Mapeo campo a campo

| SYSCOM | SupplierCategories | Catalog.Categories |
|---|---|---|
| `id` | `ExternalId` | `ExternalId` si existe. |
| `nombre` | `Name` | `Name`. |
| `nivel` | `Level` | `Level` si existe. |
| padre actual | `ParentExternalId` | `Parent`. |
| todo el objeto | `RawData` | No aplica directo. |

## Regla de sincronizacion

1. Descargar categorias raiz.
2. Guardar cada raiz en `Supplier.SupplierCategories` con `ParentExternalId = null`.
3. Por cada categoria guardada, consultar `/categorias/{id}`.
4. Si trae `subcategorias`, guardar cada hija con `ParentExternalId = id padre`.
5. Repetir recursivamente hasta hojas.
6. Ejecutar `publish_syscom_categories` para crear/actualizar `Catalog.Categories`.

## Categoria hoja

Una categoria hoja es aquella que no tiene `subcategorias`.

Estas categorias son utiles para descargar productos, porque normalmente los productos se consultan por categorias finales.

## Datos que no deben asumirse

- No usar el nombre de categoria como llave unica.
- No confiar en que `nivel` siempre venga como numero.
- No asumir que todas las categorias tienen subcategorias.
- No asumir que el arbol solo tiene tres niveles.
