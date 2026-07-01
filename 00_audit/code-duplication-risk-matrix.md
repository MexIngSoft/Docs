# Matriz de riesgo de duplicacion de codigo

## Estado

ACTUALIZADO_PARCIAL.

| Riesgo | Evidencia | Estado | Accion |
|---|---|---|---|
| Gateway legacy `/api/gateway` en documentacion DocuCore | `Docs/02_projects/docucore/api-contracts.md` y documentos relacionados siguen usando `/api/gateway`. | Riesgo documental | Migrar contrato documental a Gateway General versionado o marcar como legacy. |
| Filtro de aplicacion confundido con `X-Application-Code` | JobCron Identity necesitaba filtrar por query y operar con header `JOBCRON`. | Corregido en codigo Auth/Gateway | Mantener regla documentada en JobCron y Gateway. |
| Permisos duplicados por proyecto | Pantallas de permisos por proyecto duplicarian Auth. | Controlado | Operar desde JobCron Identity & Access. |
| DB SQLite | Estandares prohiben SQLite. | Controlado en escaneo activo previo | Mantener escaneo anti SQLite. |
| Nginx proxy directo a APIs internas | No se detecto proxy directo a API interna en `Docker.SW.Nginx/nginx.conf`; proxy actual apunta a webs. | OK parcial | Mantener inventario Nginx. |

## Criterio

Todo hallazgo que requiera codigo debe moverse al agent especializado
correspondiente antes de implementarse.
