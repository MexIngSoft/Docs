# Diccionario de base de datos

## Estado

ACTUALIZADO_PARCIAL.

## Bases oficiales vigentes en desarrollo

| Base | Uso |
|---|---|
| `auth` | Identidad, usuarios, roles, permisos, sesiones y correo Auth. |
| `comercial` | Datos compartidos de APIs comerciales existentes. |
| `jobcron` | Administracion JobCron y modulos operativos. |
| `lexnova` | Datos especificos LexNova. |
| `postgres` | Administracion PostgreSQL; no usar como base de aplicacion. |

## Tablas/campos relevantes agregados durante cierre JobCron/Auth

| Tabla | Campo | Uso |
|---|---|---|
| `"Auth"."Roles"` | `Name` | Codigo tecnico estable del rol. |
| `"Auth"."Roles"` | `DisplayName` | Nombre visible para UI administrativa. |
| `"Auth"."Roles"` | `Description` | Explicacion funcional del rol. |
| `"Auth"."UserPermissions"` | `Allow`, `Reason` | Permisos especiales auditables por usuario. |

## Reglas

- No usar SQLite ni `db.sqlite3`.
- No crear base nueva sin ADR/contrato.
- No borrar `comercial` hasta que exista migracion certificada, conteos,
  rollback y confirmacion de ownership por tabla.
