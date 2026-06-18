# Matriz Docker Por Objetivo

## Regla Principal

El ecosistema no usa infraestructura Docker dedicada por proyecto.

El ecosistema usa un Docker por objetivo.

## Docker.DB.PG

Responsable de PostgreSQL, bases, schemas, usuarios, inicializacion y backups.

No contiene APIs ni webs.

## Docker.API.PY

Responsable de ejecutar APIs Python/Django/FastAPI, Auth, Gateway General, APIs core, APIs de dominio e integraciones internas.

Los compose enfocados solo seleccionan proyectos con `API_PROJECTS`.

## Docker.WEB.NJ

Responsable de ejecutar webs Next.js.

Los compose enfocados solo seleccionan proyectos con `WEB_PROJECTS`.

## Red

Todos los objetivos comparten la red Docker `jobcron_network`.

## Prohibido

- Crear Docker.API.PY.<Proyecto>.
- Crear Docker.WEB.NJ.<Proyecto>.
- Crear Docker.DB.<Proyecto>.
- Crear Dockerfile por proyecto cuando duplica el Dockerfile base.
- Crear imagen base por proyecto sin ADR aprobado.
