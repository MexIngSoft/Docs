# Reporte de malas practicas detectadas

## Estado

ACTUALIZADO_PARCIAL.

| Hallazgo | Severidad | Evidencia | Accion |
|---|---|---|---|
| Documentacion legacy `/api/gateway` | Media | DocuCore docs usan rutas legacy. | Migrar contratos a `/api/v1` o marcar legacy. |
| Mensajes tecnicos JWT en UI | Alta | JobCron mostraba `Given token not valid...`. | Corregido en `identity-client.ts`; mantener estandar. |
| Selector global de rol ambiguo | Media | JobCron usaba selector superior para asignacion. | Corregido: acciones por fila de usuario. |
| Header `X-Application-Code` usado como filtro admin | Alta | JobCron listaba solo super admin. | Corregido: filtro admin via query. |
| Pendientes ambiguos en agents historicos | Media | `AGENTS-000`, `001`, `030` grandes. | Reorganizar en `AGENTS-031` + especializados. |

## Regla de cierre

No usar `PENDIENTE` sin etiqueta formal de bloqueo y criterio de desbloqueo.
