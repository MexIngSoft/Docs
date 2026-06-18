# Estandar de compose del workspace

La ejecucion oficial no levanta proyectos uno por uno. Existe una base general
por capa y overlays delgados por proyecto solo como archivos auxiliares de
seleccion o compatibilidad.

Nombre profesional del stack Docker compartido:

```text
Comercial Platform
```

Nombre tecnico de Docker Compose:

```text
comercial_platform
```

```text
Docker.DB.PG/docker-compose.master.db.yml
Docker.API.PY/docker-compose.master.api.yml
Docker.WEB.NJ/docker-compose.master.web.yml
Docker.SW.Nginx/docker-compose.master.nginx.yml
Docker.API.PY/docker-compose.yml
Docker.API.PY/docker-compose.<proyecto>.api.yml
Docker.WEB.NJ/docker-compose.yml
Docker.WEB.NJ/docker-compose.<proyecto>.web.yml
Docker.DB.PG/docker-compose.yml
```

Los archivos master son la entrada canonica para correr todo el workspace en un
mismo proyecto Docker Compose. Cada overlay define `API_PROJECTS` o
`WEB_PROJECTS`, puertos, dependencias y variables necesarias, pero no debe ser
usado como ruta principal de validacion operativa.

Comando canonico:

```powershell
docker compose -p comercial_platform -f Docker.DB.PG\docker-compose.master.db.yml -f Docker.API.PY\docker-compose.master.api.yml -f Docker.WEB.NJ\docker-compose.master.web.yml -f Docker.SW.Nginx\docker-compose.master.nginx.yml up -d --build
```

Si un proyecto revela un error transversal, se corrige el archivo comun,
plantilla, script o variable compartida y se replica la correccion en los demas
proyectos afectados.

La red vigente es `crejo` por compatibilidad. `jobcron_network` permanece como
migracion futura coordinada y no debe introducirse parcialmente.
