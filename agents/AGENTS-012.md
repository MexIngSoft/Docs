# AGENTE — AUDITORÍA Y NORMALIZACIÓN DE EMAIL AUTH / SES / DJOSER

## Objetivo

Revisar la configuración existente de Lex Nova/Auth para detectar las credenciales y configuración real de Amazon SES, reutilizarlas temporalmente como fuente base para los demás proyectos, pero dejando a cada proyecto con sus propias variables de entorno independientes para que en el futuro puedan migrarse sin romper dependencias.

También debe auditar que todos los eventos, endpoints y pantallas relacionadas con Djoser/Django Auth estén implementados, conectados y mostrando confirmaciones reales al usuario.

---

# 1. Reglas obligatorias

## 1.1 No inventar configuración

No asumir que SES funciona solo porque existan variables en `.env`.

Validar en código:

* qué backend de email usa Django;
* qué variables lee;
* si usa `django-ses`;
* si existen logs de envío;
* si se captura éxito/error;
* si se muestra resultado al usuario;
* si Djoser está conectado correctamente.

## 1.2 No exponer secretos

Nunca imprimir secretos completos.

Si se reportan variables, mostrar solo nombres:

```env
AWS_SES_ACCESS_KEY_ID
AWS_SES_SECRET_ACCESS_KEY
AWS_SES_REGION_NAME
AWS_SES_FROM_EMAIL
```

No mostrar valores reales.

## 1.3 No dejar proyectos dependientes de Lex Nova

Lex Nova puede ser fuente temporal de configuración, pero cada proyecto debe terminar con su propio bloque de variables.

Ejemplo:

```env
REFAPART_AWS_SES_ACCESS_KEY_ID=
REFAPART_AWS_SES_SECRET_ACCESS_KEY=
REFAPART_AWS_SES_REGION_NAME=
REFAPART_AWS_SES_FROM_EMAIL=
```

```env
JOBCron_AWS_SES_ACCESS_KEY_ID=
JOBCron_AWS_SES_SECRET_ACCESS_KEY=
JOBCron_AWS_SES_REGION_NAME=
JOBCron_AWS_SES_FROM_EMAIL=
```

Usar nombres reales según estándar del repositorio.

---

# 2. Lectura obligatoria

Antes de modificar código, leer:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
```

Después ubicar documentación relacionada con:

```text
Lex Nova
Auth
Djoser
SES
Email
Notifications
Refapart
JobCron
DocuCore
Universal POS
```

---

# 3. Auditoría de Lex Nova/Auth

Buscar en el repositorio:

```text
settings.py
base.py
production.py
local.py
.env.example
.env
docker-compose.yml
Dockerfile
requirements.txt
pyproject.toml
```

Buscar específicamente:

```text
EMAIL_BACKEND
django_ses
AWS_SES
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
DEFAULT_FROM_EMAIL
SERVER_EMAIL
DJOSER
PASSWORD_RESET
ACTIVATION
CONFIRMATION
```

Confirmar:

* si Lex Nova ya tiene variables SES;
* si el backend de email es real o consola;
* si se usa `django_ses.SESBackend`;
* si hay variables duplicadas;
* si hay nombres inconsistentes;
* si hay `.env.example` incompleto;
* si Docker inyecta correctamente variables;
* si producción y desarrollo usan configuraciones distintas.

---

# 4. Normalización de variables por proyecto

Crear un estándar para cada proyecto.

## 4.1 Variables globales permitidas

Solo si existe un servicio central Auth compartido:

```env
AUTH_EMAIL_PROVIDER=ses
AUTH_AWS_SES_ACCESS_KEY_ID=
AUTH_AWS_SES_SECRET_ACCESS_KEY=
AUTH_AWS_SES_REGION_NAME=
AUTH_AWS_SES_FROM_EMAIL=
AUTH_AWS_SES_CONFIGURATION_SET=
AUTH_EMAIL_RETURN_PATH=
```

## 4.2 Variables por proyecto

Cada proyecto debe tener sus propias variables aunque temporalmente apunten a los mismos valores de Lex Nova.

Ejemplo para Refapart:

```env
REFAPART_EMAIL_PROVIDER=ses
REFAPART_AWS_SES_ACCESS_KEY_ID=
REFAPART_AWS_SES_SECRET_ACCESS_KEY=
REFAPART_AWS_SES_REGION_NAME=
REFAPART_AWS_SES_FROM_EMAIL=
REFAPART_AWS_SES_CONFIGURATION_SET=
REFAPART_EMAIL_RETURN_PATH=
REFAPART_SUPPORT_EMAIL=
REFAPART_PUBLIC_APP_URL=
```

Ejemplo para Lex Nova:

```env
LEXNOVA_EMAIL_PROVIDER=ses
LEXNOVA_AWS_SES_ACCESS_KEY_ID=
LEXNOVA_AWS_SES_SECRET_ACCESS_KEY=
LEXNOVA_AWS_SES_REGION_NAME=
LEXNOVA_AWS_SES_FROM_EMAIL=
LEXNOVA_AWS_SES_CONFIGURATION_SET=
LEXNOVA_EMAIL_RETURN_PATH=
LEXNOVA_SUPPORT_EMAIL=
LEXNOVA_PUBLIC_APP_URL=
```

Ejemplo para JobCron:

```env
JOBCRON_EMAIL_PROVIDER=ses
JOBCRON_AWS_SES_ACCESS_KEY_ID=
JOBCRON_AWS_SES_SECRET_ACCESS_KEY=
JOBCRON_AWS_SES_REGION_NAME=
JOBCRON_AWS_SES_FROM_EMAIL=
JOBCRON_AWS_SES_CONFIGURATION_SET=
JOBCRON_EMAIL_RETURN_PATH=
JOBCRON_SUPPORT_EMAIL=
JOBCRON_PUBLIC_APP_URL=
```

---

# 5. Implementación en Django

Crear una capa central para resolver configuración de correo.

No dejar variables quemadas en `settings.py`.

Debe existir una función o módulo similar a:

```python
def get_email_settings(project_code: str):
    """
    Resolve email settings for a project.
    Priority:
    1. Project-specific variables
    2. Shared AUTH variables
    3. Safe development fallback
    """
```

Prioridad:

1. Variables específicas del proyecto.
2. Variables compartidas Auth.
3. Fallback seguro solo en desarrollo.
4. Error explícito en producción si falta configuración.

En producción no debe usar consola ni silent fail.

---

# 6. Eventos Djoser que deben auditarse

Confirmar que estén implementados, configurados y probados:

## 6.1 Registro

Evento:

```text
user registration
```

Debe:

* crear usuario;
* enviar correo de activación si aplica;
* registrar intento de envío;
* mostrar confirmación clara al usuario.

Pantalla esperada:

```text
Tu cuenta fue creada. Te enviamos un correo para confirmar tu cuenta.
```

Si falla el correo:

```text
Tu cuenta fue creada, pero no pudimos enviar el correo de confirmación. Solicita reenviar el correo.
```

---

## 6.2 Activación de cuenta

Evento:

```text
activation
```

Debe existir:

* endpoint backend;
* ruta frontend;
* pantalla de éxito;
* pantalla de token inválido;
* pantalla de token expirado;
* opción para reenviar correo.

---

## 6.3 Reenvío de activación

Evento:

```text
resend activation
```

Debe existir:

* endpoint backend;
* pantalla/formulario frontend;
* validación de email;
* mensaje de éxito sin filtrar si el email existe o no.

Mensaje recomendado:

```text
Si el correo existe y requiere activación, enviaremos nuevas instrucciones.
```

---

## 6.4 Login

Debe validar:

* usuario inexistente;
* password incorrecto;
* usuario inactivo;
* usuario no confirmado;
* bloqueo temporal si aplica.

No mostrar errores inseguros.

---

## 6.5 Reset password

Evento:

```text
password reset
```

Debe existir:

* solicitar recuperación;
* enviar correo;
* pantalla de confirmación;
* ruta con uid/token;
* formulario nueva contraseña;
* pantalla de éxito;
* pantalla de token inválido/expirado.

---

## 6.6 Confirm reset password

Evento:

```text
password reset confirm
```

Debe:

* validar token;
* cambiar contraseña;
* invalidar token;
* mostrar confirmación real;
* redirigir a login con mensaje claro.

---

## 6.7 Change password

Evento:

```text
set password / change password
```

Debe existir para usuario autenticado:

* contraseña actual;
* nueva contraseña;
* confirmación;
* mensaje de éxito;
* registro en PasswordHistory si existe esa tabla;
* bloqueo de reutilización si el sistema lo maneja.

---

## 6.8 Change email

Si Djoser está configurado para cambio de email, validar:

* solicitud de cambio;
* correo de confirmación;
* activación del nuevo correo;
* mensajes claros;
* logs.

---

# 7. Tablas y logs obligatorios

Auditar si existen tablas como:

```text
Auth.EmailDeliveryLogs
Auth.TransactionalEmailTemplates
Auth.UserAccounts
Auth.PasswordHistory
Auth.UserRoles
```

Si existen, confirmar que se usan realmente.

Cada envío debe guardar:

```text
Id
ApplicationId
UserId
ActionCode
ToEmail
Subject
Status
ErrorMessage
Provider
ProviderMessageId
CreatedAt
SentAt
```

Estados mínimos:

```text
Pending
Sent
Failed
Delivered
Bounced
Complained
```

Si SES no tiene webhook implementado todavía, dejar `Delivered/Bounced/Complained` como pendiente de integración SNS.

---

# 8. Pantallas frontend obligatorias

Auditar y crear si faltan:

```text
/register
/login
/activate/:uid/:token
/resend-activation
/password-reset
/password-reset/confirm/:uid/:token
/change-password
/email/change
/email/change/confirm
/auth/success
/auth/error
```

Cada pantalla debe:

* verse moderna;
* usar el diseño estándar del proyecto;
* tener mensajes claros;
* no mostrar proveedores internos como SES, AWS o Djoser al usuario final;
* no dejar al usuario sin respuesta;
* manejar loading, éxito y error.

---

# 9. Confirmación real de envío

Después de cualquier evento de correo:

```text
registro
activación
reenvío de activación
reset password
cambio de contraseña
cambio de email
```

El sistema debe distinguir:

```text
Correo solicitado
Correo enviado
Correo fallido
```

No basta con redirigir al login.

Debe haber respuesta visual y log persistente.

---

# 10. Templates de correo

Auditar si existen templates para:

```text
activation
confirmation
password_reset
password_changed
email_changed
welcome
```

Cada template debe tener:

```text
subject
html_body
text_body
action_url
project_brand
support_email
expiration_notice
```

No debe decir:

```text
Djoser
Amazon SES
AWS
Lex Nova
```

en proyectos que no sean Lex Nova.

---

# 11. Pruebas obligatorias

Crear o actualizar pruebas para:

## Backend

* registro con correo enviado;
* registro con fallo SES;
* reset password con correo enviado;
* reset password con fallo SES;
* activación válida;
* activación inválida;
* token expirado;
* reenvío activación;
* cambio contraseña;
* PasswordHistory si aplica;
* EmailDeliveryLogs si aplica.

## Frontend

* formulario registro;
* confirmación post-registro;
* error de envío;
* reset password;
* confirm reset;
* activación;
* token inválido;
* reenvío activación.

---

# 12. Resultado esperado del agente

El agente debe entregar:

## 12.1 Reporte

Crear:

```text
Docs/reports/auth-email-ses-djoser-audit.md
```

Debe contener:

* archivos revisados;
* variables encontradas;
* configuración actual;
* problemas detectados;
* pantallas existentes;
* pantallas faltantes;
* eventos Djoser existentes;
* eventos Djoser faltantes;
* tablas usadas;
* tablas no usadas;
* riesgos;
* cambios realizados;
* pendientes.

## 12.2 Archivos modificados

Actualizar:

```text
.env.example
settings.py / base.py / production.py
docker-compose.yml
frontend auth routes
email service
email templates
tests
Docs standards
```

Solo modificar los archivos necesarios.

## 12.3 Checklist final

Debe terminar con:

```text
[ ] Lex Nova SES auditado
[ ] Variables SES encontradas
[ ] Variables por proyecto creadas
[ ] Fallback compartido documentado
[ ] Djoser auditado
[ ] Registro validado
[ ] Activación validada
[ ] Reenvío activación validado
[ ] Reset password validado
[ ] Change password validado
[ ] EmailDeliveryLogs validado
[ ] Pantallas auth auditadas
[ ] Pruebas agregadas/actualizadas
[ ] Reporte generado
```

---

# 13. Restricciones

No hacer:

* no borrar credenciales;
* no imprimir secretos;
* no cambiar proveedor sin documentarlo;
* no dejar dependencia rígida de Lex Nova;
* no ocultar errores de envío;
* no redirigir al login sin mensaje;
* no mostrar AWS/SES/Djoser al usuario final;
* no romper otros proyectos.

---

# 14. Criterio de aceptación

El trabajo se considera terminado solo si:

1. Cada proyecto tiene variables propias de email.
2. Lex Nova puede seguir funcionando.
3. Refapart puede usar temporalmente las mismas credenciales sin depender del nombre Lex Nova.
4. Las pantallas de auth muestran éxito/error real.
5. Todos los eventos Djoser críticos están auditados.
6. Los envíos quedan registrados en base de datos.
7. `.env.example` queda completo.
8. Docker inyecta correctamente las variables.
9. Producción falla explícitamente si falta configuración.
10. Existe reporte final con evidencia de archivos revisados y cambios realizados.
9