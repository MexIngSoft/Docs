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
