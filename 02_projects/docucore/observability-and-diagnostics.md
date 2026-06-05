# DocuCore Observability and Diagnostics Standard

## Estado

Activo como estandar canonico de DocuCore.

## Objetivo

Definir como DocuCore registra logs, errores, diagnostico, metricas, issues,
alertas, auditoria y limpieza para poder responder:

```text
Que hizo el usuario, que hizo DocuCore, que servicio participo, donde fallo,
por que fallo, cuando debe escalarse y como puede resolverse.
```

Este documento complementa:

- `api-contracts.md`
- `error-handling.md`
- `execution-policy.md`
- `tool-readiness-and-configuration.md`
- `Docs/03_standards/operations/observability.md`
- `Docs/01_core_erp/erp/24_execution_resource_manager.md`
- `Docs/01_core_erp/apis/16_execution_resource_manager_api.md`

## Principios

- Todo proceso documental debe ser trazable.
- Todo error debe ser identificable con codigo estable.
- No todo error crea un issue.
- Los logs no se conservan de forma indefinida.
- Los mensajes al usuario no deben exponer stack traces, rutas internas,
  secretos, payloads sensibles ni contenido documental.
- La vista tecnica debe permitir diagnosticar sin repetir el proceso.
- La limpieza de logs es parte del producto, no una tarea manual eventual.

## Arquitectura observable

Todo flujo relevante debe poder seguirse entre capas:

```text
Usuario
  -> Workspace Web
  -> DocuCore Gateway
  -> DocuCore API / Document API
  -> Motor documental
  -> Storage privado
  -> Jobs / resultados / descargas
```

Cada capa registra eventos propios y conserva identificadores comunes para
correlacion.

## Identificadores obligatorios

| Identificador | Formato recomendado | Uso |
|---|---|---|
| `request_id` | `REQ-YYYYMMDD-000001` o UUID si ya existe trazabilidad tecnica | Solicitud visible para soporte y diagnostico. |
| `session_id` | UUID o identificador interno de sesion | Agrupar acciones del usuario durante la sesion. |
| `project_id` | UUID | Relacionar documentos, jobs y resultados. |
| `document_id` | UUID | Relacionar archivo o documento interno. |
| `job_id` | UUID | Relacionar ejecucion procesable. |
| `issue_id` | `ISSUE-YYYYMMDD-000001` o UUID | Escalacion operativa cuando aplique. |
| `trace_id` | UUID | Correlacion tecnica entre Web, Gateway, APIs y jobs. |
| `execution_id` | UUID | Medicion de recursos y costo operativo cuando aplique. |

Regla: el frontend puede generar o transportar `request_id`/`session_id`, pero
la escritura durable de eventos debe pasar por Gateway o API autorizada.

## Tipos de eventos

| Tipo | Eventos base |
|---|---|
| Operacion | `UPLOAD`, `DOWNLOAD`, `PROCESS`, `CONVERT`, `COMPRESS`, `MERGE`, `SPLIT`, `DELETE`, `RESTORE`, `PREVIEW` |
| Sistema | `SERVICE_START`, `SERVICE_STOP`, `SERVICE_RESTART`, `DATABASE_CONNECT`, `DATABASE_DISCONNECT`, `STORAGE_CONNECT`, `STORAGE_DISCONNECT` |
| Seguridad | `LOGIN`, `LOGOUT`, `PERMISSION_DENIED`, `TOKEN_EXPIRED`, `UNAUTHORIZED_DOWNLOAD` |
| Diagnostico | `WARNING`, `ERROR`, `CRITICAL`, `RETRY`, `FALLBACK`, `ENGINE_MISSING` |

## Niveles

| Nivel | Uso |
|---|---|
| `INFO` | Inicio, avance o evento esperado. |
| `SUCCESS` | Operacion finalizada correctamente. |
| `WARNING` | Riesgo o degradacion recuperable. |
| `ERROR` | Fallo de operacion sin caida total del sistema. |
| `CRITICAL` | Riesgo de indisponibilidad, perdida de datos o impacto global. |

## Etapas normalizadas

Toda herramienta debe reportar etapas compatibles con:

```text
RECEIVED
VALIDATING
PROCESSING
GENERATING
STORING
COMPLETED
FAILED
```

Para previews progresivos por pagina se reutilizan los estados definidos en
`api-contracts.md`: `pending`, `loading`, `ready` y `error`.

## Flujo minimo PDF

Ejemplo de trazabilidad para un PDF:

| Etapa | Evento | Nivel |
|---|---|---|
| Archivo recibido | `UPLOAD_RECEIVED` | `INFO` |
| Validacion iniciada | `PDF_VALIDATION_STARTED` | `INFO` |
| Archivo valido | `PDF_VALIDATED` | `SUCCESS` |
| Proceso solicitado | `PDF_PROCESS_REQUESTED` | `INFO` |
| Proceso iniciado | `PDF_PROCESS_STARTED` | `INFO` |
| Artefacto generado | `PDF_ARTIFACT_GENERATED` | `SUCCESS` |
| Artefacto almacenado | `PDF_ARTIFACT_STORED` | `SUCCESS` |
| Descarga solicitada | `PDF_DOWNLOAD_REQUESTED` | `INFO` |
| Descarga entregada | `PDF_DOWNLOAD_COMPLETED` | `SUCCESS` |

Si una pagina de preview falla, el documento no debe fallar completo salvo que
el motor no pueda identificar estructura minima del archivo.

## Tablas objetivo

Estado 2026-06-04: objetivo documentado. La implementacion puede iniciar en
Document API, DocuCore API o Gateway segun el ownership del evento, pero debe
mantener contrato comun.

### `docucore_logs`

| Campo | Regla |
|---|---|
| `id` | Identificador unico interno. |
| `request_id` | Obligatorio para solicitudes trazables. |
| `trace_id` | Obligatorio cuando cruza capas. |
| `session_id` | Recomendado para eventos web. |
| `project_id` | Requerido cuando exista proyecto documental. |
| `document_id` | Requerido cuando exista documento. |
| `job_id` | Requerido para procesamiento. |
| `service` | `WEB`, `GATEWAY`, `DOCUCORE_API`, `DOCUMENT_API`, `JOBCRON`, `STORAGE`. |
| `module` | Herramienta o modulo funcional. |
| `event_type` | Tipo normalizado. |
| `event_code` | Codigo estable. |
| `stage` | Etapa normalizada. |
| `level` | Nivel normalizado. |
| `status` | `STARTED`, `SUCCESS`, `FAILED`, `PARTIAL`, `CANCELLED`. |
| `duration_ms` | Duracion cuando aplique. |
| `metadata` | JSON sin contenido sensible. |
| `created_at` | Fecha de registro. |

### `docucore_errors`

| Campo | Regla |
|---|---|
| `id` | Identificador unico interno. |
| `request_id` | Relacion con solicitud. |
| `trace_id` | Correlacion tecnica. |
| `job_id` | Job afectado cuando aplique. |
| `error_code` | Codigo oficial. |
| `fingerprint` | Agrupacion de errores equivalentes. |
| `service` | Servicio donde se detecto. |
| `module` | Herramienta o motor afectado. |
| `stage` | Etapa donde fallo. |
| `priority` | `P0` a `P4`. |
| `user_message` | Mensaje seguro para UI. |
| `technical_message` | Mensaje tecnico interno. |
| `stack_trace_ref` | Referencia segura, no necesariamente texto completo. |
| `occurrences` | Conteo agregado. |
| `last_seen_at` | Ultima ocurrencia. |
| `issue_id` | Relacion si escalo a issue. |
| `resolved_at` | Fecha de cierre tecnico. |

## Fingerprint de errores

El `fingerprint` agrupa errores por:

```text
service + module + error_code + stage + normalized_message
```

No debe incluir nombre completo del archivo, texto del documento, rutas locales,
usuario visible, tokens ni datos personales.

## Codigos de error oficiales

### PDF

| Codigo | Uso |
|---|---|
| `PDF_READ_FAILED` | No se pudo abrir o leer el PDF. |
| `PDF_CORRUPTED` | PDF corrupto o estructura invalida. |
| `PDF_PASSWORD_PROTECTED` | PDF requiere contrasena. |
| `PDF_PREVIEW_FAILED` | Fallo al generar preview general. |
| `PDF_RENDER_FAILED` | Fallo al renderizar pagina o miniatura. |
| `PDF_SPLIT_FAILED` | Fallo al dividir paginas. |
| `PDF_MERGE_FAILED` | Fallo al unir PDFs. |
| `PDF_COMPRESS_FAILED` | Fallo al comprimir PDF. |
| `PDF_DOWNLOAD_FAILED` | Fallo al preparar o entregar descarga. |

### Carga y validacion

| Codigo | Uso |
|---|---|
| `EXTENSION_NOT_ALLOWED` | Extension desconocida o no soportada. |
| `FILE_TYPE_PLANNED` | Formato documentado para futuro, no activo. |
| `MIME_TYPE_NOT_ALLOWED` | MIME incompatible con extension activa. |
| `DANGEROUS_EXTENSION` | Extension ejecutable o riesgosa. |
| `MAX_SIZE_EXCEEDED` | Archivo supera limite permitido. |
| `EMPTY_FILE` | Archivo vacio. |

### Word

| Codigo | Uso |
|---|---|
| `WORD_READ_FAILED` | No se pudo abrir DOC/DOCX. |
| `WORD_CONVERSION_FAILED` | Fallo al convertir Word. |
| `WORD_PREVIEW_FAILED` | Fallo al generar preview. |

### Excel y CSV

| Codigo | Uso |
|---|---|
| `SPREADSHEET_READ_FAILED` | No se pudo leer hoja o CSV. |
| `SPREADSHEET_CONVERSION_FAILED` | Fallo de conversion. |
| `SPREADSHEET_PREVIEW_FAILED` | Fallo de preview tabular. |

### Imagen

| Codigo | Uso |
|---|---|
| `IMAGE_READ_FAILED` | No se pudo abrir imagen. |
| `IMAGE_CONVERSION_FAILED` | Fallo al convertir imagen. |
| `IMAGE_CLEAN_FAILED` | Fallo al normalizar o limpiar imagen. |
| `IMAGE_PREVIEW_FAILED` | Fallo al mostrar preview. |

### ZIP/XML

| Codigo | Uso |
|---|---|
| `ZIP_READ_FAILED` | No se pudo inspeccionar contenedor. |
| `ZIP_UNSUPPORTED_ENTRY` | Entrada no soportada o riesgosa. |
| `XML_READ_FAILED` | No se pudo leer XML. |
| `XML_PARSE_FAILED` | XML invalido o no parseable. |

### Motores futuros

OCR, IA documental e indexacion inteligente quedan documentados como alcance
futuro o bloqueado cuando no exista motor productivo habilitado. Sus errores no
deben mostrarse como herramienta disponible si la UI los tiene desactivados.

| Codigo | Uso futuro |
|---|---|
| `OCR_ENGINE_FAILED` | Motor OCR fallo. |
| `OCR_LANGUAGE_NOT_FOUND` | Idioma requerido no disponible. |
| `OCR_TIMEOUT` | OCR excedio tiempo limite. |
| `DOCUMENT_INDEX_FAILED` | Indice documental fallo. |
| `AI_ANALYSIS_FAILED` | Analisis inteligente fallo. |

## Prioridades

| Prioridad | Uso | Accion |
|---|---|---|
| `P0` | Caida total, perdida de datos o riesgo critico. | Crear issue inmediato y alertar. |
| `P1` | Herramienta central inutilizable. | Crear issue y revisar en prioridad alta. |
| `P2` | Fallo recurrente con workaround. | Agrupar, monitorear y planear correccion. |
| `P3` | Fallo aislado o de archivo del usuario. | Mostrar mensaje seguro y registrar. |
| `P4` | Ruido, warning o mejora. | Registrar para analisis. |

## Creacion automatica de issues

Crear issue operativo cuando se cumpla cualquiera:

- mismo `fingerprint` con 5 ocurrencias en 1 hora;
- 3 usuarios distintos afectados por el mismo error;
- error `CRITICAL`;
- error P0 o P1 sin issue abierto;
- job de limpieza fallido por 2 ejecuciones consecutivas.

No crear issue automaticamente cuando:

- el archivo del usuario esta corrupto;
- el archivo excede limites documentados;
- el usuario cancela el proceso;
- la herramienta esta bloqueada por feature gate;
- falta motor documentado como pendiente.

En esos casos se registra evento y, si aplica, se muestra orientacion segura.

## Diagnostico en UI

La vista objetivo es:

```text
Workspace -> Diagnostico
```

Campos minimos:

- `request_id`
- documento;
- herramienta;
- etapa;
- estado;
- `error_code`;
- descripcion segura;
- frecuencia;
- usuarios afectados;
- issue relacionado;
- fecha de ultima ocurrencia.

Vista usuario:

```text
No pudimos procesar este archivo en este momento.
Codigo: PDF_RENDER_FAILED
Puedes intentar de nuevo o reportar el codigo a soporte.
```

Vista admin:

- servicio;
- modulo;
- etapa;
- stack trace o referencia segura;
- payload tecnico filtrado;
- tiempo de respuesta;
- nodo/contenedor;
- version del build;
- `trace_id`, `request_id`, `job_id` y `execution_id`.

## Retencion

| Tipo | Retencion inicial |
|---|---|
| `INFO` | 15 dias. |
| `SUCCESS` | 15 dias. |
| `WARNING` | 30 dias. |
| `ERROR` | 90 dias. |
| `CRITICAL` | Hasta resolver y cerrar revision. |
| Issues cerrados | 180 dias o politica legal aplicable. |

## Limpieza programada

Job objetivo:

```text
job_cleanup_docucore_logs
```

Horario recomendado:

```text
02:00 AM
```

Responsabilidades:

- borrar o compactar logs vencidos;
- conservar agregados utiles;
- conservar errores con issue abierto;
- generar metricas de almacenamiento;
- reportar fallo de limpieza a JobCron.

## Metricas minimas

- procesos por herramienta;
- procesos completados, fallidos y parciales;
- duracion promedio por herramienta;
- paginas procesadas;
- MB de entrada y salida;
- tasa de fallo por herramienta;
- fallos por etapa;
- errores recurrentes;
- previews fallidos por pagina;
- descargas fallidas;
- almacenamiento usado por logs;
- ejecuciones de limpieza;
- herramientas bloqueadas vistas por usuarios.

## Integracion con JobCron

JobCron debe consumir o recibir:

- errores abiertos;
- issues abiertos;
- errores recurrentes;
- herramientas inestables;
- uso de almacenamiento de logs;
- estado de `job_cleanup_docucore_logs`;
- alertas criticas.

JobCron no debe procesar documentos ni reemplazar Document API; su rol aqui es
orquestar monitoreo, recordatorios, limpieza y seguimiento operativo.

## Regla final

Cada modulo nuevo de DocuCore debe:

1. generar o transportar `request_id`, `trace_id` y `execution_id` cuando
   aplique;
2. registrar eventos normalizados;
3. usar codigos oficiales de error;
4. reportar etapas normalizadas;
5. integrarse con diagnostico;
6. respetar retencion y limpieza;
7. emitir metricas sin contenido sensible.

Si una herramienta esta bloqueada, futura o sin motor productivo, se documenta
como pendiente y no debe crear ruido operativo ni prometerse como disponible.
