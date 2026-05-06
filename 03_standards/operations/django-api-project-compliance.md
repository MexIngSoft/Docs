# Validacion de cumplimiento de proyectos Django API

> Estado: migracion aplicada.
>
> Este documento registra el cumplimiento de los proyectos existentes contra `docs/03_standards/operations/project-closure-standard.md`.

## Resumen

Los proyectos existentes fueron migrados operativamente a la nomenclatura estandar `API.PY.DJANGO.NombreProyecto`.

`docker-compose.yml` y `Dockerfile` ya apuntan a las carpetas `API.PY.DJANGO.*`. Algunas carpetas anteriores `API.PY.DJANGO.*` quedaron como remanentes locales porque Windows bloqueo la eliminacion directa por permisos o archivos en uso.

`Docker.API.PY` solo orquesta las APIs. Cada carpeta `API.PY.DJANGO.*` debe ser repositorio Git propio.

## Correcciones aplicadas

- Se agrego `.env.local.example` sin secretos reales a todos los proyectos.
- Se completo `requirements.txt` base en proyectos que lo tenian vacio.
- Se agrego README minimo a proyectos que no tenian documentacion local.
- Se agrego `PROJECT_NAME` en settings de `Auth` y `LexNova`.
- Se agrego `ASGI_APPLICATION` en settings de `Auth` y `LexNova`.
- Se crearon carpetas estandarizadas `API.PY.DJANGO.*`.
- Se actualizaron `docker-compose.yml` y `Dockerfile` para usar `API.PY.DJANGO.*`.
- Se limpiaron los `.env.local` de las carpetas remanentes `API.PY.DJANGO.*`.
- Se inicializo Git en todas las carpetas `API.PY.DJANGO.*`.
- Se configuro `origin` en todas las APIs. Los modulos comerciales usan el patron `MexIngSoft/API.PY.DJANGO.NombreProyecto`.
- Se estandarizo `.gitignore` en todas las APIs con el bloque minimo Django API.

## Estado por proyecto

| Proyecto | Estado | Observaciones |
|---|---|---|
| `API.PY.DJANGO.Auth` | Cumple | `origin`: `https://github.com/1CASH1/API.PY.DJANGO.Auth.git`. Settings vive en `config/settings.py`. |
| `API.PY.DJANGO.Catalog` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Catalog.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Inventory` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Inventory.git`. Usa paquete `config`. |
| `API.PY.DJANGO.LexNova` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Pricing` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Pricing.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Procurement` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Procurement.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Sales` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Sales.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Supplier` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Supplier.git`. Usa paquete `config`. |

## Pendientes no aplicados

- Eliminar carpetas remanentes `API.PY.DJANGO.*` cuando Windows libere los archivos en uso. Esos remanentes no contienen `.env.local`.
- Mantener `config` como paquete unico de configuracion en todas las APIs.
- Eliminar secretos reales de `.env.local` si esos archivos estan versionados.
- Validar migraciones y arranque real en Docker.

## Regla de compatibilidad

La nomenclatura operativa soportada es `API.PY.DJANGO.*`. Las carpetas `API.PY.DJANGO.*` no deben usarse para Docker ni para nuevo desarrollo.
