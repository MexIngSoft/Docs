# Supplier API

## Responsabilidad

Sincronizar proveedores externos, guardar RawData, stock proveedor, precios proveedor y logs.

## Endpoints/comandos

- `sync_syscom_token`
- `sync_syscom_categories`
- `sync_syscom_brands`
- `sync_syscom_products`
- `sync_syscom_stock`
- `sync_syscom_prices`
- `publish_syscom_categories`
- `publish_syscom_products`
- `publish_syscom_prices`

## No debe hacer

- Vender.
- Calcular precio final.
- Modificar stock propio.
