# Documents API

## Objetivo

Administrar archivos, anexos y evidencias que otros modulos necesitan sin mezclar documentos con ventas, licitaciones o proyectos.

## Responsabilidades

- Guardar metadatos de documentos.
- Relacionar documentos con cliente, proyecto, venta, factura o licitacion.
- Controlar tipo, estado, vencimiento y version.
- Exponer URLs seguras de descarga o visualizacion.
- Registrar auditoria de carga, reemplazo y eliminacion.
- Procesar OCR, extraccion de texto, clasificacion, segmentacion e indice
  documental cuando el proyecto consumidor lo solicite.

## Tipos base

```text
LEGAL
TECHNICAL
COMMERCIAL
FISCAL
CONTRACT
WARRANTY
TENDER_REQUIREMENT
TENDER_PROPOSAL
PROJECT_EVIDENCE
```

## Endpoints base

```http
POST /api/documents
GET /api/documents/{document_id}
PATCH /api/documents/{document_id}
POST /api/documents/{document_id}/versions
POST /api/documents/{document_id}/link
GET /api/documents/by-context/{context_type}/{context_id}
POST /api/documents/{document_id}/process
GET /api/documents/{document_id}/index
```

## Regla

Los documentos deben poder relacionarse con multiples contextos, pero la decision de negocio siempre pertenece al modulo que los consume.

La API de documentos puede proponer clasificaciones, secciones e indices, pero
no debe tomar decisiones juridicas, fiscales o comerciales finales. La revision
humana y la accion de negocio pertenecen al proyecto consumidor.
