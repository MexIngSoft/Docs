Aquí tienes la instrucción completa para pegarla en Codex:

```text
OBJETIVO

Actualizar la documentación del repositorio:

https://github.com/MexIngSoft/Docs.git

para reflejar una arquitectura más estable y reutilizable donde:

1. Image API sea una API técnica compartida.
2. Document API sea una API documental/ETL que orquesta Image API.
3. DocuCore sea producto comercial y escaparate técnico, no el dueño global del OCR.
4. LeadHunter quede documentado como módulo interno de JobCron, no como producto independiente.
5. Se evite duplicar OCR, limpieza de imagen, previews y procesamiento visual en DocuCore, Fiscora, LexNova, Refapart u otros proyectos.

PRE-FLIGHT OBLIGATORIO

Antes de modificar archivos:

1. Leer:
   - README.md
   - _meta/active-work-index.md
   - agents/AGENT_GLOBAL_RULES.md
   - 03_standards/operations/standard-request-prompts.md
   - 03_standards/documentation-first-workflow.md

2. Leer únicamente el contexto necesario:
   - 01_core_erp/apis/00_api_index.md
   - 01_core_erp/apis/15_documents_api.md
   - 02_projects/docucore/mvp-roadmap.md
   - 02_projects/docucore/api-contracts.md
   - 02_projects/docucore/document-intelligence.md
   - 02_projects/_ecosystem/05_lexnova_docucore_fiscora_mvp_alignment.md
   - 02_projects/_ecosystem/api-version-matrix.md
   - 03_standards/product/module-catalog.md

3. No leer todo el repositorio salvo que sea indispensable.
4. No duplicar documentación existente.
5. No inventar APIs como activas si no tienen contrato, persistencia, compose y pruebas.
6. Si una capacidad aún no existe, marcarla como PENDIENTE_DE_DEFINIR, PLANNED o DOCUMENTADO, según corresponda.

CAMBIO ARQUITECTÓNICO CANÓNICO

Establecer esta separación:

API.PY.Image

Responsabilidad:
- Procesamiento visual.
- Normalización de imágenes.
- OCR visual.
- Corrección de perspectiva.
- Rotación.
- Deskew.
- Limpieza.
- Contraste.
- Recorte.
- Conversión de formatos.
- Generación de previews visuales.
- Extracción OCR TXT/JSON/HOCR cuando exista motor real.

No debe decidir:
- Si el documento es factura, contrato, ticket, evidencia, expediente o CFDI.
- Clasificación de negocio.
- Reglas jurídicas, fiscales, comerciales o contables.
- Relación con clientes, ventas, casos, proyectos o facturas.

API.PY.Document

Responsabilidad:
- Metadatos documentales.
- Storage privado.
- Versiones.
- Relación con contextos.
- Procesamiento documental.
- Clasificación documental.
- Segmentación.
- Índices.
- ETL documental.
- Orquestación de Image API cuando el archivo requiera OCR, limpieza, preview visual o procesamiento de imagen.

No debe implementar motores propios de OCR/imagen.
Debe consumir Image API para todo procesamiento visual.

DocuCore

Responsabilidad:
- Producto comercial.
- Workspace.
- Catálogo de herramientas.
- UX de conversión documental.
- Jobs.
- Historial.
- Descargas.
- Créditos.
- Límites.
- Planes.
- Escaparate técnico de ETL documental de MexIngSof.

No debe ser la fuente técnica global del OCR.
No debe contener lógica visual duplicada que corresponda a Image API.

ARQUITECTURA OBJETIVO

Documentar el flujo así:

Frontend / App
→ Gateway
→ API de producto
→ Document API
→ Image API
→ Motor OCR / limpieza / rotación / deskew / previews

Ejemplos:

DocuCore
→ Document API
→ Image API

Fiscora
→ Document API
→ Image API

LexNova
→ Document API
→ Image API

Refapart, cuando procese fotos:
→ Image API directamente si es análisis visual de refacción
o
→ Document API → Image API si la foto representa un documento.

ARCHIVOS A CREAR

1. Crear:

01_core_erp/apis/17_image_api.md

Contenido mínimo:

# Image API

## Objetivo
Centralizar el procesamiento visual reutilizable para todo el ecosistema MexIngSof/JobCron, evitando que DocuCore, Document API, Fiscora, LexNova, Refapart u otros proyectos mantengan motores propios de OCR, limpieza o preview.

## Responsabilidades
- Validar imágenes.
- Normalizar formatos visuales.
- Convertir JPG, PNG, WEBP, TIFF, HEIC cuando aplique.
- Limpiar imágenes.
- Corregir orientación.
- Rotar.
- Deskew.
- Corregir perspectiva.
- Recortar documento.
- Generar previews.
- Generar thumbnails.
- Ejecutar OCR visual.
- Entregar texto plano, JSON estructurado y formatos OCR avanzados cuando existan motores productivos.
- Emitir métricas técnicas de ejecución hacia Execution Resource Manager cuando aplique.

## Fuera de alcance
- Clasificación documental de negocio.
- Reglas fiscales.
- Reglas jurídicas.
- Reglas comerciales.
- Relación con clientes, casos, ventas o facturas.
- Decisiones finales de negocio.
- Storage documental definitivo.

## Consumidores
- Document API.
- DocuCore.
- Fiscora.
- LexNova.
- Refapart cuando procese fotos no documentales.
- Otros proyectos que requieran procesamiento visual.

## Endpoints objetivo

POST /api/image/validate
POST /api/image/normalize
POST /api/image/clean
POST /api/image/rotate
POST /api/image/deskew
POST /api/image/crop-document
POST /api/image/convert
POST /api/image/preview
POST /api/image/thumbnail
POST /api/image/ocr
GET /api/image/jobs/{job_id}

## Estados

PENDING
PROCESSING
COMPLETED
FAILED
CANCELLED
PARTIAL_COMPLETED

## Contrato base de respuesta

{
  "job_id": "uuid",
  "source_file_id": "uuid",
  "status": "COMPLETED",
  "operation": "ocr",
  "artifacts": [],
  "metadata": {
    "width": 0,
    "height": 0,
    "mime_type": "image/webp",
    "orientation": "portrait",
    "pages": 1
  },
  "ocr": {
    "text": "",
    "confidence": null,
    "blocks": []
  },
  "errors": []
}

## Reglas
- Image API no debe conocer reglas de negocio.
- Image API no debe decidir tipos documentales.
- Image API no debe reemplazar Document API.
- Image API puede trabajar de forma síncrona en MVP, pero debe dejar contrato preparado para jobs asíncronos.
- Ninguna herramienta visual debe publicarse como enabled si devuelve mock, placeholder o queued-for-engine.
- Si el motor real no existe, documentar como PLANNED.

ARCHIVOS A MODIFICAR

1. Modificar:

01_core_erp/apis/00_api_index.md

Agregar Image API en APIs compartidas.

Debe quedar con estado prudente:
- Si no existe implementación ejecutable: DOCUMENTADA o PENDIENTE_DE_DEFINIR.
- Si ya existe repositorio, contrato, compose, migraciones y pruebas: ACTIVA.

Responsabilidad sugerida:
"Procesamiento visual compartido: OCR visual, limpieza, normalización, conversión, previews y thumbnails."

No marcar como producto.

2. Modificar:

01_core_erp/apis/15_documents_api.md

Reemplazar la frase actual:

"Procesar OCR, extraccion de texto, clasificacion, segmentacion e indice documental cuando el proyecto consumidor lo solicite."

Por una separación más clara:

- Orquestar OCR y procesamiento visual mediante Image API cuando el archivo lo requiera.
- Conservar extracción documental, clasificación, segmentación e índice documental.
- No implementar motores propios de OCR, limpieza de imagen, deskew, rotación, recorte o previews visuales.
- La decisión de negocio sigue perteneciendo al módulo consumidor.

Agregar sección:

## Dependencia con Image API

Document API debe consumir Image API para:
- OCR de imágenes.
- OCR de PDFs escaneados.
- Previews visuales.
- Thumbnails.
- Limpieza visual.
- Rotación.
- Deskew.
- Corrección de perspectiva.
- Normalización de imagen.

3. Modificar:

02_projects/docucore/mvp-roadmap.md

Cambiar el entendimiento de OCR, image-clean, image-pdf, previews y herramientas visuales.

Debe quedar:

- DocuCore conserva el catálogo y experiencia del usuario.
- Las capacidades visuales deben ejecutarse por Image API.
- Document API conserva storage, documentos, artefactos, jobs documentales y relación con contextos.
- DocuCore API conserva catálogo, planes, límites, configuración comercial y experiencia de producto.

Actualizar herramientas:

- image-clean → herramienta DocuCore visible, ejecutada por Image API.
- ocr-image → herramienta DocuCore visible, ejecutada por Image API.
- image-pdf → puede usar Image API para normalización visual y Document API para artefacto documental.
- preview image/pdf → Gateway/Document API orquesta, Image API genera representación visual.

Actualizar orden de desarrollo:

1. Crear contrato Image API.
2. Ajustar Document API para orquestar Image API.
3. Migrar herramientas visuales de DocuCore a consumo de Image API.
4. Mantener DocuCore como UX/producto.
5. Después completar OCR productivo.

4. Modificar:

02_projects/docucore/api-contracts.md

Actualizar secciones:

- Preview
- Preview progresivo por página
- Document Intelligence
- Process

Regla nueva:

Todo endpoint de Gateway puede mantenerse igual para el frontend, pero internamente debe enrutar así:

Frontend
→ Gateway
→ DocuCore API / Document API
→ Image API cuando aplique.

No romper contratos frontend salvo que sea necesario.

Agregar nota:

Los endpoints públicos de DocuCore/Gateway no exponen directamente Image API al usuario final en MVP. Image API es una dependencia interna compartida.

Modificar Document Intelligence:

- POST /api/gateway/process/ocr/
- POST /api/gateway/process/ocr-image/

deben documentarse como operaciones orquestadas por Document API y ejecutadas visualmente por Image API.

5. Modificar:

02_projects/docucore/document-intelligence.md

Agregar que Document Intelligence no es el motor OCR.

Debe quedar:

- OCR visual pertenece a Image API.
- Clasificación, segmentación, índice y estructura documental pertenecen a Document Intelligence/Document API.
- DocuCore expone estas capacidades como producto.
- LexNova y Fiscora consumen resultado documental, no clases internas de DocuCore.

6. Modificar:

02_projects/_ecosystem/05_lexnova_docucore_fiscora_mvp_alignment.md

Actualizar alineación:

Antes:
- DocuCore/Document API concentran OCR/storage/colas.

Después:
- Image API concentra OCR visual y procesamiento de imagen.
- Document API concentra storage, metadatos, documentos, índices y ETL documental.
- DocuCore ofrece producto y workspace.
- LexNova consume documentos e índices.
- Fiscora consume documentos fiscales, XML, PDF y extracción estructurada.

Agregar regla:
Ningún producto debe implementar OCR propio si Image API puede resolverlo.

7. Modificar:

02_projects/_ecosystem/api-version-matrix.md

Agregar Image API como dependencia de:

- DocuCore
- Document API
- Fiscora
- LexNova
- Refapart, solo para fotos no documentales o análisis visual futuro
- Imagrafity, si usa procesamiento visual
- JobCron, solo como API compartida técnica

Estado sugerido:
- Image API v0.1 DOCUMENTADA/PENDIENTE_DE_IMPLEMENTAR
- Document API debe declarar dependencia opcional/obligatoria según flujo.

8. Modificar:

03_standards/product/module-catalog.md

Corregir LeadHunter.

Reemplazar:

LeadHunter Prospecting | Independent Product Module | 02_projects/leadhunter | Activo

Por:

LeadHunter Prospecting | Internal JobCron Module | 02_projects/jobcron o ruta documental real de JobCron | Activo interno

Agregar regla:
LeadHunter no se libera como producto independiente salvo ADR posterior. Su función inicial es prospección interna, enriquecimiento comercial y captación para MexIngSof, Refapart, POS, Fiscora y otros productos.

Agregar Image Processing / Image API al catálogo como:

Image Processing | Shared Technical API | 01_core_erp/apis/17_image_api.md | Documentado/Pendiente

9. Crear ADR

Crear archivo en la ruta estándar de ADR si existe. Si no existe, crear en:

03_standards/architecture/adr/ADR-YYYYMMDD-image-api-document-api-separation.md

Usar fecha real del sistema.

Contenido:

# ADR: Separación de Image API y Document API

## Estado
Aceptado / Documentado

## Contexto
Los documentos del ecosistema pueden llegar como PDF digital, PDF escaneado, foto, imagen, XML, Word, Excel, CSV o ZIP. Si cada producto implementa OCR y limpieza visual, se duplican motores y se incrementa el costo de mantenimiento.

## Decisión
Crear Image API como API técnica compartida para procesamiento visual y mantener Document API como orquestador documental/ETL.

## Consecuencias positivas
- Menos duplicación.
- OCR centralizado.
- Cambio de motor OCR sin reescribir productos.
- Mejor escalabilidad.
- DocuCore puede vender ETL documental sin acoplarse al motor visual.
- LexNova, Fiscora y Refapart pueden reutilizar capacidades.

## Consecuencias negativas
- Una API adicional que versionar.
- Más coordinación entre Gateway, Document API e Image API.
- Necesidad de contratos claros para jobs y artefactos.

## Reglas
- OCR visual vive en Image API.
- Clasificación documental vive en Document API.
- Decisión de negocio vive en el producto consumidor.
- DocuCore es producto, no motor global.
- No duplicar OCR por proyecto.

VALIDACIONES OBLIGATORIAS

Después de modificar:

1. Buscar menciones de:
   - OCR
   - image-clean
   - ocr-image
   - preview image
   - Document Intelligence
   - LeadHunter
   - Independent Product Module

2. Confirmar que no quede documentación diciendo que:
   - DocuCore es dueño global del OCR.
   - Document API implementa directamente motores visuales.
   - LeadHunter es producto independiente.
   - Cada proyecto puede tener su propio OCR.

3. Confirmar que:
   - Image API aparece en índice de APIs.
   - Document API declara dependencia de Image API.
   - DocuCore queda como producto comercial/UX.
   - Fiscora y LexNova quedan como consumidores de Document API.
   - Refapart solo consume Image API directamente cuando el input sea foto no documental.

4. Mantener compatibilidad con Gateway:
   - No cambiar endpoints públicos del frontend salvo que esté justificado.
   - Si se propone cambio de endpoint, documentarlo como breaking change pendiente, no aplicarlo silenciosamente.

5. No marcar herramientas como enabled si no hay motor real.
6. No crear documentación duplicada.
7. No borrar historial ni decisiones previas; reemplazar con nota de superseded cuando aplique.

ENTREGABLES

Al terminar, entregar:

1. Lista de archivos modificados.
2. Lista de archivos creados.
3. Resumen de decisiones.
4. Riesgos pendientes.
5. Checklist de validación.
6. Git status limpio o explicación de pendientes.
7. Commit sugerido:

docs: define Image API and separate visual processing from Document API

CRITERIO DE ÉXITO

La documentación debe dejar claro que:

- Image API procesa imágenes.
- Document API procesa documentos y orquesta Image API.
- DocuCore vende experiencia documental y ETL.
- Fiscora, LexNova y otros productos consumen capacidades compartidas.
- LeadHunter es módulo interno de JobCron.
- No habrá OCR duplicado por proyecto.
```

Esto deja a Codex con una ruta bastante cerrada y evita que mezcle otra vez **DocuCore**, **Document API** e **Image API** como si fueran lo mismo.
