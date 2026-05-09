# Checklist previo a programar Tecno Telec

## Regla

Si falta documentacion de proceso, API, endpoint, modelo o estado: no programar. Primero documentar.

## Checklist

| Punto | Requerido | Estado actual |
|---|---:|---|
| Documento del proceso | Si | Parcial, creado por fases 00-20. |
| API responsable | Si | Parcial. |
| Endpoint | Si | Documentado para productos; pendiente implementacion. |
| Request | Si | Parcial. |
| Response | Si | Parcial. |
| Modelo de datos | Si | Parcial. |
| Estado | Si | Documentado para catalogo, precio y cotizacion. |
| Manejo de errores | Si | Parcial. |
| Relacion con JobCron | Si | Documentada. |
| Regla de permisos | Si | Pendiente detalle por rol. |
| Placeholder | Si | Estrategia creada. |
| Criterio de prueba | Si | Basico en endpoints. |
| Paginacion | Si aplica | Documentada para productos. |
| Filtros | Si aplica | Documentados para productos. |
| Ordenamiento | Si aplica | Documentado para productos. |
| Cache | Si aplica | Pendiente TTL. |
| Ejemplo request/response | Si | Basico. |
| Pendientes | Si | Documentados. |

## Bloqueadores antes de programar integracion real

- Decision `quote-api` vs `sales-api` para cotizacion inicial.
- Contratos finales del Gateway.
- Endpoint real de Inventory API.
- Permisos por rol.
- Assets placeholder reales.
- Politica final de precios publicos/especiales.
