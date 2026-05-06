# Runbook operativo

## Objetivo

Definir pasos operativos para levantar el entorno, validar APIs, ejecutar procesos y diagnosticar fallas sin depender de conocimiento interno del codigo.

## Alcance

Aplica al entorno Docker local `Docker.API.PY` y a las APIs Django montadas como repositorios independientes.

## Principios

- Docker orquesta; no es dueño del codigo de las APIs.
- Cada API debe tener su propio `.env.local`.
- Los comandos destructivos deben ejecutarse solo con confirmacion explicita.
- Los procesos `sync_*` descargan datos externos.
- Los procesos `publish_*` transforman datos hacia modulos internos.

## Levantar entorno local

Desde la raiz de `Docker.API.PY`:

```powershell
docker compose up -d --build
```

Validar contenedores:

```powershell
docker compose ps
```

El servicio principal debe quedar saludable antes de ejecutar comandos operativos.

## Validar una API Django

Formato:

```powershell
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage <api> check
```

Ejemplo Supplier:

```powershell
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier check
```

## Migraciones

Ver migraciones:

```powershell
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier showmigrations
```

Aplicar migraciones:

```powershell
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier migrate
```

Reglas:

- No crear migraciones automáticas sin revisar el diff de modelos.
- No borrar migraciones aplicadas en ambientes compartidos.
- En ambiente nuevo, aplicar migraciones antes de sync o publish.

## Orden recomendado de Supplier

Carga completa sugerida:

```text
sync_syscom_token
sync_syscom_categories
publish_syscom_categories
sync_syscom_brands
publish_syscom_brands
sync_syscom_products
publish_syscom_products
publish_syscom_prices
sync_syscom_related
publish_syscom_related
```

Comando orquestador cuando aplique:

```powershell
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_all
```

## Reintentos seguros

Antes de reintentar:

- Revisar logs del comando.
- Confirmar si el comando es idempotente.
- Revisar conteos creados, actualizados, omitidos y fallidos.
- Si fallo un proveedor externo, validar token y conectividad.

Regla: un reintento no debe duplicar datos si existe `ExternalId`, `ReferenceId` o `IdempotencyKey`.

## Diagnostico rapido

Error de variables:

- Revisar `.env.local`.
- Comparar contra `.env.local.example`.
- Confirmar `DJANGO_SECRET_KEY`, `DATABASE_URL` o `POSTGRES_*`.

Error de base de datos:

- Confirmar que el contenedor de PostgreSQL este arriba.
- Validar `POSTGRES_HOST`, `POSTGRES_PORT`, usuario y base.
- Ejecutar `showmigrations`.

Error de proveedor:

- Validar credenciales.
- Revisar expiracion de token.
- Revisar rate limit o timeout.
- Consultar logs del sync.

Error entre APIs:

- Revisar contrato esperado.
- Validar `correlation_id`.
- Confirmar que la API destino este levantada.

## Limpieza controlada

Permitido en ambientes locales nuevos:

- Borrar datos semilla no necesarios.
- Recrear contenedores.
- Reejecutar sync idempotente.

No permitido sin aprobacion:

- Borrar volumenes de base de datos compartidos.
- Eliminar migraciones aplicadas.
- Hacer reset de repositorios Git.
- Forzar push a repos remotos.

## Criterio de cierre operativo

Un modulo esta operable cuando:

- `manage.py check` pasa.
- Migraciones estan aplicadas.
- `.env.local.example` documenta variables requeridas.
- Comandos principales tienen orden documentado.
- Reintentos son seguros o tienen advertencia.
- Fallas comunes tienen ruta de diagnostico.
