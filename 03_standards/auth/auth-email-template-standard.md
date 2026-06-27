# Estandar de plantillas de correo Auth

## Objetivo

Definir como crear, validar y mantener plantillas de correo transaccional por
aplicacion sin duplicar logica fuera de Auth.

Este estandar aplica a cualquier web que use:

```text
Web -> Gateway General -> Auth API -> proveedor de correo
```

## Ubicacion canonica

Las plantillas HTML por aplicacion viven en:

```text
Docker.API.PY/API.PY.DJANGO.Auth/templates/auth_emails/<application_code>/
```

`<application_code>` se escribe en minusculas:

| ApplicationCode | Carpeta |
|---|---|
| `REFAPART` | `auth_emails/refapart/` |
| `MEXINGSOF` | `auth_emails/mexingsof/` |
| `LEXNOVA` | `auth_emails/lexnova/` |
| `IMAGRAFITY` | `auth_emails/imagrafity/` |
| `JOBCRON` | `auth_emails/jobcron/` |
| `DOCUCORE` | `auth_emails/docucore/` |
| `FISCORA` | `auth_emails/fiscora/` |
| `TECNOTELEC` | `auth_emails/tecnotelec/` |

No crear plantillas de correo dentro de las webs.

## Archivos requeridos por aplicacion

Cada aplicacion debe tener, como minimo:

```text
base.html
register.html
verify_account.html
password_reset.html
password_changed.html
email_reset.html
email_changed.html
```

Si una accion no aplica al MVP, el archivo puede existir con contenido seguro y
sin prometer funciones no disponibles.

## Mapeo de acciones

El mapeo vive en Auth:

```text
Docker.API.PY/API.PY.DJANGO.Auth/auth/custom_email.py
```

| ActionCode | Archivo |
|---|---|
| `VERIFY_ACCOUNT` | `verify_account.html` |
| `REGISTER` | `register.html` |
| `PASSWORD_RESET` | `password_reset.html` |
| `PASSWORD_CHANGED` | `password_changed.html` |
| `EMAIL_RESET` | `email_reset.html` |
| `EMAIL_CHANGED` | `email_changed.html` |

## Regla de seleccion

Auth selecciona la plantilla con:

```text
auth_emails/<application_code>/<action_template_name>.html
```

La aplicacion se resuelve desde:

```text
X-Application-Code
ApplicationCode
application_code
```

Si falta la carpeta de la aplicacion, Auth puede caer al template base de
Djoser/Auth. Ese fallback solo es aceptable en desarrollo inicial; para MVP de
una web activa debe existir carpeta propia.

La prioridad exacta de fuente queda regulada por:

```text
Docs/03_standards/auth/auth-email-template-source-standard.md
```

Resumen:

```text
FILE -> DB_FALLBACK -> DJOSER_FALLBACK
```

`"Auth"."TransactionalEmailTemplates"` no es la fuente principal de HTML.

## Variables permitidas

Variables actuales seguras:

| Variable | Origen | Uso |
|---|---|---|
| `action_url` | Djoser/Auth | Enlace de accion; puede contener token. |
| `user.email` | Djoser/Auth | Saludo y contexto del usuario. |
| `commercial_name` | Auth metadata | Nombre comercial de la aplicacion. |
| `logo_url` | Auth metadata | Logo remoto seguro. |
| `primary_color` | Auth metadata | Color principal si aplica. |
| `sender_name` | Auth metadata | Nombre remitente. |
| `redirect_base_url` | Auth metadata | Base de redireccion. |

Variables backend futuras permitidas, pero no obligatorias:

```text
support_email
frontend_url
logo_cid
current_year
expiration_minutes
show_advertising_area
advertising_title
advertising_text
advertising_image_url
advertising_alt
advertising_url
advertising_cta
```

Si una plantilla usa una variable futura, debe envolverla con `{% if ... %}` y
no debe romper el render cuando la variable no exista.

## Estructura HTML obligatoria

`base.html` debe contener:

- `<!doctype html>`;
- `<html lang="es-MX">`;
- `<meta charset="utf-8">`;
- `<meta name="viewport">`;
- tablas con `role="presentation"`;
- estilos inline o bloque `<style>` simple;
- CTA centralizado;
- footer centralizado;
- bloque de seguridad centralizado;
- texto alternativo en imagenes;
- version texto mediante `text_body`.

## Render HTML-first

Para plantillas oficiales por archivo, Auth debe enviar el HTML como cuerpo
principal del correo. El bloque `text_body` sirve como fuente de texto
alternativa interna o fallback operativo, pero no debe quedar antepuesto al HTML
visible.

Validacion obligatoria:

```text
body_start = <!doctype html>
content_subtype = html
```

Queda prohibido que el cuerpo visible del correo inicie con:

```text
subject + text_body + html_body
```

Ese fallo provoca que clientes como Outlook muestren un parrafo plano encima
del diseno HTML y dupliquen informacion.

## Logos en correos

Las plantillas pueden usar imagen embebida cuando el correo debe funcionar sin
descargar recursos externos. Para REFAPART, el header usa un logo PNG inline
adjunto por Content-ID:

```text
src="cid:refapart-logo"
```

El archivo canonico del logo vive en:

```text
Docker.API.PY/API.PY.DJANGO.Auth/templates/auth_emails/refapart/assets/refapart-logo-with-tagline.png
```

Queda prohibido usar `data:image/svg+xml` en plantillas transaccionales
oficiales. Outlook puede limpiar ese valor y dejar el HTML como `src=""`
con `data-imagetype="DataUriOfSvg"`, provocando que el logo no se vea.

Reglas:

- siempre incluir `alt`;
- no depender exclusivamente de links remotos para el logo;
- si una aplicacion usa logo embebido, Auth debe adjuntarlo como recurso inline
  `Content-ID`;
- si una aplicacion usa `logo_url`, debe tener fallback visual seguro y no debe
  ser la unica fuente para correos criticos;
- validar que el render no contenga imagen rota en el header.

## Compatibilidad de correo

Queda prohibido en plantillas transaccionales:

- JavaScript;
- formularios;
- iframes;
- fuentes remotas obligatorias;
- CSS externo;
- `display:flex`;
- CSS grid;
- `position: fixed`;
- `linear-gradient`;
- `box-shadow`;
- imagenes sin `alt`;
- rutas internas;
- stack traces;
- tokens fuera de `action_url`.

Se permite media query simple para mejorar mobile, siempre que el correo siga
siendo legible si el cliente la ignora.

## Publicidad

La publicidad queda desactivada por defecto.

Si existe bloque futuro de publicidad:

- debe estar centralizado en `base.html`;
- debe depender de `show_advertising_area`;
- debe ser opcional;
- debe tener imagen con `alt`;
- no debe desplazar el CTA principal en correos de seguridad;
- no debe activarse sin consentimiento y validacion de negocio.

## Validacion minima

Para cerrar una carpeta de plantillas:

1. Confirmar que existen los siete archivos requeridos.
2. Confirmar que cada plantilla hija extiende `auth_emails/<app>/base.html`.
3. Confirmar que cada plantilla hija define:
   - `subject`;
   - `text_body`;
   - `headline`;
   - `intro`;
   - `detail`;
   - `cta`.
4. Renderizar todas las plantillas con contexto de prueba.
5. Confirmar que no aparecen patrones prohibidos.
6. Ejecutar `python manage.py check`.
7. Si existe test automatizado, ejecutar el test especifico de la aplicacion.

## Estado REFAPART

REFAPART queda como implementacion inicial validada en:

```text
Docker.API.PY/API.PY.DJANGO.Auth/templates/auth_emails/refapart/
```

Validacion automatizada:

```text
python manage.py test auth.tests.test_refapart_email_templates
```

## Estado de otras aplicaciones

Las demas aplicaciones deben adoptar este estandar cuando se implemente o cierre
su flujo Auth/correo. Hasta entonces quedan pendientes fuera del alcance de la
corrida REFAPART.
