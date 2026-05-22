# DocuCore Document Intelligence

## Estado

ACTIVE

## Objetivo

Definir la capacidad generica de Document Intelligence para recibir archivos,
extraer contenido, detectar estructura, segmentar documentos mezclados, crear
indices y permitir revision humana.

Esta capacidad no pertenece solo a LexNova. LexNova usa el perfil legal, pero
otros proyectos pueden usar perfiles fiscales, tecnicos, escolares,
administrativos, medicos, recetas u otros perfiles futuros.

## Entradas soportadas

- PDF completo.
- PDF escaneado.
- Imagenes y fotografias.
- Fotos de libretas.
- Word.
- Texto plano.
- XML.
- Audios transcritos o por transcribir.
- Videos con transcripcion.
- Carpetas comprimidas.
- Archivos mezclados con varios documentos internos.

## Capacidades

1. Guardar original sin alteraciones.
2. Registrar nombre original, formato, fecha, usuario, origen y contexto.
3. Detectar texto embebido.
4. Ejecutar OCR si no hay texto legible.
5. Transcribir audio/video cuando exista motor disponible.
6. Detectar perfil documental probable.
7. Clasificar documentos internos.
8. Detectar pagina de inicio y fin por seccion.
9. Generar indice JSON navegable.
10. Permitir revision humana.
11. Guardar correcciones para mejorar clasificaciones futuras.
12. Generar PDF indexado opcional.

## Perfiles MVP

| Perfil | Ejemplos |
|---|---|
| `legal` | Carpeta de investigacion, amparo, sentencia, audiencia, oficio, acuerdo, cadena de custodia. |
| `fiscal` | CFDI, XML, factura, constancia fiscal, declaracion, acuse, opinion de cumplimiento. |
| `technical` | Manual, instalacion, configuracion, advertencias, diagramas, especificaciones. |
| `recipes` | Receta, ingredientes, procedimiento, tiempo de coccion, porciones, notas. |
| `unknown` | Contenido no reconocido o con baja confianza. |

## Contratos MVP

```http
POST /api/files/upload/
POST /api/process/text-extraction/
POST /api/process/document-classification/
POST /api/process/document-segmentation/
POST /api/process/document-index/
POST /api/process/indexed-pdf-export/
GET /api/files/{file_id}/index/
POST /api/process/reviews/
```

## Salida base

```json
{
  "file_id": "uuid",
  "status": "completed",
  "profile_detected": "legal",
  "total_pages": 1,
  "index": [
    {
      "order": 1,
      "title": "Informe Policial Homologado",
      "type": "POLICE_REPORT",
      "page_start": 1,
      "page_end": 1,
      "confidence": 0.78,
      "requires_human_review": true
    }
  ]
}
```

## Revision humana

La IA nunca debe ser definitiva. Un usuario autorizado debe poder:

- Aprobar.
- Corregir titulo.
- Corregir tipo.
- Corregir pagina inicial/final.
- Separar documentos.
- Unir documentos.
- Cambiar perfil.
- Rechazar una propuesta.
- Registrar motivo.

Cada correccion debe guardar resultado original, correccion humana, usuario,
fecha, motivo y version del modelo/reglas usado.

## Implementacion MVP

El MVP usa reglas locales y devuelve resultados estructurados. No ejecuta OCR,
transcripcion ni modelos externos reales todavia. Es una base contractual para
conectar motores especializados despues.

## Persistencia implementada

La API documental queda preparada para crecer sin cambiar el contrato base:

- `Document.Files` guarda el archivo original, hash, origen, proveedor externo
  y contexto logico opcional.
- `Document.DocumentPageTexts` guarda el texto extraido por pagina y permite
  marcar cuando un documento requiere OCR real.
- `Document.DocumentClassificationResults` conserva propuestas de perfil,
  tipo documental, confianza, estado y version del motor/reglas.
- `Document.DocumentSections` y `Document.DocumentIndexes` guardan el indice
  web navegable y sus secciones.
- `Document.DocumentProcessingArtifacts` reserva salidas derivadas como PDF
  indexado.
- `Document.HumanReviewCorrections` mantiene la supervision humana y las
  correcciones que despues alimentaran aprendizaje supervisado.

## Pendientes

- Integrar motor OCR productivo.
- Definir motor de transcripcion.
- Implementar deteccion real de paginas y secciones.
- Persistir aprendizaje supervisado a partir de correcciones humanas.
- Generar PDF indexado real.
