# ADR 0001 - Nombre del API Gateway

## Estado

Aceptado

## Contexto

El frontend necesita un punto unico de entrada para consumir varias APIs internas.

## Decision

El gateway se documenta como:

```text
tecnotelec-gateway-api
```

La API propia del proyecto se documenta como:

```text
tecnotelec-api
```

## Consecuencias

- El frontend consume gateway.
- Gateway actua como BFF.
- Gateway puede consumir `tecnotelec-api` para procesos propios del proyecto.
- Las APIs internas mantienen contratos propios.
