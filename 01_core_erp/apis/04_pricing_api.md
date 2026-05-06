# Pricing API

## Responsabilidad

Administrar listas de precios, margenes, impuestos, moneda y precio final.

## Endpoints minimos

- `POST /pricing/calculate`
- `GET /price-lists`
- `POST /price-lists`
- `GET /products/{product_id}/prices`
- `POST /discount-rules`

## Regla

La lista de precios vive aqui, no en Supplier, Catalog ni Inventory.
