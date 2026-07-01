# Validacion de cumplimiento de proyectos Django API

> Estado: migracion aplicada.
>
> Este documento registra el cumplimiento de los proyectos existentes contra `docs/03_standards/operations/project-closure-standard.md`.

## Resumen

Los proyectos existentes fueron migrados operativamente a la nomenclatura
estandar `API.PY.DJANGO.NombreDominio`.

`docker-compose.yml` y `Dockerfile` ya apuntan a las carpetas `API.PY.DJANGO.*`. Algunas carpetas anteriores `API.PY.DJANGO.*` quedaron como remanentes locales porque Windows bloqueo la eliminacion directa por permisos o archivos en uso.

`Docker.API.PY` solo orquesta las APIs. Cada carpeta `API.PY.DJANGO.*` debe ser repositorio Git propio.

## Correcciones aplicadas

- Se agrego `.env.local.example` sin secretos reales a todos los proyectos.
- Se completo `requirements.txt` base en proyectos que lo tenian vacio.
- Se agrego README minimo a proyectos que no tenian documentacion local.
- Se agrego `PROJECT_NAME` en settings de `Auth` y `LexNova`.
- Se agrego `ASGI_APPLICATION` en settings de `Auth` y `LexNova`.
- Se crearon carpetas estandarizadas `API.PY.DJANGO.*`.
- Se actualizaron `docker-compose.yml` y `Dockerfile` para usar `API.PY.DJANGO.*`.
- Se limpiaron los `.env.local` de las carpetas remanentes `API.PY.DJANGO.*`.
- Se inicializo Git en todas las carpetas `API.PY.DJANGO.*`.
- Se configuro `origin` en todas las APIs. Los modulos comerciales usan el
  patron `MexIngSoft/API.PY.DJANGO.NombreDominio`.
- Se estandarizo `.gitignore` en todas las APIs con el bloque minimo Django API.

## Estado por proyecto

| Proyecto | Estado | Observaciones |
|---|---|---|
| `API.PY.DJANGO.Auth` | Cumple | `origin`: `https://github.com/1CASH1/API.PY.DJANGO.Auth.git`. Settings vive en `config/settings.py`. |
| `API.PY.DJANGO.Catalog` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Catalog.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Inventory` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Inventory.git`. Usa paquete `config`. |
| `API.PY.DJANGO.LexNova` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Pricing` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Pricing.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Procurement` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Procurement.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Sales` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Sales.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Supplier` | Cumple con excepcion | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Supplier.git`. Usa paquete `config`. |
| `API.PY.DJANGO.Document` | Cumple | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Document.git`. Check Django y compilacion Python correctos. |
| `API.PY.DJANGO.DocuCore` | Cumple | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.git`. Check Django y compilacion Python correctos. |
| `API.PY.DJANGO.DocuCore.Gateway` | Retirado | Reemplazado por `API.PY.DJANGO.Gateway` el 2026-06-14. |
| `API.PY.DJANGO.Fiscal` | Cumple | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscal.git`. Check Django y compilacion Python correctos. |
| `API.PY.DJANGO.Fiscora` | Cumple | `origin`: `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.git`. Check Django y compilacion Python correctos. |
| `API.PY.DJANGO.Fiscora.Gateway` | Retirado | Reemplazado por `API.PY.DJANGO.Gateway` el 2026-06-14. |

## Pendientes no aplicados

- Eliminar carpetas remanentes `API.PY.DJANGO.*` cuando Windows libere los archivos en uso. Esos remanentes no contienen `.env.local`.
- Mantener `config` como paquete unico de configuracion en todas las APIs.
- Eliminar secretos reales de `.env.local` si esos archivos estan versionados.
- Validar migraciones y arranque real en Docker.

## Regla de compatibilidad

La nomenclatura operativa soportada es `API.PY.DJANGO.*`. Las carpetas `API.PY.DJANGO.*` no deben usarse para Docker ni para nuevo desarrollo.

## Validacion local PostgreSQL para Django

Todas las APIs Django deben poder ejecutar:

```powershell
python manage.py check
```

sin depender de SQLite y sin exigir secretos versionados.

Reglas:

- `.env.local.example` debe contener variables PostgreSQL sin secretos reales.
- `.env.local` puede existir solo en local y no debe subirse.
- Si el API se ejecuta fuera del contenedor, debe aceptar `DATABASE_URL` o las
  variables estandar `<API>_DB_NAME`, `<API>_DB_USER`, `<API>_DB_PASSWORD`,
  `POSTGRES_HOST` y `POSTGRES_PORT`.
- Si falta password de base de datos, el error debe explicar que falta la
  variable y que SQLite esta prohibido.
- No se debe usar `db.sqlite3`, SQLite ni fallback silencioso a archivos locales.
- Si una API usa `DB_SCHEMA` y comparte base con otras APIs, debe evitar leer
  `public.django_migrations` cuando su app label pueda repetirse. Para esos
  casos se debe usar tabla `django_migrations` dentro del schema propio o un
  app label unico.

Para Auth:

```text
AUTH_DB_NAME=auth
AUTH_DB_USER=auth_user
AUTH_DB_PASSWORD=<solo local o secreto de entorno>
AUTH_DB_SCHEMA=Auth
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
```

## Regla de bases separadas por API

Desde el split fisico del 2026-07-01, cada API Django activa debe leer su base
mediante variables propias:

```text
<API>_DB_NAME
<API>_DB_USER
<API>_DB_PASSWORD
<API>_DB_SCHEMA
POSTGRES_HOST
POSTGRES_PORT
```

No permitido en settings activos:

- `COMERCIAL_DB_NAME`
- `COMERCIAL_DB_USER`
- `COMERCIAL_DB_PASSWORD`
- fallback a `POSTGRES_DB` para APIs que ya tienen base propia
- fallback a SQLite o `db.sqlite3`

`COMERCIAL_DB_*` no debe existir en configuracion viva de APIs. Si una
restauracion externa trae datos de `comercial`, se deben migrar a la base
responsable antes de arrancar servicios.

Validacion obligatoria para cada API:

```powershell
python manage.py check
python manage.py showmigrations --plan
```

Resultado esperado:

```text
check OK
migraciones pendientes 0
```

Si se restaura informacion con usuario `postgres`, se debe ejecutar el script
operativo `Docker.DB.PG/docker/postgres/04-grants.sh` mediante
`db-postgresql-apply` para que las tablas y secuencias queden accesibles al
usuario de aplicacion correspondiente.

## Validacion aplicada 2026-07-01

Se ejecuto validacion y migracion PostgreSQL en el contenedor
`api-multiproyecto` contra `db-postgresql`.

Resultado:

- APIs activas con `manage.py`: `check` correcto y migraciones pendientes 0.
- LeadHunter: omitido por retiro del proyecto/API viva.
- Artefactos `db.sqlite3`: retirados del workspace.
- Fallback SQLite retirado de `DocuCore`, `Document`, `Fiscal`, `Fiscora` e
  `Imagrafity`.
- DocuCore: se corrigio colision de migraciones `core` creando
  `DocuCore.django_migrations`, porque `public.django_migrations` ya tenia
  registros `core` de otra API.

Regla derivada:

Cuando varias APIs usan apps Django con el mismo label (`core`, `portal`,
etc.), no deben compartir una misma base ni una misma tabla
`public.django_migrations`; deben usar su base responsable y app labels unicos
cuando aplique.
