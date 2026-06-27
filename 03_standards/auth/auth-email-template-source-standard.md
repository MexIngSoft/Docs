# Estandar de fuente de plantillas Auth

## Objetivo

Definir la prioridad oficial para resolver plantillas de correo Auth por
aplicacion, evitando que una plantilla de base de datos reemplace sin control a
los HTML versionados del repositorio.

## Regla principal

Auth es el unico responsable de las plantillas transaccionales de autenticacion.
Las webs no tienen plantillas propias de registro, verificacion, recuperacion
de password ni cambio de correo.

La fuente oficial versionada es:

```text
Docker.API.PY/API.PY.DJANGO.Auth/templates/auth_emails/<application_code>/<action>.html
```

`<application_code>` se escribe en minusculas.

## Prioridad obligatoria

Auth debe resolver plantillas en este orden:

| Prioridad | Fuente | Uso |
|---|---|---|
| 1 | `FILE` | Archivo HTML versionado en `templates/auth_emails/<app>/<action>.html`. |
| 2 | `DB_FALLBACK` | `"Auth"."TransactionalEmailTemplates"` solo si no existe archivo. |
| 3 | `DJOSER_FALLBACK` | Plantilla generica de Djoser/Auth como ultimo recurso. |

La base de datos no es fuente principal de HTML.

## Trazabilidad obligatoria

Cada envio debe registrar en `ProviderResponsePayload`:

```text
template_source
resolved_template_path
application_code
action_code
has_db_template
has_file_template
```

Valores permitidos para `template_source`:

```text
FILE
DB_FALLBACK
DJOSER_FALLBACK
```

## REFAPART

REFAPART debe usar:

```text
templates/auth_emails/refapart/
```

Para `VERIFY_ACCOUNT`, el log esperado debe incluir:

```text
template_source=FILE
resolved_template_path=auth_emails/refapart/verify_account.html
application_code=REFAPART
action_code=VERIFY_ACCOUNT
```

## Prohibiciones

- No crear plantillas Auth dentro de una web.
- No usar `"Auth"."TransactionalEmailTemplates"` como fuente principal.
- No caer silenciosamente a otra aplicacion cuando falta `X-Application-Code`.
- No mostrar rutas internas ni errores tecnicos en produccion.

## Validacion

Para cerrar cambios:

1. Validar que existe el archivo HTML de la aplicacion.
2. Validar que `FILE` gana aunque exista una plantilla de BD.
3. Validar que `DB_FALLBACK` solo aplica cuando no existe archivo.
4. Validar que sin aplicacion resuelta se usa `DJOSER_FALLBACK`.
5. Ejecutar tests de plantillas del proyecto afectado.
