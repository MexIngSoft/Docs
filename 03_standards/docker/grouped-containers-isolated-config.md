# Contenedores agrupados con configuracion aislada

## Objetivo

Definir el patron oficial para despliegues de bajo costo: pocos contenedores, pero configuracion separada por proyecto.

Este patron aplica para desarrollo, staging y produccion inicial.

Este documento complementa la arquitectura Docker oficial de JobCron:

```txt
Docs/03_standards/docker/jobcron-official-docker-architecture.md
```

Si hay conflicto, la arquitectura oficial define el objetivo y este documento
explica la compatibilidad de bajo costo mientras existan contenedores
agrupados.

## Topologia permitida por costo

```txt
db-postgresql
api-multiproyecto
web-frontend-node
nginx
```

Agrupar proyectos dentro de un contenedor no significa compartir secretos, usuarios, bases ni responsabilidades.

## Regla obligatoria

Cada proyecto debe arrancar con su propia configuracion:

```txt
DJANGO_SECRET_KEY
POSTGRES_DB
POSTGRES_USER
POSTGRES_PASSWORD
DB_SCHEMA
DJANGO_ALLOWED_HOSTS
CORS_ALLOWED_ORIGINS
URLs internas requeridas
credenciales externas propias
```

## APIs dentro de `api-multiproyecto`

| Proyecto | Base | Usuario | Schema principal | Secret key |
|---|---|---|---|---|
| Auth | `auth` | `auth_user` | `Auth` | `AUTH_DJANGO_SECRET_KEY` |
| LexNova Gateway | `comercial` | `comercial_user` | `LexNovaGateway` | `LEXNOVA_GATEWAY_DJANGO_SECRET_KEY` |
| LexNova | `lexnova` | `lexnova_user` | `Person` como schema inicial | `LEXNOVA_DJANGO_SECRET_KEY` |
| Catalog | `comercial` | `comercial_user` | `Catalog` | `CATALOG_DJANGO_SECRET_KEY` |
| Inventory | `comercial` | `comercial_user` | `Inventory` | `INVENTORY_DJANGO_SECRET_KEY` |
| Pricing | `comercial` | `comercial_user` | `Pricing` | `PRICING_DJANGO_SECRET_KEY` |
| Procurement | `comercial` | `comercial_user` | `Procurement` | `PROCUREMENT_DJANGO_SECRET_KEY` |
| Sales | `comercial` | `comercial_user` | `Sales` | `SALES_DJANGO_SECRET_KEY` |
| Supplier | `comercial` | `comercial_user` | `Supplier` | `SUPPLIER_DJANGO_SECRET_KEY` |
| TecnoTelec Gateway | `comercial` | `comercial_user` | `TecnoTelecGateway` | `TECNOTELEC_GATEWAY_DJANGO_SECRET_KEY` |
| TecnoTelec API | `comercial` | `comercial_user` | `TecnoTelec` | `TECNOTELEC_DJANGO_SECRET_KEY` |
| Customization | `comercial` | `comercial_user` | `Customization` | `CUSTOMIZATION_DJANGO_SECRET_KEY` |

## Patron de base de datos

Las bases se agrupan por dominio mayor:

```txt
auth
comercial
lexnova
```

Las tablas y schemas deben seguir el patron tipo SQL Server:

- Schemas en PascalCase: `Catalog`, `Supplier`, `TecnoTelecGateway`.
- Tablas en PascalCase plural cuando aplique: `Products`, `ProductPrices`, `SupplierProducts`.
- Columnas en PascalCase: `IdProduct`, `CreatedAt`, `IsActive`.
- Llaves primarias como `Id` o `Id<Entity>` segun el modelo existente.
- No usar nombres nuevos en snake_case para tablas o columnas publicadas.

## Docker

`Docker.API.PY/docker-compose.yml` solo expone variables agrupadas y exige secretos por proyecto.

`Docker.API.PY/start.sh` es responsable de traducir esas variables al entorno que espera cada Django antes de iniciar cada proceso `uvicorn`.

Ejemplo:

```txt
SUPPLIER_DJANGO_SECRET_KEY -> DJANGO_SECRET_KEY
COMERCIAL_DB_NAME          -> POSTGRES_DB / DB_NAME
COMERCIAL_DB_USER          -> POSTGRES_USER / DB_USER
COMERCIAL_DB_PASSWORD      -> POSTGRES_PASSWORD / DB_PASSWORD
SUPPLIER_DB_SCHEMA         -> DB_SCHEMA
```

## Red compartida

Los contenedores agrupados deben participar en una red compartida del
ecosistema. La red vigente del workspace es:

```txt
crejo
```

`jobcron_network` queda reservada como migracion futura coordinada. No se deben
crear redes aisladas por proyecto como regla general, porque APIs compartidas
como Auth, Catalog, Supplier o Pricing deben poder ser reutilizadas por varias
webs sin duplicar contenedores.

## `.env.local`

Cada proyecto Django debe conservar `.env.local.example`.

En desarrollo local directo, cada proyecto puede tener su propio `.env.local`.

En Docker, el contenedor puede inyectar variables desde `Docker.API.PY/.env`, pero no debe usar una sola variable global para todos los proyectos.

## Secretos

No versionar:

```txt
.env
.env.local
.env.*
```

Solo versionar:

```txt
.env.example
.env.local.example
```

## Worker SYSCOM

El worker SYSCOM puede vivir dentro del contenedor de APIs por costo, pero debe ejecutar con configuracion de `Supplier`:

```txt
SUPPLIER_DJANGO_SECRET_KEY
COMERCIAL_DB_NAME
COMERCIAL_DB_USER
COMERCIAL_DB_PASSWORD
SUPPLIER_DB_SCHEMA
SYSCOM_CLIENT_ID
SYSCOM_CLIENT_SECRET
```

## Prohibido

- Usar `postgres` como usuario de aplicacion.
- Usar la base `postgres` para datos de negocio.
- Compartir una sola `DJANGO_SECRET_KEY` para todas las APIs.
- Documentar secretos reales.
- Crear tablas nuevas con snake_case si son parte de APIs publicadas.
- Mezclar datos maestros de Core APIs dentro de Gateway.
