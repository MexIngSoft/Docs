# Estandar de eventos Auth para webs Next.js

## Objetivo

Definir una estructura unica de eventos Auth para todas las webs Next.js del
ecosistema, tomando LexNova como referencia de cobertura de rutas, pero sin
copiar su implementacion interna cuando el proyecto usa otra arquitectura.

Este estandar aplica a webs existentes y nuevas:

- REFAPART;
- MEXINGSOF;
- TECNOTELEC;
- JOBCRON;
- LEXNOVA;
- DOCUCORE;
- FISCORA;
- IMAGRAFITY;
- cualquier web futura.

## Regla principal

Toda web que tenga autenticacion publica debe implementar o reservar de forma
controlada los mismos eventos Auth. El branding, textos y permisos pueden
cambiar por proyecto, pero el flujo, la ruta, el estado de usuario y el consumo
del Gateway General no deben cambiar.

La referencia de estructura es:

```text
app/auth/login/page.tsx
app/auth/register/page.tsx
app/auth/forgot-password/page.tsx
app/auth/resend/page.tsx
app/auth/reset/[uid]/[token]/page.tsx
app/activation/[uid]/[token]/page.tsx
app/auth/google/page.tsx
app/auth/facebook/page.tsx
```

Si una web ya publico rutas raiz como `/login`, `/register`,
`/forgot-password`, `/reset-password` o `/verify-email`, esas rutas pueden
seguir existiendo como aliases por compatibilidad, pero deben delegar al mismo
componente/servicio Auth que `app/auth/*`.

## Eventos obligatorios

| Evento | Ruta canonica | Alias permitidos | Estado minimo |
|---|---|---|---|
| Login | `/auth/login` | `/login` | Implementado si la web tiene acceso de usuario. |
| Registro | `/auth/register` | `/register` | Implementado o bloqueado con mensaje controlado. |
| Registro recibido | Pantalla dentro de registro | N/A | Debe mostrar siguiente paso, no redirigir silenciosamente. |
| Correo ya registrado | Pantalla dentro de registro | N/A | Puede ofrecer reenvio solo si aplica. |
| Reenvio verificacion | `/auth/resend` | N/A | Solo via Gateway General. |
| Activacion | `/activation/[uid]/[token]` | `/verify-email?uid=&token=` | Debe validar token y mostrar exito/error. |
| Olvide password | `/auth/forgot-password` | `/forgot-password` | Solicita reset sin revelar existencia de correo. |
| Reset password | `/auth/reset/[uid]/[token]` | `/reset-password?uid=&token=` | Valida uid/token y muestra resultado claro. |
| Logout | `/logout` | N/A | Limpia sesion via Gateway/Auth si existe. |
| Error Auth | `/auth/error` | N/A | Mensaje seguro, sin secretos ni stack traces. |
| Exito Auth | `/auth/success` | N/A | Confirmacion clara del evento completado. |
| Social Google | `/auth/google` | N/A | Reservado o implementado solo con proveedor configurado. |
| Social Facebook | `/auth/facebook` | N/A | Reservado o implementado solo con proveedor configurado. |

## Eventos que no deben fingirse

Una web no debe mostrar como exitoso lo que no puede comprobar:

- entrega real de correo;
- configuracion SES/IAM;
- estado final de bandeja de entrada;
- existencia o no existencia de un usuario cuando la API lo oculta por
  seguridad;
- autenticacion social si el proveedor no esta registrado.

Para correos, el texto correcto es que la solicitud fue recibida o enviada al
servicio de correo. La entrega final se valida con logs de Auth/proveedor.

## Consumo obligatorio

Todas las rutas Auth consumen:

```text
WEB -> Gateway General -> Auth API
```

Prohibido:

- llamar directo a `API.PY.DJANGO.Auth` desde la web;
- crear endpoints Auth propios dentro de `app/api/*`;
- duplicar Auth por proyecto;
- mezclar plantillas de correo en la web.

Cabecera obligatoria en llamadas Auth:

```text
X-Application-Code: <CODIGO_DE_APLICACION>
```

## Estados de UI obligatorios

Cada evento debe tener estados visibles y seguros:

- `idle`;
- `loading`;
- `success`;
- `warning`;
- `error`;
- `network_error`;
- `token_invalid`;
- `token_expired`;
- `email_used`;
- `user_not_verified`;
- `provider_unavailable`.

Los estados tecnicos detallados solo se muestran en desarrollo. Produccion debe
mostrar mensajes seguros conforme a:

```text
Docs/03_standards/auth/auth-frontend-error-handling-standard.md
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
```

## Matriz minima de acciones por evento

Cada web debe mapear errores por evento, no solo por texto tecnico. El mismo
texto `inactive` puede significar credenciales invalidas en login, aplicacion
deshabilitada en registro o proveedor no habilitado en social login.

| Evento | Estados esperados | Accion estandar |
|---|---|---|
| `/auth/login` | `invalid_credentials`, `inactive_ambiguous`, `network_error`, `rate_limited` | Mostrar error de formulario, no redirigir, no mostrar reenvio salvo que el usuario lo solicite desde ruta explicita. |
| `/auth/register` | `created`, `email_used`, `password_invalid`, `network_error` | Mostrar pantalla de verificacion o mantener formulario con error accionable. |
| `/auth/resend` | `sent_requested`, `rate_limited`, `email_unknown_or_hidden`, `network_error` | Mostrar cooldown, no confirmar entrega final y no revelar existencia de correo si Auth lo oculta. |
| `/activation/[uid]/[token]` | `verified`, `token_invalid`, `token_expired`, `network_error` | Mostrar resultado y CTA a login o reenvio. |
| `/auth/forgot-password` | `request_received`, `network_error` | Siempre usar mensaje neutral sobre existencia de correo. |
| `/auth/reset/[uid]/[token]` | `password_changed`, `password_invalid`, `token_invalid`, `token_expired` | Mostrar exito o permitir capturar nueva contrasena con reglas claras. |
| `/auth/google` y `/auth/facebook` | `provider_unavailable`, `provider_error`, `success` | No mostrar proveedor como opcion activa si no esta configurado para la aplicacion. |

Para login, los textos tecnicos `No active account found with the given
credentials`, `Unable to log in with provided credentials`, `inactive`,
`credentials`, `invalid_credentials` o equivalentes se muestran siempre como:

```text
Correo o contrasena incorrectos.
```

Motivo: no revelar existencia, actividad o verificacion de cuentas desde login,
y evitar que una contrasena mal escrita se interprete como cuenta inactiva.

## Reglas para social login

`/auth/google` y `/auth/facebook` no son obligatorios como login activo. Son
obligatorios como decision controlada:

- Si el proveedor esta habilitado: implementar callback y errores.
- Si el proveedor no esta habilitado: mostrar pagina `provider_unavailable`.
- No mostrar botones sociales en login si la aplicacion no tiene proveedor
  configurado.

## Aplicacion por proyecto

| Proyecto | Estado esperado |
|---|---|
| REFAPART | Debe quedar implementado primero por ser flujo activo. |
| JOBCRON | Debe adoptar login/reset/resend/activation antes de panel productivo. |
| MEXINGSOF | Debe adoptar rutas Auth solo si se habilita panel/admin con usuario. |
| TECNOTELEC | Debe adoptar rutas Auth antes de cotizador privado, carrito o admin. |
| LEXNOVA | Se usa como referencia de cobertura, pero debe alinearse a Gateway General y estados seguros. |

## Estructura recomendada

Cada web debe crear componentes propios de marca y servicios compartidos locales:

```text
features/auth/components/AuthUi.tsx
features/auth/services/auth-service.ts
lib/api/gateway-client.ts
app/auth/<evento>/page.tsx
```

Si el proyecto ya usa otra arquitectura, debe conservarla solo si cumple:

- Gateway General;
- `X-Application-Code`;
- estados seguros;
- rutas canonicas o aliases;
- validacion de lint/build.

## Validacion

Ejecutar:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs/scripts/validate-web-auth-events.ps1
```

Para cada web, el reporte debe indicar:

- rutas presentes;
- aliases presentes;
- rutas reservadas o faltantes;
- si existe cliente Gateway;
- si existe feature Auth reusable;
- si requiere implementacion o solo documentacion.

## Decision

La existencia de carpetas en LexNova no convierte automaticamente esas rutas en
estandar productivo. El estandar productivo es este documento. LexNova aporta la
cobertura de eventos; cada web debe implementar esos eventos con su identidad,
su codigo de aplicacion y su consumo real del Gateway General.
