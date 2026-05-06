# Modelo Pricing

## Objetivo

Documentar las entidades base para listas de precios, margenes, impuestos, moneda y precio final.

## Entidades requeridas

- PriceList.
- PriceListAssignment.
- ProductPrice.
- PriceRule.
- TaxRule.
- CurrencyRate.
- PriceCalculationLog.

## Regla

Pricing es dueno de listas de precios, margenes, impuestos y precio final.

Supplier aporta costo proveedor.

Catalog aporta producto interno vendible.

Gateway orquesta y adapta respuestas, pero no calcula precio final ni guarda reglas permanentes de precio.

## MVP

El primer desarrollo debe soportar:

- Lista `PUBLIC`.
- Lista `SPECIAL_BUYER`.
- Costo base desde proveedor o costo manual.
- Margen minimo.
- IVA incluido o separado.
- Vigencia de precio.
- Calculo auditable.

## Snapshot

El precio usado en cotizacion o venta debe congelarse como snapshot en `Quote` o `Sales`.

Pricing puede recalcular precios vigentes, pero no debe modificar precios historicos ya aceptados por cliente.
