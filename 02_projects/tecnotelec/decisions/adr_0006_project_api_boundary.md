# ADR 0006 - API propia del proyecto Tecno Telec

## Estado

Aceptado

## Contexto

Tecno Telec tendra web y posiblemente mobile. El frontend necesita un punto unico de entrada, pero el proyecto tambien puede requerir tablas y procesos propios que no pertenecen al nucleo ERP.

## Decision

Tecno Telec debe separar:

```text
Web/Mobile Tecno Telec
  -> tecnotelec-gateway-api
  -> tecnotelec-api
  -> APIs core ERP
```

## Responsabilidades

`tecnotelec-gateway-api`:

- Punto unico de entrada para web/mobile.
- BFF para pantallas.
- Orquestacion de llamadas.
- Adaptacion de respuestas.

`tecnotelec-api`:

- Procesos propios de Tecno Telec.
- Tablas propias del proyecto.
- Configuracion de servicios, formularios y experiencia comercial.
- Reglas especificas que no deben vivir en core.

APIs core:

- Reutilizacion de modulos ERP: Auth, Catalog, Pricing, Sales, Projects, Logistics, Rules, Documents, Notifications y GovernmentTender.

## Consecuencias

- El frontend no consume APIs core directamente.
- Tecno Telec puede crecer sin contaminar el nucleo ERP.
- Las reglas reutilizables se promueven al core.
- Las reglas especificas se mantienen en `tecnotelec-api`.

