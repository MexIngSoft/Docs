---
title: Migracion Auth de REFAPART
domain: business
project: refapart
status: active
priority: p1
owner: Equipo REFAPART
last_reviewed: 2026-06-14
---

# Migracion Auth de REFAPART

## Estado actual auditado

Antes de esta implementacion, REFAPART no tenia login, sesiones, JWT,
middleware, roles ni permisos propios. `/cuenta` era un placeholder publico.
Por ello no existe login legado que retirar ni usuarios productivos que migrar.

Estado objetivo implementado:

```text
WEB.NJ.NEXT.RefaPart
  -> API.PY.DJANGO.Gateway
    -> API.PY.DJANGO.Auth
```

## Componentes afectados

- Web REFAPART: proveedor de sesion, login, registro, recuperacion, logout,
  rutas privadas y pagina 403.
- Gateway central: proxy de frontera Auth con `X-Application-Code`.
- Gateway REFAPART: fallback legacy durante la migracion.
- Auth: aplicacion `REFAPART`, configuracion de correo y rol base `CUSTOMER`.
- Docker API: Gateway central `8025`, fallback `8023` y compose focalizado.

## Endpoints nuevos

| Metodo | Ruta Gateway | Upstream Auth |
|---|---|---|
| POST | `/api/v1/auth/login/` | `/api/auth/jwt/create/` |
| POST | `/api/v1/auth/logout/` | `/api/auth/logout/` |
| POST | `/api/v1/auth/refresh/` | `/api/auth/jwt/refresh/` |
| GET | `/api/v1/auth/me/` | `/api/users/me/` |
| GET | `/api/v1/auth/me/permissions/` | `/api/access/me/permissions/` |
| POST | `/api/v1/auth/register/` | `/api/users/` |
| POST | `/api/v1/auth/password/reset/` | `/api/users/reset_password/` |
| POST | `/api/v1/auth/password/reset/confirm/` | `/api/users/reset_password_confirm/` |

## Rutas

Publicas: `/`, `/resultados`, `/pieza/*`, `/publicar-busqueda`, `/favoritos`,
`/login`, `/register`, `/forgot-password`, `/reset-password`.

Privadas: `/cuenta`, `/dashboard`, `/profile`, `/settings`, `/logout`.

## Riesgos

- Auth y Gateway deben estar disponibles para entrar a rutas privadas.
- Las cookies HttpOnly requieren `credentials: include` y origen permitido.
- Los permisos REFAPART detallados aun no estan definidos; el MVP registra el
  rol `CUSTOMER` y conserva la autorizacion real en backend.
- El correo local usa valores de desarrollo hasta definir dominio/remitente.

## Rollback

1. Cambiar `NEXT_PUBLIC_GATEWAY_BASE_URL` al fallback `8023/api/refapart`.
2. Restaurar `/cuenta` como placeholder publico.
3. Mantener la aplicacion `REFAPART` en Auth inactiva en lugar de borrar
   usuarios o sesiones.
4. No eliminar migraciones aplicadas en produccion; crear migracion
   compensatoria si fuera necesario.

## Estado

`Auth MVP implementado`. Falta validacion funcional con base Auth levantada,
usuario real y entrega de correo real antes de declarar produccion.
