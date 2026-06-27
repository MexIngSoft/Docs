# LeadHunter local runbook

## Estado

ACTIVE

## Objetivo

Ejecutar LeadHunter localmente con su base, APIs y web sin levantar proyectos
no relacionados.

## Cadena local

```text
WEB.NJ.NEXT.LeadHunter
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.Auth
  -> API.PY.DJANGO.LeadHunter
  -> PostgreSQL
```

| Servicio | Puerto | Compose |
|---|---:|---|
| PostgreSQL | `5432` | `Docker.DB.PG/docker-compose.leadhunter.db.yml` |
| Auth API | `8000` | `Docker.API.PY/docker-compose.leadhunter.api.yml` |
| LeadHunter Gateway | `8020` | `Docker.API.PY/docker-compose.leadhunter.api.yml` |
| LeadHunter API | `8021` | `Docker.API.PY/docker-compose.leadhunter.api.yml` |
| LeadHunter Web | `3007` | `Docker.WEB.NJ/docker-compose.leadhunter.web.yml` |

## Variables requeridas

Para arranque local sin busqueda real, las plantillas de `.env` son suficientes.
Para ejecutar busqueda real:

```text
APIFY_TOKEN=<token>
APIFY_ACTOR_ID=compass~crawler-google-places
```

Los secretos reales deben vivir en `Docker.API.PY/.env` o en archivos locales no
versionados. No se deben commitear tokens.

## Arranque

Desde la raiz del workspace:

```powershell
docker compose -f Docker.DB.PG\docker-compose.leadhunter.db.yml up -d
docker compose -f Docker.API.PY\docker-compose.leadhunter.api.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.leadhunter.web.yml up -d --build
```

## Validacion minima

```powershell
docker compose -f Docker.API.PY\docker-compose.leadhunter.api.yml config --quiet
docker compose -f Docker.WEB.NJ\docker-compose.leadhunter.web.yml config --quiet
Invoke-WebRequest http://localhost:8025/health/
Invoke-WebRequest http://localhost:8021/api/leadhunter/health/
Invoke-WebRequest http://localhost:3007/prospectos
```

## Comportamiento esperado sin Apify

LeadHunter no genera prospectos de muestra. Si `APIFY_TOKEN` no esta
configurado, el Gateway debe devolver un error controlado `APIFY_NOT_CONFIGURED`
y la web no debe mostrar datos falsos.
