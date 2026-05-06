# ETL productos

## Objetivo

Descargar productos de SYSCOM hacia `Supplier.SupplierProducts`, registrar costos y existencias de proveedor, y publicar despues productos internos hacia `Catalog`.

## Endpoints usados

```http
GET /api/v1/marcas/{marca}/productos?categoria={id}&pagina={n}
GET /api/v1/productos?busqueda={texto}&pagina={n}
GET /api/v1/productos/{producto_id}
```

## Comandos

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_products
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier publish_syscom_products
```

## Estrategia recomendada

Para catalogo completo:

```text
Categorias hoja en Supplier
  -> productos por categoria
  -> detalle de producto
  -> SupplierProducts / SupplierStock / SupplierPrices
  -> publish a Catalog
```

Para busqueda puntual:

```text
Texto o producto_id
  -> productos encontrados
  -> actualizar Supplier
  -> publicar solo esos productos
```

## Entidades afectadas

| Comando | Entidades |
|---|---|
| `sync_syscom_products` | `Supplier.SupplierProducts`, `Supplier.SupplierStock`, `Supplier.SupplierPrices`, `Supplier.SupplierSyncLog` |
| `publish_syscom_products` | `Catalog.Products`, `Catalog.ProductCategoryLink`, imagenes y recursos disponibles |

## Flujo sync

```text
1. Obtener categorias hoja desde Supplier.SupplierCategories.
2. Para cada categoria hoja:
   2.1 Consumir productos paginados.
   2.2 Evitar duplicados dentro de la ejecucion.
   2.3 Obtener detalle si aplica.
   2.4 Mapear producto.
   2.5 Upsert Supplier.SupplierProducts con RawData.
   2.6 Insertar Supplier.SupplierStock si viene existencia.
   2.7 Insertar Supplier.SupplierPrices si vienen precios.
3. Registrar conteos y errores.
```

## Flujo publish

```text
1. Leer Supplier.SupplierProducts pendientes o actualizados.
2. Resolver marca publicada usando Supplier.SupplierBrands.IdBrand cuando exista.
3. Resolver categorias publicadas usando Supplier.SupplierCategories.IdCategory.
4. Crear/actualizar Catalog.Products.
5. Crear/actualizar relaciones producto-categoria.
6. Guardar IdProduct en Supplier.SupplierProducts.
```

## Datos minimos por producto

| Campo | Requerido | Accion si falta |
|---|---:|---|
| `producto_id` | Si | Saltar producto y registrar error. |
| `modelo` | Recomendado | Guardar null si no viene. |
| `titulo` | Si para publicar | Usar modelo o `Producto {producto_id}` si falta. |
| `marca` | Recomendado | Publicar con marca generica solo si la regla del negocio lo permite. |
| `categorias` | Recomendado | Guardar en `Supplier`; publicar sin categoria solo si se permite. |
| `precios` | No | Guardar producto sin precio. |
| `existencia` | No | Guardar stock desconocido o 0 segun regla definida. |

## Reglas de upsert

| Entidad | Llave |
|---|---|
| `SupplierProduct` | `Supplier + ExternalProductId` |
| `SupplierStock` | Historico por captura |
| `SupplierPrice` | Historico por tipo y captura |
| `Catalog.Product` | ID interno existente o `Provider + ExternalProductId` si el modelo lo soporta |

## Stock y precios dentro del producto

Aunque vengan dentro del endpoint de producto, conceptualmente pertenecen a `Supplier`:

```text
producto.precios -> Supplier.SupplierPrices
producto.existencia -> Supplier.SupplierStock
```

No deben guardarse como precio final ni inventario propio hasta que un proceso `publish_*` o una regla de negocio los transforme.

## Performance

- Procesar por paginas.
- Evitar productos duplicados en memoria durante una ejecucion.
- Manejar transaccion por producto o por lote pequeno.
- Guardar errores por producto y continuar.
- Considerar operaciones bulk cuando el proceso este estable.
