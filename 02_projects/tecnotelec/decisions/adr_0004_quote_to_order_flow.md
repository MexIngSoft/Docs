# ADR 0004 - Flujo Quote a Order

## Estado

Aceptado

## Contexto

Una cotizacion no es una venta. Debe poder revisarse, vencer o convertirse en orden.

## Decision

`Quote` guarda snapshot y vigencia. `Order` se crea solo cuando el cliente aprueba, paga o el asesor formaliza.

## Consecuencias

- Cambios futuros de precio no alteran cotizaciones emitidas.
- Sales formaliza venta.
- Inventory reserva con referencia explicita.
