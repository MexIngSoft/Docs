# Worker Docker para ETLs SYSCOM

## Objetivo

Ejecutar automaticamente la descarga y publicacion de informacion SYSCOM dentro del contenedor Docker de APIs, con tolerancia a fallos y continuidad despues de reinicios.

## Alcance

El worker ejecuta comandos existentes del proyecto `Supplier`. No crea una fuente de datos nueva y no escribe directamente en `Catalog`, `Pricing` o `Inventory` fuera de los publishers documentados.

```txt
SYSCOM
  -> Supplier sync_*
  -> Supplier tables
  -> publish_syscom_*
  -> Core APIs
  -> TecnoTelec Gateway
  -> Web Tecno Telec
```

## Ejecutables cubiertos

| Proceso | Comando |
|---|---|
| Token | `sync_syscom_token` |
| Categorias | `sync_syscom_categories` |
| Publicar categorias | `publish_syscom_categories` |
| Marcas | `sync_syscom_brands` |
| Publicar marcas | `publish_syscom_brands` |
| Productos, stock y precios base | `sync_syscom_products` |
| Publicar productos | `publish_syscom_products` |
| Stock | `sync_syscom_stock` |
| Precios proveedor | `sync_syscom_prices` |
| Publicar precios | `publish_syscom_prices` |
| Relacionados/accesorios | `sync_syscom_related` |
| Publicar relacionados | `publish_syscom_related` |
| Full sync orquestado | `sync_syscom_all` |
| Refresh rapido | `sync_syscom_fast` |

## Estrategia implementada

El worker ejecuta tres familias:

| Familia | Frecuencia default | Comando |
|---|---:|---|
| Token | 6 horas | `sync_syscom_token` |
| Refresh rapido | 15 minutos | `sync_syscom_fast` |
| Full sync | 24 horas | `sync_syscom_all` |

El full sync cubre categorias, marcas, productos, stock, precios y relacionados. El refresh rapido mantiene stock, precios y publicacion de precios para operacion diaria.

## Tolerancia a fallos

El script `syscom_etl_worker.sh`:

- No inicia descargas si faltan `SYSCOM_CLIENT_ID` o `SYSCOM_CLIENT_SECRET`.
- Registra logs locales por fecha.
- Usa lock de proceso para evitar dos workers al mismo tiempo.
- Detecta locks huerfanos y los limpia si el proceso original ya no existe.
- Reintenta cada tarea con backoff.
- No marca una tarea como exitosa si falla.
- Conserva estado en archivos `*.last_success`.
- Conserva checkpoint de categorias de producto ya procesadas durante el full sync.
- Al reiniciar Docker, lee el estado y continua con la tarea que corresponda por frecuencia.
- Si una tarea falla, continua con las demas ventanas disponibles.
- Si la base o SYSCOM no estan listos, espera y reintenta.
- Espera un tiempo inicial antes del bootstrap para permitir que APIs y migraciones terminen de estabilizar.
- Detecta primer llenado si no existe `full.last_success` o si `syscom_etl_state --plain` reporta catalogo SYSCOM vacio.

## Estado persistente

Ruta default:

```txt
/usr/src/api/supplier/.etl_state
```

Esa ruta vive dentro del volumen del proyecto Supplier en desarrollo local, por lo que sobrevive reinicios del contenedor.

Archivos esperados:

```txt
token.last_success
fast.last_success
full.last_success
products.completed_categories.json
```

`products.completed_categories.json` se usa solo mientras `sync_syscom_all` sigue en progreso. Si el contenedor se reinicia o el comando se corta por timeout, el siguiente intento omite las categorias ya completadas y continua con las pendientes. Cuando todas las categorias terminan, el checkpoint se elimina y `full.last_success` queda como marca de full sync exitoso.

Regla de reanudacion:

- Si `sync_syscom_products` queda parcial porque una categoria, pagina o producto falla, el comando termina con error controlado.
- El worker no escribe `full.last_success` en ejecuciones parciales.
- El siguiente intento lee `products.completed_categories.json` y continua desde la primera categoria pendiente.
- Si el full sync termina correctamente, el checkpoint se elimina.
- En el siguiente full sync programado, al no existir checkpoint pendiente, productos inicia desde cero para refrescar todo el catalogo.

El estado operativo se puede confirmar con:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier syscom_etl_state --plain
```

## Logs

Ruta default:

```txt
/usr/src/api/supplier/.etl_logs
```

Formato:

```txt
syscom-etl-YYYY-MM-DD.log
```

Tambien se registran ejecuciones en `SupplierSyncLog` desde los comandos Django.

## Variables Docker

| Variable | Default | Uso |
|---|---|---|
| `ENABLE_SYSCOM_ETL_WORKER` | `true` en compose local | Activa el worker al iniciar `start.sh serve`. |
| `SYSCOM_CLIENT_ID` | vacio | Credencial OAuth SYSCOM. |
| `SYSCOM_CLIENT_SECRET` | vacio | Credencial OAuth SYSCOM. |
| `SYSCOM_BASE_URL` | `https://developers.syscom.mx` | API base SYSCOM. |
| `SYSCOM_ETL_STATE_DIR` | `/usr/src/api/supplier/.etl_state` | Estado persistente. |
| `SYSCOM_ETL_LOG_DIR` | `/usr/src/api/supplier/.etl_logs` | Logs locales. |
| `SYSCOM_ETL_STARTUP_DELAY_SECONDS` | `180` | Espera inicial antes de detectar primer llenado. |
| `SYSCOM_ETL_TOKEN_INTERVAL_SECONDS` | `21600` | Token cada 6 horas. |
| `SYSCOM_ETL_FAST_INTERVAL_SECONDS` | `900` | Refresh rapido cada 15 minutos. |
| `SYSCOM_ETL_FULL_INTERVAL_SECONDS` | `86400` | Full sync cada 24 horas. |
| `SYSCOM_ETL_BOOTSTRAP_ON_EMPTY` | `true` | Ejecuta full sync si nunca hay full exitoso. |
| `SYSCOM_ETL_LIMIT_CATEGORIES` | vacio | Limite opcional para pruebas. |
| `SYSCOM_ETL_LIMIT_PRODUCTS` | vacio | Limite opcional para pruebas. |
| `SYSCOM_ETL_PUBLISH_BATCH_SIZE` | `500` | Publicacion por lotes en full sync. |
| `SYSCOM_ETL_FAST_STOCK_MAX_AGE_MINUTES` | `120` | Frescura stock para `sync_syscom_fast`. |
| `SYSCOM_ETL_FAST_PRICE_MAX_AGE_MINUTES` | `240` | Frescura precio para `sync_syscom_fast`. |
| `SYSCOM_ETL_FAST_BULK_BATCH_SIZE` | `500` | Batch rapido. |
| `SYSCOM_ETL_MAX_ATTEMPTS` | `3` | Reintentos por tarea. |
| `SYSCOM_ETL_RETRY_BACKOFF_SECONDS` | `60` | Backoff base. |
| `SYSCOM_ETL_LOOP_SLEEP_SECONDS` | `60` | Pausa entre revisiones. |
| `SYSCOM_ETL_COMMAND_TIMEOUT_SECONDS` | `86400` | Ventana maxima por comando. Debe cubrir bootstrap largo. |
| `SYSCOM_ETL_RESUME_PRODUCTS` | `true` | Activa checkpoint de categorias para reanudar full sync. |
| `SYSCOM_ETL_PRODUCT_DELAY_SECONDS` | `0.5` | Pausa entre productos. |
| `SYSCOM_ETL_PAGE_DELAY_SECONDS` | `2` | Pausa entre paginas. |
| `SYSCOM_ETL_CATEGORY_DELAY_SECONDS` | `3` | Pausa entre categorias. |
| `SYSCOM_ETL_ERROR_DELAY_SECONDS` | `10` | Pausa despues de error puntual. |

## Comandos manuales

Full sync controlado:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/syscom_etl_worker.sh once-full
```

Refresh rapido:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/syscom_etl_worker.sh once-fast
```

Token:

```bash
docker compose exec api-multiproyecto sh /usr/src/api/syscom_etl_worker.sh once-token
```

Logs:

```bash
docker compose exec api-multiproyecto sh -c "tail -n 200 /usr/src/api/supplier/.etl_logs/syscom-etl-$(date +%F).log"
```

Mensajes clave esperados:

```txt
[WAITING FOR API]
[FIRST SYNC DETECTED]
[STARTING FULL ETL]
Iniciando full intento N/3
Finalizado full correctamente
```

Para confirmar que el full sync sigue avanzando aunque no haya terminado:

```bash
docker compose exec api-multiproyecto sh -c "tail -n 80 /usr/src/api/supplier/.etl_logs/syscom-etl-$(date +%F).log"
docker compose exec api-multiproyecto sh -c "cat /usr/src/api/supplier/.etl_state/products.completed_categories.json"
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier syscom_etl_state --plain
```

Senales correctas:

- El log cambia de categoria con el paso del tiempo.
- `products.completed_categories.json` incrementa categorias completadas.
- Los conteos de `Products`, `Categories` y `Brands` no bajan.
- Al terminar, existe `full.last_success` y desaparece `products.completed_categories.json`.

## Pendientes

- Implementar `sync_syscom_exchange_rate` si Pricing requiere tipo de cambio oficial SYSCOM.
- Migrar a Celery/RabbitMQ cuando se necesiten colas distribuidas.
- Definir alertas externas para fallos repetidos.
- Confirmar limites iniciales para bootstrap productivo antes de descargar catalogos completos.
