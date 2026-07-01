# Agent especializado Database

## Alcance

PostgreSQL, bases, schemas, usuarios, migraciones, diccionario de datos y
retiro de SQLite.

## Lectura canonica

- `Docs/03_standards/database/postgresql-project-users-and-schemas.md`
- `Docs/03_standards/database/sql-server-publication-standard.md`
- `Docs/01_core_erp/database/00_database_overview.md`

## Reglas

- SQLite prohibido en configuracion activa.
- No crear bases definitivas sin contrato/ADR.
- Publicar nombres PascalCase estilo SQL Server cuando aplique.

## Validacion

- `python manage.py check`.
- `python manage.py migrate --check` o migraciones aplicadas segun entorno.
- Escaneo `db.sqlite3`.
