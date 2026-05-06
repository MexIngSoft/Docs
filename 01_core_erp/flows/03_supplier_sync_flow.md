# Flujo de sincronizacion de proveedor

1. Supplier valida credenciales.
2. Ejecuta `sync_*`.
3. Guarda RawData y entidades de proveedor.
4. Registra SupplierSyncLog.
5. Ejecuta `publish_*` cuando aplique.
6. Catalog, Pricing u otros modulos reciben datos normalizados.

Regla: sync descarga; publish transforma.
