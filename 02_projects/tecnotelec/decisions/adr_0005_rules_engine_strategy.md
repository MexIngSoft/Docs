# ADR 0005 - Estrategia Rules Engine

## Estado

Aceptado

## Contexto

Las reglas de descuento, margen, stock, logistica y aprobacion no deben quedar dispersas.

## Decision

Crear `rules-engine-api` como API objetivo. Puede iniciar como modulo interno, pero su contrato debe documentarse desde el principio.

## Consecuencias

- Las reglas se centralizan.
- Pricing, Logistics, Sales y Projects reducen logica duplicada.
- El sistema puede cambiar reglas sin tocar todas las APIs.
