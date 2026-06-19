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

La red vigente, oficial y obligatoria es:

```text
jobcron_network
```

Todos los compose master, compose base y overlays deben usar
`jobcron_network`.

Los overlays por proyecto no deben cambiar `container_name`. Los nombres
oficiales son:

```text
db-postgresql
api-multiproyecto
web-frontend-node
nginx
```

La regla aplica a todos los archivos `docker-compose*.yml` del workspace:
master, base, overlays por proyecto, aliases de compatibilidad y compose
focalizados. Si un proyecto conserva mas de un compose activo para el mismo rol,
todos deben heredar el mismo servicio oficial. REFAPART, por ejemplo, conserva
`docker-compose.refapart.yml` y `docker-compose.refapart.web.yml`; ambos deben
heredar `web-frontend-node` y no pueden declarar otro contenedor.

Las imagenes Docker deben estar fijadas a version exacta en los Dockerfile y
compose base. No se permite usar `latest` ni variables para elegir version de
imagen en ejecucion productiva.

`crejo` queda OBSOLETO / RECHAZADO / NO USAR y no debe usarse en
documentacion activa, compose nuevos, scripts nuevos ni refactors.

Si un archivo Docker todavia usa `crejo`, debe corregirse a
`jobcron_network` dentro de la misma fase. No se permite mantener doble red ni
migracion parcial.
