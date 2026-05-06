# ETL stock y precios

## Objetivo

Mantener actualizada la disponibilidad y los costos del proveedor sin reconstruir todo el catalogo.

## Diferencia conceptual

```text
SupplierStock = lo que el proveedor reporta disponible
InventoryStock = lo que la empresa tiene fisicamente
```

```text
SupplierPrice = costo/precio proveedor
ProductPrice = precio final calculado para cliente
```

## Comandos

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_stock
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_prices
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_exchange_rate
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_prices
```

## Entidades afectadas

| Comando | Entidades |
|---|---|
| `sync_syscom_stock` | `Supplier.SupplierStock` |
| `sync_syscom_prices` | `Supplier.SupplierPrices` |
| `sync_syscom_exchange_rate` | `Supplier.SupplierExchangeRates` |
| `publish_syscom_prices` | `Pricing.ProductPrices` |

## Flujo stock-only

```text
1. Obtener productos existentes en Supplier.SupplierProducts.
2. Por cada producto:
   - Consumir detalle o endpoint que devuelva stock actualizado.
   - Extraer existencia.
   - Insertar snapshot en Supplier.SupplierStock.
3. Registrar conteos y errores.
```

## Flujo prices-only

```text
1. Obtener productos existentes en Supplier.SupplierProducts.
2. Consumir detalle o endpoint que devuelva precios actualizados.
3. Extraer precios.
4. Insertar Supplier.SupplierPrices como historico.
5. Si los precios dependen de USD, validar snapshot vigente de tipo de cambio SYSCOM.
6. Ejecutar publish_syscom_prices para recalcular Pricing.ProductPrices.
```

## Campos de stock

| Fuente | Supplier | Tipo |
|---|---|---|
| `total_existencia` | `Quantity` | integer |
| `existencia.nuevo` | `NewQuantity` | integer |
| `existencia.asterisco` | `BranchBreakdown` | jsonb |
| `existencia.detalle` | `Detail` | jsonb |
| fecha actual | `CapturedAt` | timestamptz |

## Campos de precio

| Fuente | Supplier | Tipo |
|---|---|---|
| `precios.precio_1` | `Cost`, `PriceType=precio_1` | decimal(18,6) |
| `precios.precio_especial` | `Cost`, `PriceType=precio_especial` | decimal(18,6) |
| `precios.precio_descuento` | `Cost`, `PriceType=precio_descuento` | decimal(18,6) |
| `precios.precio_lista` | `Cost`, `PriceType=precio_lista` | decimal(18,6) |
| `precios.volumen` | `VolumePrices` | jsonb |

## Frecuencia sugerida

| Proceso | Frecuencia |
|---|---:|
| Stock proveedor | Cada 1 a 2 horas |
| Precios proveedor | Cada 2 a 4 horas |
| Tipo de cambio SYSCOM | Diario o 2 veces al dia |
| Producto puntual antes de venta | En tiempo real si la ultima captura es vieja |

## Vigencia de disponibilidad

Regla recomendada:

```text
Si SupplierStock.CapturedAt tiene mas de 60 minutos,
actualizar producto puntual antes de cerrar venta.
```

Para cotizacion:

```text
Si tiene mas de 2 horas, mostrar sujeto a disponibilidad.
```
