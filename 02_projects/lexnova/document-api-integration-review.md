# Revision de integracion LexNova + Document API

## Estado

ACTIVE

## Objetivo

Verificar la relacion real entre LexNova, DocuCore y `API.PY.DJANGO.Document`
para carga documental, OCR, clasificacion, identificacion por secciones,
indice documental y revision humana.

## Resultado ejecutivo

La integracion base existe y es funcional en modo MVP:

```text
WEB.NJ.NEXT.LexNova
  -> API.PY.DJANGO.LexNova.Gateway
  -> API.PY.DJANGO.Document
```

La ruta de producto documentada tambien exige que LexNova conserve la relacion
de negocio con casos y assets:

```text
WEB.NJ.NEXT.LexNova
  -> API.PY.DJANGO.LexNova.Gateway
  -> API.PY.DJANGO.LexNova
  -> API.PY.DJANGO.Document
```

El primer tramo ya esta conectado para upload, procesamiento e indice. El tramo
de orquestacion de dominio en `API.PY.DJANGO.LexNova` queda parcial: el modelo
`DigitalAsset` ya tiene campos para `DocumentApiFileId`, `DocumentApiIndexId`,
estado y payload de procesamiento, pero no existe todavia un endpoint de
escritura que cree o actualice el asset durante la carga documental web.

Conclusion:

```text
Estado MVP: conectado.
Estado productivo: incompleto.
```

## Evidencia de implementacion

| Componente | Evidencia | Estado |
|---|---|---|
| LexNova Web | `app/dashboard/modules/cases/upload/page.tsx` llama a `/document-intelligence/files/upload/` y despues a `/document-intelligence/process/document-index/`. | Implementado MVP |
| LexNova Gateway | `gateway/urls.py` expone `document-intelligence/*` y `gateway/views.py` reenvia a `DOCUMENT_API_BASE_URL`. | Implementado MVP |
| Document API upload | `files/views.py` guarda original, hash, origen, contexto y metadata. | Implementado MVP |
| Document API jobs | `jobs/views.py` crea job, ejecuta `run_tool`, persiste resultados, artefactos, indices y secciones. | Implementado MVP |
| OCR | `common/processing.py` ejecuta Tesseract si esta disponible y produce artefacto TXT; si falla, deja JSON de requerimiento/fallo. | Parcial |
| Identificacion por secciones | `document-index` y `document-segmentation` generan `DocumentSection` y `DocumentIndex`. | Parcial |
| Revision humana | `POST /api/process/reviews/` crea correcciones y puede aprobar, corregir o rechazar secciones. | Implementado en API documental |
| LexNova API dominio | `DigitalAsset` tiene campos de integracion, pero `legal_workspace/views.py` solo lista documentos. | Pendiente de cierre |

## Cierre MVP autorizado por agent

El agent transversal deja como implementacion inmediata el cierre minimo del
enlace documental LexNova:

```http
POST /api/lexnova/legal-workspace/documents/intake/
```

Ese endpoint debe recibir los metadatos devueltos por Document API y crear o
actualizar un `DigitalAsset` con `DocumentApiFileId`, `DocumentApiIndexId`,
`ProcessingState`, `ProcessingPayload`, hash, nombre, tamano, origen y tipo
detectado. Si se envia `legal_case_id`, tambien debe preparar una politica de
acceso del caso.

## Flujo OCR verificado

El flujo existe en Document API:

```text
Upload
  -> DocumentFile
  -> POST /api/process/ocr-image/ o /api/process/ocr-pdf/
  -> FileProcessingJob
  -> pytesseract si esta disponible
  -> DocumentProcessingArtifact
  -> FileProcessingResult
```

En LexNova Web el flujo visible actual no llama OCR directo. Llama a
`document-index`, que clasifica y genera indice por reglas MVP. OCR debe quedar
como paso automatico del pipeline cuando el texto embebido no sea legible, pero
esa orquestacion automatica todavia no esta cerrada.

## Flujo de conversacion y revision del documento

Existe un flujo tecnico de revision humana en Document API:

```text
GET /api/files/{file_id}/index/
POST /api/process/reviews/
```

Permite aprobar, corregir, rechazar, separar o unir propuestas. Sin embargo,
LexNova todavia no tiene una pantalla interna completa de conversacion/revision
legal que lea el indice, muestre secciones, reciba correcciones y escriba el
resultado final en `DigitalAsset`, `LegalProceedingContents`,
`LegalDocumentRelations`, `AIAnalysisResults` o `HumanReviews`.

Por tanto, la conversacion documental existe como contrato API base, no como
flujo legal completo dentro de LexNova.

## Identificacion de documentos por secciones

La identificacion por secciones existe como estructura persistente:

- `Document.DocumentSections`
- `Document.DocumentIndexes`
- `Document.HumanReviewCorrections`

La deteccion actual es MVP por reglas. `build_sections()` genera una seccion
principal por archivo y asigna rango de paginas completo. No hay deteccion real
de documentos mezclados, cortes por pagina, encabezados, oficios, actuaciones o
secciones internas complejas.

Para marcar este desarrollo como completo se requiere:

1. Detectar multiples secciones/documentos internos por contenido y pagina.
2. Ejecutar OCR automatico cuando no exista texto embebido.
3. Guardar confianza, razon de corte y propuesta de tipo por seccion.
4. Permitir correccion humana desde LexNova.
5. Reflejar la correccion en el expediente y en el seguimiento del caso.

## Pendientes para cierre productivo

| Pendiente | Proyecto responsable | Motivo |
|---|---|---|
| Endpoint de LexNova API para crear/actualizar `DigitalAsset` desde una carga documental. | LexNova API | Sin esto no queda relacion productiva entre archivo procesado y caso. |
| Guardar `DocumentApiFileId`, `DocumentApiIndexId`, `ProcessingState` y `ProcessingPayload` despues del procesamiento. | LexNova API | El modelo existe, falta escritura. |
| Asociar carga a `LegalCase`, `LegalProceeding` y politicas de acceso. | LexNova API | La privacidad y trazabilidad son de dominio legal. |
| Pantalla interna de revision documental por secciones. | LexNova Web + Gateway + API | La API documental ya tiene contrato, falta experiencia legal. |
| Orquestacion automatica OCR -> extraccion -> clasificacion -> segmentacion -> indice. | Document API + Gateway consumidor | Ahora son tools invocables, no pipeline asincrono completo. |
| Worker asincrono, reintentos y logs operacionales. | Document API / infraestructura | El procesamiento actual es sincrono MVP. |
| OCR productivo controlado. | Document API | Tesseract es opcional y falla con artefacto JSON si no esta disponible. |
| Deteccion real multi-seccion. | Document API | El algoritmo actual crea una seccion principal por archivo. |
| Cadena de custodia, storage productivo, cifrado y retencion. | LexNova + Document API | Requisito legal documentado, pendiente de definicion. |

## Decisiones tomadas

- No marcar el desarrollo como completo para produccion.
- Mantener Document API como capacidad reusable; LexNova no debe acoplarse a
  clases internas de DocuCore.
- Mantener LexNova Web consumiendo solo su Gateway.
- Tratar la salida de Document API como propuesta tecnica sujeta a revision
  humana.
- Mantener la relacion legal, permisos, seguimiento, expediente y resultado
  dentro de LexNova API.
- Documentar el estado como `MVP conectado / productivo incompleto` para guiar
  el siguiente desarrollo.

## Documentos base

- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/lexnova/process-tracking.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/01_core_erp/apis/15_documents_api.md`
