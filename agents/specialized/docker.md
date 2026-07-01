# Agent especializado Docker

## Alcance

Compose, Dockerfiles, scripts start/stop/status, red `jobcron_network`,
imagenes versionadas y dependencias por proyecto.

## Lectura canonica

- `Docs/03_standards/docker/jobcron-official-docker-architecture.md`
- `Docs/03_standards/operations/project-docker-dependency-map.md`
- `Docs/03_standards/operations/project-script-behavior-matrix.md`

## Reglas

- No crear Docker por proyecto si existe arquitectura compartida.
- Versiones de imagen exactas.
- Activar/desactivar desarrollos sin destruir contenedores salvo instruccion
  operativa documentada.

## Validacion

- `docker compose config --quiet`.
- Healthchecks y puertos esperados.
