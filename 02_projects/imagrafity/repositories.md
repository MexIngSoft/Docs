# Repositorios Imagrafity

## Estado

ACTIVE

## Repositorios locales creados

| Proyecto | Ruta | Tipo |
|---|---|---|
| `WEB.NJ.NEXT.Imagrafity` | `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity` | Next.js frontend |
| `API.PY.DJANGO.Imagrafity.Gateway` | `Docker.API.PY/API.PY.DJANGO.Imagrafity.Gateway` | Django Gateway/BFF |
| `API.PY.DJANGO.Imagrafity` | `Docker.API.PY/API.PY.DJANGO.Imagrafity` | Django API |

## Remotos GitHub

```text
https://github.com/MexIngSoft/WEB.NJ.NEXT.Imagrafity.git
https://github.com/MexIngSoft/API.PY.DJANGO.Imagrafity.Gateway.git
https://github.com/MexIngSoft/API.PY.DJANGO.Imagrafity.git
```

## Estado de publicacion

| Proyecto | Remoto | Estado |
|---|---|---|
| `WEB.NJ.NEXT.Imagrafity` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.Imagrafity.git` | Publicado en `dev`, `pro` y `main`. Commit `c88204b`. |
| `API.PY.DJANGO.Imagrafity.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.Imagrafity.Gateway.git` | Publicado en `dev`, `pro` y `main`. Commit `3facb84`. |
| `API.PY.DJANGO.Imagrafity` | `https://github.com/MexIngSoft/API.PY.DJANGO.Imagrafity.git` | Publicado en `dev`, `pro` y `main`. Commit `d1296a5`. |

## Ramas requeridas

Imagrafity sigue el flujo estandar del repositorio:

```text
feature/* -> dev -> pro -> main
```

Para la publicacion inicial se crearon `dev`, `pro` y `main` desde el mismo
commit validado. El desarrollo posterior debe salir de `dev`.

## Informacion ambigua recibida

La solicitud menciono cuatro repositorios, pero la lista incluyo URLs duplicadas
de JobCron y Gateway. La documentacion canonica de Imagrafity define tres
repositorios propios: web, gateway y API. El API principal se incluye porque su
remoto sugerido esta documentado y GitHub lo devuelve como alcanzable.
