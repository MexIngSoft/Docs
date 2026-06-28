# AGENTS-000 — Auth Refapart, Gateway, Correos y UI

## Estado

Activo.

Este agente absorbe la información vigente de:

* `Docs/agents/AGENTS-000.md`
* `Docs/agents/AGENTS-001.md`

`AGENTS-001` debe quedar marcado como absorbido por este agente para evitar duplicidad.

## Objetivo

Auditar, corregir y documentar el flujo completo de autenticación de REFAPART y dejar un estándar reutilizable para todas las webs del ecosistema.

Debe resolver:

* fallos de registro tipo `Failed to fetch`;
* errores ocultos detrás de mensajes genéricos;
* redirección silenciosa después del registro;
* falta de confirmación visual del envío de correo;
* falta de confirmación técnica del envío por Amazon SES;
* pantallas Auth antiguas o inconsistentes con la Home;
* uso incorrecto de Auth directo desde frontend;
* plantillas de correo genéricas;
* exposición pública de proveedores internos en Refapart.

## Rama obligatoria

```text
dev
```

## Lectura mínima obligatoria

Antes de modificar código o documentación, leer únicamente:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/agents/EXECUTION_REPORT.md
Docs/03_standards/auth/web-auth-login-standard.md
Docs/03_standards/auth/auth-versioning-standard.md
Docs/03_standards/frontend/nextjs-project-standard.md
Docs/03_standards/architecture/api-gateway-standard.md
Docs/02_projects/refapart/README.md
Docs/02_projects/refapart/frontend.md
Docs/02_projects/refapart/architecture.md
Docs/02_projects/refapart/visual-identity.md
Docs/02_projects/_ecosystem/api-version-matrix.md
Docs/02_projects/_ecosystem/gateway-matrix.md
```

No leer todo `Docs`.

No usar `_archive/` ni `agents/_archive/` como fuente vigente salvo trazabilidad.

## Arquitectura obligatoria

Toda web debe consumir Auth así:

```text
Frontend Web -> API.PY.DJANGO.Gateway -> API.PY.DJANGO.Auth
```

Prohibido:

```text
Frontend Web -> API.PY.DJANGO.Auth
Frontend Web -> Core APIs
Frontend Web -> Base de datos
```

## Diagnóstico obligatorio REFAPART

Validar:

1. Que exista `NEXT_PUBLIC_GATEWAY_BASE_URL`.
2. Que exista `NEXT_PUBLIC_APPLICATION_CODE=REFAPART`.
3. Que el frontend no llame Auth directo.
4. Que registro, login, reset y sesión usen Gateway.
5. Que exista o esté documentado el endpoint:

```text
POST /api/auth/register/
```

6. Que Gateway enrute correctamente hacia Auth.
7. Que CORS permita la web REFAPART.
8. Que Auth responda errores normalizados.
9. Que el frontend no oculte errores reales detrás de `Failed to fetch`.
10. Que el usuario siempre reciba mensaje visual claro.

## Endpoints mínimos Auth vía Gateway

Validar o documentar compatibilidad para:

```text
POST /api/auth/login/
POST /api/auth/logout/
POST /api/auth/refresh/
GET /api/auth/me/
GET /api/auth/me/permissions/
POST /api/auth/register/
POST /api/auth/password/reset/
POST /api/auth/password/reset/confirm/
POST /api/auth/password/change/
POST /api/auth/email/verification/resend/
```

Si el estándar vigente usa versionado, respetar:

```text
/api/v1/auth/...
```

## Registro por aplicación

Cada web debe tener `APPLICATION_CODE`.

Aplicaciones mínimas a validar documentalmente:

```text
REFAPART
JOBCRON
DOCUCORE
LEXNOVA
TECNOTELEC
IMAGRAFITY
FISCORA
UNIVERSAL_POS
MEXINGSOF
```

Cada aplicación debe soportar configuración propia:

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

## Correo remitente operativo

Correo base operativo documentado:

```text
cash.1dip1@gmail.com
```

Debe vivir en configuración backend/Auth o variables seguras.

Prohibido hardcodearlo en frontend.

Ejemplo aceptable:

```text
AUTH_NOTIFICATION_FROM_EMAIL=cash.1dip1@gmail.com
```

## Flujo correcto de registro

El registro debe funcionar así:

1. Usuario llena formulario.
2. Frontend llama Gateway.
3. Gateway llama Auth.
4. Auth crea usuario.
5. Auth solicita envío de correo.
6. Amazon SES responde.
7. Backend registra resultado.
8. Frontend muestra estado claro.

Prohibido:

* redirigir directo al login sin confirmación;
* mostrar pantalla vacía;
* mostrar solo `Failed to fetch`;
* asumir que el correo se envió sin confirmación backend;
* exponer nombres de proveedores internos.

## Estados backend obligatorios

El backend debe distinguir:

```text
USER_CREATED_EMAIL_SENT
USER_CREATED_EMAIL_FAILED
USER_ALREADY_EXISTS
USER_CREATED_PENDING_EMAIL_RETRY
REGISTER_FAILED
```

## Mensajes frontend esperados

Caso éxito:

```text
Cuenta creada correctamente.
Correo enviado correctamente.
Te enviamos un correo de verificación a: usuario@correo.com
Revisa tu bandeja de entrada. Si no aparece, revisa Spam o Promociones.
```

Acciones:

```text
Abrir Gmail
Abrir Outlook
Reenviar correo
Ir al login
```

Caso cuenta creada pero correo falló:

```text
Tu cuenta fue creada, pero no pudimos enviar el correo de verificación.
Puedes intentar reenviarlo en unos minutos.
```

Caso fallo total:

```text
No fue posible crear la cuenta. Intenta nuevamente.
```

## Estándar global de feedback Auth

Ninguna acción Auth puede terminar sin respuesta visual.

Crear o reutilizar componentes:

```text
AuthAlert
AuthSuccess
AuthError
AuthWarning
AuthInfo
AuthLoader
AuthResultScreen
AuthResendEmail
```

Estados obligatorios:

```text
loading
success
warning
error
timeout
provider_error
network_error
token_expired
token_invalid
email_already_used
password_invalid
user_not_verified
user_blocked
```

## Logs técnicos de correos

Crear o documentar modelo equivalente:

```text
email_delivery_logs
```

Campos mínimos:

```text
id
application_code
user_id
email
template
provider
provider_message_id
provider_request_id
status
error_code
error_message
payload_hash
created_at
updated_at
```

Estados:

```text
PENDING
SENT
FAILED
RETRYING
BOUNCED
COMPLAINT
```

Amazon SES debe guardar:

```text
MessageId
RequestId
Status
Error
```

## Reenvío de correo de verificación

Endpoint requerido o documentado:

```text
POST /api/auth/email/verification/resend/
```

Reglas:

* máximo 1 reenvío cada 60 segundos;
* máximo 5 por hora;
* máximo 10 por día;
* registrar IP;
* registrar user agent;
* registrar application code;
* proteger contra abuso.

Frontend debe mostrar contador:

```text
Podrás reenviar otro correo en 00:48
```

## Plantillas de correo por aplicación

No usar una sola plantilla genérica para todas las marcas.

Cada aplicación debe soportar:

```text
verificación de cuenta
bienvenida
recuperación de contraseña
confirmación de reset
contraseña cambiada
alerta de seguridad
reenvío de verificación
```

REFAPART debe usar:

```text
fondo negro/grafito
tarjeta blanca
botón rojo
logo REFAPART
texto claro
footer limpio
sin mencionar proveedores
```

## Pantallas Auth a rediseñar

Aplicar diseño moderno y coherente con Home en:

```text
/login
/register
/forgot-password
/reset-password
/change-password
/verify-email
/auth/success
/auth/error
/403
```

Componentes esperados:

```text
AuthLayout
AuthCard
AuthHeader
AuthBrandPanel
AuthInput
AuthButton
AuthLink
AuthAlert
AuthFooter
AuthBackground
```

Validar:

* layout;
* spacing;
* tipografía;
* logo;
* inputs;
* botones;
* bordes;
* sombras;
* fondo;
* responsive;
* mensajes;
* consistencia con Home.

## Textos públicos prohibidos en Refapart

Eliminar de Home y páginas públicas:

```text
proveedores
proveedores verificados
proveedores registrados
operación controlada
proveedor queda detrás
compra operada por REFAPART
fletera según proveedor
```

Regla:

```text
El proveedor es operación interna.
El cliente debe percibir que REFAPART resuelve todo.
```

Reemplazos sugeridos:

```text
Encuentra cualquier pieza
Refacciones nuevas y usadas
Búsqueda rápida y precisa
Compra segura
Atención personalizada
Envíos a todo México
Soporte durante todo el proceso
Miles de opciones disponibles
```

## Home Refapart

Alinear la Home con la maqueta aprobada.

Validar:

* header;
* logo;
* buscador;
* hero;
* auto/fondo;
* tarjeta flotante;
* categorías;
* búsquedas populares;
* bloque de confianza;
* resultados destacados;
* estado vacío;
* responsive.

## Documentación obligatoria

Crear o actualizar:

```text
Docs/03_standards/auth/auth-feedback-standard.md
Docs/03_standards/auth/auth-email-notification-standard.md
Docs/03_standards/auth/auth-application-registration-standard.md
Docs/03_standards/auth/auth-frontend-error-handling-standard.md
Docs/02_projects/refapart/security/auth-migration.md
Docs/02_projects/refapart/security/auth-email-branding.md
Docs/02_projects/refapart/security/auth-ui-audit.md
Docs/02_projects/refapart/frontend.md
Docs/02_projects/refapart/visual-identity.md
Docs/agents/EXECUTION_REPORT.md
```

## Validaciones funcionales

Validar según aplique:

```text
/register
/login
/forgot-password
/reset-password
/change-password
/verify-email
/logout
/dashboard
/profile
/settings
/403
```

Flujos mínimos:

1. Registro exitoso.
2. Registro con correo repetido.
3. Registro con correo inválido.
4. Registro con contraseña inválida.
5. Fallo Gateway.
6. Fallo Auth.
7. Fallo SES.
8. Reenvío de correo.
9. Login correcto.
10. Login incorrecto.
11. Usuario no verificado.
12. Recuperación de contraseña.
13. Token expirado.
14. Token inválido.
15. Cambio exitoso de contraseña.
16. Refresh de sesión.
17. Logout.
18. Acceso sin sesión.
19. Acceso sin permiso.

## Validaciones técnicas

Ejecutar solo si aplica y si el tipo de cambio lo requiere:

```bash
npm run lint
npm run build
python manage.py check
docker compose config --quiet
```

Si solo hay cambios documentales, no ejecutar build, Docker ni migraciones.

## Fuera de alcance

No hacer:

* llamar Auth directo desde frontend;
* hardcodear secretos en frontend;
* usar plantilla genérica para todas las marcas;
* romper login existente de otros proyectos;
* migrar todos los proyectos sin matriz;
* ocultar errores reales bajo `Failed to fetch`;
* mencionar proveedores internos en UI pública;
* modificar `main` o `pro`;
* leer todo `Docs`;
* usar `_archive/` como fuente vigente.

## Reporte obligatorio

Actualizar:

```text
Docs/agents/EXECUTION_REPORT.md
```

Registrar:

* agente ejecutado: `AGENTS-000`;
* agente absorbido: `AGENTS-001`;
* rama usada;
* documentos leídos;
* Context Pack usado;
* archivos creados;
* archivos modificados;
* endpoints validados;
* variables validadas;
* errores corregidos;
* pantallas revisadas;
* correos revisados;
* validaciones ejecutadas;
* validaciones no ejecutadas y motivo;
* pendientes reales;
* bloqueos;
* decisiones documentales.

## Criterio de cierre

El agente queda completado solo si:

* REFAPART ya no muestra `Failed to fetch` sin detalle;
* registro REFAPART llama al Gateway;
* `APPLICATION_CODE=REFAPART` viaja en solicitudes;
* endpoints Auth mínimos están validados o documentados;
* el usuario siempre sabe qué ocurrió;
* el registro no redirige silenciosamente;
* el correo enviado queda confirmado técnica y visualmente;
* existen logs verificables del proveedor de correo;
* Auth se ve moderno y alineado con Home;
* pantallas Auth son responsive;
* no existe referencia pública a proveedores internos;
* REFAPART tiene correos personalizados;
* estándar queda listo para futuras webs;
* `EXECUTION_REPORT.md` queda actualizado.

## Resultado esperado

REFAPART debe transmitir:

```text
REFAPART encuentra la pieza, gestiona la compra y acompaña al cliente durante todo el proceso.
```

Nunca debe transmitir:

```text
REFAPART solo conecta proveedores.
```
