# Inventario de servicios Docker

## Estado

ACTUALIZADO_PARCIAL.

## Compose detectados

| Repo | Compose |
|---|---|
| `Docker.API.PY` | `docker-compose.yml`, `docker-compose.master.api.yml`, overlays por proyecto. |
| `Docker.WEB.NJ` | `docker-compose.yml`, `docker-compose.master.web.yml`, overlays por web. |
| `Docker.DB.PG` | `docker-compose.yml`, `docker-compose.master.db.yml`, overlays por proyecto. |
| `Docker.SW.Nginx` | `docker-compose.yml`, `docker-compose.master.nginx.yml`. |

## Servicios activos observados

| Servicio | Imagen | Estado |
|---|---|---|
| `api-multiproyecto` | `api-multiproyecto:3.10.19-slim-bookworm` | healthy en validacion previa. |
| `db-postgresql` | `postgres:16.13` | healthy. |
| `web-frontend-node` | `web-frontend-node:20.19.0-bookworm-slim` | healthy. |
| `nginx` | `nginx:1.24.0` | healthy. |

## Regla

Los overlays por proyecto no deben crear redes divergentes ni imagenes `latest`.
Usar `jobcron_network` y versiones exactas.
