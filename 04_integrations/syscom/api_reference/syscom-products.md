# SYSCOM Products API

## Objetivo

Descargar productos de SYSCOM por marca, categoria o busqueda. La descarga alimenta primero a `Supplier` y la publicacion posterior alimenta a `Catalog` y `Pricing`.

## Destinos por etapa

| Etapa | Entidades |
|---|---|
| Sync | `Supplier.SupplierProducts`, `Supplier.SupplierStock`, `Supplier.SupplierPrices` |
| Publish catalogo | `Catalog.Products`, `Catalog.ProductCategoryLink`, imagenes y recursos |
| Publish precios | `Pricing.ProductPrices` |

## Endpoint principal por marca/categoria

```http
GET https://developers.syscom.mx/api/v1/marcas/{marca}/productos
```

Ejemplo:

```http
GET https://developers.syscom.mx/api/v1/marcas/syscom/productos?categoria=499&pagina=1&stock=1&agrupar=1
```

## Endpoint de busqueda

```http
GET https://developers.syscom.mx/api/v1/productos
```

Ejemplo:

```http
GET https://developers.syscom.mx/api/v1/productos?busqueda=camaras&stock=1&pagina=1
```

## Parametros observados

| Parametro | Tipo | Uso |
|---|---|---|
| `categoria` | string / integer | Filtrar por categoria. |
| `marca` | string | Filtrar por marca. |
| `busqueda` | string | Buscar por palabra. |
| `sucursal` | string | Filtrar por sucursal si aplica. |
| `orden` | string / integer | Ordenamiento. |
| `agrupar` | integer | Agrupar resultados. |
| `pagina` | integer | Paginacion. |
| `stock` | integer | Filtro o inclusion de disponibilidad. |

## Response general

```json
{
  "cantidad": 458,
  "pagina": 1,
  "paginas": 8,
  "productos": [
    {
      "producto_id": "211956",
      "modelo": "THC-B129-PS",
      "total_existencia": 500,
      "titulo": "[ColorVu] Bala TURBOHD 2 Megapixel",
      "marca": "HiLook by HIKVISION",
      "garantia": "3 anos",
      "sat_key": "46171610",
      "sat_description": "Camaras de seguridad",
      "img_portada": "https://...",
      "link_privado": "https://...",
      "categorias": [
        {
          "id": "65776",
          "nombre": "Bala",
          "nivel": 3
        }
      ],
      "precios": {
        "precio_1": "37.50",
        "precio_especial": "28.67",
        "precio_descuento": "16.51",
        "precio_lista": "37.50"
      },
      "existencia": {
        "nuevo": 500,
        "asterisco": {
          "a": 0,
          "b": 0
        },
        "detalle": []
      }
    }
  ]
}
```

## Campos de pagina

| Campo | Tipo recibido | Uso |
|---|---|---|
| `cantidad` | integer | Total de productos del filtro. |
| `pagina` | integer | Pagina actual. |
| `paginas` | integer | Total de paginas. |
| `productos` | array | Lista de productos. |
| `todo` | boolean opcional | Indicador especial de SYSCOM. |

## Campos de producto

| Campo SYSCOM | Tipo recibido | Uso |
|---|---|---|
| `producto_id` | string | ID unico del producto en SYSCOM. |
| `modelo` | string | SKU/modelo del producto. |
| `total_existencia` | integer | Existencia total reportada por proveedor. |
| `titulo` | string | Nombre comercial largo. |
| `marca` | string | Nombre de marca. |
| `garantia` | string | Garantia del producto. |
| `sat_key` | string | Clave SAT. |
| `sat_description` | string | Descripcion SAT. |
| `img_portada` | string URL | Imagen principal. |
| `link_privado` | string URL | Link privado; no mostrar en frontend publico. |
| `categorias` | array | Jerarquia de categorias. |
| `precios` | object / array | Costos o precios de proveedor. |
| `existencia` | object | Stock proveedor. |
| dimensiones | string decimal o `-` | Peso, alto, largo, ancho y peso volumetrico. |
| `unidad_de_medida` | object | Unidad y clave SAT. |
| `imagen_360` | array | Recursos 360. |
| `iconos` | array / object | Iconos comerciales. |

## Mapeo por campo

| Campo SYSCOM | Supplier | Catalog / Pricing |
|---|---|---|
| `producto_id` | `SupplierProduct.ExternalProductId` | `Catalog.Product.ExternalProductId` si existe. |
| `modelo` | `SupplierProduct.ExternalSku` | `Catalog.Product.Model`. |
| producto completo | `SupplierProduct.RawData` | No aplica directo. |
| `titulo` | `RawData.titulo` | `Catalog.Product.Name`. |
| `marca` | `RawData.marca` o `SupplierBrand` | `Catalog.Brand`. |
| `categorias[]` | `RawData.categorias` y `SupplierCategory` | `Catalog.ProductCategoryLink`. |
| `precios` | `SupplierPrice` | Base para `Pricing.ProductPrices`. |
| `existencia` | `SupplierStock` | No es inventario propio. |
| `link_privado` | `RawData.link_privado` | Solo campo protegido si existe. |

## Reglas de limpieza

| Caso SYSCOM | Regla interna |
|---|---|
| `peso = "-"` | Guardar `null`. |
| `alto/largo/ancho = "-"` | Guardar `null`. |
| `precios = []` | No crear precio, registrar warning. |
| `precio = ""` | Ignorar ese precio. |
| `marca` vacia | Guardar en `Supplier`; publicar con regla definida. |
| `categorias` vacia | Producto queda sin categoria hasta tener mapeo. |
| texto demasiado largo | Truncar solo si el campo lo exige y registrar warning. |

## Paginacion

```text
pagina = 1
while pagina <= paginas:
    consumir pagina
    procesar productos
    pagina += 1
```

Si no viene `paginas`, continuar hasta que `productos` venga vacio.

## Dedupe

Se debe evitar procesar el mismo producto varias veces dentro de un full sync.

Llave:

```text
Supplier + ExternalProductId
```

## Frecuencia recomendada

| Proceso | Frecuencia |
|---|---:|
| Productos completos | Diario en horario nocturno |
| Stock proveedor | Cada 1 a 2 horas |
| Precios proveedor | Cada 2 a 4 horas |
| Producto puntual antes de venta | En tiempo real si dato viejo |
| Busqueda por palabra | Bajo demanda |

## Que no hacer

- No usar `total_existencia` como inventario propio.
- No usar `precio_descuento` directamente como precio final al cliente.
- No mostrar `link_privado` al frontend publico.
- No sobrescribir precio final interno con precio proveedor.
- No depender solo de busqueda por texto para catalogo completo.
