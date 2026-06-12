# TecnoTelec local runbook

## Estado

ACTIVE

## Objetivo

Ejecutar TecnoTelec localmente con sus APIs core, Gateway, API de proyecto, Web
y base de datos.

## Cadena local

```text
WEB.NJ.NEXT.TecnoTelec
  -> API.PY.DJANGO.TecnoTelec.Gateway
  -> Auth, Catalog, Inventory, Pricing, Procurement, Sales, Supplier, Customization
  -> API.PY.DJANGO.TecnoTelec
  -> PostgreSQL
```

| Servicio | Puerto |
|---|---:|
| Web TecnoTelec | `3001` |
| Auth API | `8000` |
| Catalog API | `8001` |
| Inventory API | `8002` |
| Pricing API | `8004` |
| Procurement API | `8005` |
| Sales API | `8006` |
| Supplier API | `8007` |
| TecnoTelec Gateway | `8008` |
| TecnoTelec API | `8009` |
| Customization API | `8010` |

## Arranque

```powershell
docker compose -f Docker.DB.PG\docker-compose.tecnotelec.db.yml up -d
docker compose -f Docker.API.PY\docker-compose.tecnotelec.api.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.tecnotelec.web.yml up -d --build
```

## Validacion minima

```powershell
docker compose -f Docker.API.PY\docker-compose.tecnotelec.api.yml config --quiet
docker compose -f Docker.WEB.NJ\docker-compose.tecnotelec.web.yml config --quiet
Invoke-WebRequest http://localhost:3001
```

No se encontro un runbook local canonico previo de TecnoTelec. Esta ruta usa el
patron existente del contenedor API multiproyecto y los puertos canonicos del
registro local.
