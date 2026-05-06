# Estrategia multi-proveedor

## Objetivo

Preparar el sistema para integrar proveedores adicionales a SYSCOM sin redisenar el ERP.

Ejemplos:

```text
SYSCOM
CT Internacional
PCH
DC Mayorista
Autopartes
Restaurantes
Lavanderias
Servicios locales
```

## Regla principal

Todo proveedor entra por `Supplier`.

```text
supplier/{provider}/services
supplier/{provider}/mappers
supplier/{provider}/writers
supplier/{provider}/sync
supplier/management/commands
```

Ningun proveedor debe escribir directo en `Catalog`, `Pricing`, `Inventory` o `Sales` durante la descarga.

## Campos obligatorios para entidades externas

| Campo | Uso |
|---|---|
| `Supplier` | Relaciona el registro con el proveedor de negocio. |
| `Provider` o `Code` | Identifica el adaptador tecnico. |
| `ExternalId` / `ExternalProductId` | ID externo estable. |
| `ExternalSku` | SKU/modelo externo cuando exista. |
| `RawData` | JSON original para auditoria y reproceso. |
| `LastSeenAt` | Permite detectar registros que dejaron de aparecer. |

## No asumir estructura unica

Cada proveedor puede tener:

- Autenticacion diferente.
- Paginacion diferente.
- Categorias planas o jerarquicas.
- Marcas con o sin ID.
- Precios por volumen, moneda o lista.
- Stock total, por sucursal o no disponible.
- Productos con variantes o servicios sin stock.

Por eso los mappers del proveedor deben traducir a entidades comunes de `Supplier`.

## Interface comun sugerida

Cada proveedor debe implementar, segun aplique:

```text
get_token()
get_categories()
get_category_detail()
get_brands()
get_brand_detail()
get_products_page()
get_product_detail()
get_stock()
get_prices()
get_related_products()
get_technical_specs()
map_category()
map_brand()
map_product()
map_stock()
map_prices()
map_technical_specs()
```

## Comandos esperados por proveedor

Para un proveedor llamado `acme`, el patron seria:

```text
sync_acme_token
sync_acme_categories
publish_acme_categories
sync_acme_brands
publish_acme_brands
sync_acme_products
publish_acme_products
sync_acme_stock
sync_acme_prices
publish_acme_prices
sync_acme_related
sync_acme_all
```

## Criterios para agregar un proveedor nuevo

- Debe tener documentados endpoints, credenciales y limites.
- Debe conservar `RawData`.
- Debe tener comandos individuales y un orquestador.
- Debe poder ejecutarse parcialmente sin romper idempotencia.
- Debe registrar errores y conteos.
- Debe publicar hacia modulos internos solo mediante comandos `publish_*`.
- Si el proveedor entrega fichas tecnicas, deben mapearse a atributos estructurados para `ProductCompatibility`.
- Descargar un producto no implica publicarlo en todos los proyectos; la publicacion se controla por `ChannelAssortment`.
