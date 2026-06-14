---
title: Migracion de Gateway REFAPART
domain: business
project: refapart
status: active
priority: p1
owner: Equipo REFAPART
last_reviewed: 2026-06-14
---

# Migracion de Gateway REFAPART

| Campo | Valor |
|---|---|
| Gateway anterior | `API.PY.DJANGO.RefaPart.Gateway` (retirado) |
| Gateway nuevo | `API.PY.DJANGO.Gateway` |
| Estado | completed |
| Fecha de migracion | 2026-06-14 |
| Auth | v1 |

## Variables

```text
NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:8025/api/v1
NEXT_PUBLIC_APPLICATION_CODE=REFAPART
```

No existe fallback operativo a un Gateway dedicado.

## APIs usadas

- Auth v1 mediante rutas `/api/v1/auth/*`.
- API comercial REFAPART: no creada; el catalogo visible continua local/mock.

## Riesgos

- Auth y PostgreSQL no pudieron validarse integrados porque Docker Desktop no
  estaba disponible.
- Los permisos funcionales REFAPART aun no tienen catalogo definido.

## Rollback

Restaurar el respaldo solo mediante una decision explicita:

```text
_retired/legacy-gateways/2026-06-14/API.PY.DJANGO.RefaPart.Gateway.zip
```

El compose focalizado mantiene Auth y el Gateway central en `8025`; el
repositorio legacy fue retirado del arbol operativo el 2026-06-14.
