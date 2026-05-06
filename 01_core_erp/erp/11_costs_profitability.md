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

## Responsabilidades

| Modulo | Responsabilidad |
|---|---|
| Supplier | Costo proveedor y condiciones de compra. |
| Pricing | Listas, margenes, impuestos, descuentos y precio final. |
| Logistics | Costo de envio, entrega o instalacion. |
| Projects | Mano de obra, materiales y solucion completa. |
| Sales | Snapshot final de costos y precios aprobados. |

## Reglas

- La cotizacion debe guardar snapshot de costos y precios.
- El usuario sin permiso no debe ver costo real.
- La utilidad debe calcularse por partida y por documento.
- Multi-moneda debe considerar tipo de cambio usado en el momento del calculo.

## Pendientes

```text
PENDIENTE_DE_DEFINIR:
- Politica de tipo de cambio.
- Margen minimo por empresa o linea.
- Comisiones internas.
```

