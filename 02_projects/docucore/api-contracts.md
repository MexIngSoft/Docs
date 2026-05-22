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
{
  "tools": [
    {
      "slug": "pdf-split",
      "name": "PDF Split",
      "category": "PDF",
      "description": "Separar paginas de un PDF."
    }
  ]
}
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

## Document Intelligence

Herramientas reutilizables esperadas para proyectos como LexNova:

```http
POST /api/gateway/process/ocr/
POST /api/gateway/process/document-classification/
POST /api/gateway/process/document-segmentation/
POST /api/gateway/process/document-index/
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
