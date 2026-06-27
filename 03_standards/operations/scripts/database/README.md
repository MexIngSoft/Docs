# Scripts operativos de base de datos

## Objetivo

Centralizar scripts reutilizables para consultar PostgreSQL de forma rapida y
segura sin guardar passwords ni mezclar scripts temporales dentro de
`Docs/agents`.

## Ubicacion

```text
Docs/03_standards/operations/scripts/database/
```

## Reglas

- No guardar passwords en scripts.
- No usar SQLite.
- No usar `postgres` como usuario de aplicacion.
- No usar la base `postgres` para datos de negocio.
- No borrar volumenes.
- No ejecutar `docker volume prune`.
- Usar `db-postgresql` como contenedor PostgreSQL oficial.
- Ejecutar primero scripts `SELECT` para confirmar alcance antes de cualquier
  script destructivo.
- Los scripts destructivos deben quedar documentados como plantilla y requieren
  reemplazar IDs placeholder antes de uso.

## Bases oficiales actuales

```text
auth
comercial
jobcron
lexnova
postgres  # solo administracion local
```

`test_comercial` fue retirada el 2026-06-27 tras validar que no contenia datos
unicos fuera de `comercial`. No debe recrearse como base persistente; las
pruebas deben usar bases temporales generadas por Django o la base oficial
asignada al API/proyecto.

## Scripts Auth guardados

| Script | Uso |
|---|---|
| `queries/auth/list-users-by-application.sql` | Lista usuarios Auth y muestra `ApplicationCode` para saber de que web/API viene cada usuario. |
| `queries/auth/delete-users-by-id.sql` | Plantilla transaccional para eliminar usuarios Auth por Id. No ejecutar sin revisar dependencias y reemplazar IDs. |

## Uso local sugerido

Consultar usuarios por aplicacion:

```powershell
docker exec db-postgresql psql -U postgres -d auth -f /ruta/dentro/del/contenedor/list-users-by-application.sql
```

En Windows, si el archivo no esta montado dentro del contenedor, abrir el SQL
en VS Code y copiarlo en una sesion controlada de `psql`.

## Advertencia sobre eliminacion

Para operacion normal, preferir el comando Django documentado en:

```text
Docs/01_core_erp/auth/user-application-traceability.md
```

El SQL `delete-users-by-id.sql` queda como plantilla administrativa de ultima
opcion. Antes de borrar:

1. ejecutar `list-users-by-application.sql`;
2. confirmar `UserId`, `Email` y `ApplicationCode`;
3. confirmar que no existen datos productivos en APIs de proyecto;
4. hacer respaldo o snapshot segun ambiente;
5. reemplazar `123`, `456` por IDs reales;
6. ejecutar dentro de una transaccion revisada.
