# Estandar de diagnostico de correos Auth

## Objetivo

Definir el comportamiento global para envio, verificacion, reenvio,
trazabilidad, reintentos y diagnostico de correos transaccionales Auth.

Este estandar aplica a cualquier web que use Auth mediante Gateway General:

- REFAPART
- JOBCRON
- UNIVERSAL_POS
- DOCUCORE
- MEXINGSOF
- TECNOTELEC
- IMAGRAFITY
- LEXNOVA
- FISCORA
- futuras aplicaciones

## Regla principal

Los proyectos individuales no deben implementar envio de correo propio.

El flujo obligatorio es:

```text
Web -> Gateway General -> Auth API -> Notification Service/Email backend -> Proveedor
```

Auth conserva la identidad del usuario, la aplicacion, el template y el log
operativo. Notification Service puede ejecutar entrega asincrona y reintentos
cuando este disponible, pero no sustituye la trazabilidad de Auth.

## Endpoint canonico de reenvio

La web debe consumir el reenvio por Gateway General:

```http
POST /api/v1/auth/email/verification/resend/
```

Alias permitido solo como compatibilidad de Gateway:

```http
POST /auth/email/resend-verification
```

La implementacion backend reutilizable existente en Auth es Djoser:

```http
POST /api/users/resend_activation/
```

Decision:

- no crear endpoints de reenvio por proyecto;
- Gateway adapta la ruta publica a Auth;
- Auth valida usuario pendiente, token si aplica, aplicacion y limite anti abuso;
- la web solo muestra la accion si Gateway expone la ruta.

## Estados obligatorios

Todo correo transaccional debe tener estado operativo.

| Estado | Uso |
|---|---|
| `PENDING` | Solicitud recibida, pendiente de procesamiento. |
| `PROCESSING` | Envio en curso. |
| `SENT` | Auth intento enviar o encolar correctamente. |
| `ACCEPTED_BY_PROVIDER` | Proveedor acepto el mensaje. |
| `DELIVERED` | Proveedor confirmo entrega. |
| `OPENED` | Proveedor confirmo apertura si la metrica existe y esta permitida. |
| `BOUNCED` | Proveedor reporto rebote. |
| `COMPLAINED` | Proveedor reporto queja/spam. |
| `FAILED` | Error definitivo. |
| `RETRY_SCHEDULED` | Error temporal con reintento programado. |
| `RETRY_EXHAUSTED` | Reintentos agotados. |

## Campos obligatorios de trazabilidad

`"Auth"."EmailDeliveryLogs"` o el log equivalente debe conservar, como minimo:

| Campo | Regla |
|---|---|
| `UserId` | Usuario Auth relacionado, si aplica. |
| `ApplicationId` | Aplicacion Auth relacionada. |
| `ApplicationCode` | Codigo operativo de aplicacion. |
| `Email` | Destinatario normalizado. |
| `TemplateId` | Template transaccional usado. |
| `ActionCode` | Ej. `VERIFY_ACCOUNT`, `PASSWORD_RESET`, `RESEND_VERIFICATION`. |
| `Subject` | Asunto renderizado. |
| `Provider` | Ej. `SES`, `SMTP`, `CONSOLE`. |
| `ProviderRequestId` | RequestId del proveedor si existe. |
| `ProviderMessageId` | MessageId del proveedor si existe. |
| `ProviderResponseCode` | Codigo HTTP/SMTP/proveedor si existe. |
| `ProviderResponsePayload` | Payload sanitizado, sin secretos ni tokens. |
| `Status` | Estado operativo obligatorio. |
| `FailureReason` | Motivo legible para soporte, sin secreto. |
| `LastErrorCode` | Codigo estable para busqueda y alertas. |
| `RetryCount` | Numero de intentos realizados. |
| `NextRetryAt` | Proximo reintento programado. |
| `CreatedAt` | Fecha de creacion. |
| `SentAt` | Fecha de envio o aceptacion inicial. |
| `DeliveredAt` | Fecha de entrega confirmada. |
| `CorrelationId` | Correlacion de request extremo a extremo. |
| `RequestId` | Request id interno del Gateway/Auth. |

## Reintentos automaticos

Los errores temporales deben reintentarse con esta politica:

```text
1 minuto
5 minutos
15 minutos
1 hora
```

Cada intento debe crear o actualizar evidencia en el log:

- fecha del intento;
- estado antes y despues;
- codigo de error;
- proveedor;
- respuesta sanitizada;
- `RetryCount`;
- `NextRetryAt`.

No se deben reintentar errores definitivos como email invalido, usuario ya
verificado, template inexistente, aplicacion inactiva o dominio SES no
verificado hasta que un operador corrija la causa.

## Amazon SES

Cuando se use Amazon SES, antes de tratar un correo como aceptado se debe
registrar:

- `RequestId`;
- `MessageId`;
- `ResponseCode`;
- `ResponsePayload` sanitizado.

Checklist obligatorio de soporte:

| Validacion | Error operativo si falla |
|---|---|
| Region configurada | `SES_REGION_MISSING` |
| Credenciales activas | `SES_CREDENTIALS_INVALID` |
| Dominio verificado | `SES_DOMAIN_NOT_VERIFIED` |
| DKIM activo | `SES_DKIM_NOT_CONFIGURED` |
| SPF activo | `SES_SPF_NOT_CONFIGURED` |
| Return Path configurado | `SES_RETURN_PATH_NOT_CONFIGURED` |
| Cuenta fuera de sandbox | `SES_SANDBOX_ENABLED` |
| Cuota disponible | `SES_QUOTA_EXCEEDED` |
| Throttling controlado | `SES_THROTTLED` |

## Mensajes por ambiente

La regla de seguridad es estricta:

- desarrollo puede mostrar diagnostico tecnico para el programador;
- produccion no debe mostrar detalles tecnicos al usuario;
- produccion conserva detalle en logs internos sanitizados.

### Desarrollo

La UI puede mostrar un panel de diagnostico solo si el ambiente es desarrollo.

Datos permitidos:

- `error_code`;
- `correlation_id`;
- `request_id`;
- `application_code`;
- endpoint publico de Gateway;
- estado HTTP de Gateway/Auth;
- pista CORS/preflight;
- nombre de la variable faltante, sin valor;
- proveedor usado;
- estado SES/SMTP;
- `retry_count`;
- timestamp;
- enlace a runbook o documento.

Datos prohibidos incluso en desarrollo:

- passwords;
- tokens;
- cookies;
- access/refresh tokens;
- secretos AWS/SMTP;
- payloads crudos con credenciales;
- enlaces de verificacion completos si contienen token;
- stack trace visible para usuario no desarrollador.

### Produccion

La UI debe mostrar mensajes seguros:

```text
No pudimos completar la solicitud en este momento. Intenta de nuevo o contacta soporte con el folio {correlation_id}.
```

Para registro/correo:

```text
Tu cuenta fue recibida. Si el correo no llega en unos minutos, intenta reenviarlo o contacta soporte con el folio {correlation_id}.
```

Produccion nunca debe mencionar:

- Docker;
- CORS;
- Gateway interno;
- Auth interno;
- SES;
- SMTP;
- nombres de contenedores;
- variables de entorno;
- stack traces;
- SQL;
- rutas internas de codigo;
- payloads de proveedor.

## Matriz de errores

| Codigo | Causa | Desarrollo | Produccion | Log obligatorio |
|---|---|---|---|---|
| `GATEWAY_UNREACHABLE` | Gateway caido o puerto incorrecto. | Mostrar endpoint, puerto y preflight sugerido. | Mensaje generico con folio. | `correlation_id`, endpoint, status, origin. |
| `CORS_BLOCKED` | Origin/header no permitido. | Mostrar origin, header y metodo bloqueado. | Mensaje generico con folio. | origin, method, requested_headers. |
| `AUTH_UPSTREAM_DOWN` | Auth no responde via Gateway. | Mostrar upstream y timeout. | Mensaje generico con folio. | upstream_service, timeout_ms. |
| `APPLICATION_CODE_REQUIRED` | Web no envio aplicacion. | Mostrar header esperado. | Solicitud incompleta. | application_code null, route. |
| `APPLICATION_NOT_REGISTERED` | Aplicacion no existe o esta inactiva. | Mostrar codigo recibido. | Servicio no disponible para esta aplicacion. | application_code, active flag. |
| `EMAIL_TEMPLATE_MISSING` | No existe template activo. | Mostrar `ActionCode`, idioma y app. | No pudimos preparar el correo. | action_code, language_code, application_code. |
| `EMAIL_PROVIDER_UNAVAILABLE` | Backend de correo no disponible. | Mostrar proveedor y error sanitizado. | No pudimos enviar el correo ahora. | provider, error_code, retry_count. |
| `SES_REGION_MISSING` | Falta region SES. | Mostrar nombre de variable faltante. | Mensaje generico con folio. | provider=SES, missing_setting. |
| `SES_CREDENTIALS_INVALID` | Credenciales SES invalidas. | Mostrar codigo proveedor sanitizado. | Mensaje generico con folio. | request_id, response_code. |
| `SES_SANDBOX_ENABLED` | Cuenta SES en sandbox. | Mostrar destinatario/dominio afectado sin token. | No pudimos enviar el correo ahora. | provider_message_id, sandbox flag. |
| `SES_DOMAIN_NOT_VERIFIED` | Dominio/remitente no verificado. | Mostrar dominio/remitente. | Mensaje generico con folio. | from_domain, response_code. |
| `SES_QUOTA_EXCEEDED` | Cuota agotada. | Mostrar cuota/ventana si existe. | Reintento programado. | quota, retry_next_at. |
| `SES_THROTTLED` | Rate limit del proveedor. | Mostrar backoff aplicado. | Reintento programado. | retry_count, retry_next_at. |
| `EMAIL_BOUNCED` | Rebote proveedor. | Mostrar bounce type/subtype si existe. | Correo no entregado; pedir revisar direccion. | provider_payload sanitizado. |
| `EMAIL_COMPLAINED` | Queja/spam. | Mostrar complaint feedback si existe. | Contacta soporte con folio. | complaint_type. |
| `USER_ALREADY_VERIFIED` | Cuenta ya activa. | Mostrar `UserId` y app. | Tu cuenta ya esta verificada. | user_id, application_code. |
| `USER_NOT_FOUND` | Usuario no encontrado para reenvio. | Mostrar criterio usado. | No pudimos procesar la solicitud. | lookup_type, application_code. |
| `TOKEN_EXPIRED` | Token vencido. | Mostrar edad/token type sin token. | El enlace expiro. | token_type, issued_at si existe. |
| `TOKEN_INVALID` | Token invalido/usado. | Mostrar razon sanitizada. | El enlace no es valido. | token_type, reason. |
| `EMAIL_RESEND_RATE_LIMITED` | Anti abuso activo. | Mostrar ventana restante. | Espera unos minutos antes de reenviar. | user_id, ip_hash, next_allowed_at. |
| `RETRY_EXHAUSTED` | Reintentos agotados. | Mostrar historial de intentos. | Contacta soporte con folio. | attempts, last_error_code. |

## Deteccion de proveedor de correo

La web puede ayudar al usuario a abrir su proveedor por dominio.

| Dominio | Boton |
|---|---|
| `gmail.com` | Abrir Gmail |
| `outlook.com`, `hotmail.com`, `live.com` | Abrir Outlook |
| `yahoo.com` | Abrir Yahoo Mail |
| `icloud.com`, `me.com` | Abrir iCloud Mail |
| `proton.me`, `protonmail.com` | Abrir Proton Mail |

Si el dominio no esta en la tabla:

```text
Abrir mi correo
Utiliza tu proveedor habitual de correo electronico.
```

No se deben inventar proveedores por dominio desconocido.

## Pantalla posterior al registro

El registro nunca debe redirigir silenciosamente al login.

Debe mostrar:

- titulo `Verifica tu correo electronico`;
- correo destino si Auth lo puede devolver;
- instrucciones para bandeja de entrada, Spam, Promociones y correo no deseado;
- boton para abrir proveedor si el dominio es conocido;
- boton `Reenviar correo`;
- accion `Cambiar direccion`;
- accion `Ir al Login`;
- en desarrollo, panel tecnico opcional;
- en produccion, solo mensaje seguro y folio.

## Panel administrativo de diagnostico

Debe existir una vista administrativa reutilizable, por API o por herramienta
operativa, con filtros:

- usuario;
- fecha;
- aplicacion;
- estado;
- correo;
- action code;
- proveedor;
- correlation id.

Debe mostrar:

- enviados;
- fallidos;
- rebotados;
- entregados;
- tiempo de entrega;
- errores SES;
- errores SMTP;
- historial de reintentos;
- payload sanitizado del proveedor;
- folio/correlation id para soporte.

## Logs

Los logs deben seguir `Docs/03_standards/operations/observability.md`.

Campos minimos:

```json
{
  "timestamp": "ISO-8601",
  "level": "ERROR",
  "service_name": "API.PY.DJANGO.Auth",
  "env": "development",
  "request_id": "req-...",
  "correlation_id": "corr-...",
  "application_code": "REFAPART",
  "event": "auth.email.delivery.failed",
  "action_code": "VERIFY_ACCOUNT",
  "email_hash": "sha256:...",
  "provider": "SES",
  "provider_request_id": "PENDIENTE_DE_DEFINIR",
  "provider_message_id": "PENDIENTE_DE_DEFINIR",
  "error_code": "SES_REGION_MISSING",
  "retry_count": 0,
  "next_retry_at": null
}
```

El correo puede registrarse completo en tablas operativas con acceso
restringido. En logs generales se recomienda `email_hash` o mascara.

## Validacion minima

Para cerrar cambios de correo Auth:

- validar que la web consume Gateway, no Auth directo;
- validar que `X-Application-Code` viaja en registro, login, reset y reenvio;
- validar que no se muestra `Failed to fetch` literal;
- validar que produccion no muestra diagnosticos tecnicos;
- validar que desarrollo muestra codigo, folio y pista accionable;
- validar que `EmailDeliveryLogs` registra estado, error y reintentos;
- validar que SES no se usa sin region y credenciales;
- validar que Gateway expone el endpoint canonico o documenta
  `PENDIENTE_DE_DEFINIR`.

