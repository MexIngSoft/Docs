# Estandar de feedback Auth en webs

## Objetivo

Unificar la respuesta visual de login, registro, recuperacion, verificacion y
errores Auth para que ninguna web muestre estados ambiguos, redirecciones
silenciosas o errores tecnicos crudos.

## Regla principal

Toda web debe resolver los flujos Auth con componentes equivalentes a:

- `AuthLayout`
- `AuthCard`
- `AuthHeader`
- `AuthInput`
- `AuthButton`
- `AuthLink`
- `AuthAlert`
- `AuthSuccess`
- `AuthError`
- `AuthWarning`
- `AuthInfo`
- `AuthLoader`
- `AuthResultScreen`
- `AuthResendEmail`

Los nombres concretos pueden adaptarse al framework de cada web, pero los
estados y mensajes no deben omitirse.

## Estados obligatorios

| Estado | Uso |
|---|---|
| `loading` | Solicitud enviada y esperando respuesta. |
| `success` | Operacion completada. |
| `warning` | Accion incompleta, enlace faltante o paso pendiente. |
| `error` | Error recuperable para usuario. |
| `info` | Siguiente paso o explicacion no bloqueante. |
| `network_error` | Gateway, CORS o Auth no disponible. |
| `provider_error` | Proveedor externo no disponible. |
| `token_expired` | Token expirado o usado. |
| `token_invalid` | Token invalido. |
| `email_used` | Correo ya registrado. |
| `password_invalid` | Contrasena no cumple politica. |
| `user_not_verified` | Cuenta pendiente de verificacion. |
| `user_blocked` | Cuenta bloqueada o sin permiso. |

## Matriz de mensajes por evento

| Evento | Caso | Mensaje usuario | Accion visible | Console/overlay |
|---|---|---|---|---|
| Login | Correo o contrasena incorrectos, cuenta inexistente, cuenta inactiva ambigua o credenciales invalidas | Correo o contrasena incorrectos. | Mantener formulario, permitir reintento, mostrar enlace a recuperacion. | No mostrar `console.error` por `400`/`401` esperados. |
| Login | Gateway/Auth no disponible | No pudimos completar la solicitud en este momento. | Mostrar reintento y soporte si hay folio. | Desarrollo puede registrar diagnostico sin secretos. |
| Registro | Cuenta creada | Verifica tu correo electronico. | Mostrar correo destino, abrir proveedor, reenviar si endpoint existe, login. | No afirmar entrega final del proveedor. |
| Registro | Correo ya registrado | Ese correo ya esta registrado. | Ofrecer login y reenvio solo si el flujo esta relacionado con verificacion. | No registrar como error tecnico esperado. |
| Registro | Password invalido | La contrasena no cumple los requisitos. | Mantener formulario y reglas visibles. | No registrar como error tecnico esperado. |
| Reenvio | Solicitud recibida | Solicitamos reenviar el correo. | Cooldown y abrir proveedor de correo. | Registrar detalle solo si falla proveedor/Gateway. |
| Activacion | Token valido | Correo verificado correctamente. | CTA a login. | Sin error. |
| Activacion | Token vencido/invalido | El enlace es invalido o expiro. | CTA a reenvio de verificacion. | Desarrollo puede registrar codigo sin token. |
| Recuperacion password | Solicitud recibida | Si el correo existe, recibiras instrucciones. | CTA a login y abrir correo si aplica. | No revelar existencia de correo. |
| Reset password | Token vencido/invalido | El enlace es invalido o expiro. | CTA a solicitar otro enlace. | Desarrollo puede registrar codigo sin token. |
| Social login | Proveedor no configurado | Este proveedor no esta activo para esta aplicacion. | CTA a login con correo. | No mostrar boton social si no esta habilitado. |

## Registro de cuenta

El registro nunca debe redirigir silenciosamente al login.

Despues de crear cuenta debe mostrar una pantalla de resultado con:

- titulo `Verifica tu correo electronico`;
- mensaje de correo de verificacion enviado;
- correo destino si la API lo permite;
- instrucciones para revisar bandeja de entrada, Spam, Promociones o correo no deseado;
- CTA para abrir proveedor de correo si el dominio es conocido;
- CTA generico `Abrir mi correo` si el dominio no es conocido;
- CTA para ir al login;
- CTA de reenvio si existe endpoint habilitado.

Si el backend no distingue si el correo fue enviado o fallo, la web debe marcar
el reenvio o estado fino como `PENDIENTE_DE_DEFINIR` y no fingir confirmacion
tecnica de entrega.

## Errores de red

`Failed to fetch` nunca se muestra literal al usuario final.

Mensaje minimo en produccion:

```text
No pudimos completar la solicitud en este momento. Intenta de nuevo o contacta soporte con el folio disponible.
```

El mensaje tecnico con Docker, Gateway, Auth y CORS solo puede mostrarse en
desarrollo. La validacion obligatoria es el preflight real documentado en
`auth-frontend-error-handling-standard.md`.

## Reenvio de correo

El reenvio solo se muestra como accion activa si existe endpoint via Gateway.

Endpoint esperado:

```text
POST /api/v1/auth/email/verification/resend/
```

Si no existe, la UI puede mostrar el estado como no disponible y registrar:

```text
PENDIENTE_DE_DEFINIR: endpoint de reenvio Auth/Gateway.
```

Gateway puede exponer un alias compatible:

```text
POST /auth/email/resend-verification
```

pero ninguna web debe crear solucion propia ni llamar Auth directo.

## Diagnostico de correo

Las reglas de estados, reintentos, SES, logs detallados, errores de desarrollo
y mensajes seguros de produccion estan en:

```text
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
```

La UI puede mostrar detalle tecnico solo en desarrollo y nunca debe exponer
tokens, passwords, cookies, secretos, stack traces ni payloads crudos.

## Proveedor de correo

Deteccion permitida:

| Dominio | Boton |
|---|---|
| `gmail.com` | Abrir Gmail |
| `outlook.com`, `hotmail.com`, `live.com` | Abrir Outlook |
| `yahoo.com` | Abrir Yahoo Mail |
| `icloud.com`, `me.com` | Abrir iCloud Mail |
| `proton.me`, `protonmail.com` | Abrir Proton Mail |

Si el dominio no esta en la tabla, mostrar solo:

```text
Abrir mi correo
Utiliza tu proveedor habitual de correo electronico.
```

No se deben inventar proveedores.

## Branding

Cada web debe usar su identidad visual canonica. En REFAPART:

- negro/grafito como fondo premium;
- tarjetas blancas;
- CTA rojo REFAPART;
- iconografia limpia;
- textos orientados a cliente;
- sin exponer proveedor tecnico, SES, logs internos ni detalles de operacion.

## Validacion minima

Validar:

```text
/login
/register
/forgot-password
/reset-password
/change-password
/verify-email
/auth/success
/auth/error
/logout
/403
```

Cada ruta debe compilar, renderizar feedback claro y consumir Auth unicamente
a traves del Gateway General.
