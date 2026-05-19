# Runbook Docker local

Este documento permite reconstruir el entorno Docker local `crejo` si se pierde configuracion o se cambia de equipo.

## Servicios

| Carpeta | Servicio | Contenedor | Puerto host | Red |
| --- | --- | --- | --- | --- |
| `Docker.DB.PG` | PostgreSQL | `db-postgresql` | `127.0.0.1:5432` | `crejo` |
| `Docker.API.PY` | APIs Django | `api-backend-python` | `8000-8050` reservado, `8000-8017` publicado hoy | `crejo` |
| `Docker.WEB.NJ` | Next.js frontends | `web-frontend-node` | `3000-3050` reservado, `3000-3005` asignado hoy | `crejo` |
| `Docker.SW.Nginx` | Proxy Nginx | `nginx` | `80` | `crejo` |

Registro canonico de puertos:

```txt
Docs/03_standards/operations/local-port-registry.md
```

## Orden recomendado de arranque

Ejecuta desde la raiz del workspace:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1
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

Todos los compose deben declarar:

```yaml
networks:
  default:
    name: crejo
```

Esto permite que Nginx resuelva:

```txt
web-frontend-node
api-backend-python
```

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
| `POSTGRES_VERSION` | Version de imagen PostgreSQL. |
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
| `/api` | `api-backend-python:8000` |
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
docker ps --filter "network=crejo"
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

## Problemas comunes

| Sintoma | Causa probable | Accion |
| --- | --- | --- |
| Nginx responde 502 | API o Web no estan arriba, o no estan en red `crejo`. | Revisa `docker ps --filter "network=crejo"` y logs de Nginx. |
| `host not found in upstream` | Cambio el nombre del contenedor destino. | Alinea `container_name` con `nginx.conf`. |
| Frontend llama directo a `:8000` | `NEXT_PUBLIC_HOST` esta mal configurado. | Debe ser `http://localhost` cuando se usa Nginx. |
| PostgreSQL pide variables | Falta `Docker.DB.PG/.env`. | Copia `.env.example` y cambia los secretos. |
| Cambios de schemas no aparecen | El volumen ya existia antes del cambio. | Ejecuta `docker compose -f Docker.DB.PG\docker-compose.yml --profile tools run --rm db-postgresql-apply`. |
