# Estandar de registro Auth por aplicacion

## Objetivo

Garantizar que cada web del ecosistema tenga una aplicacion registrada en Auth,
con codigo estable, URLs propias, configuracion de correo y estado operativo.

## Regla principal

Toda web productiva o MVP con login debe existir en:

```text
"Auth"."Applications"
```

El frontend debe enviar:

```text
X-Application-Code: <APPLICATION_CODE>
```

y el payload debe poder incluir:

```text
ApplicationCode=<APPLICATION_CODE>
```

## Aplicaciones minimas

| Aplicacion | Codigo |
|---|---|
| REFAPART | `REFAPART` |
| JobCron | `JOBCRON` |
| DocuCore | `DOCUCORE` |
| LexNova | `LEXNOVA` |
| TecnoTelec | `TECNOTELEC` |
| Imagrafity | `IMAGRAFITY` |
| Fiscora | `FISCORA` |
| MexIngSof | `MEXINGSOF` |

## Configuracion requerida por aplicacion

Cada aplicacion debe tener configuracion equivalente a:

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

En codigo actual, la configuracion vive principalmente en:

```text
"Auth"."Applications"
"Auth"."ApplicationEmailSettings"
templates/auth_emails/<application_code>/
"Auth"."TransactionalEmailTemplates"  # fallback administrativo, no fuente principal
```

La fuente principal de plantillas HTML es el archivo versionado en Auth:

```text
Docker.API.PY/API.PY.DJANGO.Auth/templates/auth_emails/<application_code>/
```

La prioridad de seleccion queda definida en:

```text
Docs/03_standards/auth/auth-email-template-source-standard.md
```

## Variables web obligatorias

Cada `.env.local.example` debe incluir:

```text
NEXT_PUBLIC_APP_NAME=
NEXT_PUBLIC_HOST=
NEXT_PUBLIC_ENVIRONMENT=
NEXT_PUBLIC_GATEWAY_BASE_URL=
NEXT_PUBLIC_APPLICATION_CODE=
```

## Remitente operativo local

Para desarrollo local se permite reutilizar el mismo remitente operativo:

```text
cash.1dip1@gmail.com
```

Este valor debe vivir en configuracion backend/Auth o variables de entorno. No
debe hardcodearse en componentes frontend como secreto ni como logica de envio.

## Prohibiciones

- No llamar Auth directo desde el frontend.
- No crear Auth por proyecto.
- No usar SQLite.
- No usar `postgres` como usuario de aplicacion.
- No dejar una web con Auth sin `NEXT_PUBLIC_APPLICATION_CODE`.
