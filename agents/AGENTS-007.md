## FASE 6 — Pricing básico

Actualizar:

02_projects/tecnotelec/tasks/06_pricing_first_plan.md

Crear o actualizar:

01_core_erp/flows/04_pricing_flow.md
01_core_erp/database/06_pricing_model.md
01_core_erp/apis/04_pricing_api.md

Reglas iniciales:

1. Precio fijo manual.
2. Costo proveedor + porcentaje.
3. Costo proveedor + monto fijo.
4. Redondeo comercial.
5. Precio demo marcado como DEMO.
6. Precio vigente por fecha.
7. Precio por lista.
8. Precio público.
9. Precio especial.
10. Precio interno oculto.

Ejemplo:

Costo proveedor: 750
Regla porcentaje: +20% = 900
Regla monto fijo: +49 = 799
Regla precio fijo: 899

Pricing API debe calcular.
Gateway solo consulta.
Web solo muestra.
JobCron administra reglas.

Endpoint mínimo:

GET /pricing/product/{productId}
POST /pricing/calculate

Respuesta:

- productId
- baseCost
- publicPrice
- ruleApplied
- currency
- validFrom
- validTo
- isDemo
- calculationSnapshot