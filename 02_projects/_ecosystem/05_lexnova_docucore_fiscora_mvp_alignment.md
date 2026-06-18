# Alineacion MVP LexNova, DocuCore y Fiscora

## Estado

ACTIVE

## Objetivo

Convertir las instrucciones vigentes de `Docs/agents/AGENTS-000.md` en una
referencia canonica transversal, sin perder decisiones ya documentadas y sin
duplicar los documentos propios de LexNova, DocuCore o Fiscora.

## Principio

Las tres plataformas deben crecer como productos separados, pero compartir
capacidades comunes:

```text
LexNova = gestion juridica
DocuCore = procesamiento documental
Fiscora = gestion fiscal CFDI
```

Capacidades compartidas:

- autenticacion;
- auditoria;
- OCR;
- storage;
- colas;
- permisos;
- observabilidad;
- IA futura;
- Gateway General;
- contratos API versionados.

## LexNova MVP

LexNova debe cerrar primero un flujo legal operativo estable:

```text
Caso
  -> carga documental
  -> OCR / extraccion
  -> clasificacion automatica
  -> indexacion
  -> relaciones documentales
  -> revision humana
  -> observaciones / analisis
  -> resultado juridico
  -> seguimiento procesal
```

### Entidades minimas

| Area | Requisito MVP |
|---|---|
| Casos | Crear expediente, cambiar estado, asignar responsables, participantes, documentos, timeline, notas, eventos, analisis y auditoria. |
| Documentos | PDF, imagenes, Word, ZIP, audio, video, oficios escaneados y evidencias. |
| Participantes | Separar persona fisica, moral, autoridad, defensor, asesor, imputado, victima, testigo, perito, ministerio publico, juez, magistrado, custodio y terceros. |
| Analisis | Manual, IA, mixto, cronologico, contradicciones, relacional, probatorio y riesgo. |

### Capacidades documentales

| Capacidad | Estado MVP |
|---|---|
| OCR | Requerido |
| Clasificacion automatica | Requerido |
| Relacion documental | Requerido |
| Versionado | Requerido |
| Vista previa | Requerido |
| Descarga controlada | Requerido |
| Hash de integridad | Requerido |
| Cadena de custodia | Parcial MVP |
| Redaccion sensible | Futuro cercano |

### Permisos y visibilidad

Los permisos deben separarse por:

- perfil;
- tipo de documento;
- accion permitida.

Acciones base:

```text
VIEW
DOWNLOAD
UPLOAD
EDIT
DELETE
SHARE
ANALYZE
APPROVE
EXPORT
```

El cliente puede ver estado general, documentos autorizados, linea de tiempo
simple, proximos eventos, mensajes, notificaciones, avances y resoluciones
autorizadas.

El cliente no debe ver notas internas, estrategias, borradores, analisis
preliminares, contradicciones internas, riesgos, evaluaciones probatorias ni
documentos no validados.

### Materias iniciales

Fase 1:

- Penal.
- Familiar.
- Amparo.

Fase 2:

- Civil.
- Mercantil.
- Administrativo.

La IA juridica compleja, predicciones, jurisprudencia inteligente y
automatizacion masiva quedan fuera del primer MVP.

## DocuCore MVP

DocuCore debe mantenerse como capacidad documental reusable y no como sistema de
usuarios finales. Debe vivir detras de productos como LexNova, Fiscora y sus
gateways.

### Prioridades

Prioridad alta:

- OCR.
- PDF searchable.
- Batch upload.
- Metadata.
- Rotate.

Prioridad media:

- Resize.
- Convert.
- Watermark.

### OCR inicial

El MVP debe usar Tesseract local controlado cuando este disponible, por costo,
privacidad y control operativo. La evolucion futura puede incluir Azure Document
Intelligence, Google Vision o AWS Textract.

### Aislamiento recomendado

```text
API
  -> cola
  -> worker aislado
  -> procesamiento
```

Mientras no existan workers aislados y motores productivos, las herramientas
deben publicarse solo cuando tengan procesador real o quedar como pendientes.

## Fiscora MVP

Fiscora debe iniciar con carga manual de XML CFDI y no con descarga SAT directa
como dependencia critica.

Razones:

- CAPTCHA y cambios frecuentes del SAT;
- riesgo de bloqueo;
- credenciales sensibles;
- complejidad legal y operativa.

### Cliente prioritario

MVP:

```text
PyME + contador pequeno
```

### Plan gratis recomendado

| Recurso | Limite |
|---|---|
| CFDI | 100 |
| Empresas | 1 |
| PDFs | 50 |
| Storage | 500 MB |
| Reportes | Basicos |

### Creditos

Pueden consumir creditos:

- OCR;
- PDF visual;
- IA;
- reportes;
- descarga SAT;
- exportaciones.

### CFDI y complementos

Versiones MVP:

- CFDI 4.0.
- CFDI 3.3.
- CFDI 2.0 como compatibilidad intermedia.

Complementos:

- Pagos: alta prioridad.
- Nomina: prioridad media.
- Carta Porte: prioridad baja.
- Comercio Exterior: prioridad baja.

### Retencion recomendada

| Tipo | Tiempo |
|---|---|
| XML | 5 anos |
| PDF | 5 anos |
| Logs | 1 ano |
| OCR temporal | 30 dias |

## Decision de implementacion inmediata

La instruccion del agent confirma como prioridad cerrar el enlace documental de
LexNova. El cambio inmediato de codigo debe ser acotado:

1. LexNova Web sube y procesa el archivo por Document API mediante LexNova
   Gateway.
2. LexNova Web informa a LexNova API, tambien por Gateway, el `file_id`, el
   `index_id`, metadatos y payload de procesamiento.
3. LexNova API crea o actualiza `DigitalAsset` con:
   - `DocumentApiFileId`;
   - `DocumentApiIndexId`;
   - `ProcessingState`;
   - `ProcessingPayload`;
   - hash, nombre, tipo, tamano, origen y tipo detectado;
   - politica de acceso si se informa `legal_case_id`.

Este cierre no reemplaza la revision humana, no implementa IA juridica avanzada
y no cambia el contrato de DocuCore o Fiscora.

## Documentos canonicos relacionados

- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/lexnova/document-api-integration-review.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/fiscora/tasks/00_mvp_scope.md`
- `Docs/02_projects/fiscora/tasks/01_pending_tasks.md`
- `Docs/02_projects/_ecosystem/04_process_convergence_and_conflicts.md`
