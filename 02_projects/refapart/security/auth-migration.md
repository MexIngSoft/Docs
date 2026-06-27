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

## Sesion anonima en frontend

Al iniciar la web sin sesion, `AuthProvider` consulta:

```text
GET /api/v1/auth/me/
GET /api/v1/auth/me/permissions/
```

Si no existen cookies/tokens de Auth, Gateway debe responder `401` y la web
debe tratarlo como estado anonimo normal:

- limpiar `session`;
- mantener `loading=false`;
- no mostrar error al usuario;
- no registrar `console.error` para ese `401` esperado.

El `console.error` queda reservado para fallos reales de Gateway/Auth, por
ejemplo `502`, CORS, red, aplicacion no registrada o errores de operaciones
explicitamente solicitadas como login, registro, reset o reenvio.

REFAPART usa autenticacion por alcance de ruta, no autenticacion global
obligatoria para toda la web.

| Politica | Rutas REFAPART |
|---|---|
| Publico | `/`, `/resultados`, `/pieza/[id]`, `/publicar-busqueda`, `/login`, `/register`, `/forgot-password`, `/reset-password`, `/verify-email`, `/auth/success`, `/auth/error`, `/403`, `/logout` |
| Opcional | `/favoritos`, `/carrito` |
| Protegido | `/cuenta`, `/cuenta/direcciones`, `/cuenta/facturacion`, `/dashboard`, `/profile`, `/settings`, `/change-password`, `/checkout`, `/mis-solicitudes`, `/mis-cotizaciones`, `/mis-pedidos`, `/mis-pedidos/[id]`, `/proveedor`, `/admin/refapart/*` |

Implementacion frontend:

```text
features/auth/services/auth-service.ts -> getSession({ mode })
features/auth/components/AuthGuard.tsx -> PublicRoute / OptionalAuthRoute / ProtectedRoute
middleware.ts -> redireccion temprana de rutas protegidas sin cookie Auth
```

Regla de registro y reenvio:

- Si el registro crea una cuenta nueva, mostrar pantalla de verificacion y
  boton de reenvio.
- Si el correo ya existe, mostrar que el correo ya tiene cuenta, boton de login
  y opcion de reenvio solo como ayuda para cuentas no verificadas.
- Si el error es contrasena invalida, email invalido, CORS, Gateway caido o
  Auth no disponible, no mostrar reenvio.
- El reenvio no confirma entrega final; solo solicita un nuevo intento. La
  entrega real se revisa en `"Auth"."EmailDeliveryLogs"`.

Pendiente fuera de esta corrida:

- Aplicar `Docs/03_standards/auth/web-auth-route-scope-standard.md` a las otras
  webs del ecosistema.

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
- La UI no debe afirmar que el correo fue enviado solo porque la cuenta fue
  creada. En modo fail-open debe usar mensaje seguro de cuenta recibida y
  recomendar reenvio/soporte si no llega.
- Si AWS SES devuelve `AccessDeniedException`, revisar permisos IAM del usuario
  o rol configurado en Auth; para el backend actual se requiere al menos
  `ses:SendEmail`, `ses:SendRawEmail` y `ses:GetAccount`.
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

## Validacion SES y reenvio 2026-06-26

Se valido el flujo real:

```text
WEB.NJ.NEXT.RefaPart
-> API.PY.DJANGO.Gateway /api/v1/auth/email/verification/resend/
-> API.PY.DJANGO.Auth /api/users/resend_activation/
-> Amazon SES
```

Resultado:

- El endpoint de reenvio responde `204`, por lo que Gateway y Auth aceptan la
  solicitud.
- El correo no se considera enviado si `"Auth"."EmailDeliveryLogs"` no registra
  `SENT`, `ACCEPTED_BY_PROVIDER` o estado equivalente.
- La prueba contra `cash_dip@hotmail.com` registro `Status=FAILED`,
  `Provider=SES`, `LastErrorCode=SES_ACCESS_DENIED` y `SentAt=None`.
- AWS rechazo la accion `ses:GetAccount` para el usuario IAM configurado en
  desarrollo.

Accion requerida en AWS antes de volver a probar entrega real:

```text
Permitir al usuario/rol IAM usado por Auth:
- ses:GetAccount
- ses:SendEmail
- ses:SendRawEmail
```

Ademas, confirmar en la misma region configurada:

- remitente o dominio verificado;
- DKIM/SPF si aplica;
- cuenta SES fuera de sandbox o destinatario verificado si sigue en sandbox.

Regla para UI:

- Registro duplicado debe responder como email existente y la web debe mostrar
  un mensaje de correo ya registrado.
- Registro nuevo o reenvio no debe afirmar entrega final del correo; solo debe
  indicar que la cuenta o solicitud fue recibida y pedir revisar bandejas o
  contactar soporte si no llega.

Nota operativa:

- Si el contenedor `api-multiproyecto` fue creado con una lista antigua de
  `API_PROJECTS`, un `docker restart` no cambia sus variables. Debe recrearse
  el contenedor desde el compose vigente para retirar proyectos ya eliminados
  como `leadhunter` de la lista runtime.

## Plantillas de correo REFAPART

REFAPART usa plantillas propias en Auth:

```text
Docker.API.PY/API.PY.DJANGO.Auth/templates/auth_emails/refapart/
```

Archivos activos:

- `base.html`
- `register.html`
- `verify_account.html`
- `password_reset.html`
- `password_changed.html`
- `email_reset.html`
- `email_changed.html`

Estas plantillas son seleccionadas por Auth cuando la solicitud llega con:

```text
X-Application-Code: REFAPART
```

Estandar rector:

```text
Docs/03_standards/auth/auth-email-template-standard.md
```

Validacion automatizada:

```text
python manage.py test auth.tests.test_refapart_email_templates
```

Las carpetas de plantillas para otras webs quedan pendientes fuera del alcance
REFAPART hasta que cada web cierre su flujo Auth/correo.
