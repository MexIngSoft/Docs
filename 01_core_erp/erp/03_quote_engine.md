# Motor de cotizacion

## Objetivo

Generar cotizaciones reproducibles para productos, servicios o proyectos completos.

## Responsabilidades

- Recibir productos y servicios desde Cart o Projects.
- Consultar Pricing para precios finales.
- Consultar Inventory para disponibilidad.
- Consultar Logistics para envio.
- Consultar Rules Engine para aprobacion, descuentos o estrategia.
- Crear snapshot de precios, impuestos, costos y condiciones.

## Regla critica

Una cotizacion emitida no debe cambiar si cambian los precios del proveedor. Debe conservar snapshot.

## Estados sugeridos

- `DRAFT`.
- `CALCULATED`.
- `PENDING_REVIEW`.
- `APPROVED`.
- `REJECTED`.
- `EXPIRED`.
- `CONVERTED_TO_ORDER`.
