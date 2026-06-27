# Documentos de seleccion Docker por aplicacion

> Estado: base vigente.

## Objetivo

Definir los documentos y archivos auxiliares que debe tener cada proyecto para
poder seleccionarse dentro del stack Docker compartido.

Este documento no autoriza validaciones Docker proyecto por proyecto. La
validacion operativa oficial se hace sobre el stack compartido:

```text
Comercial Platform
```

Nombre tecnico de Docker Compose:

```text
comercial_platform
```

## Regla principal

Cada proyecto puede tener documentos, variables y overlays auxiliares propios,
pero APIs, webs, base de datos y proxy se ejecutan dentro del stack compartido.

Si una prueba de proyecto descubre un error transversal, se corrige el patron
comun y se replica a todos los proyectos afectados.

## Archivos master obligatorios

| Capa | Archivo |
|---|---|
| DB | `Docker.DB.PG/docker-compose.master.db.yml` |
| API | `Docker.API.PY/docker-compose.master.api.yml` |
| Web | `Docker.WEB.NJ/docker-compose.master.web.yml` |
| Nginx | `Docker.SW.Nginx/docker-compose.master.nginx.yml` |

Comando de validacion estatica:

```powershell
docker compose -p comercial_platform -f Docker.DB.PG\docker-compose.master.db.yml -f Docker.API.PY\docker-compose.master.api.yml -f Docker.WEB.NJ\docker-compose.master.web.yml -f Docker.SW.Nginx\docker-compose.master.nginx.yml config --quiet
```

## Documentos y overlays por proyecto

El mapa operativo de dependencias y scripts vive en:

```text
Docs/03_standards/operations/project-docker-dependency-map.md
```

| Proyecto | Runbook canonico | DB auxiliar | API auxiliar | Web auxiliar | Estado |
|---|---|---|---|---|---|
| DocuCore | `Docs/02_projects/docucore/local-runbook.md` | `Docker.DB.PG/docker-compose.docucore.db.yml` | `Docker.API.PY/docker-compose.docucore.api.yml` | `Docker.WEB.NJ/docker-compose.docucore.web.yml` | Definido |
| Fiscora | `Docs/02_projects/fiscora/local-runbook.md` | `Docker.DB.PG/docker-compose.fiscora.db.yml` | `Docker.API.PY/docker-compose.fiscora.api.yml` | `Docker.WEB.NJ/docker-compose.fiscora.web.yml` | Definido |
| Imagrafity | `Docs/02_projects/imagrafity/local-runbook.md` | `Docker.DB.PG/docker-compose.imagrafity.db.yml` | `Docker.API.PY/docker-compose.imagrafity.api.yml` | `Docker.WEB.NJ/docker-compose.imagrafity.web.yml` | Definido |
| JobCron | `Docs/02_projects/jobcron/local-runbook.md` | `Docker.DB.PG/docker-compose.jobcron.db.yml` | `Docker.API.PY/docker-compose.jobcron.api.yml` | `Docker.WEB.NJ/docker-compose.jobcron.web.yml` | Definido |
| LexNova | `Docs/02_projects/lexnova/local-dependency-runbook.md` | `Docker.DB.PG/docker-compose.lexnova.db.yml` | `Docker.API.PY/docker-compose.lexnova.api.yml` | `Docker.WEB.NJ/docker-compose.lexnova.web.yml` | Definido |
| MexIngSof | `Docs/02_projects/mexingsof/local-runbook.md` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | `Docker.WEB.NJ/docker-compose.mexingsof.web.yml` | Parcial; web definida, DB/API pendientes |
| REFAPART | `Docs/02_projects/refapart/local-runbook.md` | `Docker.DB.PG/docker-compose.refapart.db.yml` | `Docker.API.PY/docker-compose.refapart.api.yml` | `Docker.WEB.NJ/docker-compose.refapart.web.yml` | Definido |
| TecnoTelec | `Docs/02_projects/tecnotelec/local-runbook.md` | `Docker.DB.PG/docker-compose.tecnotelec.db.yml` | `Docker.API.PY/docker-compose.tecnotelec.api.yml` | `Docker.WEB.NJ/docker-compose.tecnotelec.web.yml` | Definido |

## Reglas de contenido minimo

Cada runbook de proyecto debe declarar:

- nombre canonico del proyecto;
- puerto web;
- API especializada si aplica;
- dependencias core;
- variables requeridas sin secretos reales;
- overlays auxiliares asociados;
- rutas de healthcheck o validacion estatica;
- errores comunes y correccion transversal esperada.

Cada overlay auxiliar debe:

- extender o incluir el compose base de su capa cuando sea posible;
- definir solo seleccion, variables o dependencias necesarias;
- evitar duplicar servicios completos sin justificacion;
- usar el Gateway General como entrada de frontend;
- no crear infraestructura Docker, Auth ni entrada publica dedicada por aplicacion.

## Faltantes reales

- PENDIENTE_DE_DEFINIR: confirmar si `Docker.SW.Nginx` necesita overlays
  auxiliares por proyecto o si el routing completo queda solo en el master.
- PENDIENTE_DE_DEFINIR: confirmar si todos los runbooks listados deben usar el
  mismo nombre `local-runbook.md` o conservar nombres historicos como
  `local-dependency-runbook.md`.
