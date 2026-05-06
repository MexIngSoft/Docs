# Ejecutables SYSCOM

Los comandos se ejecutan desde el contenedor API usando el proyecto `supplier`.

## Comandos disponibles

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_token
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_categories
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_categories
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_brands
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_brands
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_products
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_products
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_stock
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_prices
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_prices
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_related
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_related
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_all
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_fast
```

## Orden recomendado para carga inicial

```txt
1. sync_syscom_token
2. sync_syscom_categories
3. publish_syscom_categories
4. sync_syscom_brands
5. publish_syscom_brands
6. sync_syscom_products
7. publish_syscom_products
8. publish_syscom_prices
9. sync_syscom_related
10. publish_syscom_related
```

`sync_syscom_all` ejecuta el flujo principal en ese orden. Debe tratarse como un comando de bootstrap, recuperacion o mantenimiento completo, no como cron diario.

`sync_syscom_stock` y `sync_syscom_prices` existen para refrescos parciales de productos ya descargados; no sustituyen el primer `sync_syscom_products`, porque el producto es la base para relacionar stock y precios.

Puede limitar la prueba:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_all --limit-categories 2 --limit-products 20
```

## Politica de ejecucion

La frecuencia oficial vive en `docs/03_standards/operations/scheduling.md`. Resumen operativo:

| Grupo | Frecuencia | Comandos |
|---|---:|---|
| Bootstrap | Manual | `sync_syscom_all` |
| Catalogos lentos | Mensual | `sync_syscom_categories`, `publish_syscom_categories`, `sync_syscom_brands`, `publish_syscom_brands` |
| Productos metadata | Semanal o quincenal | `sync_syscom_products`, `publish_syscom_products` |
| Relacionados/accesorios | Semanal o mensual | `sync_syscom_related`, `publish_syscom_related` |
| Stock | Cada 1-2 horas | `sync_syscom_stock` |
| Precios proveedor | Cada 2-4 horas | `sync_syscom_prices`, `publish_syscom_prices` |
| Refresh rapido | Cada 2-4 horas | `sync_syscom_fast` |
| Tipo de cambio | Diario o 2 veces al dia | Pendiente `sync_syscom_exchange_rate` |

## Flujo diario recomendado

Para operacion normal no correr todo. Ejecutar solo datos volatiles:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_fast
```

Para prueba limitada:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_fast --limit-products 20
```

Opciones utiles:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_fast --stock-max-age-minutes 120 --price-max-age-minutes 240
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_fast --bulk-batch-size 1000
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_fast --force
```

`--force` ignora la frescura y revisa todos los productos existentes. Usarlo para auditoria o pruebas controladas, no como cron normal.

`--bulk-batch-size` controla cuantos snapshots se insertan por bloque. Para PostgreSQL, `500` a `1000` suele ser un punto inicial razonable.

## Flujo semanal recomendado

Para refrescar metadata de productos:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_products
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_products
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_prices
```

## Flujo mensual recomendado

Para catalogos maestros:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_categories
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_categories
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_brands
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_brands
```

## Ejecuciones parciales

Actualizar solo categorias:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_categories
```

Actualizar solo marcas:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_brands
```

Descargar productos hacia Supplier con stock y precios de proveedor:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_products
```

Descargar productos y publicar por lotes durante el proceso:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_products --publish-batch-size 500
```

Con publicacion por lotes, `Catalog.Products` y `Pricing.ProductPrices` empiezan a recibir datos durante la descarga, sin esperar a que terminen todas las categorias.

Publicar productos descargados hacia Catalog:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_products
```

Actualizar solo stock de productos ya existentes:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_stock
```

Actualizar solo precios de productos ya existentes:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_prices
```

Publicar precios descargados hacia Pricing:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_prices
```

Actualizar solo relacionados y accesorios:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_related
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_related
```

## Flujo de datos actual

La descarga se centraliza en el proyecto `supplier`. SYSCOM es solo un proveedor; el modelo esta preparado para agregar otros proveedores de computacion, mecanica, comida, lavanderia u otros giros.

```txt
Proveedor externo
  -> Supplier service/sync
  -> Supplier.SupplierCategories
  -> Supplier.SupplierBrands
  -> Supplier.SupplierProducts
  -> Supplier.SupplierStock
  -> Supplier.SupplierPrices
  -> Supplier.SupplierProductRelations
  -> publish_syscom_*
  -> Catalog.Categories
  -> Catalog.Brands
  -> Catalog.Products
  -> Catalog.ProductCategoryLink
  -> Catalog.ProductImages
  -> Catalog.ProductResources
  -> Catalog.ProductRelations
  -> Pricing.ProductPrices
```

## Tablas de proveedor

```txt
Supplier.SupplierCategories
  Categorias propias del proveedor. Se vinculan opcionalmente con Catalog.Categories.

Supplier.SupplierBrands
  Marcas propias del proveedor. Se vinculan opcionalmente con Catalog.Brands.

Supplier.SupplierProducts
  Productos propios del proveedor. Guardan RawData y se vinculan opcionalmente con Catalog.Products.

Supplier.SupplierStock
  Historico de disponibilidad del proveedor.

Supplier.SupplierPrices
  Historico de precios/costos del proveedor.

Supplier.SupplierProductRelations
  Relaciones y accesorios como los reporta el proveedor. Se publican despues hacia Catalog.ProductRelations.
```

## Publicacion hacia proyectos

```txt
Supplier
  -> Catalog.Categories
  -> Catalog.Brands
  -> Catalog.Products
  -> Catalog.ProductCategoryLink
  -> Catalog.ProductImages
  -> Catalog.ProductResources
  -> Catalog.ProductRelations
  -> Pricing.ProductPrices
```

Los comandos `sync_*` descargan a `Supplier`. Los comandos `publish_*` transforman y publican hacia los modulos internos. Esta separacion es obligatoria para mantener el ERP reutilizable con otros proveedores.

## APIs SYSCOM cubiertas

Documentadas en `docs/04_integrations/syscom/api_reference/syscom-api-app.md` y archivos separados:

```txt
POST /oauth/token
GET  /api/v1/categorias
GET  /api/v1/categorias/{id}
GET  /api/v1/marcas
GET  /api/v1/marcas/{id}
GET  /api/v1/productos
GET  /api/v1/productos/{producto_id}
GET  /api/v1/productos/{producto_id}/relacionados
GET  /api/v1/productos/{producto_id}/accesorios
GET  /api/v1/tipocambio
```

Pendiente de implementar si el proyecto lo requiere:

```txt
sync_syscom_exchange_rate
```

Ese endpoint conviene usarlo antes de recalcular `Pricing.ProductPrices` cuando los costos vengan en USD o dependan de tipo de cambio.

Documento especifico:

```txt
docs/04_integrations/syscom/api_reference/syscom-exchange-rate.md
```
