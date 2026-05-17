# Docker local

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
docker compose -f Docker.DB.PG\docker-compose.yml up -d
docker compose -f Docker.API.PY\docker-compose.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.yml up -d --build
docker compose -f Docker.SW.Nginx\docker-compose.yml up -d --build
```

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
- `lexnova_gateway`
- `lexnova`
- `pricing`
- `procurement`
- `sales`
- `supplier`

## Puertos

- `auth`: `8000`
- `catalog`: `8001`
- `inventory`: `8002`
- `lexnova_gateway`: `8017`
- `lexnova`: `8003`
- `pricing`: `8004`
- `procurement`: `8005`
- `sales`: `8006`
- `supplier`: `8007`

## Ejecutables SYSCOM

Los comandos de descarga/sincronizacion de SYSCOM viven en el proyecto `supplier`.

Ver detalle en:

```txt
docs/04_integrations/syscom/etl/syscom-commands.md
```
