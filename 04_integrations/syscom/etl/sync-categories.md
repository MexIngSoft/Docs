# ETL categorias

## Objetivo

Descargar categorias de SYSCOM hacia `Supplier.SupplierCategories` y publicarlas despues hacia `Catalog.Categories`.

## Endpoints usados

```http
GET /api/v1/categorias
GET /api/v1/categorias/{id}
```

## Comandos

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_categories
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_categories
```

## Entidades afectadas

| Comando | Entidades |
|---|---|
| `sync_syscom_categories` | `Supplier.SupplierCategories`, `Supplier.SupplierSyncLog` |
| `publish_syscom_categories` | `Catalog.Categories`, `Supplier.SupplierCategories.IdCategory` |

## Flujo sync

```text
1. Obtener token valido.
2. Consumir GET /api/v1/categorias.
3. Validar que la respuesta sea lista.
4. Mapear categorias raiz.
5. Upsert en Supplier.SupplierCategories.
6. Consultar hijos con GET /api/v1/categorias/{id}.
7. Guardar hijos con ParentExternalId.
8. Repetir recursivamente hasta hojas.
9. Registrar conteos y errores.
```

## Flujo publish

```text
1. Leer Supplier.SupplierCategories activas.
2. Crear/actualizar Catalog.Categories.
3. Resolver jerarquia interna usando ParentExternalId.
4. Guardar IdCategory en Supplier.SupplierCategories.
5. Continuar aunque una categoria tenga error.
```

## Mapeo

| SYSCOM | Supplier | Catalog |
|---|---|---|
| `id` | `ExternalId` | `ExternalId` si existe |
| `nombre` | `Name` | `Name` |
| `nivel` | `Level` | `Level` si existe |
| padre externo | `ParentExternalId` | `Parent` |
| JSON completo | `RawData` | No aplica |

## Validaciones

- `id` no debe ser nulo.
- `nombre` debe limpiarse con `strip()`.
- `nivel` debe convertirse a entero.
- Si `subcategorias` no viene, tratar como hoja.
- No borrar categorias que no aparezcan en una ejecucion; marcarlas inactivas despues de una politica definida.
