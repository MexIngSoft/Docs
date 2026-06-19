# Runbook local REFAPART

## Web directa

```powershell
cd Docker.WEB.NJ\WEB.NJ.NEXT.RefaPart
npm install
npm run dev -- --port 3008
```

Abrir:

```text
http://localhost:3008
```

## Docker

Desde `Docker.WEB.NJ`:

```powershell
docker compose up -d --build web-frontend-node
```

Para levantar solo REFAPART dentro del contenedor:

```powershell
$env:WEB_PROJECTS="refapart"
docker compose up -d --build web-frontend-node
```

Arranque focalizado recomendado para REFAPART:

```powershell
cd Docker.WEB.NJ
docker compose -f docker-compose.yml -f docker-compose.refapart.yml up -d --no-build web-frontend-node
```

Este override usa `!override` para publicar solo `3008`, montar solo
`WEB.NJ.NEXT.RefaPart` y forzar `WEB_PROJECTS=refapart`. Conserva el contenedor
oficial `web-frontend-node`; los overrides focalizados no deben cambiar nombres
de contenedor ni crear contenedores por proyecto.

El Gateway principal existe en `Docker.API.PY/API.PY.DJANGO.Gateway`. El
Gateway `API.PY.DJANGO.RefaPart.Gateway` fue retirado el 2026-06-14. La API de
dominio vive en `Docker.API.PY/API.PY.DJANGO.RefaPart` y usa el puerto `8024`.

Arranque Auth focalizado:

```powershell
cd Docker.API.PY
docker compose -f docker-compose.refapart.api.yml up -d --build
```

La corrida focalizada levanta PostgreSQL, Auth, Gateway central y API REFAPART,
publicando `8000`, `8024` y `8025`.

## Validacion

```powershell
npm run build
docker compose config --quiet
```

Para ejecuciones con agents, si solo se modifica documentacion y no compose,
Dockerfile ni runtime REFAPART, no se debe levantar Docker por proyecto. Se
debe registrar el motivo y validar la documentacion afectada.

Si se modifica codigo web REFAPART, validar desde
`Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart`:

```powershell
npm run build
```

Validacion 2026-06-13:

- `npm run build` paso en `Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart`.
- `docker compose config --quiet` paso en `Docker.WEB.NJ`.
- Se libero el puerto `3008` de un proceso local `node.exe` previo para evitar
  mezclar pruebas locales con Docker.
- Docker devolvio `500 Internal Server Error` al consultar `/version` y
  `/containers/json` en los contextos `desktop-linux` y `default`, incluso
  fijando `DOCKER_API_VERSION=1.43`; el bloqueo esta en el engine local antes de
  arrancar `web-frontend-node`.
- Se agrego `docker-compose.refapart.yml` como override focalizado para evitar
  que una corrida de REFAPART cree mounts de webs no usadas.

Validacion focalizada posterior 2026-06-13:

- Se bajaron los compose de `Docker.WEB.NJ`, `Docker.API.PY`,
  `Docker.SW.Nginx` y `Docker.DB.PG` sin borrar volumenes.
- Docker Desktop requirio reinicio para liberar reservas internas de nombres de
  contenedor despues de intentos interrumpidos.
- `docker-compose.refapart.yml` paso `docker compose config --quiet`.
- REFAPART quedo corriendo en `web-frontend-node`, saludable, publicando solo
  `3008`.
- `http://localhost:3008` respondio `200` y contiene `REFAPART`.
- No quedaron contenedores API, DB ni Nginx activos para esta corrida.

## Variables

```text
NEXT_PUBLIC_APP_NAME=REFAPART
NEXT_PUBLIC_HOST=http://localhost:3008
NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:8025/api/v1
NEXT_PUBLIC_GATEWAY_FETCH_TIMEOUT_MS=30000
NEXT_PUBLIC_ENVIRONMENT=local
NEXT_PUBLIC_APPLICATION_CODE=REFAPART
```
