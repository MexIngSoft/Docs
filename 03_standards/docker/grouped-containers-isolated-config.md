# Contenedores agrupados con configuracion aislada

## Objetivo

Definir el patron oficial para despliegues de bajo costo: pocos contenedores,
pero configuracion separada por proyecto.

Agrupar proyectos dentro de un contenedor no significa compartir secretos,
usuarios, bases ni responsabilidades.

## Topologia permitida por costo

```txt
db-postgresql
api-multiproyecto
web-frontend-node
nginx
```

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
| Auth | `Auth` | `auth_user` | `Auth` | `AUTH_DJANGO_SECRET_KEY` |
| LexNova | `LexNova` | `lexnova_user` | `Person` como schema inicial | `LEXNOVA_DJANGO_SECRET_KEY` |
| JobCron | `JobCron` | `jobcron_user` | `JobCron` | `JOBCRON_DJANGO_SECRET_KEY` |
| Gateway | `Gateway` | `gateway_user` | `Gateway` | `GATEWAY_DJANGO_SECRET_KEY` |
| Address | `Address` | `address_user` | `Address` | `ADDRESS_DJANGO_SECRET_KEY` |
| Catalog | `Catalog` | `catalog_user` | `Catalog` | `CATALOG_DJANGO_SECRET_KEY` |
| Inventory | `Inventory` | `inventory_user` | `Inventory` | `INVENTORY_DJANGO_SECRET_KEY` |
| Pricing | `Pricing` | `pricing_user` | `Pricing` | `PRICING_DJANGO_SECRET_KEY` |
| Procurement | `Procurement` | `procurement_user` | `Procurement` | `PROCUREMENT_DJANGO_SECRET_KEY` |
| Sales | `Sales` | `sales_user` | `Sales` | `SALES_DJANGO_SECRET_KEY` |
| Supplier | `Supplier` | `supplier_user` | `Supplier` | `SUPPLIER_DJANGO_SECRET_KEY` |
| Search | `Search` | `search_user` | `Search` | `SEARCH_DJANGO_SECRET_KEY` |
| RefaPart | `RefaPart` | `refapart_user` | `RefaPart` | `REFAPART_DJANGO_SECRET_KEY` |
| TecnoTelec | `TecnoTelec` | `tecnotelec_user` | `TecnoTelec` | `TECNOTELEC_DJANGO_SECRET_KEY` |
| Customization | `Customization` | `customization_user` | `Customization` | `CUSTOMIZATION_DJANGO_SECRET_KEY` |
| Document | `Document` | `document_user` | `Document` | `DOCUMENT_DJANGO_SECRET_KEY` |
| DocuCore | `DocuCore` | `docucore_user` | `DocuCore` | `DOCUCORE_DJANGO_SECRET_KEY` |
| Fiscal | `Fiscal` | `fiscal_user` | `Fiscal` | `FISCAL_DJANGO_SECRET_KEY` |
| Fiscora | `Fiscora` | `fiscora_user` | `Fiscora` | `FISCORA_DJANGO_SECRET_KEY` |
| Imagrafity | `Imagrafity` | `imagrafity_user` | `Imagrafity` | `IMAGRAFITY_DJANGO_SECRET_KEY` |

## Patron de base de datos

Las bases se separan por responsabilidad y usan nombres PascalCase:

```txt
Auth
Gateway
RefaPart
JobCron
Catalog
Inventory
Pricing
Supplier
...
```

No se permite una base global `comercial` ni bases con sufijo `_db`.

## Docker

`Docker.API.PY/docker-compose.yml` expone variables por API.

`Docker.API.PY/start.sh` traduce esas variables al entorno que espera cada
Django antes de iniciar cada proceso `uvicorn`.

Ejemplo:

```txt
SUPPLIER_DJANGO_SECRET_KEY -> DJANGO_SECRET_KEY
SUPPLIER_DB_NAME           -> POSTGRES_DB / DB_NAME
SUPPLIER_DB_USER           -> POSTGRES_USER / DB_USER
SUPPLIER_DB_PASSWORD       -> POSTGRES_PASSWORD / DB_PASSWORD
SUPPLIER_DB_SCHEMA         -> DB_SCHEMA
```

Variables prohibidas para ejecucion activa:

```txt
COMERCIAL_DB_NAME
COMERCIAL_DB_USER
COMERCIAL_DB_PASSWORD
```

## Red compartida

Los contenedores agrupados deben participar en una red compartida del
ecosistema:

```txt
jobcron_network
```

No se deben crear redes aisladas por proyecto como regla general, porque APIs
compartidas como Auth, Catalog, Supplier o Pricing deben reutilizarse sin
duplicar contenedores.

## `.env.local`

Cada proyecto Django debe conservar `.env.local.example` cuando aplique.

En desarrollo local directo, cada proyecto puede tener su propio `.env.local`.

En Docker, el contenedor inyecta variables desde `Docker.API.PY/.env`, pero no
debe usar una sola variable global para todos los proyectos.

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

## Prohibido

- Usar `postgres` como usuario de aplicacion.
- Usar la base `postgres` para datos de negocio.
- Usar `comercial` como base activa o de respaldo vivo.
- Usar bases con sufijo `_db`.
- Compartir una sola `DJANGO_SECRET_KEY` para todas las APIs.
- Compartir una sola credencial de base de datos para todas las APIs.
- Documentar secretos reales.
- Crear tablas nuevas con snake_case si son parte de APIs publicadas.
- Mezclar datos maestros de Core APIs dentro de Gateway.
