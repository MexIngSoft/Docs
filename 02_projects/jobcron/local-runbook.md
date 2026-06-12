# JobCron local runbook

## Estado

ACTIVE

## Objetivo

Ejecutar JobCron localmente con su base, API y web segun la arquitectura Docker
oficial del repositorio.

## Cadena local

```text
WEB.NJ.NEXT.JobCron
  -> API.PY.DJANGO.JobCron
  -> API.PY.DJANGO.Auth
  -> PostgreSQL
```

| Servicio | Puerto | Compose |
|---|---:|---|
| PostgreSQL | `5432` | `Docker.DB.PG/docker-compose.jobcron.db.yml` |
| Auth API | `8000` | `Docker.API.PY/docker-compose.jobcron.api.yml` |
| JobCron API | `8022` | `Docker.API.PY/docker-compose.jobcron.api.yml` |
| JobCron Web | `3000` | `Docker.WEB.NJ/docker-compose.jobcron.web.yml` |

## Variables

La plantilla global `Docker.API.PY/.env.example` incluye las variables
`JOBCRON_*`. La API tambien tiene plantilla local en:

```text
Docker.API.PY/API.PY.DJANGO.JobCron/.env.local.example
```

No se encontro documentacion canonica adicional de variables runtime especificas
para JobCron Web; se usan los patrones existentes de Next.js del workspace.

## Arranque

```powershell
docker compose -f Docker.DB.PG\docker-compose.jobcron.db.yml up -d
docker compose -f Docker.API.PY\docker-compose.jobcron.api.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.jobcron.web.yml up -d --build
```

## Validacion minima

```powershell
docker compose -f Docker.DB.PG\docker-compose.jobcron.db.yml config --quiet
docker compose -f Docker.API.PY\docker-compose.jobcron.api.yml config --quiet
docker compose -f Docker.WEB.NJ\docker-compose.jobcron.web.yml config --quiet
Invoke-WebRequest http://localhost:3000
```

Si la API no expone `GET /`, validar proceso, puerto `8022` y rutas propias del
servicio cuando esten documentadas.
