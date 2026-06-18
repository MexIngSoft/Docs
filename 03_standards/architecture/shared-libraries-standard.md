# Estandar de librerias compartidas

## Objetivo

Definir librerias internas reutilizables para evitar copiar logica comun en
cada API o frontend.

## Backend

Ruta objetivo:

```text
Docker.API.PY/libs/jobcron_common
```

Debe contener:

- configuracion PostgreSQL;
- healthcheck base;
- formato estandar de errores;
- paginacion;
- permisos comunes;
- cliente Auth;
- cliente Gateway;
- logging;
- auditoria;
- validadores;
- helpers de settings.

## Frontend

Ruta objetivo UI:

```text
Docker.WEB.NJ/packages/jobcron-ui
```

Debe contener:

- componentes UI comunes;
- layout;
- cards;
- tablas;
- formularios;
- estados vacios;
- loaders;
- manejo de errores.

Ruta objetivo API client:

```text
Docker.WEB.NJ/packages/jobcron-api-client
```

Debe contener:

- cliente Gateway General;
- manejo de token;
- errores normalizados;
- fetcher comun;
- tipos compartidos.

## Regla

No duplicar logica comun dentro de cada proyecto. Crear libreria compartida
solo cuando exista reutilizacion real y contrato estable.
