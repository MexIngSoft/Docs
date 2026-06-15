# Search Engine Core

## Objetivo

Ofrecer normalizacion, diccionarios, intencion, ranking, sugerencias y registro
de demanda no satisfecha como capacidad reutilizable.

## Arquitectura

```text
Frontend -> Gateway central -> API de proyecto -> Search Engine Core
```

La API de proyecto aporta diccionario y reglas de dominio. El Core no conoce
pantallas ni expone datos sin autorizacion del proyecto.

## Capas

1. Normalizacion de texto y errores comunes.
2. Diccionario por `ProjectCode` y `DomainCode`.
3. Extraccion de intencion.
4. Coincidencia exacta y flexible.
5. Compatibilidad cuando aplique.
6. Ranking y sugerencias.
7. Logs y demanda no satisfecha.
