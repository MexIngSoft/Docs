# LexNova repositories

## Estado

ACTIVE

## Repositorios

| Proyecto | Ruta local | Repositorio esperado | Rama de trabajo |
|---|---|---|---|
| Web LexNova | `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.LexNova.git` | `feature/lex-nova-tech-identification` |
| API LexNova Gateway | `Docker.API.PY/API.PY.DJANGO.LexNova.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.Gateway.git` | `feature/lex-nova-tech-identification` |
| API LexNova | `Docker.API.PY/API.PY.DJANGO.LexNova` | `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.git` | `feature/lex-nova-tech-identification` |
| Auth Core | `Docker.API.PY/API.PY.DJANGO.Auth` | `https://github.com/MexIngSoft/API.PY.DJANGO.Auth.git` | `feature/lex-nova-tech-identification` |
| Docs | `Docs` | `https://github.com/MexIngSoft/Docs.git` | `feature/lex-nova-tech-identification` |

## Regla

Cada repositorio se versiona por separado. La web no debe incluir codigo del
gateway ni del API de dominio. El gateway no debe contener reglas permanentes de
dominio legal.

## Publicacion

Orden recomendado:

1. `Docs`
2. `API.PY.DJANGO.Auth` si cambio Auth Core o la semilla de acceso
3. `API.PY.DJANGO.LexNova`
4. `API.PY.DJANGO.LexNova.Gateway`
5. `WEB.NJ.NEXT.LexNova`
6. `Docker.API.PY` si cambio el orquestador
7. `Docker.WEB.NJ` si cambio el orquestador web
