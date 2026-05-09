# Proceso de catalogo publico Tecno Telec

## Objetivo

Definir como la Web Tecno Telec muestra productos sin consumir APIs internas y sin convertir TecnoTelec API o Gateway en base maestra.

## Flujo

```text
Web Tecno Telec
  -> GET /products en TecnoTelec Gateway
  -> TecnoTelec API para configuracion propia
  -> Catalog API para producto base
  -> Pricing API para precio visible
  -> Supplier API para origen y disponibilidad proveedor
  -> Inventory API para stock visible
  -> Gateway arma respuesta de frontend
```

## Responsabilidades

| API | Responsabilidad |
|---|---|
| TecnoTelec API | Destacados, reglas de publicacion, orden visual, textos, banners y soluciones relacionadas. |
| Catalog API | Producto, nombre, modelo, marca, categoria, subcategoria, descripcion, imagenes, ficha tecnica, dimensiones, peso, garantia y SAT. |
| Pricing API | Precio publico/especial, regla aplicada, vigencia y snapshot cuando aplique. |
| Supplier API | Proveedor origen, SKU externo, identificador externo y disponibilidad proveedor. |
| Inventory API | Stock visible, disponibilidad interna y estado de inventario. |
| Gateway | Une, limpia, oculta internos, pagina, filtra, ordena, aplica placeholder y devuelve JSON listo. |
| Web | Muestra productos, filtros, detalle y placeholders. No calcula precios. |

## Response Gateway

- `id`
- `slug`
- `name`
- `model`
- `sku`
- `externalSku`
- `brand`
- `category`
- `subcategory`
- `shortDescription`
- `imageUrl`
- `placeholderImage`
- `gallery`
- `has360Image`
- `price`
- `priceLabel`
- `stockStatus`
- `quoteOnly`
- `sellable`
- `supplierOrigin`
- `warranty`
- `satKey`
- `satDescription`
- `weight`
- `dimensions`
- `isPublished`
- `url`

## Reglas de presentacion

1. Si no hay imagen, usar placeholder.
2. Si no hay precio, mostrar `Solicitar cotizacion`.
3. Si no hay stock, mostrar `Consultar disponibilidad`.
4. Si el producto es componente, no mostrar como producto final.
5. Si el producto requiere asesor, marcar `quoteOnly`.
6. Si el producto esta bloqueado en JobCron, no mostrar.
7. Si no hay galeria, usar solo imagen principal.
8. Si no hay imagen 360, no mostrar seccion 360.
9. Si no hay ficha tecnica, ocultar bloque tecnico.
10. Si no hay dimensiones, no romper la vista.

## Estados

| Estado | Uso |
|---|---|
| `DRAFT` | No visible. |
| `ACTIVE` | Publicable. |
| `HIDDEN` | Oculto por decision comercial. |
| `BLOCKED` | Nunca visible. |
| `QUOTE_ONLY` | Requiere cotizacion. |
| `COMPONENT_ONLY` | Solo dentro de solucion o detalle relacionado. |
| `SELLABLE` | Puede venderse o agregarse a cotizacion. |
| `DISCONTINUED` | No vendible; puede conservar ficha historica si se decide. |
| `PENDING_REVIEW` | Requiere revision administrativa. |
| `NO_IMAGE` | Usar placeholder. |
| `NO_PRICE` | Mostrar solicitar cotizacion. |
| `NO_STOCK` | Consultar disponibilidad. |

## Pendientes

- Confirmar endpoint Inventory API real.
- Confirmar politica de mostrar proveedor.
- Crear assets placeholder locales.
- Definir TTL de cache.
