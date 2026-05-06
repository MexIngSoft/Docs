# ETL relacionados y accesorios

## Objetivo

Descargar relaciones comerciales entre productos para mejorar cotizaciones, kits, recomendaciones y soluciones.

## Endpoints usados

```http
GET /api/v1/productos/{producto_id}/relacionados
GET /api/v1/productos/{producto_id}/accesorios
```

## Comando

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_related
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_related
```

## Entidades afectadas

| Etapa | Entidades |
|---|---|
| `sync_syscom_related` | `Supplier.SupplierProductRelations`, `Supplier.SupplierProducts`, `Supplier.SupplierStock`, `Supplier.SupplierPrices` si llegan productos nuevos |
| `publish_syscom_related` | `Catalog.ProductRelations` y productos relacionados si existen |

## Flujo

```text
1. Seleccionar productos ya descargados en Supplier.SupplierProducts.
2. Para cada producto con IdProduct publicado:
   - Consumir relacionados.
   - Consumir accesorios.
3. Por cada producto devuelto:
   - Verificar si existe en Supplier.SupplierProducts.
   - Si no existe, descargarlo como producto normal cuando aplique.
   - Guardar Supplier.SupplierProductRelations con RelationType.
4. Ejecutar publish_syscom_related:
   - Publicar productos pendientes si hace falta.
   - Crear relacion interna en Catalog.ProductRelations.
   - Guardar IdProductRelation en Supplier.SupplierProductRelations.
5. Conservar evidencia suficiente en RawData o metadata de sync.
```

## RelationType sugeridos

| Tipo | Cuando usarlo |
|---|---|
| `RELATED` | Endpoint `/relacionados`. |
| `ACCESSORY` | Endpoint `/accesorios`. |
| `COMPATIBLE` | Relacion validada manualmente o por regla. |
| `REPLACEMENT` | Sustituto recomendado. |
| `EQUIVALENT` | Producto equivalente funcional. |

## Frecuencia

```text
Semanal para todo el catalogo.
Bajo demanda para productos en cotizacion.
```
