# SYSCOM Product Detail API

## Objetivo

Obtener el detalle completo de un producto cuando la lista paginada no traiga toda la informacion necesaria.

El detalle enriquece primero `Supplier.SupplierProducts.RawData`. Despues, `publish_syscom_products` decide que informacion se publica hacia `Catalog`.

## Endpoint sugerido

```http
GET https://developers.syscom.mx/api/v1/productos/{producto_id}
```

Este endpoint debe validarse contra respuestas reales de SYSCOM en desarrollo.

## Request

Headers:

```http
Authorization: Bearer {{access_token}}
Accept: application/json
```

Path param:

| Parametro | Tipo | Descripcion |
|---|---|---|
| `producto_id` | string / integer | ID de producto SYSCOM. |

## Response parcial esperado

```json
{
  "producto_id": "163327",
  "modelo": "B8-TURBO-G2W",
  "titulo": "Bala TURBOHD",
  "imagenes": [
    {
      "imagen": "https://.../B8TURBOG2W-p.PNG",
      "orden": "0"
    }
  ],
  "recursos": [
    {
      "recurso": "Especificaciones Tecnicas B8-TURBO-G2W",
      "path": "https://.../Especificaciones.pdf"
    }
  ]
}
```

## Destinos por etapa

| Informacion | Sync | Publish |
|---|---|---|
| Producto completo | `Supplier.SupplierProducts.RawData` | No aplica directo. |
| Datos base | `RawData` | `Catalog.Products`. |
| Imagenes | `RawData.imagenes` | `Catalog.ProductImages`. |
| Recursos | `RawData.recursos` | `Catalog.ProductResources`. |
| Precios / stock | `SupplierPrices`, `SupplierStock` si vienen | `Pricing` o futura regla de inventario. |

## Reglas

- No descargar PDFs al inicio; guardar URL.
- Si se requiere indexar fichas tecnicas, crear proceso separado.
- No bloquear el producto si falla el enriquecimiento de recursos.
- Guardar imagenes y recursos en `Catalog` solo durante publish.
- Conservar la respuesta original en `RawData` para reproceso.

## Frecuencia

| Caso | Frecuencia |
|---|---:|
| Detalle durante full sync | Diario |
| Detalle bajo demanda | Cuando se necesite refrescar producto |
| Recursos tecnicos | Semanal o bajo demanda |
