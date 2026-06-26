# Migracion Auth REFAPART

## Estado

ACTIVO

## Objetivo

Alinear REFAPART con el flujo obligatorio:

```text
WEB.NJ.NEXT.RefaPart -> API.PY.DJANGO.Gateway -> API.PY.DJANGO.Auth
```

## Configuracion web

```text
NEXT_PUBLIC_APP_NAME=REFAPART
NEXT_PUBLIC_HOST=http://localhost:3008
NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:8025/api/v1
NEXT_PUBLIC_APPLICATION_CODE=REFAPART
NEXT_PUBLIC_ENVIRONMENT=local
```

## Endpoints Gateway usados

```text
POST /api/v1/auth/login/
POST /api/v1/auth/logout/
POST /api/v1/auth/refresh/
GET  /api/v1/auth/me/
GET  /api/v1/auth/me/permissions/
POST /api/v1/auth/register/
POST /api/v1/auth/password/reset/
POST /api/v1/auth/password/reset/confirm/
POST /api/v1/auth/password/change/
```

## Reglas

- REFAPART no consume `API.PY.DJANGO.Auth` directamente.
- Todas las llamadas Auth envian `X-Application-Code: REFAPART`.
- El registro envia `ApplicationCode=REFAPART` por Gateway.
- Los errores de red/Auth se muestran con mensajes accionables.
- La base de datos Auth usa PostgreSQL y schema `"Auth"`; SQLite esta
  prohibido.

## Validacion funcional minima

| Ruta | Estado esperado |
|---|---|
| `/register` | Registro via Gateway con `ApplicationCode=REFAPART`. |
| `/login` | Login via Gateway y cookies Auth. |
| `/forgot-password` | Solicitud de reset via Gateway. |
| `/reset-password` | Confirmacion de reset via Gateway. |
| `/logout` | Logout via Gateway y limpieza de cookies. |
| `/dashboard` | Ruta privada protegida. |
| `/profile` | Ruta privada protegida. |
| `/settings` | Ruta privada protegida. |
| `/403` | Acceso denegado controlado. |

## Pendientes reales

- PENDIENTE_DE_DEFINIR: datos reales de prueba para validar registro/login en
  ambiente productivo sin reutilizar cuentas personales.
- PENDIENTE_DE_DEFINIR: matriz final de permisos REFAPART por rol operativo.

## Incidente de registro 2026-06-25

Durante la prueba de registro via Gateway se detecto:

```text
POST /api/v1/auth/register/
-> Auth POST /api/users/
-> 500 HTML
-> Gateway 502 UPSTREAM_INVALID_RESPONSE
```

La causa real no era frontend ni CORS. El usuario se creaba en PostgreSQL, pero
el correo de activacion fallaba porque SES no tenia region configurada:

```text
You must specify a region.
```

Regla aplicada:

- Auth no debe usar SES si faltan `AWS_SES_ACCESS_KEY_ID`,
  `AWS_SES_SECRET_ACCESS_KEY` o `AWS_SES_REGION_NAME`.
- En local debe usar `django.core.mail.backends.console.EmailBackend` cuando
  SES no este completo.
- Los fallos de correo deben registrarse en `"Auth"."EmailDeliveryLogs"`.
- Un fallo de correo no debe convertirse en HTML `500`, `Failed to fetch` ni
  `502 UPSTREAM_INVALID_RESPONSE` para REFAPART ni para otras webs.

Configuracion esperada local:

```text
AUTH_NOTIFICATION_FROM_EMAIL=cash.1dip1@gmail.com
AUTH_EMAIL_DELIVERY_FAIL_OPEN=True
```

## Incidente CORS 2026-06-25

Sintoma en desarrollo:

```text
No se pudo conectar con el Gateway. Verifica que Docker, Gateway y Auth esten
levantados y que CORS permita esta web.
```

Este mensaje es solo diagnostico local/desarrollo. En produccion la web debe
mostrar un mensaje seguro con folio/correlation id, sin mencionar Docker,
Gateway interno, Auth interno ni CORS. Regla canonica:

```text
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
```

Causa:

- Docker, Gateway y Auth estaban levantados.
- `GET /health/` del Gateway respondia `200`.
- El registro via curl podia funcionar.
- Pero el `OPTIONS` CORS del navegador no devolvia
  `Access-Control-Allow-Origin` para `http://localhost:3008`.
- El `.env` real de `Docker.API.PY` solo permitia puertos `3000` a `3007`, por
  lo que REFAPART (`3008`) quedaba fuera.
- El preflight tambien debe permitir `x-application-code`; si no aparece en
  `Access-Control-Allow-Headers`, el navegador bloquea el registro aunque el
  origen ya este permitido.

Correccion obligatoria:

```text
CORS_ALLOWED_ORIGINS debe incluir http://localhost:3008 y http://127.0.0.1:3008.
CORS_ALLOW_HEADERS debe incluir x-application-code.
```

La regla aplica a todas las webs locales: el Gateway debe permitir los puertos
documentados `3000` a `3009` tanto para `localhost` como para `127.0.0.1`.
