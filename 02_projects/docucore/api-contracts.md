# Contratos API DocuCore

## Gateway

Base:

```text
/api/gateway
```

## Tools

```http
GET /api/gateway/tools/
```

Respuesta:

```json
[
  {
    "slug": "pdf-split",
    "name": "PDF Split",
    "category": "PDF",
    "description": "Separar paginas de un PDF en un ZIP descargable.",
    "accepted_extensions": ["pdf"],
    "output": "zip",
    "status": "enabled"
  }
]
```

## Upload

```http
POST /api/gateway/files/upload/
Content-Type: multipart/form-data
```

Body:

```text
file=<binary>
```

Respuesta correcta:

```json
{
  "file": {
    "id": "uuid",
    "original_name": "archivo.pdf",
    "sha256": "hash",
    "mime_type": "application/pdf",
    "extension": ".pdf",
    "size_bytes": 123,
    "status": "UPLOADED"
  },
  "validation_errors": []
}
```

## Process

```http
POST /api/gateway/process/{tool}/
```

Body:

```json
{
  "file_id": "uuid",
  "options": {}
}
```

Estados:

```text
PENDING
PROCESSING
COMPLETED
FAILED
CANCELLED
PARTIAL_COMPLETED
```

Respuesta base:

```json
{
  "id": "uuid",
  "file_id": "uuid",
  "file_name": "archivo.pdf",
  "tool": "pdf-split",
  "status": "COMPLETED",
  "progress": 100,
  "results": [],
  "artifacts": [
    {
      "storage_key": "resultado.zip",
      "filename": "resultado.zip",
      "mime_type": "application/zip",
      "download_url": "/api/gateway/artifacts/resultado.zip/download/"
    }
  ]
}
```

## Download

```http
GET /api/gateway/artifacts/{storage_key}/download/
GET /api/gateway/jobs/{job_id}/download/
```

Las descargas siempre deben pasar por Gateway. Document API conserva el storage
privado y Gateway actua como frontera publica del frontend.

## Preview

El preview documental debe generarse como representacion interna, no como
render directo del archivo original en cada pantalla. El frontend consume una
respuesta normalizada desde Gateway.

Endpoints objetivo:

```http
POST /api/gateway/preview/pdf/
POST /api/gateway/preview/docx/
POST /api/gateway/preview/excel/
POST /api/gateway/preview/image/
POST /api/gateway/preview/xml/
POST /api/gateway/preview/zip/
GET /api/gateway/files/{file_id}/preview/
```

Respuesta base:

```json
{
  "file_id": "uuid",
  "type": "pdf",
  "status": "READY",
  "pages": 25,
  "thumbnails": [
    {
      "page": 1,
      "thumbnail_url": "/api/gateway/previews/file/page-1.png",
      "width": 320,
      "height": 452
    }
  ],
  "preview_url": "/api/gateway/previews/file/index.json",
  "metadata": {
    "text_searchable": true,
    "requires_ocr": false
  }
}
```

Reglas por tipo:

| Tipo | Representacion |
|---|---|
| PDF | Miniaturas por pagina, pagina activa, zoom, busqueda y seleccion de texto cuando exista texto embebido. |
| Word/DOCX | HTML temporal seguro generado por backend o libreria controlada. |
| Excel/CSV | Tabla HTML/JSON con hojas, filtros y busqueda. |
| Imagen | Imagen directa con zoom, rotacion, recorte y comparacion cuando exista motor. |
| OCR | Vista dividida: imagen/documento y texto extraido. |
| ZIP | Arbol navegable de archivos internos sin descargar automaticamente. |
| XML | Vista doble: XML original y estructura normalizada. |
| TXT | Editor o tabla segun contenido detectado. |

Pendiente: elegir motor real para PDF, DOCX, Excel y OCR. Hasta entonces el
workspace puede usar miniaturas conceptuales, marcadas como MVP visual.

## Preview progresivo por pagina

Para que `/workspace` pueda mostrar estructura inmediata sin esperar el render
completo, Gateway debe exponer metadata y previews por pagina.

Endpoints objetivo:

```http
GET /api/gateway/files/{file_id}/metadata/
GET /api/gateway/files/{file_id}/pages/{page}/preview/
POST /api/gateway/files/{file_id}/pages/{page}/preview/retry/
```

Respuesta de metadata:

```json
{
  "document_id": "uuid",
  "file_name": "archivo.pdf",
  "file_type": "pdf",
  "total_pages": 50,
  "status": "preview-loading",
  "pages": [
    {
      "page": 1,
      "status": "pending",
      "preview_url": null
    }
  ]
}
```

Respuesta de pagina:

```json
{
  "document_id": "uuid",
  "page": 1,
  "status": "ready",
  "preview_url": "/api/gateway/previews/uuid/page-1.webp",
  "width": 960,
  "height": 1358,
  "size_name": "Carta",
  "orientation": "portrait",
  "mime_type": "image/webp"
}
```

Estados normalizados por pagina:

| Estado | Significado | Regla frontend |
|---|---|---|
| `pending` | La pagina existe pero aun no inicia render. | Mostrar placeholder en blanco. |
| `loading` | La pagina esta generando preview. | Mostrar preloader dentro de la pagina. |
| `ready` | Existe preview consumible. | Reemplazar placeholder por preview. |
| `error` | La pagina fallo. | Mostrar error local y permitir reintento por pagina. |

Reglas:

- El frontend no debe esperar todas las paginas para pintar el documento.
- El fallo de una pagina no invalida el documento completo.
- La preview recomendada para PDF es WEBP cacheado; PNG queda como alternativa.
- Mientras no exista motor real, el frontend puede renderizar placeholders
  conceptuales y debe documentarlo como deuda tecnica.

Nota de implementacion frontend 2026-05-30:

- `WEB.NJ.NEXT.DocuCore` ya usa PDF.js para renderizar miniaturas reales de un
  PDF seleccionado en `/upload`.
- La transferencia actual entre `/upload` y `/workspace` usa `objectUrl`
  temporal guardado en `sessionStorage`.
- Esta solucion no sustituye el contrato backend definitivo; es un puente MVP
  para que el usuario vea miniaturas reales antes de que Gateway exponga
  `GET /api/gateway/files/{file_id}/pages/{page}/preview/`.
- Cada preview debe entregar o permitir derivar `width`, `height`, `size_name`
  y `orientation` para que el frontend construya marcos adaptativos sin
  desbordamiento.

## Document Intelligence

Herramientas reutilizables esperadas para proyectos como LexNova:

```http
POST /api/gateway/process/ocr/
POST /api/gateway/process/ocr-image/
POST /api/gateway/process/document-classification/
POST /api/gateway/process/document-segmentation/
POST /api/gateway/process/document-index/
POST /api/gateway/process/indexed-pdf-export/
GET /api/gateway/files/{file_id}/index/
```

Respuesta base:

```json
{
  "file_id": "uuid",
  "status": "COMPLETED",
  "text_extracted": true,
  "classification": {
    "document_type": "UNKNOWN",
    "confidence": 0.42
  },
  "sections": [],
  "index": []
}
```

La respuesta es propuesta tecnica. La aprobacion final y la relacion con un
caso, expediente o procedimiento pertenecen al proyecto consumidor.
