# Administrador de Ejecucion y Recursos

## Estado

Documentado. No implementado.

## Objetivo

El Administrador de Ejecucion y Recursos controla la medicion transversal de
procesos ejecutados por proyectos del ecosistema. Su responsabilidad es saber
quien ejecuto una tarea, donde se ejecuto, cuanto costo internamente, cuantos
creditos se cobraron y que ahorro operativo produjo.

Nombre operativo sugerido:

```text
Execution & Resource Manager
```

Nombre en espanol:

```text
Administrador de Ejecucion y Recursos
```

## Clasificacion

| Campo | Valor |
|---|---|
| Tipo | Core ERP / Shared operational module |
| Owner documental | `Docs/01_core_erp/erp/24_execution_resource_manager.md` |
| API sugerida | `API.PY.DJANGO.ExecutionResourceManager` |
| Consumidores | DocuCore, LexNova, Imagrafity, ERP, futuros productos |
| Estado | Planeacion canonica |

## Responsabilidad

Debe registrar y mostrar:

- proyecto que ejecuto la tarea;
- usuario, tenant o cliente solicitante;
- modulo y tipo de proceso;
- modo de ejecucion: cliente, servidor o hibrido;
- uso de fallback;
- costo interno estimado;
- creditos cobrados;
- ahorro operativo estimado;
- consumo tecnico de servidor;
- capacidad estimada del cliente;
- fallos y codigos de error;
- trazabilidad por `execution_id`, `trace_id` y `request_id`;
- tareas mas costosas;
- proyectos que consumen mas recursos;
- procesos que conviene optimizar.

## No debe hacer

- Procesar PDFs.
- Ejecutar OCR.
- Convertir archivos.
- Guardar archivos pesados.
- Reemplazar DocuCore, Document API o Gateway.
- Decidir precio comercial final por si solo.
- Guardar contenido sensible del documento.

## Arquitectura sugerida

```text
Proyecto Web
  -> Gateway del proyecto
  -> API del proyecto / Document API / Shared module
  -> API.PY.DJANGO.ExecutionResourceManager
  -> ERP Web
```

El Gateway o API responsable del proceso envia eventos normalizados. El ERP Web
consume reportes del modulo para dashboard, costos, fallbacks y reglas.

## Ruta ERP sugerida

```text
/erp/execution-resources
/erp/execution-resources/dashboard
/erp/execution-resources/projects
/erp/execution-resources/modules
/erp/execution-resources/costs
/erp/execution-resources/fallbacks
/erp/execution-resources/rules
/erp/execution-resources/settings
```

## Identificadores obligatorios

Cada evento debe incluir:

| Campo | Uso |
|---|---|
| `execution_id` | Identificador unico de la ejecucion medida. |
| `trace_id` | Correlacion entre frontend, gateway, API y jobs. |
| `request_id` | Solicitud original del usuario o sistema. |
| `tenant_id` | Negocio, cliente o espacio propietario. |
| `user_id` | Usuario solicitante cuando exista autenticacion. |
| `project_code` | Proyecto que genera el evento. |
| `module_code` | Modulo que ejecuta o prepara la tarea. |
| `task_type` | Tipo funcional de proceso. |

Ejemplos de `project_code`:

```text
DOCUCORE_WEB
DOCUCORE_API
DOCUCORE_GATEWAY
DOCUMENT_API
LEXNOVA
IMAGRAFITY
ERP_CORE
```

Ejemplos de `module_code`:

```text
PDF_OCR
PDF_SPLIT
PDF_MERGE
IMAGE_TO_PDF
PDF_PREVIEW
AI_LEGAL_ANALYSIS
PRODUCT_DESIGN_PREVIEW
```

## Evento minimo

```json
{
  "execution_id": "uuid",
  "trace_id": "uuid",
  "request_id": "uuid",
  "project_code": "DOCUCORE_GATEWAY",
  "module_code": "PDF_OCR",
  "task_type": "OCR",
  "execution_mode": "CLIENT|SERVER|HYBRID",
  "fallback_used": true,
  "user_id": "internal-user-id",
  "tenant_id": "business-or-client-id",
  "file_count": 1,
  "page_count": 25,
  "input_size_mb": 8.5,
  "output_size_mb": 1.2,
  "client_cpu_score": 75,
  "client_memory_score": 60,
  "server_cpu_ms": 12000,
  "server_memory_mb": 512,
  "estimated_internal_cost": 0.18,
  "credits_charged": 2,
  "status": "SUCCESS|FAILED|PARTIAL",
  "error_code": null,
  "created_at": "timestamp"
}
```

## Campos obligatorios y opcionales

| Campo | Requerido | Regla |
|---|---|---|
| `execution_id` | Si | Generado una vez por tarea medida. |
| `trace_id` | Si | Debe viajar entre capas. |
| `project_code` | Si | Identifica origen. |
| `module_code` | Si | Identifica modulo funcional. |
| `task_type` | Si | Clasifica proceso. |
| `execution_mode` | Si | `CLIENT`, `SERVER` o `HYBRID`. |
| `fallback_used` | Si | Booleano. |
| `status` | Si | `SUCCESS`, `FAILED` o `PARTIAL`. |
| `credits_charged` | Si | Puede ser `0` si aplica plan o promocion. |
| `estimated_internal_cost` | Si | Estimado aunque sea provisional. |
| `user_id` | Condicional | Requerido con usuario autenticado. |
| `tenant_id` | Condicional | Requerido en escenarios multi-tenant. |
| `file_count`, `page_count`, `input_size_mb` | Condicional | Requeridos para procesos documentales. |
| `client_cpu_score`, `client_memory_score` | Opcional | Solo si se ejecuto o evaluo cliente. |
| `server_cpu_ms`, `server_memory_mb` | Opcional | Solo si hubo servidor o hibrido. |
| `error_code` | Condicional | Requerido si fallo o fue parcial. |

## Vistas ERP

### Dashboard general

- Procesos ejecutados hoy.
- Costo interno total.
- Creditos cobrados.
- Ahorro estimado por procesamiento en cliente.
- Porcentaje cliente / servidor / hibrido.
- Fallos y fallback.

### Vista por proyecto

- DocuCore.
- LexNova.
- Imagrafity.
- ERP.
- Otros proyectos.

### Vista por modulo

- OCR.
- PDF Split.
- PDF Merge.
- Image Compress.
- PDF to Word.
- AI Analysis.
- Preview Generator.

### Vista por usuario o cliente

- Consumo total.
- Creditos usados.
- Procesos mas usados.
- Fallos frecuentes.

### Vista tecnica

- CPU consumida.
- Memoria consumida.
- Tiempo promedio.
- Procesos en cola.
- Errores.
- Uso de fallback.

### Vista financiera

- Costo interno estimado.
- Ingresos por creditos.
- Margen aproximado.
- Ahorro operativo.

## Calculo inicial de ahorro

Formula provisional:

```text
ahorro_operativo_estimado =
  costo_estimado_servidor_equivalente
  - costo_real_o_estimado_usado
```

El costo equivalente del servidor debe usar una tabla interna por tipo de tarea,
paginas, MB, tiempo promedio, storage temporal y memoria. Hasta definir esa
tabla, el valor se considera estimado y no fiscal.

## Politica de creditos

Los creditos cobrados al usuario son independientes del lugar de ejecucion. Si
una tarea pasa de cliente a servidor por fallback, no se cobra dos veces.

Regla base:

```text
1 solicitud confirmada = 1 cargo comercial segun herramienta y plan.
```

El evento puede registrar varios intentos tecnicos, pero debe conservar un solo
`execution_id` comercial o relacionarlos por `trace_id`.

## Privacidad

No se deben enviar:

- archivos;
- contenido OCR completo;
- prompts con informacion sensible;
- datos personales innecesarios;
- secretos;
- rutas privadas de storage;
- hashes si permiten reconstruir informacion sensible sin contrato.

Se deben preferir contadores, tamanos, estados, codigos, referencias internas y
metricas agregadas.

## Preguntas pendientes

| Pregunta | Motivo | Consecuencia si no se responde |
|---|---|---|
| Formula final de costo interno | Define reportes financieros y margen. | Los costos seran solo estimados. |
| Tabla de creditos por herramienta | Afecta producto y facturacion. | No se puede cerrar precio comercial. |
| Permisos ERP por vista | Protege datos tecnicos y financieros. | Riesgo de exposicion interna. |
| Retencion de eventos | Afecta auditoria, costos y almacenamiento. | No hay politica clara de historico. |
| API separada o modulo ERP interno | Define repositorio y despliegue. | No se puede implementar backend. |

## Decision inicial

Se recomienda crear `API.PY.DJANGO.ExecutionResourceManager` como API separada
o modulo desacoplado del ERP. La razon es que la medicion aplica a varios
productos y no debe quedar acoplada a DocuCore.
