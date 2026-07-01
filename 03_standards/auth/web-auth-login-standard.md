# Estandar de login Auth para webs

## Objetivo

Definir el flujo obligatorio de autenticacion para proyectos web del ecosistema.

## Regla principal

Todo proyecto web nuevo debe incluir login estandar contra Auth, salvo que su
documentacion canonica declare explicitamente:

```text
auth_required: false
```

La excepcion debe explicar motivo, alcance y riesgos. Un sitio publico puede
tener rutas sin login, pero cualquier cuenta, panel, compra, administracion o
operacion privada debe pasar por Auth.

## Flujo oficial

El frontend no consume Auth directamente.

```text
Frontend Web
-> API.PY.DJANGO.Gateway
-> API.PY.DJANGO.Auth
```

No permitido:

```text
Frontend Web -> API.PY.DJANGO.Auth
Frontend Web -> Core APIs
Frontend Web -> Base de datos
```

## Responsabilidad del frontend

Debe encargarse de:

- mostrar login, registro si aplica y recuperacion de contrasena;
- reflejar sesion, permisos y errores para experiencia de usuario;
- redirigir segun estado de sesion;
- ocultar opciones que el usuario no puede usar;
- enviar `X-Application-Code` mediante el Gateway cuando aplique.

No debe encargarse de:

- validar permisos como unica barrera;
- guardar secretos;
- generar tokens manualmente;
- consultar bases de datos o APIs core directamente.

## Responsabilidad del Gateway General

Cada proyecto con login debe exponer endpoints de frontera:

```text
POST /api/auth/login/
POST /api/auth/logout/
POST /api/auth/refresh/
GET  /api/auth/me/
GET  /api/auth/me/permissions/
POST /api/auth/register/
POST /api/auth/password/reset/
POST /api/auth/password/reset/confirm/
POST /api/auth/password/change/
```

El Gateway adapta nombres, errores y permisos para la web. La autoridad real de
usuarios, roles, permisos, sesiones, refresh tokens y auditoria vive en Auth.

## Application Code

Cada proyecto debe existir como aplicacion en Auth.

Ejemplos:

```text
LEXNOVA
TECNOTELEC
DOCUCORE
REFAPART
IMAGRAFITY
JOBCRON
FISCORA
MEXINGSOF
```

Las llamadas de sesion o permisos deben poder recibir:

```text
X-Application-Code: <APPLICATION_CODE>
```

## Variables web obligatorias

`.env.local.example` debe incluir:

```text
NEXT_PUBLIC_APP_NAME=
NEXT_PUBLIC_HOST=
NEXT_PUBLIC_ENVIRONMENT=
NEXT_PUBLIC_GATEWAY_BASE_URL=
NEXT_PUBLIC_APPLICATION_CODE=
```

No se deben publicar secretos como `NEXT_PUBLIC_*`.

## Rutas estandar

Todo proyecto con Auth debe definir o justificar la ausencia de:

```text
/login
/register
/forgot-password
/reset-password
/logout
/dashboard
/profile
/settings
/403
```

Si no existe registro publico, `/register` debe mostrar un estado controlado o
redirigir segun configuracion.

El alcance por ruta se define en:

```text
Docs/03_standards/auth/web-auth-route-scope-standard.md
```

No toda ruta debe exigir sesion. Las rutas publicas y opcionales deben tratar
`401` de `/auth/me/` como usuario anonimo esperado, sin registrar errores falsos
en consola.

## Modulo frontend sugerido

```text
features/auth/
  components/
  hooks/
  services/
  store/
  types.ts
```

Capacidades esperadas:

```text
useAuth()
useSession()
usePermissions()
requireAuth()
requirePermission()
logout()
refreshSession()
```

## Proteccion de rutas

- Usuario sin sesion: redirigir a `/login`.
- Usuario sin permiso: mostrar `/403`.
- Sesion expirada: intentar refresh.
- Refresh fallido: limpiar sesion y redirigir.
- Usuario autenticado en `/login`: redirigir a su entrada privada.

## Permisos

El frontend solo refleja permisos. Gateway y APIs deben validar siempre.

El frontend puede:

- ocultar botones;
- ocultar menus;
- bloquear navegacion visual;
- mostrar mensajes.

No puede sustituir validacion backend.

## Error de sesion no persistida despues de login

Si `POST /auth/login/` responde correctamente pero la llamada inmediata a
`GET /auth/me/` o `GET /auth/me/permissions/` devuelve `401` con mensajes como
`Las credenciales de autenticacion no se proveyeron`, no se debe mostrar como
contrasena incorrecta.

Ese caso significa:

- el navegador no conservo o no envio las cookies `access`/`refresh`;
- Gateway no reexpuso correctamente `Set-Cookie`;
- `CORS_ALLOW_CREDENTIALS` u origen permitido no coincide;
- la web y el Gateway usan hosts distintos (`localhost` vs `127.0.0.1`) o
  dominios incompatibles;
- `AUTH_COOKIE_SAMESITE`/`AUTH_COOKIE_SECURE` no coincide con el ambiente.

En desarrollo local, queda prohibido mezclar hosts loopback entre web y
Gateway. Si el usuario abre la web en `http://127.0.0.1:<puerto>`, el cliente
web debe llamar al Gateway como `http://127.0.0.1:<puerto-gateway>`. Si abre la
web en `http://localhost:<puerto>`, debe llamar al Gateway como
`http://localhost:<puerto-gateway>`.

```text
localhost web -> localhost gateway
127.0.0.1 web -> 127.0.0.1 gateway
```

Los clientes web pueden normalizar automaticamente `localhost`/`127.0.0.1` solo
cuando ambos hosts son loopback. No se permite hacer esta sustitucion con
dominios productivos.

Gateway debe reenviar las cookies emitidas por Auth con atributos completos:

```text
Set-Cookie access=<token>; Path=/; HttpOnly; SameSite=<ambiente>; Secure=<ambiente>; Max-Age=<access>
Set-Cookie refresh=<token>; Path=/; HttpOnly; SameSite=<ambiente>; Secure=<ambiente>; Max-Age=<refresh>
```

Mensaje recomendado en desarrollo:

```text
El inicio de sesion fue aceptado, pero el navegador no conservo la sesion.
Verifica cookies, CORS y que estes entrando a la web con el mismo host
configurado para el Gateway.
```

Mensaje recomendado en produccion:

```text
No pudimos confirmar tu sesion. Intenta de nuevo o contacta soporte.
```

El cliente Gateway debe tratar `401` de `/auth/me/` como un estado esperado de
sesion ausente y no debe registrar `console.error` falso. Solo debe registrar
errores tecnicos cuando el endpoint falle con error real de red, `5xx` o payload
inesperado.

## Migracion de proyectos existentes

Antes de reemplazar login existente, crear:

```text
Docs/02_projects/<proyecto>/security/auth-migration.md
```

Debe usar la plantilla:

```text
Docs/02_projects/_templates/auth-migration-template.md
```

## Checklist de cierre

- [ ] Tiene `NEXT_PUBLIC_APPLICATION_CODE`.
- [ ] Consume Gateway, no Auth directo.
- [ ] Tiene login y logout.
- [ ] Tiene refresh de sesion.
- [ ] Tiene `/me` y `/me/permissions`.
- [ ] Tiene pagina `/403`.
- [ ] Protege rutas privadas.
- [ ] Normaliza errores de Auth.
- [ ] Declara excepcion si `auth_required: false`.
- [ ] Tiene `auth-migration.md` si era proyecto viejo.
- [ ] Esta registrado en `api-version-matrix.md`.
