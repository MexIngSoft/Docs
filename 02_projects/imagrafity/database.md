# Base de datos Imagrafity

## Estado

ACTIVE

## Schema

```text
Imagrafity
```

## Entidades MVP

| Entidad | Tabla | Uso |
|---|---|---|
| `ProductCategory` | `"Imagrafity"."ProductCategories"` | Categorias de productos personalizables. |
| `ErpCatalogProduct` | `"Imagrafity"."ErpCatalogProducts"` | Proyeccion local del Catalog ERP para productos vendibles en web. |
| `ErpProductPrice` | `"Imagrafity"."ErpProductPrices"` | Precio publico vigente proveniente de Pricing ERP. |
| `ErpInventoryStock` | `"Imagrafity"."ErpInventoryStocks"` | Disponibilidad comercial proveniente de Inventory ERP. |
| `CustomizableProduct` | `"Imagrafity"."CustomizableProducts"` | Configuracion de personalizacion enlazada a un producto ERP. |
| `DesignTemplate` | `"Imagrafity"."DesignTemplates"` | Plantillas creativas reutilizables. |
| `ProductPrompt` | `"Imagrafity"."ProductPrompts"` | Prompts editables por producto. |
| `PromptPreview` | `"Imagrafity"."PromptPreviews"` | Vista previa generada desde un prompt sobre el producto. |
| `CustomerDesign` | `"Imagrafity"."CustomerDesigns"` | Diseno guardado por cliente o visitante. |
| `ProductionOrder` | `"Imagrafity"."ProductionOrders"` | Orden inicial de produccion derivada de un diseno. |

## Decisiones

- Se usan UUIDs como identificadores publicables.
- `design_payload`, `preview_payload` y `preview_layers` quedan en JSON para
  soportar evolucion del editor sin migrar en cada ajuste visual.
- Productos, precios e inventario comerciales deben venir de los modulos ERP.
- `CustomizableProduct` solo agrega configuracion de personalizacion, imagenes
  web, etiquetas, badges y reglas de preview.
- `base_price + print_price` queda solo como fallback cuando Pricing ERP no
  tenga precio vigente.
- La API puede responder catalogo fallback si la base de datos aun no tiene
  datos semilla.
- Todo producto debe tener prompts configurables en base de datos, no quemados
  en codigo productivo.
- Ningun prompt debe avanzar a carrito o produccion sin `PromptPreview`.

## Datos demo

El comando local `python manage.py seed_imagrafity_demo` crea 3 categorias y 9
productos demo, con 3 objetos por categoria:

- Ropa y moda: playera, sudadera y gorra.
- Hogar y decoracion: taza, termo y cojin.
- Publicidad y empresa: kit corporativo, llavero QR y mousepad.

El comando no elimina productos antiguos. Los productos demo obsoletos con SKU
`IMG-*` quedan deshabilitados para que el catalogo activo refleje solo los
productos vigentes del ERP.

Tambien crea 3 prompts activos por producto:

- `base_design`
- `creative_variation`
- `production_adjustment`

## Pendientes

- Margenes, costos, impuestos y descuentos.
- Tablas de archivos subidos.
- Historial de produccion y auditoria.
- Relacion con clientes y facturacion.
- Historial avanzado de previews y comparacion visual.
