# Arquitectura Docker oficial JobCron

## Objetivo

La arquitectura Docker oficial del ecosistema JobCron debe permitir dos formas
de ejecucion sin cambiar archivos generales por necesidades de un solo
proyecto:

1. Ejecutar todo el ecosistema completo.
2. Ejecutar un proyecto web con sus APIs, bases y proxy necesarios.

Esta regla aplica a `Docker.DB.PG`, `Docker.API.PY`, `Docker.WEB.NJ` y
`Docker.SW.Nginx`.

## Carpetas principales

| Carpeta | Responsabilidad |
|---|---|
| `Docker.DB.PG` | Bases de datos, schemas, volumenes, respaldos e inicializacion. |
| `Docker.API.PY` | APIs Django, Gateways/BFF y corridas generales o individuales. |
| `Docker.WEB.NJ` | Webs Next.js y corridas generales o individuales. |
| `Docker.SW.Nginx` | Proxy, rutas internas, dominios locales y entrada general del sistema. |

## Composes master

Los archivos master representan la corrida completa del ecosistema:

```text
Docker.DB.PG/docker-compose.master.db.yml
Docker.API.PY/docker-compose.master.api.yml
Docker.WEB.NJ/docker-compose.master.web.yml
Docker.SW.Nginx/docker-compose.master.nginx.yml
```

Los compose master pueden incluir o extender los compose base de cada carpeta,
pero deben existir como ubicacion canonica para correr todo.

## Composes por proyecto

Cada proyecto web debe tener compose propio para una corrida focalizada. La
ubicacion canonica es:

```text
Docker.DB.PG/docker-compose.<proyecto>.db.yml
Docker.API.PY/docker-compose.<proyecto>.api.yml
Docker.WEB.NJ/docker-compose.<proyecto>.web.yml
Docker.SW.Nginx/docker-compose.<proyecto>.nginx.yml
```

Regla de limpieza: el compose por proyecto no debe copiar todo el servicio si
solo cambia la lista de procesos. En ese caso debe ser un overlay delgado que
extiende el compose base y define `API_PROJECTS` o `WEB_PROJECTS`.

Una corrida por proyecto no debe duplicar APIs compartidas que ya esten sanas.
Debe levantar solo lo que falte o reconstruir solo lo que cambio.

## Dependencias por proyecto

| Proyecto web | Dependencias esperadas |
|---|---|
| TecnoTelec | TecnoTelec Gateway, Auth, Catalog, Supplier, Pricing, Inventory, Sales, TecnoTelec API, base comercial y base auth. |
| LexNova | LexNova Gateway, Auth, LexNova API, base auth y base LexNova. |
| JobCron | JobCron Gateway/API, Auth, APIs administrativas necesarias, base auth y base JobCron si aplica. |

Un proyecto web no es dueno de una API compartida. `Auth`, `Catalog`,
`Supplier`, `Pricing`, `Inventory`, `Sales` y capacidades core pertenecen al
ecosistema o al dominio compartido correspondiente.

## Dockerfiles

Debe existir un Dockerfile base por tecnologia/capa y Dockerfiles especificos
solo cuando el proyecto tenga instalacion, build o configuracion diferente que
no se pueda expresar con variables o scripts de arranque.

APIs:

```text
Docker.API.PY/Dockerfile.api.base
Docker.API.PY/Dockerfile.<api-o-proyecto>
```

Webs:

```text
Docker.WEB.NJ/Dockerfile.web.base
Docker.WEB.NJ/Dockerfile.<proyecto>
```

Base de datos:

```text
Imagen oficial postgres desde Docker.DB.PG/docker-compose.yml
```

No se crean Dockerfiles especificos por proyecto si todos comparten runtime y
dependencias instalables desde sus `requirements.txt` o `package-lock.json`.

## Variables de entorno

No se deben borrar `.env.example` ni `.env.local.example`.

| Archivo | Uso |
|---|---|
| `.env.example` | Plantilla documentada sin secretos. |
| `.env.local.example` | Plantilla para desarrollo local. |
| `.env.local` | Valores reales locales no versionados. |
| `.env.master` | Valores para correr todo el ecosistema. |
| `.env.<proyecto>` | Valores para correr un proyecto individual. |
| `.env.<api>` | Valores para correr una API individual. |

Ubicacion recomendada por capa:

```text
Docker.DB.PG/.env.master.db
Docker.API.PY/.env.master.api
Docker.WEB.NJ/.env.master.web
Docker.SW.Nginx/.env.master.nginx
```

Ubicacion recomendada por proyecto:

```text
Docker.DB.PG/.env.<proyecto>.db
Docker.API.PY/.env.<proyecto>.api
Docker.WEB.NJ/.env.<proyecto>.web
Docker.SW.Nginx/.env.<proyecto>.nginx
```

Cada variable nueva debe agregarse a las plantillas y archivos de entorno donde
aplique. Los secretos deben ser especificos por API:

```text
AUTH_DJANGO_SECRET_KEY
CATALOG_DJANGO_SECRET_KEY
SUPPLIER_DJANGO_SECRET_KEY
LEXNOVA_DJANGO_SECRET_KEY
TECNOTELEC_DJANGO_SECRET_KEY
```

No se debe usar una sola `DJANGO_SECRET_KEY` global para todas las APIs.

## Bases de datos

La base se gestiona desde `Docker.DB.PG`.

Bases principales:

```text
auth
lexnova
comercial
jobcron, si aplica
```

La base `comercial` puede dividirse por schemas:

```text
catalog
inventory
pricing
procurement
sales
supplier
tecnotelec
customization
```

Los nombres publicados deben seguir el estandar PascalCase estilo SQL Server
documentado en:

```text
Docs/03_standards/database/sql-server-publication-standard.md
```

## Red Docker oficial

La red Docker oficial objetivo es:

```text
jobcron_network
```

Debe ser compartida, estable y persistente para Webs, Gateways, APIs core, APIs
de proyecto, bases de datos, Nginx y servicios auxiliares.

La red se declara como externa:

```yaml
networks:
  jobcron_network:
    external: true
```

Antes de levantar cualquier proyecto:

```powershell
docker network create jobcron_network
```

Si ya existe, no debe recrearse ni eliminarse. La comunicacion interna debe usar
nombres de servicio Docker y no `localhost` ni `127.0.0.1`.

### Compatibilidad temporal

El entorno actual puede seguir usando la red local heredada `crejo` mientras se
migra de forma coordinada. Durante esa transicion:

- los compose existentes no deben cambiarse parcialmente;
- Nginx, scripts, readmes y healthchecks deben migrarse en la misma fase;
- no deben coexistir servicios duplicados por renombrar la red;
- `jobcron_network` es el nombre objetivo para nuevos compose o refactors
  Docker.

## Servicios compartidos

No deben existir dos contenedores activos para la misma API compartida.

Incorrecto:

```text
api-auth-tecnotelec
api-auth-lexnova
api-auth-jobcron
```

Correcto:

```text
api-auth
```

Nombres estables sugeridos:

```text
api-auth
api-catalog
api-supplier
api-pricing
api-inventory
api-sales
api-procurement
db-postgres
nginx-jobcron
```

Los servicios propios de proyecto si pueden incluir el nombre del proyecto.

## Actualizacion de APIs compartidas

Cuando una API compartida cambia:

1. Detener solo esa API.
2. Reconstruirla si hubo cambios de codigo, Dockerfile, dependencias o entorno.
3. Levantarla de nuevo.
4. Validar healthcheck.
5. Continuar con los proyectos dependientes.

No se debe levantar otra copia por proyecto.

## Healthchecks

Toda API compartida debe tener healthcheck. Ruta recomendada:

```text
/api/health/
```

Si una API no esta saludable, se deben revisar logs, reiniciar o reconstruir
solo ese servicio y continuar cuando el healthcheck responda correctamente.

## Puertos y exposicion

Los puertos externos solo deben exponerse cuando sean necesarios:

- Nginx expone puertos publicos.
- Webs pueden exponerse en local para diagnostico.
- APIs internas no deben exponerse publicamente.
- PostgreSQL no debe exponerse publicamente en produccion.

El registro local de puertos vive en:

```text
Docs/03_standards/operations/local-port-registry.md
```

## Perfiles Docker

Los compose pueden usar perfiles:

```text
master
tecnotelec
lexnova
jobcron
auth
commercial
```

## Flujo para crear un proyecto web

1. Crear Dockerfile del proyecto web solo si lo necesita.
2. Crear `docker-compose.<proyecto>.web.yml`.
3. Crear `docker-compose.<proyecto>.api.yml`.
4. Crear `docker-compose.<proyecto>.db.yml` si requiere base/schemas propios.
5. Crear `.env.<proyecto>` solo si necesita variables locales separadas.
6. Conectar su Gateway/BFF.
7. Definir que APIs necesita en `API_PROJECTS`.
8. Definir que web necesita en `WEB_PROJECTS`.
9. Probar corrida individual.
10. Documentar la arquitectura del proyecto.

## Regla final

```text
Master = corre todo.
Proyecto = corre solo lo necesario.
API = corre una API individual.
DB = administra bases y schemas.
Nginx = entrada y ruteo.
.env.example = documentacion.
.env.local = desarrollo local.
.env.master = corrida general.
.env.<proyecto> = corrida individual.
```

Los Dockerfile y docker-compose generales representan la infraestructura
completa. Los compose por proyecto representan ejecucion focalizada y deben
preferir overlays delgados antes que duplicar servicios completos.
