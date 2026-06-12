# Project runtime readiness report

Fecha: 2026-06-11

## Objetivo

Documentar donde se guardan los Dockerfile y docker-compose para correr cada
proyecto web con sus dependencias, siguiendo
`Docs/03_standards/documentation-first-workflow.md` y sin usar agents.

## Ubicacion canonica

| Tipo | Ubicacion |
|---|---|
| Dockerfile base API | `Docker.API.PY/Dockerfile.api.base` |
| Dockerfile especifico API/proyecto | `Docker.API.PY/Dockerfile.<api-o-proyecto>` solo si el build difiere. |
| Dockerfile base Web | `Docker.WEB.NJ/Dockerfile.web.base` |
| Dockerfile especifico Web | `Docker.WEB.NJ/Dockerfile.<proyecto>` solo si el build difiere. |
| Compose master DB | `Docker.DB.PG/docker-compose.master.db.yml` |
| Compose master API | `Docker.API.PY/docker-compose.master.api.yml` |
| Compose master Web | `Docker.WEB.NJ/docker-compose.master.web.yml` |
| Compose proyecto DB | `Docker.DB.PG/docker-compose.<proyecto>.db.yml` |
| Compose proyecto API | `Docker.API.PY/docker-compose.<proyecto>.api.yml` |
| Compose proyecto Web | `Docker.WEB.NJ/docker-compose.<proyecto>.web.yml` |
| Compose proyecto Nginx | `Docker.SW.Nginx/docker-compose.<proyecto>.nginx.yml` cuando haya ruteo/proxy especifico. |

## Regla de responsabilidad

Los compose por proyecto deben existir para dar una entrada clara de ejecucion,
pero no deben copiar todo el servicio si solo cambia la lista de procesos.

Patron aplicado:

```text
compose base: define build, puertos, volumenes, red y healthcheck.
compose por proyecto: extiende el servicio base y define API_PROJECTS o WEB_PROJECTS.
Dockerfile base: construye runtime compartido de la capa.
Dockerfile por proyecto: solo si hay dependencias o build realmente distintos.
```

## Matriz actual

| Proyecto | DB | API | Web |
|---|---|---|---|
| JobCron | `Docker.DB.PG/docker-compose.jobcron.db.yml` | `Docker.API.PY/docker-compose.jobcron.api.yml` | `Docker.WEB.NJ/docker-compose.jobcron.web.yml` |
| TecnoTelec | `Docker.DB.PG/docker-compose.tecnotelec.db.yml` | `Docker.API.PY/docker-compose.tecnotelec.api.yml` | `Docker.WEB.NJ/docker-compose.tecnotelec.web.yml` |
| LexNova | `Docker.DB.PG/docker-compose.lexnova.db.yml` | `Docker.API.PY/docker-compose.lexnova.api.yml` | `Docker.WEB.NJ/docker-compose.lexnova.web.yml` |
| DocuCore | `Docker.DB.PG/docker-compose.docucore.db.yml` | `Docker.API.PY/docker-compose.docucore.api.yml` | `Docker.WEB.NJ/docker-compose.docucore.web.yml` |
| Fiscora | `Docker.DB.PG/docker-compose.fiscora.db.yml` | `Docker.API.PY/docker-compose.fiscora.api.yml` | `Docker.WEB.NJ/docker-compose.fiscora.web.yml` |
| Imagrafity | `Docker.DB.PG/docker-compose.imagrafity.db.yml` | `Docker.API.PY/docker-compose.imagrafity.api.yml` | `Docker.WEB.NJ/docker-compose.imagrafity.web.yml` |
| LeadHunter | `Docker.DB.PG/docker-compose.leadhunter.db.yml` | `Docker.API.PY/docker-compose.leadhunter.api.yml` | `Docker.WEB.NJ/docker-compose.leadhunter.web.yml` |

## Documentacion revisada

- `Docs/03_standards/documentation-first-workflow.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/active-work-index.md`
- `Docs/03_standards/docker.md`
- `Docs/03_standards/docker/jobcron-official-docker-architecture.md`
- `Docs/03_standards/docker/grouped-containers-isolated-config.md`
- `Docs/03_standards/frontend/shared-docker-frontend-architecture.md`
- Runbooks locales de JobCron, TecnoTelec, LexNova, DocuCore, Fiscora,
  Imagrafity y LeadHunter.

## Decisiones

- Se restauran los archivos por proyecto porque el estandar del repositorio los
  define como entrada canonica de ejecucion.
- Para evitar duplicacion, los compose por proyecto usan `extends` o `include`.
- No se crean Dockerfiles especificos por proyecto porque no se encontro una
  diferencia canonica de build que lo requiera.
- Nginx por proyecto queda pendiente hasta que exista ruteo/proxy especifico por
  proyecto; no se inventa en esta pasada.

## Validaciones

| Validacion | Resultado |
|---|---|
| Matriz DB: base, master y proyectos | OK |
| Matriz API: base, master y proyectos | OK |
| Matriz Web: base, master y proyectos | OK |
| `Docker.SW.Nginx/docker-compose.master.nginx.yml` | OK |

## Informacion faltante

No encontrado en la documentacion actual: reglas concretas de Nginx por proyecto
para todos los hosts locales. Se mantiene fuera de alcance hasta documentar
rutas/proxy por proyecto.
