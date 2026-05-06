# ETL marcas

## Objetivo

Descargar marcas de SYSCOM hacia `Supplier.SupplierBrands` y publicarlas despues hacia `Catalog.Brands`.

## Endpoints usados

```http
GET /api/v1/marcas
GET /api/v1/marcas/{id}
```

## Comandos

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_brands
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_brands
```

## Entidades afectadas

| Comando | Entidades |
|---|---|
| `sync_syscom_brands` | `Supplier.SupplierBrands`, `Supplier.SupplierSyncLog` |
| `publish_syscom_brands` | `Catalog.Brands`, `Supplier.SupplierBrands.IdBrand` |

## Flujo sync

```text
1. Consumir GET /api/v1/marcas.
2. Validar que la respuesta sea lista.
3. Por cada marca:
   - ExternalId = str(id)
   - Name = nombre.strip()
   - RawData = marca completa
4. Upsert en Supplier.SupplierBrands por Supplier + ExternalId.
5. Registrar conteos y errores.
```

## Flujo publish

```text
1. Leer Supplier.SupplierBrands activas.
2. Crear/actualizar Catalog.Brands.
3. Guardar IdBrand en Supplier.SupplierBrands.
4. Continuar aunque una marca tenga error.
```

## Detalle de marca

Si se usa `GET /api/v1/marcas/{id}`, el detalle debe enriquecer `Supplier.SupplierBrands.RawData`.

Las relaciones marca-categoria se deben publicar despues, usando categorias ya publicadas desde `Supplier.SupplierCategories`.

## Reglas

- No crear categorias desde detalle de marca si no existen en `Supplier.SupplierCategories`.
- No romper sync si una marca no tiene detalle.
- Guardar marcas raras o incompletas en `Supplier`; decidir visibilidad en `Catalog` o frontend.
- Si una marca no tiene ID estable, usar una llave normalizada documentada para ese proveedor.
