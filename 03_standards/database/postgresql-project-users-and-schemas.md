# PostgreSQL por proyecto, usuarios y schemas

## Estado

ACTIVE

## Objetivo

Definir el estado operativo permitido para bases, usuarios, schemas y
migraciones PostgreSQL del workspace. Cada API debe operar sobre su propia base
fisica y su propio usuario de aplicacion.

## Reglas obligatorias

- PostgreSQL oficial se ejecuta en `db-postgresql`.
- Imagen oficial: `postgres:16.13`.
- Red oficial: `jobcron_network`.
- Stack Docker actual: `comercial_platform`.
- El nombre del stack no autoriza una base llamada `comercial`.
- No usar SQLite ni `db.sqlite3`.
- No usar `postgres` como base de negocio.
- No usar `postgres` como usuario de aplicacion.
- No usar bases con sufijo `_db`.
- Las bases publicadas deben usar sintaxis tipo SQL Server/PascalCase.
- Cada API debe tener `<API>_DB_NAME`, `<API>_DB_USER` y `<API>_DB_PASSWORD`.
- Las bases no deben comunicarse directo entre si; la integracion ocurre via API
  o Gateway.
- `comercial` queda retirada como base operativa. Si se requiere rollback, usar
  respaldo externo, no una base viva compartida.

## Bases oficiales vigentes

| Base | Usuario | Schema principal | API responsable |
|---|---|---|---|
| `Address` | `address_user` | `Address`, `public` | Address API |
| `Auth` | `auth_user` | `Auth` | Auth API |
| `Catalog` | `catalog_user` | `Catalog`, `public` | Catalog API |
| `Customization` | `customization_user` | `Customization`, `public` | Customization API |
| `DocuCore` | `docucore_user` | `DocuCore`, `public` | DocuCore API |
| `Document` | `document_user` | `Document`, `public` | Document API |
| `Fiscal` | `fiscal_user` | `Fiscal`, `public` | Fiscal API |
| `Fiscora` | `fiscora_user` | `Fiscora`, `public` | Fiscora API |
| `Gateway` | `gateway_user` | `Gateway`, `public` | Gateway API |
| `Imagrafity` | `imagrafity_user` | `Imagrafity`, `public` | Imagrafity API |
| `Inventory` | `inventory_user` | `Inventory`, `public` | Inventory API |
| `JobCron` | `jobcron_user` | `JobCron` | JobCron API |
| `LexNova` | `lexnova_user` | LexNova schemas | LexNova API |
| `Pricing` | `pricing_user` | `Pricing`, `public` | Pricing API |
| `Procurement` | `procurement_user` | `Procurement`, `public` | Procurement API |
| `RefaPart` | `refapart_user` | `RefaPart`, `public` | RefaPart API |
| `Sales` | `sales_user` | `Sales`, `public` | Sales API |
| `Search` | `search_user` | `Search`, `public` | Search API |
| `Supplier` | `supplier_user` | `Supplier`, `public` | Supplier API |
| `TecnoTelec` | `tecnotelec_user` | `TecnoTelec`, `TecnoTelecGateway`, `public` | TecnoTelec API |

`postgres` existe solo para administracion local.

## Variables esperadas

Cada API debe declarar sus variables propias. Ejemplos:

```txt
AUTH_DB_NAME=Auth
AUTH_DB_USER=auth_user
AUTH_DB_PASSWORD=...

REFAPART_DB_NAME=RefaPart
REFAPART_DB_USER=refapart_user
REFAPART_DB_PASSWORD=...

JOBCRON_DB_NAME=JobCron
JOBCRON_DB_USER=jobcron_user
JOBCRON_DB_PASSWORD=...
```

Variables prohibidas para configuracion activa:

```txt
COMERCIAL_DB_NAME
COMERCIAL_DB_USER
COMERCIAL_DB_PASSWORD
```

## Migracion y retiro de `comercial`

El 2026-07-01 se valido que `comercial` aun tenia datos en tablas `Address*` y
`RefaPart*`, y estructura `Search*`. Antes de retirarla se ejecuto:

- respaldo binario local de `comercial`;
- migracion de `Address*` hacia `Address`;
- migracion de `RefaPart*` hacia `RefaPart`;
- migracion de estructura/datos `Search*` hacia `Search`;
- comparacion de conteos entre origen y destino;
- renombrado de bases antiguas con `_db` a PascalCase;
- eliminacion de la base `comercial`;
- validacion `manage.py check` y `showmigrations --plan` de las APIs activas.

Respaldo local previo al retiro:

```txt
C:\Users\cash1\AppData\Local\Temp\Workspace.Comercial\db-backups\pre-rename-20260701_034045
```

Ese respaldo es el unico objetivo vigente para conservar informacion historica
de `comercial`. No debe recrearse una base viva `comercial` dentro del stack.

## Validaciones obligatorias

Despues de cambiar nombres, usuarios o passwords:

```powershell
docker compose -f Docker.DB.PG\docker-compose.yml --profile tools run --rm db-postgresql-apply
docker compose -f Docker.API.PY\docker-compose.yml up -d --force-recreate api-multiproyecto
```

Validar bases antiguas:

```sql
SELECT datname
FROM pg_database
WHERE datistemplate = false
  AND (datname = 'comercial' OR datname LIKE '%_db')
ORDER BY datname;
```

El resultado esperado es cero filas.

Validar cada API:

```powershell
python manage.py check
python manage.py showmigrations --plan
```

## Criterio para borrar `comercial`

`comercial` solo podia borrarse cuando:

- existiera respaldo binario externo;
- no hubiera API activa apuntando a `COMERCIAL_DB_*`;
- las tablas utiles estuvieran migradas a su base responsable;
- los conteos origen/destino coincidieran;
- las APIs validaran contra sus bases separadas;
- `docker-postgresql-apply` no recreara `comercial`.

Ese criterio quedo cumplido el 2026-07-01.
