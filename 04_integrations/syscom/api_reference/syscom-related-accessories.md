# SYSCOM Related Products and Accessories APIs

## Objetivo

Descargar productos relacionados y accesorios para construir inteligencia comercial: productos equivalentes, complementarios, accesorios requeridos, sustitutos y recomendaciones para kits.

## Endpoints

```http
GET https://developers.syscom.mx/api/v1/productos/{producto_id}/relacionados
GET https://developers.syscom.mx/api/v1/productos/{producto_id}/accesorios
```

## Response esperado

Ambos endpoints devuelven una lista de productos con estructura similar a productos normales.

```json
[
  {
    "producto_id": "69463",
    "modelo": "XB-275",
    "total_existencia": 29,
    "titulo": "Pilona o Bolardo Neumatico",
    "marca": "ACCESSPRO",
    "precios": {
      "precio_1": "100.00"
    },
    "existencia": {
      "nuevo": 29
    }
  }
]
```

## Destinos por etapa

| Etapa | Entidades |
|---|---|
| Sync | `Supplier.SupplierProductRelations`, `Supplier.SupplierProducts`, `Supplier.SupplierStock`, `Supplier.SupplierPrices` si el producto relacionado no existe. |
| Publish | `Catalog.ProductRelations` cuando ambos productos ya tienen `IdProduct`. |

## Modelo sugerido: ProductRelations

| Campo | Tipo Django | Tipo PostgreSQL | Nulo | Descripcion |
|---|---|---|---:|---|
| `Id` | `UUIDField` | `uuid` | No | PK. |
| `Provider` | `CharField(20)` | `varchar(20)` | No | `SYSCOM`. |
| `SourceProduct` | `ForeignKey(Product)` | `uuid` | No | Producto base. |
| `TargetProduct` | `ForeignKey(Product)` | `uuid` | No | Producto relacionado/accesorio. |
| `RelationType` | `CharField(50)` | `varchar(50)` | No | `RELATED`, `ACCESSORY`, `EQUIVALENT`, `REPLACEMENT`, `COMPATIBLE`. |
| `RawData` | `JSONField` | `jsonb` | Si | Objeto recibido. |
| `IsActive` | `BooleanField` | `boolean` | No | Relacion activa. |
| `CreatedAt` | `DateTimeField` | `timestamptz` | No | Auditoria. |
| `UpdatedAt` | `DateTimeField` | `timestamptz` | No | Auditoria. |

Restriccion recomendada:

```text
Unique(Provider, SourceProduct, TargetProduct, RelationType)
```

## Reglas de procesamiento

1. Consultar relacionados/accesorios para productos existentes en `Supplier.SupplierProducts`.
2. Si el producto relacionado no existe en `Supplier`, descargarlo como producto normal cuando aplique.
3. Guardar la relacion externa en `Supplier.SupplierProductRelations`.
4. Publicar productos pendientes hacia `Catalog` antes de crear la relacion interna.
5. Crear la relacion en `Catalog.ProductRelations` solo cuando origen y destino tengan producto interno.
6. Guardar evidencia suficiente para auditoria.
7. No duplicar relaciones.

## RelationType

| Relacion | Uso |
|---|---|
| `ACCESSORY` | Sugerir accesorios al cotizar. |
| `RELATED` | Mostrar alternativas o complementos. |
| `COMPATIBLE` | Armar soluciones completas. |
| `REPLACEMENT` | Recomendar sustituto si no hay stock. |
| `EQUIVALENT` | Comparar productos similares. |

## Frecuencia

| Proceso | Frecuencia |
|---|---:|
| Relacionados/accesorios | Semanal |
| Producto puntual | Bajo demanda antes de cotizar soluciones |
