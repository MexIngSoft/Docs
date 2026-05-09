# Flujo de pricing

1. Supplier publica costo proveedor.
2. Pricing toma costo, moneda e impuestos.
3. Aplica margen y lista de precios.
4. Rules Engine puede validar descuentos.
5. Pricing devuelve precio final con vigencia.
6. Quote guarda snapshot.

## Reglas iniciales Tecno Telec

Pricing API debe calcular; Gateway solo consulta; Web solo muestra; JobCron administra reglas.

Reglas soportadas para MVP documental:

1. Precio fijo manual.
2. Costo proveedor + porcentaje.
3. Costo proveedor + monto fijo.
4. Redondeo comercial.
5. Precio demo marcado como `DEMO`.
6. Precio vigente por fecha.
7. Precio por lista.
8. Precio publico.
9. Precio especial.
10. Precio interno oculto.

## Flujo de calculo minimo

```text
1. Obtener producto interno desde Catalog.
2. Obtener costo desde Supplier o costo manual autorizado.
3. Convertir moneda si aplica.
4. Seleccionar lista de precio.
5. Aplicar regla de margen o monto fijo.
6. Aplicar precio fijo si tiene prioridad documentada.
7. Aplicar redondeo comercial.
8. Aplicar impuestos.
9. Devolver precio y regla aplicada.
10. Quote/Sales guarda snapshot si el cliente cotiza.
```

## Pendiente

La decision `quote-api` separado vs cotizacion inicial dentro de `sales-api` sigue pendiente en `02_projects/tecnotelec/tasks/00_pending_tasks.md`.
