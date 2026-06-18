# Endpoints publicos Gateway para productos

## Regla

La Web Tecno Telec consume solo `API.PY.DJANGO.Gateway`. Estos endpoints son
contratos publicos del Gateway General; las APIs internas se consultan detras
del Gateway.

## Endpoints

| Endpoint | Objetivo | Origen principal | APIs consultadas | Estado |
|---|---|---|---|---|
| `GET /products` | Listar catalogo visible. | Gateway | TecnoTelec, Catalog, Pricing, Supplier, Inventory | DOCUMENTADO |
| `GET /products/{slug}` | Detalle de producto. | Gateway | TecnoTelec, Catalog, Pricing, Supplier, Inventory | DOCUMENTADO |
| `GET /products/search` | Busqueda. | Gateway | Catalog, Pricing, TecnoTelec | DOCUMENTADO |
| `GET /products/category/{categorySlug}` | Productos por categoria. | Gateway | Catalog, Pricing, Inventory | DOCUMENTADO |
| `GET /products/brand/{brandSlug}` | Productos por marca. | Gateway | Catalog, Pricing, Inventory | DOCUMENTADO |
| `GET /categories` | Categorias publicables. | Gateway | Catalog, TecnoTelec | DOCUMENTADO |
| `GET /categories/{slug}` | Detalle de categoria. | Gateway | Catalog, TecnoTelec | DOCUMENTADO |
| `GET /brands` | Marcas visibles. | Gateway | Catalog, TecnoTelec | DOCUMENTADO |
| `GET /brands/{slug}` | Detalle de marca. | Gateway | Catalog, TecnoTelec | DOCUMENTADO |
| `GET /products/{slug}/related` | Relacionados. | Gateway | Catalog, TecnoTelec | DOCUMENTADO |
| `GET /products/{slug}/gallery` | Galeria. | Gateway | Catalog | DOCUMENTADO |
| `GET /products/{slug}/technical-sheet` | Ficha tecnica. | Gateway | Catalog | DOCUMENTADO |
| `GET /products/{slug}/availability` | Disponibilidad visible. | Gateway | Inventory, Supplier | DOCUMENTADO |
| `GET /products/{slug}/price` | Precio visible. | Gateway | Pricing | DOCUMENTADO |
| `GET /products/featured` | Destacados. | Gateway | TecnoTelec, Catalog, Pricing | DOCUMENTADO |
| `GET /products/recommended` | Recomendados. | Gateway | TecnoTelec, Catalog, Pricing | DOCUMENTADO |
| `GET /products/filters` | Filtros disponibles. | Gateway | Catalog, Pricing, Inventory | DOCUMENTADO |
| `GET /products/by-solution/{solutionSlug}` | Productos por solucion. | Gateway | TecnoTelec, Catalog, Pricing | DOCUMENTADO |

## Parametros minimos de `GET /products`

| Parametro | Tipo | Obligatorio | Descripcion |
|---|---|---:|---|
| `page` | integer | No | Pagina, default `1`. |
| `pageSize` | integer | No | Tamano, default `24`, maximo pendiente de definir. |
| `search` | string | No | Texto de busqueda. |
| `category` | string | No | Slug de categoria. |
| `subcategory` | string | No | Slug de subcategoria. |
| `brand` | string | No | Slug de marca. |
| `minPrice` | decimal | No | Precio minimo visible. |
| `maxPrice` | decimal | No | Precio maximo visible. |
| `stockStatus` | string | No | Estado visible de disponibilidad. |
| `quoteOnly` | boolean | No | Solo productos de cotizacion. |
| `sortBy` | string | No | Ordenamiento permitido. |
| `sortDirection` | string | No | `asc` o `desc` cuando aplique. |

## Ordenamientos permitidos

- `name_asc`
- `name_desc`
- `price_asc`
- `price_desc`
- `newest`
- `relevance`
- `stock`
- `brand`

## Filtros permitidos

- Categoria.
- Subcategoria.
- Marca.
- Rango de precio.
- Disponibilidad.
- Proveedor, solo si la politica lo permite.
- Solucion.
- `quoteOnly`.
- `sellable`.

## Request ejemplo

```http
GET /products?page=1&pageSize=24&category=redes-wifi&sortBy=relevance
```

## Response ejemplo

```json
{
  "data": [
    {
      "id": "uuid",
      "slug": "kit-wifi-empresarial-poe",
      "name": "Kit WiFi empresarial PoE",
      "model": "TT-WIFI-BASE",
      "brand": "Marca pendiente",
      "category": "Redes y WiFi",
      "shortDescription": "Base para oficinas y comercios.",
      "imageUrl": "/placeholders/product.png",
      "priceLabel": "Solicitar cotizacion",
      "stockStatus": "Consultar disponibilidad",
      "quoteOnly": true,
      "sellable": false,
      "url": "/catalogo/kit-wifi-empresarial-poe"
    }
  ],
  "pagination": {
    "page": 1,
    "pageSize": 24,
    "total": 1
  },
  "filters": {
    "categories": [],
    "brands": [],
    "stockStatuses": []
  }
}
```

## Validaciones

- `page` y `pageSize` deben tener limites.
- Filtros desconocidos se ignoran o devuelven error controlado segun politica.
- Productos `BLOCKED` nunca se devuelven.
- Productos `COMPONENT_ONLY` solo aparecen dentro de soluciones o detalle relacionado.

## Manejo de errores

| Caso | Respuesta Gateway |
|---|---|
| Catalog API no responde | `503` con mensaje recuperable y estado vacio seguro. |
| Pricing API no responde | Producto sin precio visible y `priceStatus=NO_PRICE` si Catalog responde. |
| Inventory API no responde | `stockStatus=Consultar disponibilidad`. |
| Imagen faltante | Placeholder local. |

## Seguridad

Catalogo publico puede ser anonimo. Precios especiales, costos internos, margen y reglas internas requieren usuario y permisos. Gateway debe ocultar campos internos.

## Cache

Pendiente definir TTL por endpoint. Recomendacion inicial: cache corto para catalogo y sin cache para disponibilidad/precio si no hay politica de snapshots.

## Pruebas basicas

- Listar productos sin filtros.
- Listar productos filtrando categoria.
- Buscar producto inexistente.
- Producto sin imagen usa placeholder.
- Producto sin precio no rompe la vista.
- Producto bloqueado no aparece.

## Pendientes

- Definir response final de errores avanzados.
- Definir TTL de cache.
- Definir si proveedor se muestra al cliente.
- Sembrar datos reales en Core APIs para operacion completa.
