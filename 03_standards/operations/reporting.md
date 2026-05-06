# Reporting

> Ruta actual: `/docs/03_standards/operations/reporting.md`

## 1. Reportes recomendados

| Reporte | Fuente |
|---|---|
| Productos más cotizados | Sales.QuoteItems |
| Productos sin stock | SupplierStock + Inventory.Stock |
| Cambios de precio proveedor | SupplierPrices |
| Margen por categoría | Pricing.ProductPrices + Catalog.Categories |
| Productos con errores de sync | SupplierSyncLog + error logs |
| Proveedor con mejor disponibilidad | SupplierStock por proveedor |
| Productos bajo pedido | Sales + SupplierStock |
| Productos propios en oficina | Inventory.Stock |

## 2. Métricas clave

```txt
conversion_rate = ventas / cotizaciones
avg_margin = promedio margen por categoría
stock_age = now - SupplierStock.CapturedAt
price_age = now - SupplierPrice.CapturedAt
```

## 3. Alertas

- Stock proveedor viejo.
- Precio proveedor viejo.
- Producto visible sin precio.
- Producto visible sin categoría.
- Producto cotizado sin disponibilidad.
- Error repetido en sync.
