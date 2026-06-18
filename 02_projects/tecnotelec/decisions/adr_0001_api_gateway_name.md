# ADR 0001 - Nombre del Gateway General

## Estado

Reemplazado por estandar activo de Gateway General

## Contexto

El frontend necesita un punto unico de entrada para consumir varias APIs internas.
La decision historica nombraba un gateway exclusivo de Tecno Telec; el estandar
vigente usa `API.PY.DJANGO.Gateway` para todos los frontends.

## Decision

El gateway se documenta como:

```text
API.PY.DJANGO.Gateway
```

La API especializada del proyecto se documenta como:

```text
tecnotelec-api
```

## Consecuencias

- El frontend consume Gateway General.
- Gateway General adapta y enruta respuestas para la web.
- Gateway General puede consumir `tecnotelec-api` para procesos propios del proyecto.
- Las APIs internas mantienen contratos propios.
