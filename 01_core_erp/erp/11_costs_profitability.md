# Costos, precios y utilidad

## Objetivo

Evitar que el ERP confunda precio de venta con costo real. Cada venta, cotizacion y proyecto debe poder explicar margen y utilidad.

## Formula base

```text
Costo producto
+ Costo logistico
+ Mano de obra
+ Materiales adicionales
+ Comisiones
+ Impuestos o cargos aplicables
= Costo total

Precio venta - Costo total = Utilidad
```

## Frontera Pricing vs Costing

```txt
Costing calcula cuanto cuesta.
Pricing decide cuanto cobrar.
Profitability mide si realmente se gano o perdio.
```

## Responsabilidades

| Modulo | Responsabilidad |
|---|---|
| Supplier | Costo proveedor y condiciones de compra. |
| Pricing | Listas, margenes, impuestos, descuentos y precio final. |
| Logistics | Costo de envio, entrega o instalacion. |
| Projects | Mano de obra, materiales y solucion completa. |
| Sales | Snapshot final de costos y precios aprobados. |
| Returns | Costos reales de devolucion, reenvio, merma y reembolso. |
| Costing futuro | Costo real/estimado, costos financieros, marketplace, almacenaje y asignacion de gastos. |
| Profitability futuro | Simulacion, alertas, rentabilidad por cliente/producto/canal. |

## Reglas

- La cotizacion debe guardar snapshot de costos y precios.
- El usuario sin permiso no debe ver costo real.
- La utilidad debe calcularse por partida y por documento.
- Multi-moneda debe considerar tipo de cambio usado en el momento del calculo.
- Las perdidas reales no deben cambiar precios historicos; deben alimentar reportes y ajustes futuros de reglas.
- Pricing puede incluir un colchon preventivo, pero Profitability debe medir la utilidad real con eventos reales.

## Pendientes

```text
PENDIENTE_DE_DEFINIR:
- Politica de tipo de cambio.
- Margen minimo por empresa o linea.
- Comisiones internas.
- Metodo para medir costo real de devoluciones, reenvios y errores operativos.
- Definir si `cost-api` sera modulo separado o parte inicial de Sales/Profitability.
```

## Vision futura

```txt
01_core_erp/erp/22_pricing_costing_future_map.md
```
