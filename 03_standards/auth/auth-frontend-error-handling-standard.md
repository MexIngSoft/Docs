# Estandar de errores Auth en frontend

## Objetivo

Evitar que las webs muestren errores tecnicos crudos como `Failed to fetch`
cuando falla Auth, Gateway, CORS, credenciales o un token.

## Regla principal

El frontend debe transformar errores tecnicos en mensajes claros para usuario,
sin ocultar el error tecnico en consola/logs de desarrollo.

Produccion nunca debe mostrar detalles utiles solo para programacion u
operacion interna: Docker, CORS, Gateway interno, Auth interno, SES, SMTP,
variables de entorno, stack traces, SQL, headers completos ni payloads de
proveedor. Produccion debe mostrar un mensaje seguro con folio/correlation id.

Desarrollo si puede mostrar diagnostico tecnico controlado para acelerar
correccion, siempre sin secretos, tokens ni passwords. La regla completa de
correo Auth esta en:

```text
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
```

## Mapeo minimo

| Caso | Mensaje de usuario |
|---|---|
| Gateway no responde | No pudimos completar la solicitud. Intenta de nuevo o contacta soporte con el folio disponible. |
| Auth no responde via Gateway | No pudimos completar la solicitud. Intenta de nuevo o contacta soporte con el folio disponible. |
| `Failed to fetch` | No pudimos conectar con el servicio en este momento. |
| Login con correo o password incorrecto | Correo o contrasena incorrectos. |
| Login con payload `No active account found with the given credentials` | Correo o contrasena incorrectos. |
| Login con payload `Unable to log in with provided credentials` | Correo o contrasena incorrectos. |
| Login con payload `inactive` sin codigo explicito de verificacion pendiente | Correo o contrasena incorrectos. |
| Correo duplicado | Ese correo ya esta registrado. |
| Password invalido | La contrasena no cumple los requisitos. |
| Token expirado | El enlace es invalido o expiro. |
| Link incompleto | El enlace de recuperacion esta incompleto. |
| `APPLICATION_CODE_REQUIRED` | La aplicacion no envio su codigo de Auth. |
| `APPLICATION_NOT_REGISTERED` | La aplicacion no esta registrada o habilitada en Auth. |
| Error desconocido | No fue posible completar la solicitud. |

## Reglas de implementacion

- No mostrar trazas internas al usuario.
- No reemplazar todos los errores por un mensaje generico.
- Mantener `X-Application-Code` en todas las llamadas Auth.
- Usar Gateway General como unica frontera.
- Separar la URL publica del navegador y la URL interna del contenedor cuando
  la web corre en Docker. El navegador debe usar `NEXT_PUBLIC_GATEWAY_BASE_URL`
  con `http://localhost:8025/api/v1`; SSR/Next server debe usar una variable no
  publica como `GATEWAY_INTERNAL_BASE_URL=http://api-multiproyecto:8025/api/v1`.
  No usar `localhost` para llamadas server-side dentro del contenedor web,
  porque apunta al propio contenedor web y produce `ECONNREFUSED 127.0.0.1:8025`.
- Mantener `CORS_ALLOWED_ORIGINS` del Gateway con todos los puertos web locales
  activos: `3000` a `3009` para `localhost` y `127.0.0.1`.
- Permitir en `CORS_ALLOW_HEADERS` las cabeceras Auth usadas por frontend:
  `x-application-code`, `x-device-fingerprint`, `x-device-name`,
  `x-device-type`, `x-device-os` y `x-device-browser`.
- Registrar el error tecnico en consola solo en desarrollo o en observabilidad
  aprobada.

## Login y seguridad de enumeracion

El login es un evento especial. Cuando el usuario intenta iniciar sesion y Auth
responde con errores ambiguos como:

```text
No active account found with the given credentials
Unable to log in with provided credentials
inactive
credentials
invalid_credentials
```

la web debe mostrar:

```text
Correo o contrasena incorrectos.
```

No debe mostrar:

```text
La cuenta no esta activa.
El usuario no existe.
El correo no esta verificado.
```

salvo que exista un flujo explicito y seguro posterior, por ejemplo una pantalla
de verificacion iniciada desde registro o reenvio. En login, revelar si una
cuenta existe, esta activa o esta verificada facilita enumeracion de usuarios y
confunde a usuarios que solo escribieron mal la contrasena.

El frontend puede registrar el detalle tecnico solo en desarrollo y sin mostrar
payloads crudos al usuario. Los fallos esperados de login (`400`/`401`) no deben
emitir `console.error` visual en el overlay de Next.js; deben manejarse como
estado de formulario.

## Mensajes por ambiente

### Desarrollo

Para `Failed to fetch`, Gateway caido o CORS, el panel de desarrollo puede
mostrar:

```text
No se pudo conectar con el Gateway. Verifica Docker, Gateway, Auth y CORS.
```

Debe incluir, si existen:

- `error_code`;
- `correlation_id`;
- endpoint Gateway;
- origin;
- headers solicitados;
- estado HTTP;
- pista de preflight.

### Produccion

El usuario final debe ver:

```text
No pudimos completar la solicitud en este momento. Intenta de nuevo o contacta soporte con el folio {correlation_id}.
```

No debe ver nombres de contenedores, rutas internas, proveedor, configuracion
ni stack traces.

## Diagnostico obligatorio de CORS

Si una web muestra en desarrollo:

```text
No se pudo conectar con el Gateway. Verifica que Docker, Gateway y Auth esten
levantados y que CORS permita esta web.
```

validar primero el preflight real:

```bash
curl -i -X OPTIONS "http://127.0.0.1:8025/api/v1/auth/register/" \
  -H "Origin: http://localhost:<PUERTO_WEB>" \
  -H "Access-Control-Request-Method: POST" \
  -H "Access-Control-Request-Headers: content-type,x-application-code"
```

La respuesta debe incluir:

```text
Access-Control-Allow-Origin: http://localhost:<PUERTO_WEB>
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: ... x-application-code ...
```

Si no aparece, corregir `Docker.API.PY/.env`,
`Docker.API.PY/.env.example` y el default de
`API.PY.DJANGO.Gateway/config/settings.py`. No es suficiente que Gateway
responda `GET /health/` con HTTP 200.

## Validacion minima

Probar:

```text
/register
/login
/forgot-password
/reset-password
/logout
/dashboard
/profile
/settings
/403
```

Los errores de red y Auth deben mostrar mensajes accionables, nunca solo
`Failed to fetch`.
