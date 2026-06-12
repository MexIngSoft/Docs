# Docker local

## Arquitectura oficial JobCron

La regla oficial para Docker del ecosistema JobCron vive en:

```txt
Docs/03_standards/docker/jobcron-official-docker-architecture.md
```

Ese documento define la separacion entre corridas `master`, corridas por
proyecto, Dockerfiles base/especificos, variables `.env.master` y
`.env.<proyecto>`, red compartida objetivo `jobcron_network`, reutilizacion de
APIs compartidas y criterios para no duplicar contenedores.

El entorno actual conserva compatibilidad con la red heredada `crejo` mientras
la migracion a `jobcron_network` se haga de forma coordinada en compose,
scripts, Nginx y documentacion operativa.

El entorno local usa varios compose separados bajo el proyecto Docker `crejo`:

- `Docker.DB.PG`: PostgreSQL local.
- `Docker.API.PY`: APIs Django multiproyecto.
- `Docker.WEB.NJ`: frontend Next.js.
- `Docker.SW.Nginx`: proxy local de entrada.

Por estrategia de costos, las APIs y webs pueden agruparse en contenedores multiproyecto. Esa agrupacion no permite compartir configuracion de proyecto. La regla oficial es:

```txt
contenedores agrupados
configuracion aislada por proyecto
secretos separados
bases/usuarios/schemas separados por dominio
```

Estandar completo:

```txt
Docs/03_standards/docker/grouped-containers-isolated-config.md
```

Runbook completo de recuperacion:

```txt
Docs/03_standards/operations/docker-recovery-runbook.md
```

## Levantar servicios

Desde la raiz del workspace:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1
```

Ese script levanta `Docker.DB.PG`, `Docker.API.PY`, `Docker.WEB.NJ` y
`Docker.SW.Nginx` en el orden operativo correcto, y valida que los contenedores,
puertos, procesos API y webs principales respondan. Debe usarse como ruta
normal para evitar dejar fuera APIs o frontends del contenedor multiproyecto.

Si hay conflictos de puertos:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -ReleasePorts
```

Si una web Next.js carga HTML sin CSS:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -RepairCss
```

Comandos manuales equivalentes para diagnostico:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Reserve-WorkspacePorts.ps1 -DryRun
docker compose -f Docker.DB.PG\docker-compose.yml up -d
docker compose -f Docker.API.PY\docker-compose.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.yml up -d --build
docker compose -f Docker.SW.Nginx\docker-compose.yml up -d --build
```

Comandos por proyecto:

```powershell
docker compose -f Docker.DB.PG\docker-compose.<proyecto>.db.yml up -d
docker compose -f Docker.API.PY\docker-compose.<proyecto>.api.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.<proyecto>.web.yml up -d --build
```

Los compose por proyecto se guardan en la carpeta de su capa. Si solo cambia la
lista de procesos, deben ser overlays delgados que extiendan el compose base y
definan `API_PROJECTS` o `WEB_PROJECTS`.

Si el diagnostico muestra conflictos en puertos reservados, liberarlos antes de
levantar Docker:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Reserve-WorkspacePorts.ps1 -KillConflicts
```

La validacion no debe asumir que `GET /` devuelve `200` en cada API. Varias
APIs Django no exponen pagina raiz y pueden responder `404` en `/` aunque el
servicio este activo. Validar proceso, puerto publicado y rutas propias como
`/api/lexnova/health/` en el gateway LexNova.

Registro canonico de puertos:

```txt
Docs/03_standards/operations/local-port-registry.md
```

## Regla para proyectos con dependencias cruzadas

Cuando una web depende de Gateway/BFF, API de dominio y APIs core, no se debe
validar ni entregar solo el frontend. La validacion local debe cubrir toda la
cadena documentada por el proyecto:

```text
DB -> Core APIs -> Project Domain API -> Project Gateway/BFF -> Web
```

Cada proyecto con esta forma debe tener un runbook propio en
`Docs/02_projects/<proyecto>/local-dependency-runbook.md` con:

- matriz de proyectos relacionados,
- puertos,
- variables requeridas,
- orden de arranque,
- validacion minima,
- diagnostico de errores comunes.

Si el frontend se levanta en un puerto alterno, ese puerto debe existir en
`CORS_ALLOWED_ORIGINS` del Gateway/BFF.

## Reparacion de CSS Next.js

Si una web carga HTML pero aparece sin estilos, validar y reparar con:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Repair-NextCss.ps1 -Project lexnova -Url http://localhost:3002
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Repair-NextCss.ps1 -Project lexnova -Url http://localhost:3002 -Repair -Docker
```

El script revisa los assets CSS en `/_next/static/`, limpia `.next` cuando se
solicita reparacion y reinicia `web-frontend-node`.

## Ver logs

```powershell
docker compose -f Docker.API.PY\docker-compose.yml logs -f api-multiproyecto
docker compose -f Docker.WEB.NJ\docker-compose.yml logs -f web-frontend-node
docker compose -f Docker.SW.Nginx\docker-compose.yml logs -f nginx
```

## Ejecutar migraciones sin bajar el contenedor

Aplicar migraciones de un proyecto:

```powershell
docker compose -f Docker.API.PY\docker-compose.yml exec api-multiproyecto sh /usr/src/api/start.sh manage catalog migrate
```

Crear y aplicar migraciones de un proyecto:

```powershell
docker compose -f Docker.API.PY\docker-compose.yml exec api-multiproyecto sh /usr/src/api/start.sh manage catalog makemigrations
docker compose -f Docker.API.PY\docker-compose.yml exec api-multiproyecto sh /usr/src/api/start.sh manage catalog migrate
```

Aplicar migraciones de todos los proyectos:

```powershell
docker compose -f Docker.API.PY\docker-compose.yml exec api-multiproyecto sh /usr/src/api/start.sh migrate-all
```

Crear migraciones en todos los proyectos:

```powershell
docker compose -f Docker.API.PY\docker-compose.yml exec api-multiproyecto sh /usr/src/api/start.sh makemigrations-all
```

## Entrada principal

Con todos los servicios arriba:

```txt
http://localhost
```

## Proyectos disponibles

- `auth`
- `catalog`
- `inventory`
- `customization`
- `document`
- `docucore`
- `docucore_gateway`
- `fiscal`
- `fiscora`
- `fiscora_gateway`
- `imagrafity`
- `imagrafity_gateway`
- `jobcron`
- `leadhunter`
- `leadhunter_gateway`
- `lexnova_gateway`
- `lexnova`
- `pricing`
- `procurement`
- `sales`
- `supplier`
- `tecnotelec`
- `tecnotelec_gateway`

## Puertos

- `auth`: `8000`
- `catalog`: `8001`
- `inventory`: `8002`
- `lexnova`: `8003`
- `pricing`: `8004`
- `procurement`: `8005`
- `sales`: `8006`
- `supplier`: `8007`
- `tecnotelec_gateway`: `8008`
- `tecnotelec`: `8009`
- `customization`: `8010`
- `document`: `8011`
- `docucore`: `8012`
- `docucore_gateway`: `8013`
- `fiscora_gateway`: `8014`
- `fiscora`: `8015`
- `fiscal`: `8016`
- `lexnova_gateway`: `8017`
- `imagrafity_gateway`: `8018`
- `imagrafity`: `8019`
- `leadhunter_gateway`: `8020`
- `leadhunter`: `8021`
- `jobcron`: `8022`

Rangos reservados:

- Webs Next.js: `3000-3050`
- APIs Django/Gateway/BFF: `8000-8050`
- Nginx local: `80` y `443` futuro
- PostgreSQL local: `5432`

## Ejecutables SYSCOM

Los comandos de descarga/sincronizacion de SYSCOM viven en el proyecto `supplier`.

Ver detalle en:

```txt
docs/04_integrations/syscom/etl/syscom-commands.md
```
