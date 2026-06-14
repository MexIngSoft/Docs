# Imagrafity local runbook

## Estado

ACTIVE

## Objetivo

Ejecutar Imagrafity localmente con Gateway, API de dominio, Web y base de datos.

## Cadena local

```text
WEB.NJ.NEXT.Imagrafity
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.Imagrafity
  -> PostgreSQL
```

| Servicio | Puerto | Compose |
|---|---:|---|
| PostgreSQL | `5432` | `Docker.DB.PG/docker-compose.imagrafity.db.yml` |
| Imagrafity Gateway | `8018` | `Docker.API.PY/docker-compose.imagrafity.api.yml` |
| Imagrafity API | `8019` | `Docker.API.PY/docker-compose.imagrafity.api.yml` |
| Imagrafity Web | `3006` | `Docker.WEB.NJ/docker-compose.imagrafity.web.yml` |

## Arranque

```powershell
docker compose -f Docker.DB.PG\docker-compose.imagrafity.db.yml up -d
docker compose -f Docker.API.PY\docker-compose.imagrafity.api.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.imagrafity.web.yml up -d --build
```

## Validacion minima

```powershell
docker compose -f Docker.API.PY\docker-compose.imagrafity.api.yml config --quiet
docker compose -f Docker.WEB.NJ\docker-compose.imagrafity.web.yml config --quiet
Invoke-WebRequest http://localhost:3006
```

No se encontro runbook local canonico previo de Imagrafity. Esta ruta usa el
patron de API/Gateway/Web ya implementado en el workspace y los puertos
canonicos existentes.
