# AGENT — ESTANDARIZACIÓN COMPLETA DE AUTH, CORREOS Y UI REFAPART

## Objetivo general

Corregir completamente la experiencia de autenticación de REFAPART y dejar un estándar reutilizable para todas las webs del ecosistema.

Actualmente existen problemas graves:

* El registro puede fallar con `Failed to fetch`.
* El usuario puede ser redirigido sin confirmación.
* No hay certeza visual de que el correo fue enviado.
* No hay confirmación técnica visible basada en Amazon SES.
* Las pantallas Auth no siguen la maqueta visual aprobada.
* Existen mensajes públicos que revelan operación interna o proveedores.
* Las pantallas de login, registro y recuperación se ven antiguas frente a la Home.

## Actividades a realizar

### 1. Auditoría visual de pantallas actuales

Revisar contra la maqueta aprobada:

* Home actual.
* Login.
* Registro.
* Forgot Password.
* Reset Password.
* Change Password.
* Confirmación de correo.
* Estados de éxito.
* Estados de error.

Detectar diferencias de:

* layout;
* spacing;
* tipografía;
* tamaño del logo;
* inputs;
* botones;
* bordes;
* sombras;
* fondo;
* responsive;
* mensajes;
* consistencia con la Home.

Resultado obligatorio:

```text
Docs/02_projects/refapart/security/auth-ui-audit.md
```

---

### 2. Corregir flujo de registro

El registro no debe terminar en redirección silenciosa.

Flujo correcto:

1. Usuario llena formulario.
2. Frontend llama al Gateway.
3. Gateway llama Auth.
4. Auth crea usuario.
5. Auth solicita envío de correo.
6. Amazon SES responde.
7. Backend registra resultado.
8. Frontend muestra pantalla clara.

Pantalla esperada si todo sale bien:

```text
Cuenta creada correctamente

Te enviamos un correo de verificación a:
usuario@correo.com

Revisa tu bandeja de entrada. Si no aparece, revisa Spam o Promociones.

Botones:
- Abrir Gmail
- Abrir Outlook
- Reenviar correo
- Ir al login
```

Prohibido:

* redirigir directo al login;
* mostrar solo `Failed to fetch`;
* mostrar pantalla vacía;
* ocultar error real;
* asumir que el correo se envió sin confirmación backend.

---

### 3. Diagnosticar `Failed to fetch`

Validar:

* `NEXT_PUBLIC_GATEWAY_BASE_URL`;
* `NEXT_PUBLIC_APPLICATION_CODE=REFAPART`;
* CORS;
* Gateway activo;
* Auth activo;
* endpoint de registro existente;
* ruta usada por frontend;
* que el frontend no consuma Auth directo;
* errores de red;
* errores de Docker;
* errores de variables `.env`.

El frontend debe consumir:

```text
Frontend Web -> API.PY.DJANGO.Gateway -> API.PY.DJANGO.Auth
```

Nunca:

```text
Frontend Web -> API.PY.DJANGO.Auth
```

---

### 4. Crear estándar global de feedback Auth

Ninguna acción Auth puede terminar sin respuesta visual.

Crear componentes reutilizables:

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

* loading;
* success;
* warning;
* error;
* timeout;
* provider error;
* network error;
* token expired;
* token invalid;
* email already used;
* password invalid;
* user not verified;
* user blocked.

---

### 5. Crear logs técnicos de correos

Crear tabla o modelo equivalente:

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

---

### 6. Confirmar envío real de correo

No basta con “usuario creado”.

El backend debe distinguir:

```text
USER_CREATED_EMAIL_SENT
USER_CREATED_EMAIL_FAILED
USER_ALREADY_EXISTS
USER_CREATED_PENDING_EMAIL_RETRY
```

Frontend debe mostrar mensajes distintos:

Caso éxito:

```text
Cuenta creada correctamente.
Correo enviado correctamente.
```

Caso fallo correo:

```text
Tu cuenta fue creada, pero no pudimos enviar el correo de verificación.
Puedes intentar reenviarlo en unos minutos.
```

Caso fallo total:

```text
No fue posible crear la cuenta.
Intenta nuevamente.
```

---

### 7. Reenvío de correo de verificación

Agregar acción:

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

---

### 8. Crear estándar global de correos por aplicación

Crear documentación:

```text
Docs/03_standards/auth/auth-email-notification-standard.md
```

El sistema debe soportar:

```text
REFAPART
JOBCRON
UNIVERSAL_POS
DOCUCORE
MEXINGSOF
TECNOTELEC
IMAGRAFITY
LEXNOVA
FISCORA
```

Cada aplicación debe tener:

```text
application_code
brand_name
brand_logo_url
brand_primary_color
brand_secondary_color
brand_background_color
support_email
from_email
from_name
site_url
login_url
register_url
password_reset_url
email_template_set
```

Correo base operativo:

```text
cash.1dip1@gmail.com
```

No hardcodear en frontend.

Debe vivir en configuración segura backend/Auth.

---

### 9. Plantillas de correo REFAPART

Crear plantillas personalizadas para:

* verificación de cuenta;
* bienvenida;
* recuperación de contraseña;
* contraseña cambiada;
* alerta de seguridad;
* reenvío de verificación.

Estilo REFAPART:

* fondo negro/grafito;
* tarjeta blanca;
* botón rojo;
* logo REFAPART;
* texto claro;
* footer limpio;
* sin mencionar proveedores.

---

### 10. Rediseñar pantallas Auth

Aplicar a:

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

Componentes obligatorios:

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

Diseño esperado:

* moderno;
* premium;
* responsive;
* coherente con Home;
* sin aspecto administrativo;
* sin formularios planos;
* inputs redondeados;
* botones rojos;
* mensajes visibles;
* logo proporcionado;
* fondo con profundidad.

---

### 11. Eliminar textos públicos incorrectos

Eliminar de la Home y páginas públicas:

```text
proveedores
proveedores verificados
proveedores registrados
operación controlada
proveedor queda detrás
proveedores verificados internamente
compra operada por REFAPART
fletera según proveedor
```

Regla:

El proveedor es operación interna. El cliente debe percibir que REFAPART resuelve todo.

Reemplazar por:

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

---

### 12. Alinear Home con maqueta aprobada

La Home debe acercarse al 95%-100% de la maqueta aprobada.

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

---

### 13. Documentación obligatoria

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

---

### 14. Validaciones funcionales

Probar:

* registro exitoso;
* registro con correo repetido;
* registro con correo inválido;
* registro con contraseña inválida;
* fallo Gateway;
* fallo Auth;
* fallo SES;
* reenvío de correo;
* login correcto;
* login incorrecto;
* usuario no verificado;
* recuperación de contraseña;
* token expirado;
* token inválido;
* cambio exitoso;
* logout;
* refresh session;
* acceso sin sesión;
* acceso sin permiso.

---

### 15. Validaciones técnicas

Ejecutar según aplique:

```bash
npm run lint
npm run build
python manage.py check
docker compose config --quiet
```

---

## Criterio de aceptación

No se considera terminado hasta que:

* el usuario siempre sepa qué ocurrió;
* el registro no redirija silenciosamente;
* el correo enviado quede confirmado técnica y visualmente;
* existan logs verificables del proveedor de correo;
* `Failed to fetch` sea reemplazado por mensajes claros;
* Auth se vea moderno y alineado con la Home;
* las pantallas Auth sean responsive;
* no exista ninguna referencia pública a proveedores;
* REFAPART tenga correos personalizados;
* el estándar quede listo para futuras webs;
* se actualice `EXECUTION_REPORT.md`.

## Resultado esperado

REFAPART debe transmitir:

```text
REFAPART encuentra la pieza, gestiona la compra y acompaña al cliente durante todo el proceso.
```

Nunca debe transmitir:

```text
REFAPART solo conecta proveedores.
```
s