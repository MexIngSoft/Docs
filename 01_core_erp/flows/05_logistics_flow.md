# Flujo logistico

## Drop shipping inicial

1. Producto disponible en proveedor.
2. Logistics calcula envio desde proveedor.
3. Sales muestra costo y tiempo estimado.
4. Si se confirma, se registra shipment.

## Almacen propio futuro

1. Inventory confirma stock propio.
2. Logistics calcula envio desde almacen.
3. Carrier genera guia.
4. Tracking actualiza estado.

## Estados

- `CREATED`.
- `IN_TRANSIT`.
- `OUT_FOR_DELIVERY`.
- `DELIVERED`.
- `EXCEPTION`.
- `CANCELLED`.
