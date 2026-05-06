# Docker local

Este proyecto mantiene un solo contenedor para levantar las APIs Django durante la etapa inicial.

## Levantar servicios

```bash
docker compose up -d --build
```

## Ver logs

```bash
docker compose logs -f api-multiproyecto
```

## Ejecutar migraciones sin bajar el contenedor

Aplicar migraciones de un proyecto:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage catalog migrate
```

Crear y aplicar migraciones de un proyecto:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage catalog makemigrations
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage catalog migrate
```

Aplicar migraciones de todos los proyectos:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh migrate-all
```

Crear migraciones en todos los proyectos:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh makemigrations-all
```

## Proyectos disponibles

- `auth`
- `catalog`
- `inventory`
- `lexnova`
- `pricing`
- `procurement`
- `sales`
- `supplier`

## Puertos

- `auth`: `8000`
- `catalog`: `8001`
- `inventory`: `8002`
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
