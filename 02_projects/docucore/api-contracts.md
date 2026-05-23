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
