# Flujo Global De Busqueda

```text
Usuario
-> Web del proyecto
-> Gateway General
-> Search API
-> APIs de dominio para detalle operativo
```

## Con Resultado

Search devuelve candidatos con `externalId`, titulo, score y payload minimo.

La web usa el Gateway para consultar el detalle real del dominio.

## Sin Resultado

Search registra `SearchQueryLog` y puede crear `SearchDemand`.

El proyecto decide si convierte esa demanda en solicitud operativa.
