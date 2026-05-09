# Pricing API

## Responsabilidad

Administrar listas de precios, margenes, impuestos, moneda y precio final.

Pricing tambien debe soportar reglas comerciales como precio fijo, aumento fijo sobre costo, descuentos por volumen, redondeo comercial y colchones preventivos de riesgo operativo cuando formen parte de la estrategia de precio.

Cuando el costo proveedor venga en USD o dependa de tipo de cambio, Pricing debe usar un snapshot vigente de `CurrencyRate` antes de aplicar reglas comerciales.

## Endpoints minimos

- `POST /pricing/calculate`
- `GET /pricing/product/{productId}`
- `GET /price-lists`
- `POST /price-lists`
- `POST /price-lists/{id}/assignments`
- `GET /products/{product_id}/prices`
- `POST /pricing/rebuild-product-price`
- `POST /pricing/rebuild-price-list`
- `POST /discount-rules`
- `POST /rounding-rules`
- `POST /volume-discount-rules`
- `POST /operational-risk-rules`

## Regla

La lista de precios vive aqui, no en Supplier, Catalog ni Inventory.

El Gateway puede solicitar calculos y adaptar respuestas para frontend, pero no debe contener reglas permanentes de precio.

Las perdidas reales por devoluciones, reenvios, errores operativos o producto danado deben registrarse en Sales/Returns/Profitability. Pricing solo puede usar un colchon estimado si la politica comercial lo define.

Para SYSCOM, el tipo de cambio se obtiene desde `supplier-api` y debe conservarse como historico. Pricing no debe consultar SYSCOM directamente en cada calculo.

## Frontera con Costing

Pricing decide cuanto cobrar.

Costing calcula cuanto cuesta.

Profitability mide si la venta, cotizacion o proyecto realmente dejo utilidad.

Documento de vision futura:

```txt
docs/01_core_erp/erp/22_pricing_costing_future_map.md
```

## Listas iniciales

- `PUBLIC`: precio publico.
- `SPECIAL_BUYER`: comprador especial.
- `INTERNAL_COST`: costo interno, solo usuarios autorizados.

## Documento de implementacion inicial

```txt
docs/02_projects/tecnotelec/tasks/06_pricing_first_plan.md
```

## Response minimo de `GET /pricing/product/{productId}`

```json
{
  "productId": "uuid",
  "baseCost": "750.00",
  "publicPrice": "899.00",
  "ruleApplied": "FIXED_PRICE",
  "currency": "MXN",
  "validFrom": "2026-05-01",
  "validTo": "2026-06-30",
  "isDemo": false,
  "calculationSnapshot": {
    "source": "supplier-api",
    "priceList": "PUBLIC"
  }
}
```

Costos, margen y precio interno solo se devuelven a usuarios autorizados.
