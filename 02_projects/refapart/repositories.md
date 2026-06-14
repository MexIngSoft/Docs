# Repositorios REFAPART

## Estado actual

| Capa | Ruta local | Estado |
|---|---|---|
| Web | `Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart` | Creada dentro del orquestador web. |
| Gateway central | `Docker.API.PY/API.PY.DJANGO.Gateway` | Principal; Auth versionado en puerto `8025`. |
| Gateway retirado | `API.PY.DJANGO.RefaPart.Gateway` | Retirado del workspace; respaldo local documentado. |
| API | `Docker.API.PY/API.PY.DJANGO.Refapart` | PENDIENTE_DE_DEFINIR. |
| Docker web | `Docker.WEB.NJ` | Orquesta puerto `3008`. |

## Repositorio propio

Repositorio objetivo:

```text
https://github.com/MexIngSoft/WEB.NJ.NEXT.RefaPart.git
```

Repositorio objetivo del Gateway legacy:

```text
El remoto historico de RefaPart Gateway no sustituye al Gateway central.
```

Repositorio objetivo del Gateway central:

```text
https://github.com/MexIngSoft/API.PY.DJANGO.Gateway.git
```

## Decision

La ruta tecnica y remoto objetivo del proyecto web son
`WEB.NJ.NEXT.RefaPart`. La web debe publicarse como repositorio propio y el
orquestador `Docker.WEB.NJ` solo conserva Docker, mounts, puertos y scripts de
arranque.
