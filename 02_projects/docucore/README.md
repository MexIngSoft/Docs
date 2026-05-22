# DocuCore

DocuCore es el ecosistema documental del workspace comercial.

## Proyectos

| Proyecto | Rol | Puerto |
|---|---|---|
| `API.PY.DJANGO.Document` | Upload, validacion, storage, procesamiento y jobs de archivos. | `8011` |
| `API.PY.DJANGO.DocuCore` | Catalogo de herramientas, configuracion, limites, historial y personalizacion. | `8012` |
| `API.PY.DJANGO.DocuCore.Gateway` | Contrato frontend-backend y proxy seguro hacia APIs internas. | `8013` |
| `WEB.NJ.NEXT.DocuCore` | Dashboard, herramientas, upload, jobs, downloads e historial. | `3004` |

## Document Intelligence

DocuCore y `API.PY.DJANGO.Document` concentran capacidades reutilizables de
OCR, clasificacion documental, segmentacion e indice. Proyectos como LexNova
deben consumir estas capacidades por su propio Gateway/BFF y conservar en su
dominio la relacion con casos, permisos, seguimiento y revision humana.

Documento canonico:

```text
document-intelligence.md
```

## Estado

MVP base creado por agents 000-030.

## Documentos

```text
architecture.md
database.md
api-contracts.md
document-intelligence.md
tools-catalog.md
security.md
error-handling.md
docker.md
qa-checklist.md
repositories.md
```
