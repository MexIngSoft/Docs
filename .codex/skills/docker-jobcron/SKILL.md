---
title: Docker JobCron Skill
domain: Codex
status: ACTIVE
priority: P1
owner: Equipo plataforma
name: docker-jobcron
description: Aplica el estandar Docker JobCron con Docker por objetivo y red jobcron_network.
---

# Docker JobCron Skill

## Leer primero

- `Docs/03_standards/docker/jobcron-official-docker-architecture.md`
- `Docs/03_standards/docker/docker-compose-project-standard.md`
- `Docs/03_standards/operations/definition-of-done.md`

## Reglas

- Usar Docker por objetivo.
- Usar `jobcron_network`.
- No usar `crejo`.
- No crear Docker por proyecto.
- No crear red por proyecto.
- PostgreSQL vive en `Docker.DB.PG`.
- APIs viven en `Docker.API.PY`.
- Webs viven en `Docker.WEB.NJ`.

## Validacion

- `docker compose config` sobre los compose modificados.
- Busqueda de `crejo`.
- Healthchecks si aplica.
- Confirmar que no se agrego red por proyecto.

## Salida obligatoria

- Compose o Dockerfile revisado.
- Red usada.
- Validaciones ejecutadas.
- Faltantes con `PENDIENTE_DE_DEFINIR`.
