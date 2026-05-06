# Pricing API

## Responsabilidad

Administrar listas de precios, margenes, impuestos, moneda y precio final.

## Endpoints minimos

- `POST /pricing/calculate`
- `GET /price-lists`
- `POST /price-lists`
- `POST /price-lists/{id}/assignments`
- `GET /products/{product_id}/prices`
- `POST /pricing/rebuild-product-price`
- `POST /pricing/rebuild-price-list`
- `POST /discount-rules`

## Regla

La lista de precios vive aqui, no en Supplier, Catalog ni Inventory.

El Gateway puede solicitar calculos y adaptar respuestas para frontend, pero no debe contener reglas permanentes de precio.

## Listas iniciales

- `PUBLIC`: precio publico.
- `SPECIAL_BUYER`: comprador especial.
- `INTERNAL_COST`: costo interno, solo usuarios autorizados.

## Documento de implementacion inicial

```txt
docs/02_projects/tecnotelec/tasks/06_pricing_first_plan.md
```
