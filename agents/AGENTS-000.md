'Sí, esto ya no es solo “un bug de registro”; es un **proceso Auth incompleto por aplicación**.

El error **“Failed to fetch”** normalmente apunta a una de estas causas: URL Gateway incorrecta, Gateway/Auth apagado, CORS, endpoint inexistente, variable `NEXT_PUBLIC_GATEWAY_BASE_URL` mal configurada, o que el frontend esté llamando directo a Auth cuando la documentación exige `Frontend -> Gateway -> Auth` .

Te dejo el agente completo para Codex:

````md
# AGENT — Auditoría y estandarización Auth por aplicación

## Objetivo

Auditar, corregir y documentar todos los procesos Auth del ecosistema para que cada web tenga registro, login, logout, sesión, permisos, recuperación de contraseña, cambio de password y correos personalizados por aplicación.

El caso inicial obligatorio es REFAPART, donde el registro falla con:

```text
Failed to fetch
````

## Rama obligatoria

```text
dev
```

## Lectura obligatoria

Antes de tocar código o documentación, leer:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/03_standards/auth/web-auth-login-standard.md
Docs/03_standards/auth/auth-versioning-standard.md
Docs/03_standards/frontend/nextjs-project-standard.md
Docs/02_projects/refapart/README.md
Docs/02_projects/refapart/frontend.md
Docs/02_projects/refapart/architecture.md
Docs/02_projects/_ecosystem/api-version-matrix.md
```

## Diagnóstico obligatorio del bug REFAPART

Validar:

1. Que `NEXT_PUBLIC_GATEWAY_BASE_URL` exista.
2. Que `NEXT_PUBLIC_APPLICATION_CODE=REFAPART` exista.
3. Que el frontend no llame Auth directo.
4. Que el registro use Gateway.
5. Que exista endpoint:

```text
POST /api/auth/register/
```

6. Que Gateway enrute correctamente hacia Auth.
7. Que CORS permita la web REFAPART.
8. Que el backend responda errores normalizados.
9. Que el botón de registro no oculte el error real detrás de “Failed to fetch”.
10. Que `npm run build` no falle.

## Regla Auth obligatoria

Toda web debe consumir Auth así:

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

## Endpoints mínimos requeridos en Gateway

Validar o implementar frontera Gateway:

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

Si algunos endpoints son versionados, respetar el estándar:

```text
/api/v1/auth/...
```

y documentar compatibilidad.

## Registro por aplicación

Cada web debe estar registrada en Auth con su `APPLICATION_CODE`.

Aplicaciones mínimas a validar:

```text
REFAPART
JOBCRON
DOCUCORE
LEXNOVA
TECNOTELEC
IMAGRAFITY
FISCORA
```

Cada aplicación debe tener configuración propia:

```text
application_code
application_name
public_site_url
login_url
register_url
password_reset_url
password_reset_confirm_url
support_email
notification_from_email
notification_from_name
brand_logo_url
brand_primary_color
brand_secondary_color
brand_background_color
email_template_set
auth_enabled
registration_enabled
password_reset_enabled
```

## Correo remitente operativo

Configurar como correo base de notificaciones:

```text
cash.1dip1@gmail.com
```

Este correo está configurado con Amazon para envío de notificaciones.

No hardcodear este correo dentro de componentes frontend.

Debe vivir en configuración backend/Auth/env:

```text
AUTH_NOTIFICATION_FROM_EMAIL=cash.1dip1@gmail.com
```

o equivalente seguro según la arquitectura existente.

## Correos personalizados por marca

No usar plantillas genéricas para todas las webs.

Crear sistema de plantillas por aplicación para:

```text
registro / activación
bienvenida
olvidé mi contraseña
confirmación de reset
cambio de password
notificación de login si aplica
```

Para REFAPART, los correos deben usar identidad visual REFAPART:

```text
Negro / grafito / blanco / rojo REFAPART
Logo REFAPART
Texto claro
CTA rojo
Footer con nombre REFAPART
```

## Variables requeridas por web

Cada `.env.local.example` debe incluir:

```text
NEXT_PUBLIC_APP_NAME=
NEXT_PUBLIC_HOST=
NEXT_PUBLIC_ENVIRONMENT=
NEXT_PUBLIC_GATEWAY_BASE_URL=
NEXT_PUBLIC_APPLICATION_CODE=
```

Para REFAPART:

```text
NEXT_PUBLIC_APP_NAME=REFAPART
NEXT_PUBLIC_APPLICATION_CODE=REFAPART
```

## Documentación nueva requerida

Crear o actualizar:

```text
Docs/03_standards/auth/auth-application-registration-standard.md
Docs/03_standards/auth/auth-email-notification-standard.md
Docs/03_standards/auth/auth-frontend-error-handling-standard.md
Docs/02_projects/refapart/security/auth-migration.md
Docs/02_projects/refapart/security/auth-email-branding.md
Docs/agents/EXECUTION_REPORT.md
```

## Estándar de errores frontend

El frontend nunca debe mostrar solo:

```text
Failed to fetch
```

Debe mapear errores así:

```text
Gateway no disponible
Servicio Auth no disponible
Correo ya registrado
Contraseña inválida
Token expirado
Link inválido
CORS o conexión bloqueada
Error inesperado
```

El error técnico debe quedar en consola/dev logs, pero el usuario debe ver mensaje entendible.

## Validaciones funcionales obligatorias REFAPART

Probar manual o automatizadamente:

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

Flujos mínimos:

1. Registro nuevo.
2. Registro con correo repetido.
3. Login correcto.
4. Login incorrecto.
5. Recuperar contraseña.
6. Abrir link de reset.
7. Confirmar nueva contraseña.
8. Cambiar contraseña con sesión iniciada.
9. Refresh de sesión.
10. Logout.
11. Acceso a ruta privada sin sesión.
12. Acceso sin permiso a ruta protegida.

## Validaciones técnicas

Ejecutar según aplique:

```bash
npm run lint
npm run build
python manage.py check
docker compose config --quiet
```

## Criterio de cierre

El agent queda completado solo si:

* REFAPART ya no muestra `Failed to fetch` sin detalle.
* Registro REFAPART llama al Gateway.
* `APPLICATION_CODE=REFAPART` viaja en las solicitudes.
* Los endpoints Auth mínimos están validados.
* El correo base `cash.1dip1@gmail.com` queda documentado como remitente operativo.
* Las plantillas de correo quedan preparadas por aplicación.
* REFAPART tiene plantilla visual propia.
* La matriz de aplicaciones/Auth queda actualizada.
* Se actualiza `EXECUTION_REPORT.md`.

## Prohibiciones

* No llamar Auth directo desde frontend.
* No hardcodear secretos en frontend.
* No usar una sola plantilla genérica para todas las marcas.
* No romper login existente de otros proyectos.
* No migrar todos los proyectos sin matriz.
* No ocultar errores reales bajo “Failed to fetch”.

```

La prioridad real sería: **primero arreglar registro REFAPART**, luego estandarizar correos por aplicación, y después validar todos los módulos Auth web por web.
```
