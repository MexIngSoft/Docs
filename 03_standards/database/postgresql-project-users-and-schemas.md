# PostgreSQL por proyecto, usuarios y schemas

## Estado

ACTIVE

## Objetivo

Definir el estado operativo permitido para bases, usuarios, schemas y
migraciones PostgreSQL del ecosistema sin inventar usuarios, schemas ni bases
finales fuera de contrato.

## Reglas generales

- PostgreSQL oficial se ejecuta en `db-postgresql`.
- Imagen oficial: `postgres:16.13`.
- Red oficial: `jobcron_network`.
- Stack oficial: `comercial_platform`.
- Las APIs no deben usar SQLite.
- La base `postgres` queda reservada para administracion local.
- El usuario `postgres` queda reservado para administracion local.
- Las APIs deben usar usuarios de aplicacion con permisos minimos.
- No crear bases, usuarios ni schemas definitivos sin contrato canonico.
- No ejecutar `docker volume prune` ni borrar volumenes para validar.

## Bases oficiales detectadas

| Base | Uso esperado | Proyecto/API duena | Estado | Observacion |
|---|---|---|---|---|
| `auth` | Identidad, usuarios, roles, sesiones y permisos | Auth API | ACTIVA | Detectada en PostgreSQL. |
| `comercial` | APIs core comerciales y proyectos compartidos | Catalog, Inventory, Pricing, Supplier, Procurement, Sales, Search, Address, REFAPART, TecnoTelec y proyectos relacionados | ACTIVA | Detectada en PostgreSQL. |
| `jobcron` | Operacion JobCron y modulos administrativos | JobCron API | ACTIVA | Detectada en PostgreSQL. |
| `lexnova` | Dominio legal LexNova | LexNova API | ACTIVA | Detectada en PostgreSQL. |
| `postgres` | Administracion local | PostgreSQL | ADMINISTRACION | No usar para datos de negocio. |

## Usuarios detectados

| Usuario | Uso actual | Base permitida | Permisos | Estado | Observacion |
|---|---|---|---|---|---|
| `auth_user` | Usuario de aplicacion Auth | `auth` | Login sin superuser | ACTIVO | Detectado en PostgreSQL. |
| `comercial_user` | Usuario de aplicacion comercial | `comercial` | Login sin superuser | ACTIVO | Detectado en PostgreSQL. |
| `jobcron_user` | Usuario de aplicacion JobCron | `jobcron` | Login sin superuser | ACTIVO | Detectado en PostgreSQL. |
| `lexnova_user` | Usuario de aplicacion LexNova | `lexnova` | Login sin superuser | ACTIVO | Detectado en PostgreSQL. |
| `postgres` | Administracion local | Todas | Superuser | ADMINISTRACION | Prohibido como usuario de aplicacion. |

## Schemas detectados

| Base | Schemas funcionales detectados | Estado | Observacion |
|---|---|---|---|
| `auth` | `Auth` | ACTIVO | Schema Auth detectado. |
| `comercial` | `Catalog`, `Customization`, `Inventory`, `Pricing`, `Procurement`, `RefaPart`, `Sales`, `Search`, `Supplier`, `TecnoTelec`, `TecnoTelecGateway` | ACTIVO | No se detecto schema `Address`; queda `PENDIENTE_DE_DEFINIR` si Address requiere schema propio. |
| `jobcron` | `JobCron` | ACTIVO | Schema JobCron detectado. |
| `lexnova` | `Amparo`, `Appeal`, `Case`, `Catalog`, `CausePenal`, `Document`, `Evidence`, `Inventory`, `InvestigationFolder`, `OralTrial`, `Person`, `Pricing`, `Procurement`, `Sales`, `Supplier` | ACTIVO | Schemas LexNova detectados. |
| `postgres` | Solo schemas de sistema/public | ADMINISTRACION | No usar para negocio. |

## Matriz proyecto/API

| Proyecto/API | Base | Schema | Usuario | Permisos | Migracion | Estado |
|---|---|---|---|---|---|---|
| Auth | `auth` | `Auth` | `auth_user` | Aplicacion | Django migrations existentes | ACTIVO |
| Catalog | `comercial` | `Catalog` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| Inventory | `comercial` | `Inventory` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| Pricing | `comercial` | `Pricing` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| Procurement | `comercial` | `Procurement` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| Sales | `comercial` | `Sales` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| Supplier | `comercial` | `Supplier` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| Search | `comercial` | `Search` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| Address | `comercial` | `PENDIENTE_DE_DEFINIR` | `comercial_user` | Aplicacion | Django migrations existentes | PARCIAL |
| REFAPART | `comercial` | `RefaPart` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| TecnoTelec | `comercial` | `TecnoTelec`, `TecnoTelecGateway`, `Customization` | `comercial_user` | Aplicacion | Django migrations existentes | ACTIVO |
| JobCron | `jobcron` | `JobCron` | `jobcron_user` | Aplicacion | Django migrations existentes | ACTIVO |
| LeadHunter | `comercial` | `PENDIENTE_DE_DEFINIR` | `comercial_user` | Aplicacion | Django migrations existentes | PARCIAL |
| LexNova | `lexnova` | Schemas LexNova detectados | `lexnova_user` | Aplicacion | Django migrations existentes | ACTIVO |
| MexIngSof | `PENDIENTE_DE_DEFINIR` | `PENDIENTE_DE_DEFINIR` | `PENDIENTE_DE_DEFINIR` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | BLOQUEADO POR CONTRATO |

## Variables de entorno esperadas

| Variable | Uso |
|---|---|
| `POSTGRES_HOST` | Debe apuntar a `db-postgresql` dentro de Docker. |
| `POSTGRES_PORT` | Debe ser `5432`. |
| `<API>_DB_NAME` | Base de datos asignada al API. |
| `<API>_DB_USER` | Usuario de aplicacion asignado. |
| `<API>_DB_PASSWORD` | Password del usuario de aplicacion. |
| `<API>_POSTGRES_OPTIONS` | Opciones como `search_path` cuando aplique. |

## Reglas de migracion

- Migraciones Django deben vivir en cada API/app correspondiente.
- No generar migraciones finales sin contrato de modelo.
- Si una app tiene carpeta `migrations` sin migraciones, documentar como
  pendiente y no inventar modelos.
- Validar migraciones con comandos del API afectado cuando exista entorno
  funcional.

## Prohibiciones

- Prohibido SQLite en configuracion activa.
- Prohibido usar `postgres` como usuario de aplicacion.
- Prohibido usar base `postgres` para negocio.
- Prohibido `localhost` o `127.0.0.1` entre contenedores; usar nombres de
  servicio como `db-postgresql`.
- Prohibido borrar volumenes como parte de validacion.

## Procedimiento seguro de validacion

```powershell
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Networks}}"
docker exec db-postgresql psql -U postgres -tAc "SELECT datname FROM pg_database WHERE datistemplate=false ORDER BY datname;"
docker exec db-postgresql psql -U postgres -tAc "SELECT rolname, rolsuper, rolcreatedb, rolcanlogin FROM pg_roles ORDER BY rolname;"
docker exec db-postgresql psql -U postgres -d comercial -tAc "SELECT schema_name FROM information_schema.schemata ORDER BY schema_name;"
rg -n "sqlite|sqlite3|db.sqlite|SQLITE" Docker.API.PY -g "*.py" -g "*.env*" -g "*.yml" -g "*.yaml"
```

## Scripts operativos documentados

Los scripts reutilizables de consulta PostgreSQL viven en:

```text
Docs/03_standards/operations/scripts/database/
```

Scripts Auth disponibles:

```text
Docs/03_standards/operations/scripts/database/queries/auth/list-users-by-application.sql
Docs/03_standards/operations/scripts/database/queries/auth/delete-users-by-id.sql
```

Regla:

- `list-users-by-application.sql` es solo lectura.
- `delete-users-by-id.sql` es plantilla administrativa y no debe ejecutarse sin
  reemplazar IDs placeholder, validar alcance y preferir antes el comando
  Django documentado en
  `Docs/01_core_erp/auth/user-application-traceability.md`.

## Pendientes

- `PENDIENTE_DE_DEFINIR`: contrato final de DB/schema/usuario para MexIngSof.
- `PENDIENTE_DE_DEFINIR`: confirmar si Address requiere schema propio o usa
  tablas en schema compartido.
- `PENDIENTE_DE_DEFINIR`: confirmar schema operativo de LeadHunter.
