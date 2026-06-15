# AGENTS-003.md

# ESTRUCTURA OFICIAL DE REPOSITORIOS, DOCKER Y POSTGRESQL

## OBJETIVO

Definir una única estructura física para todos los proyectos, APIs, bases de datos, Docker, despliegues y repositorios del ecosistema.

Este agente debe garantizar que todos los proyectos futuros mantengan la misma organización.

No se permiten estructuras alternativas.

---

# OBJETIVO PRINCIPAL

Garantizar:

* Orden.
* Escalabilidad.
* Reutilización.
* Mantenimiento.
* Despliegue consistente.
* Integración sencilla.
* Administración centralizada.

---

No existe un Docker por proyecto.

Existe un Docker por objetivo:

1. Docker.DB
   - PostgreSQL
   - bases
   - schemas
   - usuarios
   - backups

2. Docker.API.PY
   - todas las APIs Python/Django/FastAPI
   - Auth
   - Gateway General
   - APIs comerciales
   - APIs de proyectos
   - integraciones internas

3. Docker.WEB.NJ
   - todas las webs Next.js
   - JobCron
   - Refapart
   - TecnoTelec
   - LexNova
   - DocuCore
   - Fiscora
   - Imagrafity

Los compose por proyecto NO crean otro Docker.
Solo levantan los servicios necesarios dentro del Docker correspondiente.

REGLA CORREGIDA DE DOCKER

La arquitectura oficial NO crea imágenes, Dockerfiles ni contenedores base por cada proyecto.

La arquitectura oficial usa un Docker por objetivo:

- Docker.DB para bases de datos.
- Docker.API.PY para todas las APIs.
- Docker.WEB.NJ para todas las webs.

Cada proyecto puede tener un docker-compose enfocado, pero ese compose solo selecciona qué servicios levantar.

Está prohibido:

- Crear Docker.API.PY.Refapart
- Crear Docker.API.PY.TecnoTelec
- Crear Docker.WEB.NJ.Refapart
- Crear Docker.WEB.NJ.TecnoTelec
- Crear Docker.DB.Refapart
- Crear Docker.DB.TecnoTelec
- Crear Dockerfile por proyecto si duplica el Dockerfile general
- Crear imagen base por proyecto sin justificación técnica aprobada

Permitido:

- Carpetas por proyecto dentro del Docker correspondiente.
- Variables por proyecto.
- Servicios por proyecto en compose.
- Compose enfocado por proyecto.
- Puertos por proyecto.
- Procesos separados dentro del mismo objetivo.
- Build args para seleccionar proyecto cuando sea necesario.

Regla final:

Un Docker por objetivo.
No un Docker por proyecto.

Ningún proyecto debe romper esta estructura.

---

# DOCKER.DB

## RESPONSABILIDAD

Administrar PostgreSQL.

---

## CONTENIDO

PostgreSQL

Backups

Restore

Scripts de mantenimiento

Monitoreo

Health Checks

---

## PROHIBICIONES

No almacenar:

* Código de APIs
* Código Frontend
* ETLs
* Scripts de negocio

---

# DOCKER.API.PY

## RESPONSABILIDAD

Contener todas las APIs Python.

---

## ESTRUCTURA

Docker.API.PY

├── API.PY.DJANGO.Auth
├── API.PY.DJANGO.Gateway.General
├── API.PY.DJANGO.Catalog
├── API.PY.DJANGO.Inventory
├── API.PY.DJANGO.Pricing
├── API.PY.DJANGO.Supplier
├── API.PY.DJANGO.Procurement
├── API.PY.DJANGO.Sales
├── API.PY.DJANGO.Search
├── API.PY.DJANGO.Document
├── API.PY.DJANGO.Notification
├── API.PY.DJANGO.Refapart
├── API.PY.DJANGO.LexNova
├── API.PY.DJANGO.DocuCore
├── API.PY.DJANGO.Fiscora
└── API.PY.DJANGO.TecnoTelec

---

# REGLA DE RESPONSABILIDAD

Las APIs de dominio compartidas:

* Catalog
* Inventory
* Pricing
* Supplier
* Procurement
* Sales
* Search
* Notification
* Document

deben ser reutilizadas por todos los proyectos.

---

# APIS DE PROYECTO

Solo pueden existir cuando contienen lógica exclusiva.

Ejemplo:

Refapart API

Funciones específicas de refacciones.

LexNova API

Funciones jurídicas.

DocuCore API

Funciones documentales propias.

---

# PROHIBICIONES DE APIS

No crear:

* APIs duplicadas.
* APIs espejo.
* APIs temporales.
* APIs experimentales sin documentación.

---

# GATEWAY GENERAL

Debe existir únicamente:

API.PY.DJANGO.Gateway.General

---

# PROHIBICIONES DE GATEWAY

Eliminar:

API.PY.DJANGO.Refapart.Gateway

API.PY.DJANGO.Fiscora.Gateway

API.PY.DJANGO.DocuCore.Gateway

API.PY.DJANGO.LexNova.Gateway

API.PY.DJANGO.TecnoTelec.Gateway

Cualquier otro Gateway por proyecto.

---

# AUTH

Debe existir únicamente:

API.PY.DJANGO.Auth

Todos los proyectos deben reutilizarlo.

---

# DOCKER.WEB.NJ

## RESPONSABILIDAD

Contener todas las aplicaciones Next.js.

---

## ESTRUCTURA

Docker.WEB.NJ

├── WEB.NJ.JobCron
├── WEB.NJ.Refapart
├── WEB.NJ.LexNova
├── WEB.NJ.DocuCore
├── WEB.NJ.Fiscora
├── WEB.NJ.TecnoTelec
└── WEB.NJ.Imagrafity

---

# REGLA DE FRONTEND

Las webs:

* Nunca consumen PostgreSQL.
* Nunca consumen tablas.
* Nunca consumen servicios internos.

Deben consumir:

Gateway General.

---

# POSTGRESQL OFICIAL

La única base de datos permitida es PostgreSQL.

---

# PROHIBICIONES DE BASE DE DATOS

Eliminar completamente:

SQLite

sqlite

db.sqlite3

Local Database

Embedded Database

Fallback Database

Temporary Database

---

# ESTRUCTURA POSTGRESQL

Cada API debe utilizar schema propio.

Ejemplo:

auth

catalog

inventory

pricing

supplier

procurement

sales

search

notification

document

refapart

lexnova

docucore

fiscora

tecnotelec

---

# VARIABLES DE ENTORNO

Toda API debe documentar:

DB_HOST

DB_PORT

DB_NAME

DB_USER

DB_PASSWORD

DB_SCHEMA

---

# DOCKER COMPOSE GENERAL

Debe existir:

docker-compose.db.yml

docker-compose.api.yml

docker-compose.web.yml

---

# COMPOSE POR PROYECTO

Cada proyecto web debe tener:

docker-compose-refapart.yml

docker-compose-lexnova.yml

docker-compose-docucore.yml

docker-compose-fiscora.yml

docker-compose-tecnotelec.yml

docker-compose-imagrafity.yml

---

# REGLA DE COMPOSE POR PROYECTO

El compose de proyecto:

* Solo levanta dependencias necesarias.
* No crea nuevos Gateways.
* No crea nuevos Auth.
* No crea nuevas bases.

Utiliza infraestructura existente.

---

# RED DOCKER

Debe existir una red compartida.

Nombre recomendado:

jobcron_network

Todos los servicios deben poder comunicarse mediante esta red.

---

# HEALTH CHECKS

Todas las APIs deben tener:

/health

/ready

cuando aplique.

---

# LOGS

Todas las APIs deben registrar:

* inicio
* errores
* advertencias
* integraciones
* ETLs
* autenticación

---

# BACKUPS

PostgreSQL debe tener:

* backup automático
* restore documentado
* validación periódica

---

# VALIDACIONES

Verificar:

* estructura de carpetas
* docker compose
* PostgreSQL
* schemas
* variables de entorno
* dependencias

---

# RESULTADO ESPERADO

Al finalizar:

* Existirá una única estructura física.
* Existirá un único Gateway General.
* Existirá un único Auth.
* Existirá una única estrategia Docker.
* Existirá una única estrategia PostgreSQL.
* Todos los proyectos serán desplegables bajo el mismo estándar.
