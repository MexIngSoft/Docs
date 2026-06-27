# Mapa Docker de dependencias por proyecto

## Estado

ACTIVE

## Objetivo

Registrar como se activa cada proyecto dentro del stack compartido
`comercial_platform` sin crear contenedores alternos ni redes por proyecto.

## Reglas vigentes

- Stack: `comercial_platform`.
- Red: `jobcron_network`.
- Contenedores oficiales: `db-postgresql`, `api-multiproyecto`,
  `web-frontend-node`, `nginx`.
- PostgreSQL vive en `db-postgresql`.
- APIs Django viven como procesos dentro de `api-multiproyecto`.
- Webs Next.js viven como procesos dentro de `web-frontend-node`.
- Activar o desactivar un proyecto significa cambiar `API_PROJECTS` y
  `WEB_PROJECTS` y recrear los servicios oficiales necesarios.
- Nunca usar `docker volume prune` para estas pruebas.

## Scripts

Ubicacion:

```text
Docs/03_standards/operations/scripts/docker/projects
```

Comandos globales:

| Script | Uso |
|---|---|
| `start-all.ps1` | Levanta el stack master. |
| `stop-all.ps1` | Detiene API, Web y Nginx; conserva PostgreSQL. |
| `status-all.ps1` | Muestra contenedores, imagenes y red. |
| `healthcheck-all.ps1` | Valida URLs de proyectos registrados. |
| `clean-safe.ps1` | Limpieza segura sin borrar volumenes. |
| `test-random-project-scripts.ps1` | Valida una seleccion aleatoria de proyectos sin crear contenedores ni redes por proyecto. |

Matriz canonica de comportamiento:

```text
Docs/03_standards/operations/project-script-behavior-matrix.md
```

Cada proyecto tiene:

```text
start-<proyecto>.ps1
stop-<proyecto>.ps1
```

## Dependencias

| Proyecto | Puerto web | Web | APIs activadas | Base/schema | Start | Stop |
|---|---:|---|---|---|---|---|
| JobCron | `3000` | `WEB.NJ.NEXT.JobCron` | `auth gateway jobcron search` | `auth`, `jobcron` si aplica | `start-jobcron.ps1` | `stop-jobcron.ps1` |
| TecnoTelec | `3001` | `WEB.NJ.NEXT.TecnoTelec` | `auth gateway catalog inventory pricing procurement sales supplier tecnotelec customization search` | `auth`, `comercial/TecnoTelec` | `start-tecnotelec.ps1` | `stop-tecnotelec.ps1` |
| LexNova | `3002` | `WEB.NJ.NEXT.LexNova` | `auth gateway lexnova document` | `auth`, `lexnova` | `start-lexnova.ps1` | `stop-lexnova.ps1` |
| DocuCore | `3004` | `WEB.NJ.NEXT.DocuCore` | `auth gateway document docucore` | `comercial/Document`, `comercial/DocuCore` | `start-docucore.ps1` | `stop-docucore.ps1` |
| Fiscora | `3005` | `WEB.NJ.NEXT.Fiscora` | `auth gateway document fiscora fiscal` | `comercial/Fiscora`, `comercial/Fiscal` | `start-fiscora.ps1` | `stop-fiscora.ps1` |
| Imagrafity | `3006` | `WEB.NJ.NEXT.Imagrafity` | `auth gateway imagrafity` | `comercial/Imagrafity` | `start-imagrafity.ps1` | `stop-imagrafity.ps1` |
| REFAPART | `3008` | `WEB.NJ.NEXT.RefaPart` | `auth gateway refapart address search` | `comercial/RefaPart`, `comercial/Address`, `comercial/Search` | `start-refapart.ps1` | `stop-refapart.ps1` |
| MexIngSof | `3009` | `WEB.NJ.NEXT.MexIngSof` | `auth gateway jobcron search` | `PENDIENTE_DE_DEFINIR`; MVP actual usa Prisma local | `start-mexingsof.ps1` | `stop-mexingsof.ps1` |

## Overlays relacionados

| Proyecto | DB | API | Web |
|---|---|---|---|
| DocuCore | `Docker.DB.PG/docker-compose.docucore.db.yml` | `Docker.API.PY/docker-compose.docucore.api.yml` | `Docker.WEB.NJ/docker-compose.docucore.web.yml` |
| Fiscora | `Docker.DB.PG/docker-compose.fiscora.db.yml` | `Docker.API.PY/docker-compose.fiscora.api.yml` | `Docker.WEB.NJ/docker-compose.fiscora.web.yml` |
| Imagrafity | `Docker.DB.PG/docker-compose.imagrafity.db.yml` | `Docker.API.PY/docker-compose.imagrafity.api.yml` | `Docker.WEB.NJ/docker-compose.imagrafity.web.yml` |
| JobCron | `Docker.DB.PG/docker-compose.jobcron.db.yml` | `Docker.API.PY/docker-compose.jobcron.api.yml` | `Docker.WEB.NJ/docker-compose.jobcron.web.yml` |
| LexNova | `Docker.DB.PG/docker-compose.lexnova.db.yml` | `Docker.API.PY/docker-compose.lexnova.api.yml` | `Docker.WEB.NJ/docker-compose.lexnova.web.yml` |
| REFAPART | `Docker.DB.PG/docker-compose.refapart.db.yml` | `Docker.API.PY/docker-compose.refapart.api.yml` | `Docker.WEB.NJ/docker-compose.refapart.web.yml` |
| TecnoTelec | `Docker.DB.PG/docker-compose.tecnotelec.db.yml` | `Docker.API.PY/docker-compose.tecnotelec.api.yml` | `Docker.WEB.NJ/docker-compose.tecnotelec.web.yml` |
| MexIngSof | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | `Docker.WEB.NJ/docker-compose.mexingsof.web.yml` |

## Healthchecks

| Capa | Check |
|---|---|
| Gateway | `http://127.0.0.1:8025/health/` |
| Web | URL del puerto canonico del proyecto. |
| Docker | `docker compose -p comercial_platform ps` |
| Red | `docker network inspect jobcron_network` |

## Bloqueos conocidos

- MexIngSof no tiene DB/API auxiliar canonica definida; su documento actual
  conserva leads en rutas Next.js/Prisma hasta definir integracion final con
  JobCron.
- Los scripts `stop-<proyecto>.ps1` no borran contenedores ni volumenes; dejan
  un baseline minimo con JobCron para conservar la operacion del ecosistema.
