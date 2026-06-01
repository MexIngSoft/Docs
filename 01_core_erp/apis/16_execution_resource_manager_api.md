# Execution Resource Manager API

## Estado

Propuesta documentada. No implementada.

## Objetivo

Recibir eventos normalizados de ejecucion desde proyectos y devolver reportes
para ERP sobre costos internos, creditos, fallback, carga tecnica y ahorro
operativo.

## Nombre de repositorio sugerido

```text
API.PY.DJANGO.ExecutionResourceManager
```

## Base sugerida

```text
/api/execution-resources
```

## Endpoints objetivo

```http
POST /api/execution-resources/events/
GET /api/execution-resources/events/{execution_id}/
GET /api/execution-resources/dashboard/
GET /api/execution-resources/projects/
GET /api/execution-resources/modules/
GET /api/execution-resources/costs/
GET /api/execution-resources/fallbacks/
GET /api/execution-resources/rules/
```

## Crear evento

```http
POST /api/execution-resources/events/
Content-Type: application/json
```

Body minimo:

```json
{
  "execution_id": "uuid",
  "trace_id": "uuid",
  "request_id": "uuid",
  "project_code": "DOCUCORE_GATEWAY",
  "module_code": "PDF_OCR",
  "task_type": "OCR",
  "execution_mode": "CLIENT",
  "fallback_used": false,
  "tenant_id": "tenant-id",
  "user_id": "user-id",
  "file_count": 1,
  "page_count": 25,
  "input_size_mb": 8.5,
  "output_size_mb": 1.2,
  "estimated_internal_cost": 0.18,
  "credits_charged": 2,
  "status": "SUCCESS",
  "error_code": null,
  "created_at": "timestamp"
}
```

Respuesta:

```json
{
  "execution_id": "uuid",
  "trace_id": "uuid",
  "status": "RECORDED",
  "received_at": "timestamp"
}
```

## Errores normalizados

| Codigo | Uso |
|---|---|
| `MISSING_PROJECT_CODE` | El evento no identifica proyecto origen. |
| `MISSING_MODULE_CODE` | El evento no identifica modulo funcional. |
| `INVALID_EXECUTION_MODE` | Modo distinto a `CLIENT`, `SERVER` o `HYBRID`. |
| `DUPLICATE_EXECUTION_EVENT` | Evento repetido sin idempotency key valida. |
| `FORBIDDEN_PROJECT` | El proyecto no puede reportar eventos. |

## Idempotencia

El API debe aceptar reintentos seguros. El par `execution_id` + `trace_id` debe
permitir detectar duplicados sin cobrar ni sumar dos veces.

## Seguridad

- Solo Gateways, APIs internas o jobs autorizados pueden crear eventos.
- ERP Web solo consulta agregados con permisos.
- Los eventos no deben incluir archivos, contenido OCR, secretos ni prompts
  sensibles.
- Los reportes financieros requieren permiso administrativo.

## Relacion con otros modulos

| Sistema | Relacion |
|---|---|
| DocuCore Gateway | Emite eventos de herramientas y fallback. |
| DocuCore API | Define herramientas, creditos esperados y limites. |
| Document API | Puede emitir metricas de jobs, storage y procesamiento. |
| Billing/ERP | Usa creditos cobrados e ingresos, pero no procesa eventos tecnicos. |
| Costing | Puede proveer tablas base para costo interno. |
| Rules Engine | Puede evaluar reglas de ejecucion y promociones futuras. |

## Pendientes antes de implementar

- Definir autenticacion interna entre APIs.
- Definir modelo de base de datos.
- Definir retencion y agregacion historica.
- Definir si el repositorio sera independiente o modulo dentro del ERP.
- Definir comandos de validacion y despliegue.
