# Inventario de codebase

## Estado

ACTUALIZADO_PARCIAL - generado durante `AGENTS-006`.

## Repositorios detectados

| Repo | Rama | Estado local |
|---|---|---|
| `Docs` | `general` | Con cambios locales documentales. |
| `Docker.API.PY` | `general` | Con cambios locales en Auth/Gateway y configuracion previa. |
| `Docker.DB.PG` | `general` | Con cambios locales previos. |
| `Docker.WEB.NJ` | `general` | Con cambios locales. |
| `Docker.SW.Nginx` | `general` | Sin cambios locales al momento de auditoria. |

## APIs Django activas relevantes

```text
Docker.API.PY/API.PY.DJANGO.Auth
Docker.API.PY/API.PY.DJANGO.Gateway
Docker.API.PY/API.PY.DJANGO.Address
Docker.API.PY/API.PY.DJANGO.RefaPart
Docker.API.PY/API.PY.DJANGO.JobCron
Docker.API.PY/API.PY.DJANGO.Catalog
Docker.API.PY/API.PY.DJANGO.Supplier
Docker.API.PY/API.PY.DJANGO.Sales
Docker.API.PY/API.PY.DJANGO.Pricing
Docker.API.PY/API.PY.DJANGO.Inventory
Docker.API.PY/API.PY.DJANGO.TecnoTelec
```

## Webs Next.js relevantes

```text
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron
Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof
Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec
```

## Observacion

Este inventario no reemplaza `master-index.md`; sirve para orientar validaciones
de codigo y repositorios durante agents.
