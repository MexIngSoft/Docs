# Base de datos JobCron

## Regla

Las tablas publicadas de JobCron usan nombres PascalCase estilo SQL Server,
segun:

```text
Docs/03_standards/database/sql-server-publication-standard.md
```

## FeatureAvailability

Tabla Django publicada:

```text
JobCronFeatureAvailability
```

Equivalente publicado:

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

Tabla Django publicada:

```text
JobCronFeatureAvailabilityAudit
```

Equivalente publicado:

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
