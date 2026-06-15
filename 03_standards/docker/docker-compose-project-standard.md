# Estandar compose por proyecto

Existe una base general por capa y overlays delgados por proyecto. Una prueba
focalizada no levanta todas las webs.

```text
Docker.API.PY/docker-compose.yml
Docker.API.PY/docker-compose.<proyecto>.api.yml
Docker.WEB.NJ/docker-compose.yml
Docker.WEB.NJ/docker-compose.<proyecto>.web.yml
Docker.DB.PG/docker-compose.yml
```

Cada overlay define `API_PROJECTS` o `WEB_PROJECTS`, puertos, dependencias y
variables necesarias. Varias APIs pueden compartir el contenedor base por
costo cuando el overlay documenta la dependencia real; eso no comparte
secretos, schema ni responsabilidad.

La red vigente es `crejo` por compatibilidad. `jobcron_network` permanece como
migracion futura coordinada y no debe introducirse parcialmente.
