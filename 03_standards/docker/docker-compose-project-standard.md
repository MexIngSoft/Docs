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

Los archivos master son la entrada canonica para levantar la infraestructura
compartida del workspace en un mismo proyecto Docker Compose. No deben crear
contenedores alternos por proyecto. La seleccion de procesos activos dentro de
`api-multiproyecto` y `web-frontend-node` se controla con `API_PROJECTS` y
`WEB_PROJECTS` para evitar saturar el equipo local.

El valor por defecto de `WEB_PROJECTS` debe ser un conjunto minimo y estable.
Las webs adicionales se activan con overlays o variables de entorno sin cambiar
`container_name`, `image` ni red. Cada overlay define `API_PROJECTS` o
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

Los servicios con `build:` deben declarar tambien `image:` con nombre oficial y
tag exacto. Sin `image:`, Docker Compose genera imagenes locales con nombres
derivados del directorio y tag `latest`, lo cual queda prohibido. Los nombres
oficiales de imagen runtime son:

```text
api-multiproyecto:3.10.19-slim-bookworm
web-frontend-node:20.19.0-bookworm-slim
nginx:1.24.0
postgres:16.13
```

Para probar proyectos de forma focalizada no se crean contenedores alternos.
Se mantiene el contenedor oficial de la capa y se seleccionan procesos con
`API_PROJECTS` o `WEB_PROJECTS`. Si el contenedor ya esta corriendo, el cambio
de seleccion requiere recrear el servicio oficial con la nueva variable; no
requiere cambiar `container_name`, usar otra imagen ni crear otro contenedor.

`crejo` queda OBSOLETO / RECHAZADO / NO USAR y no debe usarse en
documentacion activa, compose nuevos, scripts nuevos ni refactors.

Si un archivo Docker todavia usa `crejo`, debe corregirse a
`jobcron_network` dentro de la misma fase. No se permite mantener doble red ni
migracion parcial.
