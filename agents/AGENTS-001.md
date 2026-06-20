Sí: **operativamente deben ser solo estos 3 contenedores oficiales**:

| Capa | Repo/orquestador documental | Contenedor operativo obligatorio |
| ---- | --------------------------- | -------------------------------- |
| DB   | `Docker.DB.PG`              | `db-postgresql`                  |
| APIs | `Docker.API.PY`             | `api-multiproyecto`              |
| Webs | `Docker.WEB.NJ`             | `web-frontend-node`              |

La documentación sí separa esas responsabilidades: `Docker.DB.PG`, `Docker.API.PY` y `Docker.WEB.NJ` aparecen como repos separados; también dice que los proyectos no deben mezclarse en un monorepo general. ([GitHub][1])

La regla debe quedar así: **Codex no puede crear contenedores nuevos para probar**. Debe probar siempre dentro de:

```txt
db-postgresql
api-multiproyecto
web-frontend-node
```

Y sobre SQLite: **debe quedar prohibido en runtime, tests y defaults**. Si una API trae SQLite por defecto, se corrige antes de validar.

Te dejo la instrucción lista:

# INSTRUCCIÓN CODEX — NORMALIZACIÓN DOCKER OFICIAL Y BLOQUEO DE SQLITE

## OBJETIVO

Corregir la bloqueante de Docker y base de datos para que todas las pruebas, APIs y webs del ecosistema se ejecuten únicamente en los contenedores oficiales, sin crear contenedores alternos y sin usar SQLite.

## CONTENEDORES OFICIALES OBLIGATORIOS

Los únicos nombres operativos permitidos son:

```text
db-postgresql
api-multiproyecto
web-frontend-node
```

## MAPEO OFICIAL

```text
Docker.DB.PG      → db-postgresql
Docker.API.PY     → api-multiproyecto
Docker.WEB.NJ     → web-frontend-node
```

## REGLA PRINCIPAL

Está prohibido crear contenedores nuevos como:

```text
gateway-db
jobcron-db
refapart-db
api-gateway
api-jobcron
api-refapart
web-refapart
web-jobcron
```

Toda API Django debe probarse dentro de:

```text
api-multiproyecto
```

Toda web Next.js debe probarse dentro de:

```text
web-frontend-node
```

Toda base de datos PostgreSQL debe vivir dentro de:

```text
db-postgresql
```

## PROHIBICIÓN DE SQLITE

SQLite queda prohibido en:

```text
settings.py
settings/local.py
settings/test.py
.env.example
.env.local.example
docker-compose.yml
pytest
tests
CI
validaciones manuales
```

Si una API usa SQLite por default, corregirla antes de continuar.

Toda API debe usar PostgreSQL apuntando a:

```env
DB_HOST=db-postgresql
DB_PORT=5432
DB_NAME=<nombre_db>
DB_USER=<usuario>
DB_PASSWORD=<password>
```

## ACCIONES OBLIGATORIAS

1. Revisar `Docker.DB.PG`, `Docker.API.PY` y `Docker.WEB.NJ`.
2. Confirmar que los `docker-compose.yml` usen estos nombres exactos:

```yaml
services:
  db-postgresql:
  api-multiproyecto:
  web-frontend-node:
```

3. Si existen servicios con nombres distintos, renombrarlos.
4. Si existen contenedores duplicados, eliminarlos.
5. No crear compose nuevo por API.
6. No crear compose nuevo por web.
7. Usar una sola red compartida:

```text
jobcron_network
```

8. Todas las APIs deben resolver PostgreSQL por hostname:

```text
db-postgresql
```

9. Todas las webs deben resolver backend por:

```text
api-multiproyecto
```

10. Gateway debe ejecutarse dentro de `api-multiproyecto`, no como contenedor aparte.

## COMANDOS OPERATIVOS

Desde el orquestador correspondiente:

```bash
docker compose down
docker compose up -d --build
docker ps
```

Validar que solo existan:

```bash
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

Resultado esperado:

```text
db-postgresql
api-multiproyecto
web-frontend-node
```

Eliminar contenedores incorrectos:

```bash
docker rm -f <container_name>
```

Eliminar imágenes obsoletas solo si no están en uso:

```bash
docker image prune -f
```

No usar:

```bash
docker system prune -a
```

salvo autorización explícita.

## POSTGRESQL

Crear bases y usuarios necesarios en `db-postgresql`.

Bases mínimas:

```text
gateway_db
jobcron_db
refapart_db
tecnotelec_db
catalog_db
supplier_db
pricing_db
inventory_db
sales_db
document_db
search_db
auth_db
address_db
```

Usuarios mínimos:

```text
gateway_user
jobcron_user
refapart_user
tecnotelec_user
catalog_user
supplier_user
pricing_user
inventory_user
sales_user
document_user
search_user
auth_user
address_user
```

Cada usuario debe tener permisos sobre su propia DB.

Para tests Django, permitir creación de DB temporal:

```sql
ALTER USER <usuario> CREATEDB;
```

Esto desbloquea errores como:

```text
permission denied to create database
```

## VALIDACIÓN DE API

Todas las validaciones deben ejecutarse dentro de `api-multiproyecto`.

Ejemplo:

```bash
docker exec -it api-multiproyecto bash
```

Dentro:

```bash
cd API.PY.DJANGO.Gateway
python manage.py check
python manage.py migrate
python manage.py test
```

Repetir para:

```text
API.PY.DJANGO.JobCron
API.PY.DJANGO.RefaPart
API.PY.DJANGO.TecnoTelec
API.PY.DJANGO.Catalog
API.PY.DJANGO.Supplier
API.PY.DJANGO.Pricing
API.PY.DJANGO.Inventory
API.PY.DJANGO.Sales
API.PY.DJANGO.Document
API.PY.DJANGO.Search
API.PY.DJANGO.Auth
API.PY.DJANGO.Address
```

## VALIDACIÓN WEB

Todas las validaciones web deben ejecutarse dentro de `web-frontend-node`.

```bash
docker exec -it web-frontend-node bash
```

Dentro:

```bash
cd WEB.NJ.NEXT.JobCron
npm install
npm run lint
npm run build
```

Repetir para:

```text
WEB.NJ.NEXT.MexIngSof
WEB.NJ.NEXT.Refapart
WEB.NJ.NEXT.TecnoTelec
```

## BLOQUEANTES ACTUALES A RESOLVER

1. Corregir remoto inaccesible de:

```text
API.PY.DJANGO.Gateway
API.PY.DJANGO.RefaPart
API.PY.DJANGO.Address
```

2. Subir commit local pendiente de Gateway:

```text
7d20ae7 feat(gateway): register mexingsof lead route
```

3. Verificar que Gateway ya no tenga SQLite.
4. Verificar que JobCron pueda crear DB de test.
5. Ejecutar RefaPart dentro de Docker oficial, no fuera.
6. Configurar PostgreSQL real para Gateway.
7. Confirmar que `db-postgresql` acepte conexión desde `api-multiproyecto`.
8. Confirmar que `web-frontend-node` consuma Gateway dentro de `api-multiproyecto`.

## VALIDACIÓN CONTRA SQLITE

Ejecutar búsqueda en cada repo API:

```bash
grep -R "sqlite" -n .
grep -R "db.sqlite3" -n .
```

Si aparece en configuración activa, corregir.

Permitido únicamente si aparece en documentación histórica o comentarios de migración indicando que está prohibido.

## REPORTE OBLIGATORIO

Actualizar:

```text
Docs/agents/EXECUTION_REPORT.md
```

Debe incluir:

```text
Contenedores detectados
Contenedores eliminados
Contenedores oficiales activos
APIs probadas dentro de api-multiproyecto
Webs probadas dentro de web-frontend-node
Bases creadas en db-postgresql
Usuarios PostgreSQL creados
Permisos CREATEDB configurados para tests
Archivos donde se eliminó SQLite
Errores encontrados
Errores corregidos
Bloqueantes reales restantes
```

## CRITERIO DE CIERRE

La tarea solo puede cerrarse si:

```text
docker ps muestra db-postgresql, api-multiproyecto y web-frontend-node.
Ninguna API usa SQLite.
Gateway corre con PostgreSQL.
JobCron corre tests con PostgreSQL.
RefaPart se prueba dentro de api-multiproyecto.
Las webs se prueban dentro de web-frontend-node.
No se creó ningún contenedor alterno.
Todo queda documentado en EXECUTION_REPORT.md.
```

Punto clave: **el nombre de repo no es el nombre del contenedor**.
El repo puede llamarse `Docker.API.PY`, pero el contenedor vivo debe llamarse **`api-multiproyecto`**.

[1]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/03_standards/operations/git-repository-map.md "raw.githubusercontent.com"
