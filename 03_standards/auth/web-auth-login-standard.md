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
LEADHUNTER
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
