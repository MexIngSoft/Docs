# ADR 0002 - Estrategia ERP modular

## Estado

Aceptado

## Contexto

Tecno Telec requiere vender soluciones y proyectos, no solo productos.

## Decision

Separar el ERP en modulos: Supplier, Catalog, Pricing, Inventory, Quote, Sales, Logistics, Projects, Rules Engine, Cart y POS.

Tecno Telec debe usar una API intermedia y una API propia:

```text
Web/Mobile Tecno Telec
  -> tecnotelec-gateway-api
  -> tecnotelec-api
  -> APIs core ERP
```

## Consecuencias

- Cada API tiene responsabilidad clara.
- El sistema puede crecer a microservicios.
- Se evita mezclar proveedor, precio, stock y venta.
- El proyecto puede tener tablas y procesos propios sin contaminar el nucleo ERP.
