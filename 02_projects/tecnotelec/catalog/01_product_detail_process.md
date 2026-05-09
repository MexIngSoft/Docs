# Proceso de detalle de producto

## Objetivo

Definir el contrato documental para `GET /products/{slug}` en la Web Tecno Telec.

## Flujo

```text
Web
  -> TecnoTelec Gateway GET /products/{slug}
    -> TecnoTelec API para texto comercial, solucion relacionada y reglas visuales
    -> Catalog API para datos tecnicos
    -> Pricing API para precio visible
    -> Supplier API para origen y SKU externo
    -> Inventory API para disponibilidad visible
```

## Datos consultados

| Fuente | Datos |
|---|---|
| TecnoTelec API | Texto comercial, solucion relacionada, destacado, reglas de visualizacion. |
| Catalog API | Datos tecnicos, descripcion limpia, marca, categoria, subcategoria, imagenes, galeria, imagen 360, peso, dimensiones, garantia, SAT y relacionados. |
| Pricing API | Precio calculado, lista aplicada, vigencia y estado. |
| Supplier API | Proveedor, origen, SKU externo, existencia proveedor. |
| Inventory API | Existencia interna y disponibilidad visible. |

## Response requerido

- `title`
- `subtitle`
- `slug`
- `model`
- `sku`
- `mainImage`
- `gallery`
- `has360Image`
- `placeholderImage`
- `visiblePrice`
- `availability`
- `technicalSheet`
- `cleanDescription`
- `dimensions`
- `weight`
- `warranty`
- `sat`
- `quoteButton`
- `whatsappButton`
- `relatedProducts`
- `productsByCategory`
- `productsByBrand`
- `relatedSolutions`

## Campos que no deben mostrarse

- Costo proveedor.
- Precio descuento interno.
- Link privado proveedor.
- Reglas internas.
- Margen.
- Proveedor si la politica comercial decide ocultarlo al cliente.

## Estados visuales

| Caso | Comportamiento |
|---|---|
| Sin imagen principal | Usar placeholder local. |
| Sin galeria | Mostrar solo imagen principal. |
| Sin imagen 360 | Ocultar bloque 360. |
| Sin precio | Mostrar `Solicitar cotizacion`. |
| Sin stock | Mostrar `Consultar disponibilidad`. |
| Producto `COMPONENT_ONLY` | CTA a solucion compatible. |
| Producto `QUOTE_ONLY` | CTA `Cotizar con asesor`. |

## Pendientes

- Definir estructura final de ficha tecnica.
- Definir si SAT se muestra publicamente o solo internamente.
- Confirmar si proveedor puede verse en detalle publico.
- Confirmar response real de `GET /products/{slug}/gallery`.
