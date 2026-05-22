# LexNova Document Intelligence

## Estado

ACTIVE

## Objetivo

Definir la regla oficial para OCR, extraccion, clasificacion, segmentacion e
indice documental en LexNova sin cargar al usuario con decisiones tecnicas.

## Decision

LexNova no debe pedir al usuario final que seleccione manualmente el tipo de
documento al subir evidencia. El usuario solo elige el origen del archivo:

- Equipo local.
- Camara.
- Escaner.
- Google Drive.
- Dropbox.
- Mega.
- OneDrive.
- URL externa.
- Otro origen futuro.

Despues de la carga, el sistema conserva el archivo original y envia el trabajo
a una API documental reutilizable para detectar texto, ejecutar OCR cuando sea
necesario, clasificar documentos, segmentar secciones y generar un indice.

La IA propone. Un perfil humano autorizado valida o corrige.

## Ubicacion arquitectonica

La IA documental no vive en el frontend.

La responsabilidad reusable pertenece a la API documental del ecosistema:

```text
API.PY.DJANGO.Document
  -> OCR
  -> extraccion de texto
  -> clasificacion documental
  -> segmentacion
  -> indice JSON
  -> PDF indexado opcional
```

LexNova consume esta capacidad por su gateway:

```text
WEB.NJ.NEXT.LexNova
  -> API.PY.DJANGO.LexNova.Gateway
  -> API.PY.DJANGO.LexNova
  -> API.PY.DJANGO.Document
```

El frontend nunca debe hablar directo con `API.PY.DJANGO.Document`.

## Flujo

```text
Usuario selecciona origen
        |
        v
LexNova Web
        |
        v
LexNova Gateway
        |
        v
LexNova API guarda relacion con caso y asset original
        |
        v
Document API procesa OCR, texto, clasificacion y secciones
        |
        v
LexNova recibe indice JSON y resultados estructurados
        |
        v
Perfil autorizado revisa y corrige
        |
        v
El indice y el resultado quedan visibles dentro del caso
```

## Responsabilidades

| Capa | Responsabilidad |
|---|---|
| LexNova Web | Seleccionar origen, cargar archivo, mostrar seguimiento, indice y revision. |
| LexNova Gateway | Validar sesion, permisos y normalizar respuestas para la web. |
| LexNova API | Relacionar archivo con caso, expediente, procedimiento, participantes, seguimiento y revision humana. |
| Document API | Guardar/procesar archivo reusable: OCR, texto, clasificacion, segmentacion, indice y PDF indexado opcional. |
| Auth | Identidad, perfiles, permisos y auditoria de acceso. |

## Modelo de relacion preparado

La carga documental no obliga al usuario a elegir un procedimiento. LexNova
puede crear o actualizar un `DigitalAsset` con:

- origen (`Source`, `ExternalProvider`, `ExternalUri`),
- referencia al archivo procesado por DocuCore (`DocumentApiFileId`),
- referencia al indice generado (`DocumentApiIndexId`),
- estado y payload de procesamiento.

Despues de que Document API proponga clasificacion, secciones y relaciones,
LexNova puede guardar:

- `EvidenceUsages` para indicar como se usa la evidencia en un caso,
  procedimiento o entidad externa.
- `LegalDocumentRelations` para relaciones entre documentos.
- `LegalGraphRelations` para el mapa juridico relacional general.
- `LegalCaseExternalIdentifiers` para NUC, toca, amparo, apelacion y otros
  numeros externos relacionados al expediente interno.

Todas las relaciones propuestas por IA deben conservar confianza, naturaleza de
relacion y estado de revision humana.

## Estados recomendados

```text
UPLOADED
PENDING_CLASSIFICATION
TEXT_EXTRACTION
OCR_REQUIRED
OCR_PROCESSING
SEGMENTATION
INDEX_GENERATED
NEEDS_HUMAN_REVIEW
HUMAN_REVIEWED
READY_FOR_CASE_REVIEW
FAILED
```

Estos estados pueden mapearse a los estados existentes de `DigitalAssets`,
`LegalDocumentVersions`, `DocumentClassificationHistory`, `AIAnalysisResults`,
`HumanReviews` y `TimelineEvents`.

## Salida JSON esperada

La API documental debe devolver resultados estructurados y trazables. Ejemplo:

```json
{
  "document_type": "INVESTIGATION_FOLDER",
  "page_start": 1,
  "page_end": 12,
  "authority": "Ministerio Publico",
  "date": "2020-04-27",
  "folio": "12-2020-05085",
  "summary": "Registro inicial de carpeta de investigacion",
  "confidence": 0.92,
  "sections": [
    {
      "title": "Comparecencia inicial",
      "page_start": 1,
      "page_end": 4
    }
  ]
}
```

Si la confianza es baja o no hay tipo claro, la clasificacion debe quedar como:

```text
UNKNOWN
```

## Indice documental

LexNova debe soportar dos salidas:

1. Indice web dentro del caso para navegar, filtrar, corregir y relacionar
   documentos.
2. PDF con indice agregado como exportable futuro: portada, indice y archivo
   original o secciones separadas.

Prioridad:

```text
1. Indice web.
2. PDF indexado exportable.
```

## Perfiles autorizados

El modulo de clasificacion documental solo debe estar disponible para perfiles
internos:

- Administrador.
- Analista juridico.
- Abogado.
- Revisor juridico.
- Personal documental.

El cliente puede cargar evidencia y consultar seguimiento visible, pero no debe
ver complejidad tecnica ni bandejas internas de clasificacion.

## Pantallas requeridas

### Carga documental

Pantalla simple para usuario final:

- Origen del archivo.
- Selector o conexion con proveedor.
- Estado de carga.
- Estado de procesamiento.
- Opcion de corregir origen si se equivoco.

### Pendientes de clasificacion

Pantalla interna:

- Archivo subido.
- Caso o expediente relacionado.
- Estado OCR/texto.
- Tipo detectado.
- Nivel de confianza.
- Accion de revisar.

### Revision documental

Pantalla interna:

- Tipo de documento.
- Hoja inicio/fin.
- Seccion.
- Procedimiento relacionado.
- Partes involucradas.
- Fecha.
- Autoridad.
- Resumen.
- Relaciones con otros documentos.

## Pendientes

- Definir contrato final entre `API.PY.DJANGO.LexNova` y
  `API.PY.DJANGO.Document`.
- Definir proveedor inicial de OCR. Recomendacion MVP: Tesseract controlado,
  con posible migracion futura a Azure AI Document Intelligence, Google
  Document AI o AWS Textract.
- Definir storage productivo, retencion, cifrado, hash y cadena de custodia.
- Definir colas asincronas y politica de reintentos para procesamiento pesado.
