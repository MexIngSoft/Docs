# Estandar de correos Auth por aplicacion

## Objetivo

Definir como Auth envia correos transaccionales personalizados por aplicacion
sin duplicar logica en las webs.

## Regla principal

Auth es responsable de:

- remitente operativo;
- nombre remitente;
- URL base de redireccion;
- logo de marca;
- colores de marca;
- plantillas transaccionales por aplicacion;
- logs de envio.

Las webs solo muestran flujos y mensajes; no envian correos transaccionales.

## Aplicaciones cubiertas

Este estandar aplica a:

- `REFAPART`
- `JOBCRON`
- `UNIVERSAL_POS`
- `DOCUCORE`
- `MEXINGSOF`
- `TECNOTELEC`
- `IMAGRAFITY`
- `LEXNOVA`
- `FISCORA`

## Remitente base local

El remitente operativo local autorizado es:

```text
AUTH_NOTIFICATION_FROM_EMAIL=cash.1dip1@gmail.com
```

En produccion puede reemplazarse por aplicacion o ambiente usando
configuracion de Auth.

## Resiliencia del proveedor

El envio de correos transaccionales no debe romper registro, login, reset ni
cambio de password con HTML `500`.

Si el proveedor de correo falla o no esta configurado, Auth debe:

- registrar el intento en `"Auth"."EmailDeliveryLogs"` con `Status=FAILED`;
- devolver respuesta JSON controlada via Gateway;
- no exponer trazas internas al frontend;
- usar fallback local a `django.core.mail.backends.console.EmailBackend`;
- usar modo estricto solo cuando `AUTH_EMAIL_DELIVERY_FAIL_OPEN=False`.
- si el proveedor devuelve `AccessDeniedException` o `not authorized`, registrar
  `SES_ACCESS_DENIED`; no mostrar al usuario que el correo fue enviado.
- con `django-ses==3.5.0`, el usuario/rol IAM usado por Auth debe permitir,
  como minimo, `ses:SendEmail`, `ses:SendRawEmail` y `ses:GetAccount`.

Configuracion minima local:

```text
AUTH_NOTIFICATION_FROM_EMAIL=cash.1dip1@gmail.com
AUTH_EMAIL_DELIVERY_FAIL_OPEN=True
```

Si se usa SES, deben existir al menos:

```text
AWS_SES_ACCESS_KEY_ID=
AWS_SES_SECRET_ACCESS_KEY=
AWS_SES_REGION_NAME=
AWS_SES_FROM_EMAIL=
```

Sin `AWS_SES_REGION_NAME`, Auth no debe intentar usar SES porque Django SES
puede fallar con:

```text
You must specify a region.
```

Ese error debe quedar registrado, no convertirse en `Failed to fetch`, `502
UPSTREAM_INVALID_RESPONSE` o HTML `500` para la web.

La separacion entre diagnostico de desarrollo, mensaje seguro de produccion,
reintentos, estados, payload SES sanitizado y panel administrativo queda regida
por:

```text
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
```

La estructura, ubicacion, nombres, variables permitidas y validacion de
plantillas por aplicacion queda regida por:

```text
Docs/03_standards/auth/auth-email-template-standard.md
```

La prioridad de fuente de plantillas queda regida por:

```text
Docs/03_standards/auth/auth-email-template-source-standard.md
```

Regla obligatoria:

```text
FILE -> DB_FALLBACK -> DJOSER_FALLBACK
```

`"Auth"."TransactionalEmailTemplates"` no es fuente principal de HTML.

Produccion nunca debe mostrar al usuario detalles como Docker, CORS, Gateway
interno, Auth interno, SES, SMTP, variables de entorno, stack traces, SQL ni
payloads de proveedor. Esos datos solo viven en logs internos sanitizados y, en
desarrollo, en panel tecnico controlado.

## Tablas Auth

```text
"Auth"."ApplicationEmailSettings"
"Auth"."TransactionalEmailTemplates"  # fallback administrativo, no fuente principal
"Auth"."EmailDeliveryLogs"
```

## Plantillas requeridas

Cada aplicacion debe preparar plantillas para:

| Accion | Uso |
|---|---|
| `VERIFY_ACCOUNT` | Registro / activacion. |
| `WELCOME` | Bienvenida. |
| `PASSWORD_RESET` | Olvide mi contrasena. |
| `PASSWORD_CHANGED` | Confirmacion de cambio. |
| `EMAIL_RESET` | Cambio de email solicitado. |
| `EMAIL_CHANGED` | Email cambiado. |
| `LOGIN_ALERT` | Notificacion de login si aplica. |
| `RESEND_VERIFICATION` | Reenvio de verificacion si existe endpoint habilitado. |

Si una accion no esta habilitada, debe permanecer inactiva o marcada como
`PENDIENTE_DE_DEFINIR`; no se debe mostrar como flujo productivo.

## Respuesta al frontend

Auth debe devolver respuestas JSON controladas para que la web distinga al
menos:

| Codigo | Uso |
|---|---|
| `USER_CREATED_EMAIL_SENT` | Usuario creado y correo enviado o encolado. |
| `USER_CREATED_EMAIL_FAILED` | Usuario creado, pero envio fallido registrado. |
| `EMAIL_RESEND_SENT` | Reenvio aceptado. |
| `EMAIL_RESEND_RATE_LIMITED` | Reenvio bloqueado por limite. |
| `EMAIL_TEMPLATE_MISSING` | Plantilla no configurada. |
| `EMAIL_PROVIDER_UNAVAILABLE` | Proveedor no disponible. |

Si el backend todavia no entrega estos codigos, la web debe documentar la
brecha como `PENDIENTE_DE_DEFINIR` y no presentar una confirmacion tecnica
falsa de entrega.

El reenvio de verificacion se expone a la web por Gateway General:

```http
POST /api/v1/auth/email/verification/resend/
```

Gateway puede mantener como alias compatible:

```http
POST /auth/email/resend-verification
```

La ruta backend reutilizable en Auth es:

```http
POST /api/users/resend_activation/
```

No se permite crear un endpoint de reenvio por proyecto.

## Trazabilidad y reintentos

Todo correo debe registrar estado operativo. Estados minimos:

```text
PENDING
PROCESSING
SENT
ACCEPTED_BY_PROVIDER
DELIVERED
OPENED
BOUNCED
COMPLAINED
FAILED
RETRY_SCHEDULED
RETRY_EXHAUSTED
```

Campos minimos:

- `UserId`;
- `ApplicationId`;
- `ApplicationCode`;
- `Email`;
- `TemplateId`;
- `ActionCode`;
- `Subject`;
- `Provider`;
- `ProviderRequestId`;
- `ProviderMessageId`;
- `ProviderResponseCode`;
- `ProviderResponsePayload` sanitizado;
- `Status`;
- `FailureReason`;
- `LastErrorCode`;
- `RetryCount`;
- `NextRetryAt`;
- `CreatedAt`;
- `SentAt`;
- `DeliveredAt`;
- `CorrelationId`;
- `RequestId`.

Los errores temporales se reintentan a:

```text
1 minuto
5 minutos
15 minutos
1 hora
```

Cada intento debe quedar registrado. Errores definitivos como template
inexistente, aplicacion inactiva, usuario ya verificado o dominio SES no
verificado no se reintentan hasta que soporte corrija la causa.

## Personalizacion

Las plantillas no deben ser genericas cuando exista identidad de marca. Deben
usar:

- nombre comercial;
- logo;
- color primario;
- URL publica de la web;
- tono del proyecto;
- CTA claro;
- footer con nombre de la aplicacion.

## REFAPART

REFAPART usa:

```text
Negro / grafito / blanco / rojo REFAPART
Logo REFAPART
CTA rojo
Footer REFAPART
```

## Validacion

Validar con:

```text
GET /api/access/email-templates/
GET /api/access/application-email-settings/
GET /api/access/email-delivery-logs/
```

o con preview si la API lo expone:

```text
GET /api/access/email-templates/preview/?application_code=<CODE>&action_code=<ACTION>
```
