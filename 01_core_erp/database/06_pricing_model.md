# Modelo Pricing

## Objetivo

Documentar las entidades base para listas de precios, margenes, impuestos, moneda y precio final.

## Entidades requeridas

- PriceList.
- PriceListAssignment.
- ProductPrice.
- PriceRule.
- PriceRoundingRule.
- VolumeDiscountRule.
- OperationalRiskRule.
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
- Precio fijo manual cuando aplique.
- Aumento fijo sobre costo.
- Descuento por volumen.
- Redondeo comercial.
- Colchon preventivo de riesgo operativo.
- IVA incluido o separado.
- Vigencia de precio.
- Calculo auditable.
- Snapshot de tipo de cambio usado cuando el costo origen no este en MXN.

## Frontera con costos reales

Pricing define cuanto cobrar y por que regla.

Las perdidas reales por devoluciones, reenvios, errores de envio, mermas o tiempo operativo deben registrarse en Sales/Returns/Profitability.

Pricing puede incluir un colchon preventivo estimado solo cuando sea parte de la politica de lista de precios.

## Tipo de cambio

`CurrencyRate` debe guardar el tipo de cambio usado por Pricing.

Para proveedores como SYSCOM, `supplier-api` sincroniza el dato externo y Pricing conserva o referencia el snapshot aplicado al calculo.

La cotizacion o venta debe guardar el tipo de cambio usado para no depender de recalculos futuros.

## Snapshot

El precio usado en cotizacion o venta debe congelarse como snapshot en `Quote` o `Sales`.

Pricing puede recalcular precios vigentes, pero no debe modificar precios historicos ya aceptados por cliente.

## Campos minimos para respuesta MVP

- `productId`.
- `baseCost`.
- `publicPrice`.
- `ruleApplied`.
- `currency`.
- `validFrom`.
- `validTo`.
- `isDemo`.
- `calculationSnapshot`.

## Reglas iniciales requeridas

| Regla | Entidad sugerida |
|---|---|
| Precio fijo manual | `PriceRule` |
| Costo proveedor + porcentaje | `PriceRule` |
| Costo proveedor + monto fijo | `PriceRule` |
| Redondeo comercial | `PriceRoundingRule` |
| Precio demo | `ProductPrice` / `PriceRule` |
| Precio por vigencia | `ProductPrice` |
| Precio por lista | `PriceList` |
| Precio interno oculto | `PriceList` + permisos |
