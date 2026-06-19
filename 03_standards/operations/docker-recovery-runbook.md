# Runbook Docker local

Este documento permite reconstruir el entorno Docker local de Comercial Platform
si se pierde configuracion o se cambia de equipo.

La arquitectura Docker objetivo del ecosistema JobCron vive en:

```txt
Docs/03_standards/docker/jobcron-official-docker-architecture.md
```

Este runbook describe el estado operativo actual. La red oficial vigente es
`jobcron_network`.

## Servicios

| Carpeta | Servicio | Contenedor | Puerto host | Red |
| --- | --- | --- | --- | --- |
| `Docker.DB.PG` | PostgreSQL | `db-postgresql` | `127.0.0.1:5432` | `jobcron_network` |
| `Docker.API.PY` | APIs Django | `api-multiproyecto` | `8000-8050` reservado, `8000-8017` publicado hoy | `jobcron_network` |
| `Docker.WEB.NJ` | Next.js frontends | `web-frontend-node` | `3000-3050` reservado, `3000-3009` asignado hoy | `jobcron_network` |
| `Docker.SW.Nginx` | Proxy Nginx | `nginx` | `80` | `jobcron_network` |

Registro canonico de puertos:

```txt
Docs/03_standards/operations/local-port-registry.md
```

## Orden recomendado de arranque

Ejecuta desde la raiz del workspace:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1
```

## Pruebas focalizadas por proyecto

Cuando el equipo local no soporte levantar todos los procesos al mismo tiempo,
se permite probar un proyecto a la vez sin crear contenedores alternos. La
regla es mantener los contenedores oficiales y cambiar solo la seleccion de
procesos:

```text
db-postgresql
api-multiproyecto
web-frontend-node
nginx
```

Ejemplo API:

```powershell
$env:API_PROJECTS="auth gateway jobcron search"
docker compose -f Docker.API.PY\docker-compose.yml up -d --no-build api-multiproyecto
```

Ejemplo Web:

```powershell
$env:WEB_PROJECTS="mexingsof"
docker compose -f Docker.WEB.NJ\docker-compose.yml up -d --no-build web-frontend-node
```

Si se requiere cambiar `API_PROJECTS` o `WEB_PROJECTS`, se reinicia el servicio
oficial con la nueva variable. No se debe crear otro `container_name`, no se
deben crear imagenes con `latest` y no se deben conservar imagenes derivadas de
directorios como `dockerapipy-*`, `dockerwebnj-*` o `crejo-*`.

Imagenes runtime oficiales:

```text
postgres:16.13
api-multiproyecto:3.10.19-slim-bookworm
web-frontend-node:20.19.0-bookworm-slim
nginx:1.24.0
```

Si necesitas liberar puertos reservados antes de arrancar:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -ReleasePorts
```

Si LexNova u otra web Next.js carga sin estilos:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -RepairCss
```

Comandos manuales equivalentes:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Reserve-WorkspacePorts.ps1 -DryRun
docker compose -f Docker.DB.PG\docker-compose.yml up -d
docker compose -f Docker.API.PY\docker-compose.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.yml up -d --build
docker compose -f Docker.SW.Nginx\docker-compose.yml up -d --build
```

Si el diagnostico de puertos muestra procesos ajenos a Docker usando puertos
reservados, ejecutar:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Reserve-WorkspacePorts.ps1 -KillConflicts
```

Entrada principal:

```txt
http://localhost
```

Entradas directas de diagnostico:

```txt
http://localhost:3000
http://localhost:8000
```

Nota: `http://localhost:8000/` puede responder `404` aunque el contenedor API
este sano. Para APIs multiproyecto se valida puerto, proceso Uvicorn y endpoint
propio cuando exista.

## Red Docker

En el estado actual, todos los compose declaran:

```yaml
networks:
  default:
    name: jobcron_network
```

Esto permite que Nginx resuelva:

```txt
web-frontend-node
api-multiproyecto
```

Para nuevos compose y refactors Docker, usar la misma red oficial:

```yaml
networks:
  jobcron_network:
    external: true
```

No crear redes aisladas por proyecto, frontend o API.

## Variables de PostgreSQL

La plantilla vive en:

```txt
Docker.DB.PG/.env.example
```

Para restaurar:

```powershell
Copy-Item Docker.DB.PG\.env.example Docker.DB.PG\.env
```

Despues edita `Docker.DB.PG/.env` y cambia todos los valores `change-me-*`.

Variables requeridas:

| Variable | Uso |
| --- | --- |
| Imagen PostgreSQL | Fijada en Compose como `postgres:16.13`; no debe depender de variable para evitar diferencias entre desarrollo y produccion. |
| `POSTGRES_PORT` | Puerto publicado en host. |
| `POSTGRES_USER` | Usuario administrador inicial. |
| `POSTGRES_DB` | Base administrativa inicial. |
| `POSTGRES_PASSWORD` | Password del usuario administrador. |
| `AUTH_DB_PASSWORD` | Password de `auth_user`. |
| `LEXNOVA_DB_PASSWORD` | Password de `lexnova_user`. |
| `COMERCIAL_DB_PASSWORD` | Password de `comercial_user`. |

## Bases y schemas esperados

PostgreSQL crea:

| Database | Owner |
| --- | --- |
| `auth` | `auth_user` |
| `lexnova` | `lexnova_user` |
| `comercial` | `comercial_user` |

Scripts fuente, ejecutados automaticamente cuando el volumen `postgres` esta vacio:

```txt
Docker.DB.PG/docker/postgres/01-users.sh
Docker.DB.PG/docker/postgres/02-databases.sh
Docker.DB.PG/docker/postgres/03_schemas.sql
```

Para reaplicar cambios sin borrar datos:

```powershell
docker compose -f Docker.DB.PG\docker-compose.yml --profile tools run --rm db-postgresql-apply
```

Ese comando no debe dejar un segundo contenedor PostgreSQL permanente.

## Rutas Nginx

| Ruta publica | Destino |
| --- | --- |
| `http://localhost/` | `web-frontend-node:3000` |
| `http://localhost/api/mock/` | `web-frontend-node:3000` |
| `http://tecnotelec.localhost/` | `web-frontend-node:3001` |
| `http://lexnova.localhost/` | `web-frontend-node:3002` |
| `/api` | `api-multiproyecto:8000` |
| `/static/` | `/app/web/static/` dentro de Nginx |

Si una API distinta a `auth` debe exponerse por Nginx, agrega una ruta dedicada en `Docker.SW.Nginx/nginx.conf`.

## Validacion rapida

```powershell
docker compose -f Docker.DB.PG\docker-compose.yml config
docker compose -f Docker.API.PY\docker-compose.yml config
docker compose -f Docker.WEB.NJ\docker-compose.yml config
docker compose -f Docker.SW.Nginx\docker-compose.yml config
```

Ver estado:

```powershell
docker ps --filter "network=jobcron_network"
```

Logs:

```powershell
docker compose -f Docker.DB.PG\docker-compose.yml logs -f
docker compose -f Docker.API.PY\docker-compose.yml logs -f api-multiproyecto
docker compose -f Docker.WEB.NJ\docker-compose.yml logs -f web-frontend-node
docker compose -f Docker.SW.Nginx\docker-compose.yml logs -f nginx
```

## Recuperacion desde cero

Advertencia: el siguiente comando borra datos locales de PostgreSQL.

```powershell
docker compose -f Docker.DB.PG\docker-compose.yml down -v
docker compose -f Docker.DB.PG\docker-compose.yml up -d
```

Despues levanta API, Web y Nginx en el orden recomendado.

## Limpieza segura

La limpieza Docker debe conservar datos de PostgreSQL salvo autorizacion
explicita para borrar volumenes.

Comandos permitidos:

```powershell
docker compose -p comercial_platform down --remove-orphans
docker container prune
docker image prune
docker network prune
```

Comando prohibido salvo autorizacion explicita:

```powershell
docker volume prune
```

No borrar volumenes con datos de negocio ni ejecutar limpiezas globales que
eliminen informacion productiva o local necesaria para validaciones.

## Problemas comunes

| Sintoma | Causa probable | Accion |
| --- | --- | --- |
| Nginx responde 502 | API o Web no estan arriba, o no estan en red `jobcron_network`. | Revisa `docker ps --filter "network=jobcron_network"` y logs de Nginx. |
| `host not found in upstream` | Cambio el nombre del contenedor destino. | Alinea `container_name` con `nginx.conf`. |
| Frontend llama directo a `:8000` | `NEXT_PUBLIC_HOST` esta mal configurado. | Debe ser `http://localhost` cuando se usa Nginx. |
| PostgreSQL pide variables | Falta `Docker.DB.PG/.env`. | Copia `.env.example` y cambia los secretos. |
| Cambios de schemas no aparecen | El volumen ya existia antes del cambio. | Ejecuta `docker compose -f Docker.DB.PG\docker-compose.yml --profile tools run --rm db-postgresql-apply`. |
