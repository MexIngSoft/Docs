# Reset limpio y sincronizacion automatica SYSCOM

## Objetivo

Dejar en blanco las tablas que llena o afecta el ETL SYSCOM para probar una carga inicial desde cero y observar que el worker Docker ejecute la sincronizacion sin intervencion manual.

## Estado de agentes

Al momento de esta ejecucion, `Docs/agents/AGENTS-000.md`, `AGENTS-001.md` y `AGENTS-002.md` estaban en blanco. No habia una instruccion nueva que implementar desde agents.

La operacion se ejecuto con base en la documentacion vigente:

- `Docs/04_integrations/syscom/etl/overview.md`
- `Docs/04_integrations/syscom/etl/syscom-commands.md`
- `Docs/04_integrations/syscom/etl/docker-worker.md`

## Tablas limpiadas

Stage de proveedor:

```txt
Supplier.Suppliers
Supplier.SupplierCategories
Supplier.SupplierBrands
Supplier.SupplierProducts
Supplier.SupplierStock
Supplier.SupplierPrices
Supplier.SupplierProductRelations
Supplier.SyscomTokens
Supplier.SupplierSyncLog
```

Publicacion hacia Catalog:

```txt
Catalog.Categories
Catalog.Brands
Catalog.BrandCategory
Catalog.Products
Catalog.ProductCategoryLink
Catalog.ProductImages
Catalog.ProductResources
Catalog.ProductFeatures
Catalog.ProductVariants
Catalog.ProductRelations
```

Publicacion hacia Pricing:

```txt
Pricing.ProductPrices
```

## Tablas no limpiadas

No se limpiaron tablas de configuracion:

```txt
Pricing.PriceLists
Pricing.MarginRules
Supplier.SupplierProviders
```

## Estado del worker

El worker se ejecuta automaticamente al iniciar `api-multiproyecto` cuando:

```txt
ENABLE_SYSCOM_ETL_WORKER=true
```

Al arrancar:

1. Revisa credenciales SYSCOM.
2. Si faltan credenciales, registra el evento y espera.
3. Si existen credenciales y no hay estado previo, ejecuta `sync_syscom_all`.
4. Despues mantiene refresh continuo con `sync_syscom_fast`.

## Como confirmar que esta ejecutandose

Ver logs del contenedor API:

```bash
docker logs --tail=120 api-backend-python
```

Buscar lineas como:

```txt
SYSCOM ETL worker: iniciando proceso automatico
[syscom-etl] Worker SYSCOM iniciado
```

Ver logs persistentes del worker:

```bash
docker exec api-backend-python sh -c "tail -n 120 /usr/src/api/supplier/.etl_logs/syscom-etl-$(date +%F).log"
```

Ver estado persistente:

```bash
docker exec api-backend-python sh -c "ls -la /usr/src/api/supplier/.etl_state"
```

Cuando una tarea termine bien, deben aparecer archivos:

```txt
token.last_success
full.last_success
fast.last_success
```

Consultar logs de ejecucion en base:

```bash
docker exec db-postgresql psql -U postgres -d postgres -c "SELECT \"Entity\", \"Status\", \"StartedAt\", \"FinishedAt\", \"ErrorCount\" FROM \"Supplier\".\"SupplierSyncLog\" ORDER BY \"StartedAt\" DESC LIMIT 20;"
```

Consultar conteos de carga:

```bash
docker exec db-postgresql psql -U postgres -d postgres -c "SELECT COUNT(*) FROM \"Supplier\".\"SupplierProducts\";"
docker exec db-postgresql psql -U postgres -d postgres -c "SELECT COUNT(*) FROM \"Catalog\".\"Products\";"
docker exec db-postgresql psql -U postgres -d postgres -c "SELECT COUNT(*) FROM \"Pricing\".\"ProductPrices\";"
```

## Pendiente operativo

Para que la descarga real inicie, deben existir:

```txt
SYSCOM_CLIENT_ID
SYSCOM_CLIENT_SECRET
```

Si estan vacias, el worker se queda vivo y en espera. Eso es intencional para que Docker no se caiga por falta de credenciales.

## Validacion con credenciales locales

Las credenciales deben cargarse desde un archivo local ignorado por Git:

```txt
Docker.API.PY/.env
```

Formato esperado:

```txt
SYSCOM_CLIENT_ID=valor-local
SYSCOM_CLIENT_SECRET=valor-local
```

No documentar credenciales reales en Markdown, `docker-compose.yml` ni commits.

Despues de recrear el contenedor API, el log esperado cambia de:

```txt
Credenciales SYSCOM incompletas; esperando 300s
```

a:

```txt
Iniciando token intento 1/3
TOKEN SYSCOM OK
No existe full sync exitoso; ejecutando bootstrap
Iniciando full intento 1/3
```

Confirmacion observada:

```txt
Supplier.SupplierCategories > 0
Supplier.SupplierSyncLog muestra catalog RUNNING
```
