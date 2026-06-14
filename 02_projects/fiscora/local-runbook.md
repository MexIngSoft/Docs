# Fiscora local runbook

## Estado

ACTIVE

## Objetivo

Ejecutar Fiscora localmente con sus dependencias de autenticacion, documentos,
API fiscal, Gateway, Web estatica y base de datos.

## Cadena local

```text
WEB.NJ.NEXT.Fiscora
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.Auth
  -> API.PY.DJANGO.Document
  -> API.PY.DJANGO.Fiscora
  -> API.PY.DJANGO.Fiscal
  -> PostgreSQL
```

| Servicio | Puerto | Compose |
|---|---:|---|
| PostgreSQL | `5432` | `Docker.DB.PG/docker-compose.fiscora.db.yml` |
| Auth API | `8000` | `Docker.API.PY/docker-compose.fiscora.api.yml` |
| Document API | `8011` | `Docker.API.PY/docker-compose.fiscora.api.yml` |
| Fiscora Gateway | `8014` | `Docker.API.PY/docker-compose.fiscora.api.yml` |
| Fiscora API | `8015` | `Docker.API.PY/docker-compose.fiscora.api.yml` |
| Fiscal API | `8016` | `Docker.API.PY/docker-compose.fiscora.api.yml` |
| Fiscora Web | `3005` | `Docker.WEB.NJ/docker-compose.fiscora.web.yml` |

## Arranque

```powershell
docker compose -f Docker.DB.PG\docker-compose.fiscora.db.yml up -d
docker compose -f Docker.API.PY\docker-compose.fiscora.api.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.fiscora.web.yml up -d --build
```

## Validacion minima

```powershell
docker compose -f Docker.API.PY\docker-compose.fiscora.api.yml config --quiet
docker compose -f Docker.WEB.NJ\docker-compose.fiscora.web.yml config --quiet
Invoke-WebRequest http://localhost:3005
```

Fiscora Web se sirve desde la salida estatica `fiscora-static`; por eso su
compose focalizado no monta volumen de codigo fuente.
