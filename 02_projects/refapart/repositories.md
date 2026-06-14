# Repositorios REFAPART

## Estado actual

| Capa | Ruta local | Estado |
|---|---|---|
| Web | `Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart` | Creada dentro del orquestador web. |
| Gateway | `Docker.API.PY/API.PY.DJANGO.Refapart.Gateway` | PENDIENTE_DE_DEFINIR. |
| API | `Docker.API.PY/API.PY.DJANGO.Refapart` | PENDIENTE_DE_DEFINIR. |
| Docker web | `Docker.WEB.NJ` | Orquesta puerto `3008`. |

## Repositorio propio

Repositorio objetivo:

```text
https://github.com/MexIngSoft/WEB.NJ.NEXT.RefaPart.git
```

## Decision

La ruta tecnica y remoto objetivo del proyecto web son
`WEB.NJ.NEXT.RefaPart`. La web debe publicarse como repositorio propio y el
orquestador `Docker.WEB.NJ` solo conserva Docker, mounts, puertos y scripts de
arranque.
