# Matriz de comportamiento de scripts Docker por proyecto

## Estado

ACTIVE

## Objetivo

Definir el comportamiento obligatorio de los scripts operativos ubicados en:

```text
Docs/03_standards/operations/scripts/docker/projects
```

Esta matriz aplica al stack compartido `comercial_platform` y a la red oficial
`jobcron_network`.

## Regla operativa

Los scripts por proyecto no crean contenedores por proyecto. Un proyecto se
activa cambiando la seleccion de procesos dentro de los contenedores oficiales:

```text
db-postgresql
api-multiproyecto
web-frontend-node
nginx
```

Detener un proyecto significa quitar sus procesos activos de
`API_PROJECTS` y `WEB_PROJECTS`, conservando los contenedores oficiales, la red
`jobcron_network` y los volumenes.

## Scripts globales

| Script | Funcion | Efecto permitido | Efecto prohibido |
|---|---|---|---|
| `start-all.ps1` | Levantar stack master | Crear la red si falta y levantar servicios oficiales | Crear redes o contenedores alternos por proyecto |
| `stop-all.ps1` | Detener API, Web y Nginx | Conservar PostgreSQL y volumenes | Ejecutar `docker volume prune` o borrar datos |
| `status-all.ps1` | Mostrar estado operativo | Listar compose, contenedores, imagenes y red oficial | Alterar servicios |
| `healthcheck-all.ps1` | Validar URLs registradas | Consultar healthchecks y webs canonicas | Crear o eliminar contenedores |
| `clean-safe.ps1` | Limpieza segura | Limpiar recursos no usados sin volumenes | Borrar volumenes o red oficial |
| `test-random-project-scripts.ps1` | Probar seleccion aleatoria | Ejecutar start/health/stop por proyecto usando scripts canonicos | Crear compose, contenedor o red por proyecto |

## Scripts por proyecto

| Proyecto | Start | Stop | Web esperada | APIs esperadas | URL web |
|---|---|---|---|---|---|
| JobCron | `start-jobcron.ps1` | `stop-jobcron.ps1` | `jobcron` | `auth gateway jobcron search` | `http://127.0.0.1:3000` |
| TecnoTelec | `start-tecnotelec.ps1` | `stop-tecnotelec.ps1` | `tecnotelec` | `auth gateway catalog inventory pricing procurement sales supplier tecnotelec customization search` | `http://127.0.0.1:3001` |
| LexNova | `start-lexnova.ps1` | `stop-lexnova.ps1` | `lexnova` | `auth gateway lexnova document` | `http://127.0.0.1:3002` |
| DocuCore | `start-docucore.ps1` | `stop-docucore.ps1` | `docucore` | `auth gateway document docucore` | `http://127.0.0.1:3004` |
| Fiscora | `start-fiscora.ps1` | `stop-fiscora.ps1` | `fiscora` | `auth gateway document fiscora fiscal` | `http://127.0.0.1:3005` |
| Imagrafity | `start-imagrafity.ps1` | `stop-imagrafity.ps1` | `imagrafity` | `auth gateway imagrafity` | `http://127.0.0.1:3006` |
| REFAPART | `start-refapart.ps1` | `stop-refapart.ps1` | `refapart` | `auth gateway refapart address search` | `http://127.0.0.1:3008` |
| MexIngSof | `start-mexingsof.ps1` | `stop-mexingsof.ps1` | `mexingsof` | `auth gateway jobcron search` | `http://127.0.0.1:3009` |

## Contrato minimo por script

Cada `start-<proyecto>.ps1` debe:

- Invocar `Invoke-WorkspaceProjectDocker.ps1`.
- Usar `-Action start`.
- No definir `container_name`.
- No crear redes por proyecto.
- No ejecutar `docker compose down -v`.

Cada `stop-<proyecto>.ps1` debe:

- Invocar `Invoke-WorkspaceProjectDocker.ps1`.
- Usar `-Action stop`.
- Dejar un baseline operativo minimo.
- No borrar contenedores oficiales.
- No borrar volumenes.

## Validacion

Validaciones documentadas:

```powershell
powershell -ExecutionPolicy Bypass -File Docs/03_standards/operations/scripts/docker/projects/status-all.ps1
powershell -ExecutionPolicy Bypass -File Docs/03_standards/operations/scripts/docker/projects/healthcheck-all.ps1
powershell -ExecutionPolicy Bypass -File Docs/03_standards/operations/scripts/docker/projects/test-random-project-scripts.ps1
```

Si se modifican Dockerfiles, compose o scripts de infraestructura, ejecutar:

```powershell
docker compose -p comercial_platform config --quiet
```

## Bloqueos reales

- MexIngSof no tiene API ni DB auxiliar canonica separada. Mientras siga asi,
  su seleccion usa `auth gateway jobcron search`.
- Cualquier API o web faltante debe documentarse como `PENDIENTE_DE_DEFINIR`
  en su proyecto, no resolverse creando contenedores alternos.
