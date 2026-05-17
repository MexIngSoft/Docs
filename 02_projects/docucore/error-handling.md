# Manejo de errores DocuCore

## Forma Gateway

```json
{
  "error": {
    "code": "DOCUMENT_API_UNAVAILABLE",
    "message": "detalle"
  }
}
```

## Codigos iniciales

| Codigo | Uso |
|---|---|
| `FILE_REQUIRED` | No se envio archivo. |
| `FILE_NOT_FOUND` | Archivo no existe o fue borrado. |
| `JOB_NOT_FOUND` | Job inexistente. |
| `EXTENSION_NOT_ALLOWED` | Extension no permitida. |
| `DANGEROUS_EXTENSION` | Extension peligrosa. |
| `MAX_SIZE_EXCEEDED` | Archivo supera limite. |
| `EMPTY_FILE` | Archivo vacio. |
| `DOCUMENT_API_UNAVAILABLE` | Gateway no pudo contactar Document API. |
| `DOCUCORE_API_UNAVAILABLE` | Gateway no pudo contactar DocuCore API. |
