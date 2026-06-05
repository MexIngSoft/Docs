# Manejo de errores DocuCore

## Relacion canonica

La taxonomia completa de errores, prioridades, issues, diagnostico y retencion
vive en:

```text
observability-and-diagnostics.md
```

Este documento conserva la forma minima de respuesta del Gateway y los codigos
base compartidos por la API.

## Forma Gateway

```json
{
  "error": {
    "code": "DOCUMENT_API_UNAVAILABLE",
    "message": "detalle seguro",
    "request_id": "REQ-20260604-000001"
  }
}
```

Reglas:

- `message` debe ser seguro para usuario.
- `request_id` debe mostrarse o conservarse para soporte.
- Los detalles tecnicos, stack traces y payloads internos solo pertenecen a la
  vista admin/diagnostico.
- Los errores de herramientas deben mapearse a los codigos oficiales de
  `observability-and-diagnostics.md`.

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
