# Base de datos JobCron

## Regla

Las tablas publicadas de JobCron usan nombres PascalCase estilo SQL Server y
deben migrarse sobre PostgreSQL local mediante `Docker.DB.PG`. Las bases
embebidas de archivo no son runtime activo para desarrollo ni para validacion
de migraciones, segun:

```text
Docs/03_standards/database/sql-server-publication-standard.md
```

## FeatureAvailability

Tabla Django/PostgreSQL publicada:

```text
JobCronFeatureAvailability
```

Referencia SQL Server publicada equivalente:

```sql
[JobCron].[FeatureAvailability]
```

Campos principales:

| Campo | Uso |
|---|---|
| `Id` | UUID primario. |
| `ProjectKey` | Proyecto o web: `docucore`, `lexnova`, `tecnotelec`. |
| `ModuleKey` | Modulo funcional. |
| `FeatureKey` | Llave estable y unica. |
| `Label` | Nombre visible administrativo. |
| `Description` | Descripcion operativa. |
| `Href` | Ruta frontend asociada. |
| `Status` | `disabled`, `development`, `internal`, `beta`, `mvp`, `released`. |
| `Enabled` | Activa o bloquea la regla. |
| `Countries` | Lista JSON de paises permitidos. |
| `Regions` | Lista JSON de regiones permitidas. |
| `ShowInDevelopment` | Permite mostrar en entorno desarrollo. |
| `ShowUnfinishedBadge` | Obliga a marcar incompleto. |
| `FrontendReady` | La UI existe. |
| `BackendReady` | La API o engine existe. |
| `QaReady` | Paso validacion. |
| `DocumentationReady` | Tiene documento canonico. |
| `PublicVisible` | Puede mostrarse a usuario final. |
| `InternalVisible` | Puede mostrarse a perfiles internos. |
| `DisplayOrder` | Orden de navegacion/listado. |
| `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy` | Auditoria basica. |

## FeatureAvailabilityAudit

Tabla Django/PostgreSQL publicada:

```text
JobCronFeatureAvailabilityAudit
```

Referencia SQL Server publicada equivalente:

```sql
[JobCron].[FeatureAvailabilityAudit]
```

Campos:

| Campo | Uso |
|---|---|
| `Id` | UUID primario. |
| `FeatureKey` | Feature afectada. |
| `Action` | `create`, `update` u otra accion administrativa. |
| `Before` | Snapshot JSON previo. |
| `After` | Snapshot JSON posterior. |
| `ChangedBy` | Usuario o actor reportado. |
| `CreatedAt` | Fecha del cambio. |

## Semilla inicial

La migracion `0002_seed_docucore_features.py` carga el mapa inicial de
DocuCore para que JobCron tenga reglas desde la primera instalacion.

## Servidor de base de datos PostgreSQL

| Dato | Valor |
| --- | --- |
| Servidor | PostgreSQL local Docker |
| Contenedor | `db-postgresql` |
| Base de datos | `jobcron` |
| Usuario | `jobcron_user` |
| Schema | `"JobCron"` |
| Puerto externo | `127.0.0.1:5432` |
| Puerto interno | `5432` |
| Script de usuarios | `Docker.DB.PG/docker/postgres/01-users.sh` |
| Script de bases | `Docker.DB.PG/docker/postgres/02-databases.sh` |
| Script de schemas | `Docker.DB.PG/docker/postgres/03_schemas.sql` |

Variables esperadas por `API.PY.DJANGO.JobCron`:

```txt
POSTGRES_DB=jobcron
POSTGRES_USER=jobcron_user
POSTGRES_PASSWORD=<secret>
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_OPTIONS=-c search_path=JobCron,public
```

Comando para aplicar estructura PostgreSQL:

```powershell
Set-Location Docker.DB.PG
docker compose --profile tools run --rm db-postgresql-apply
```

Comando para migrar JobCron:

```powershell
Set-Location ..\Docker.API.PY\API.PY.DJANGO.JobCron
python manage.py migrate
```
