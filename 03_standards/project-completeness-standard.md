# Estandar de proyecto completo Web/API

## Objetivo

Definir el minimo obligatorio para considerar que una Web o API nueva no es un
conjunto de archivos sueltos, sino un proyecto operable, documentado y
preparado para Docker.

Este documento complementa:

- `Docs/03_standards/frontend/nextjs-project-standard.md`
- `Docs/03_standards/operations/project-closure-standard.md`
- `Docs/03_standards/docker/jobcron-official-docker-architecture.md`

## Regla general

Toda Web y toda API debe nacer con identidad, configuracion, variables,
documentacion, healthcheck y ruta Docker definida.

No se considera completo un proyecto que solo tenga paginas o endpoints.

Para crear proyectos nuevos se debe usar el scaffolder operativo:

```powershell
Docs/03_standards/operations/scripts/New-WorkspaceProject.ps1 -Type web -Name NombreProyecto -Port 3000
Docs/03_standards/operations/scripts/New-WorkspaceProject.ps1 -Type api -Name NombreProyecto -Port 8000
```

El scaffolder crea estructura minima, `.env.local.example`, README, healthcheck
base y compose por proyecto. Si despues se integra al contenedor
multi-proyecto, tambien se deben registrar manualmente volumen, puerto,
`WEB_PROJECTS`/`API_PROJECTS` y `start.sh`, porque esos datos dependen de la
asignacion real de puertos y responsabilidades.

## Web completa

Una Web debe incluir:

- nombre canonico `WEB.NJ.NEXT.<Proyecto>`;
- README propio;
- `.env.local.example` sin secretos;
- configuracion central para identidad, rutas, SEO, tema y gateway;
- favicon e iconos publicos;
- metadata de navegador y Open Graph;
- logo principal, logo reducido y assets de marca cuando aplique;
- variables `NEXT_PUBLIC_*` documentadas;
- gateway/BFF definido;
- comandos de `build`, `lint` o validacion equivalente;
- compose Web por proyecto en `Docker.WEB.NJ/docker-compose.<proyecto>.web.yml`.

Variables recomendadas:

```text
NEXT_PUBLIC_APP_NAME=
NEXT_PUBLIC_HOST=
NEXT_PUBLIC_GATEWAY_BASE_URL=
NEXT_PUBLIC_ENVIRONMENT=
```

Si el proyecto requiere metadata comercial adicional, documentar tambien:

```text
APP_NAME
COMPANY_NAME
APP_SHORT_NAME
APP_DESCRIPTION
APP_DOMAIN
APP_URL
APP_AUTHOR
APP_KEYWORDS
APP_LOCALE
APP_THEME_COLOR
APP_DEFAULT_TITLE
APP_TITLE_TEMPLATE
```

## API completa

Una API debe incluir:

- nombre canonico `API.PY.DJANGO.<Proyecto>`;
- README propio;
- `.env.local.example` sin secretos;
- paquete de configuracion `config`;
- settings por variables de entorno;
- healthcheck;
- urls, serializers, views y permisos conectados;
- migraciones cuando use base de datos;
- logs suficientes para diagnostico;
- variables de entorno documentadas;
- runbook o seccion operativa;
- compose API por proyecto en `Docker.API.PY/docker-compose.<proyecto>.api.yml`.

Variables recomendadas:

```text
API_NAME=
API_VERSION=
API_DESCRIPTION=
API_DOMAIN=
API_PORT=
API_BASE_PATH=
API_HEALTH_PATH=
API_DOCS_PATH=
API_SCHEMA_NAME=
API_DATABASE_NAME=
```

## Dockerfile por proyecto

No es obligatorio crear Dockerfile por proyecto.

Debe existir Dockerfile base por capa:

```text
Docker.API.PY/Dockerfile.api.base
Docker.WEB.NJ/Dockerfile.web.base
```

Solo se crea Dockerfile especifico cuando cambie el runtime, dependencias del
sistema, build o configuracion que no pueda resolverse desde variables,
`requirements.txt`, `package-lock.json` o scripts de arranque.

## Compose por proyecto

El compose por proyecto si debe existir como entrada canonica de ejecucion:

```text
Docker.DB.PG/docker-compose.<proyecto>.db.yml
Docker.API.PY/docker-compose.<proyecto>.api.yml
Docker.WEB.NJ/docker-compose.<proyecto>.web.yml
```

Si solo cambia la lista de procesos, debe ser overlay delgado sobre el compose
base, no copia completa del servicio.

## Criterio de cierre

Antes de marcar Web/API como lista:

- favicon, titulo y metadata visibles;
- gateway y APIs requeridas definidos;
- variables completas sin secretos reales;
- healthcheck funcionando o ruta documentada;
- Docker individual funcional;
- Docker master compatible;
- README/runbook actualizado;
- validaciones ejecutadas o faltantes documentados.

Si falta informacion real, usar:

```text
PENDIENTE_DE_DEFINIR
```

No inventar disponibilidad ni prometer funciones sin backend real.
