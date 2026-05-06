# Scheduling - Procesos programados

Este documento define cada cuando se debe ejecutar cada proceso de proveedor, cada cuando se considera viejo un dato y como decidir si se inserta, actualiza o se omite.

La regla principal es no correr el full sync como operacion diaria. `sync_syscom_all` es para carga inicial, recuperacion o mantenimiento completo. La operacion normal debe refrescar solo lo volatil.

## 1. Tipos de dato

| Tipo | Ejemplos | Naturaleza | Estrategia |
|---|---|---|---|
| Maestros lentos | Categorias, marcas | Cambian poco | Upsert mensual y publicar solo cambios. |
| Catalogo medio | Producto, imagenes, recursos, relaciones | Cambia a veces | Upsert semanal/quincenal, puntual si se detecta faltante. |
| Operacion volatil | Stock, precios proveedor, tipo de cambio | Cambia mucho | Refrescar varias veces al dia. |
| Derivado interno | Precio final | Depende de costos, dolar, margen, impuesto | Recalcular despues de precio/dolar. |

## 2. Frecuencia por script

| Script | Frecuencia recomendada | Ejecutar cuando | No ejecutar para |
|---|---:|---|---|
| `sync_syscom_token` | Cuando expire o falle autenticacion | Antes de procesos que reciban 401/403 | Cada minuto o como cron fijo agresivo |
| `sync_syscom_categories` | Mensual | Carga inicial, nueva linea de negocio, auditoria mensual | Refresco diario normal |
| `publish_syscom_categories` | Despues de categorias | Publicar nuevas categorias o cambios | Si no hubo cambios en Supplier |
| `sync_syscom_brands` | Mensual | Carga inicial, auditoria mensual, nuevas marcas | Refresco diario normal |
| `publish_syscom_brands` | Despues de marcas | Publicar nuevas marcas o cambios | Si no hubo cambios en Supplier |
| `sync_syscom_products` | Semanal o quincenal | Carga inicial, refresh de metadata, productos faltantes | Refrescar stock/precio diario |
| `publish_syscom_products` | Despues de productos | Publicar productos nuevos o metadata cambiada | Si solo cambio stock/precio |
| `sync_syscom_stock` | Cada 1-2 horas | Disponibilidad operativa | Carga inicial sin productos existentes |
| `sync_syscom_prices` | Cada 2-4 horas | Cambios de costo/precio proveedor | Carga inicial sin productos existentes |
| `publish_syscom_prices` | Despues de precios o dolar | Recalcular precio final | Si no cambio costo, dolar o reglas |
| `sync_syscom_related` | Semanal o mensual | Recomendaciones, accesorios, sustitutos | Flujo diario de venta |
| `publish_syscom_related` | Despues de relacionados | Publicar relaciones nuevas | Si no hubo cambios |
| `sync_syscom_all` | Manual, bootstrap, recuperacion | Ambiente nuevo o reconstruccion controlada | Cron diario |
| `sync_syscom_fast` | Cada 2-4 horas | Refresh operativo de stock, precios y pricing | Carga inicial o metadata de catalogo |

## 3. Frescura por entidad

| Entidad | Campo de frescura | Viejo si supera | Accion |
|---|---|---:|---|
| `Supplier.SupplierCategories` | `LastSeenAt` | 30 dias | `sync_syscom_categories` y `publish_syscom_categories` |
| `Supplier.SupplierBrands` | `LastSeenAt` | 30 dias | `sync_syscom_brands` y `publish_syscom_brands` |
| `Supplier.SupplierProducts` | `UpdatedAt` | 7-15 dias | `sync_syscom_products` y `publish_syscom_products` por lotes |
| `Supplier.SupplierStock` | `CapturedAt` | 1-2 horas | `sync_syscom_stock` |
| `Supplier.SupplierPrices` | `CapturedAt` | 2-4 horas | `sync_syscom_prices` y `publish_syscom_prices` |
| Tipo de cambio | `CapturedAt` futuro | 12-24 horas | `sync_exchange_rate` futuro y `publish_syscom_prices` |
| `Supplier.SupplierProductRelations` | `LastSeenAt` | 7-30 dias | `sync_syscom_related` y `publish_syscom_related` |
| `Pricing.ProductPrices` | `CreatedAt`/`ValidFrom` | Cuando cambie costo, dolar o regla | `publish_syscom_prices` |

## 4. Reglas para detectar si algo esta viejo

Para maestros con `LastSeenAt`, un dato esta viejo si:

```txt
now - LastSeenAt > umbral_de_entidad
```

Para snapshots historicos como stock y precios, se usa el ultimo registro por producto:

```txt
max(CapturedAt) por SupplierProduct < now - umbral_de_entidad
```

Para productos publicados en `Catalog`, se usa el vinculo:

```txt
SupplierProduct.IdProduct is null
    => producto existe en Supplier pero no esta publicado

SupplierProduct.UpdatedAt > CatalogProduct.UpdatedAt
    => Supplier tiene informacion mas reciente que Catalog
```

Para precio final:

```txt
SupplierPrice.Id no existe en Pricing.ProductPrices.IdSupplierPrice
    => falta publicar ese costo proveedor

SupplierPrice.CapturedAt > ultimo Pricing.ProductPrices.CreatedAt del producto
    => recalcular precio final

TipoCambio.CapturedAt > ultimo Pricing.ProductPrices.CreatedAt
    => recalcular precio final para productos afectados por moneda
```

## 5. Reglas de insert, update y omit

| Caso | Regla | Accion |
|---|---|---|
| Categoria/marca no existe | `Supplier + ExternalId` no encontrado | Insertar en Supplier |
| Categoria/marca existe | Mismo `Supplier + ExternalId` | Actualizar campos y `LastSeenAt` |
| Categoria/marca no aparece en full mensual | `LastSeenAt` anterior al inicio del sync | Marcar inactiva despues de ventana de gracia |
| Producto no existe | `Supplier + ExternalProductId` no encontrado | Insertar en Supplier |
| Producto existe y cambio | Hash de `RawData` distinto o campos clave distintos | Actualizar `RawData`, `ExternalSku`, `UpdatedAt` |
| Producto existe igual | Hash igual | Omitir escritura pesada |
| Stock igual al ultimo | Mismo producto, cantidad y detalle | Omitir o insertar solo snapshot de auditoria segun politica |
| Stock diferente | Cambio en cantidad o detalle | Insertar nuevo snapshot |
| Precio igual al ultimo | Mismo producto, `PriceType`, costo, moneda y volumen | Omitir |
| Precio diferente | Cambio en costo, moneda o volumen | Insertar nuevo `SupplierPrice` y publicar pricing |
| Relacion no existe | `Supplier + source + target + type` no encontrado | Insertar |
| Relacion existe | Misma llave | Actualizar `RawData`, `LastSeenAt`, `IsActive` |

## 6. Optimizaciones recomendadas

Estas optimizaciones deben implementarse antes de correr volumen completo frecuente:

1. Agregar hash de payload por entidad.
   - `SupplierProduct.PayloadHash`
   - `SupplierCategory.PayloadHash`
   - `SupplierBrand.PayloadHash`
   - `SupplierProductRelation.PayloadHash`

2. Evitar snapshots duplicados.
   - No crear `SupplierStock` si el ultimo snapshot del producto tiene misma cantidad y mismo detalle.
   - No crear `SupplierPrice` si el ultimo precio por producto/tipo tiene mismo costo, moneda y volumen.
   - Implementado en `SyscomProductWriter` para stock y precios proveedor.
   - La insercion de `SupplierStock` y `SupplierPrice` usa `bulk_create` por bloques cuando el flujo acumula lotes.

3. Separar orquestadores.
   - `sync_syscom_bootstrap`: carga completa inicial.
   - `sync_syscom_catalog_refresh`: categorias, marcas, productos y relacionados segun frescura.
   - `sync_syscom_fast`: stock, precios, dolar y pricing.

4. Implementar tipo de cambio.
   - Consumir `GET /api/v1/tipocambio`.
   - Guardarlo como snapshot historico.
   - Recalcular pricing solo cuando cambie.

5. Procesar solo candidatos viejos.
   - Stock: productos cuyo ultimo `SupplierStock.CapturedAt` este vencido.
   - Precios: productos cuyo ultimo `SupplierPrice.CapturedAt` este vencido.
   - Productos: productos con `UpdatedAt` vencido o sin `IdProduct`.

6. Publicar solo cambios.
   - `publish_syscom_products` debe publicar productos sin `IdProduct` o con hash distinto al ultimo publicado.
   - `publish_syscom_prices` debe publicar solo `SupplierPrice` sin `Pricing.ProductPrices.IdSupplierPrice`.
   - Implementado en `publish_syscom_prices`: un `SupplierPrice` ya publicado no se vuelve a publicar aunque su precio final historico este inactivo.
   - `sync_syscom_products --publish-batch-size N` publica productos y precios por lote durante la descarga.

7. Paralelizar con limite.
   - Usar concurrencia controlada para llamadas HTTP.
   - Mantener rate limit y backoff por proveedor.
   - Registrar fallos por producto sin detener el lote.

## 7. Ventanas sugeridas

```txt
Mensual 01 01:00 - sync_syscom_categories
Mensual 01 01:30 - publish_syscom_categories
Mensual 01 02:00 - sync_syscom_brands
Mensual 01 02:30 - publish_syscom_brands

Domingo 02:00 - sync_syscom_products
Domingo 04:00 - publish_syscom_products
Domingo 05:00 - sync_syscom_related
Domingo 05:30 - publish_syscom_related

Cada 1-2h - sync_syscom_stock
Cada 2-4h - sync_syscom_prices
Despues de precios - publish_syscom_prices
Cada 2-4h - sync_syscom_fast como alternativa operativa compacta
Diario 07:00 - sync_exchange_rate futuro
Despues de dolar - publish_syscom_prices si cambio el tipo de cambio
```

## 8. Antes de cotizar o vender

Antes de mostrar disponibilidad:

```txt
Si ultimo SupplierStock del producto > 2 horas:
    mostrar "sujeto a disponibilidad"
```

Antes de cerrar venta:

```txt
Si ultimo SupplierStock del producto > 60 minutos:
    actualizar producto puntual

Si ultimo SupplierPrice del producto > 4 horas:
    actualizar precio puntual y recalcular pricing
```

## 9. Herramientas posibles

| Herramienta | Uso |
|---|---|
| Cron | Simple y suficiente al inicio. |
| Celery Beat | Mejor si ya se usa Celery. |
| Django management commands | Implementacion base. |
| n8n | Orquestacion visual externa. |
| Airflow/Prefect | Mas adelante si el ETL crece. |
