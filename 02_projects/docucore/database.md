# Base de datos DocuCore Document

## Schema

```text
Document
DocuCore
DocuCoreGateway
```

## Tablas Document

| Tabla | Proposito |
|---|---|
| `Document.Files` | Archivo original, hash, MIME, extension, tamano y estado. |
| `Document.FileMetadata` | Metadata extensible por archivo. |
| `Document.FileProcessingJobs` | Jobs de procesamiento. |
| `Document.FileProcessingResults` | Resultados por job. |
| `Document.FileErrors` | Errores de validacion o procesamiento. |
| `Document.FileStorageLocations` | Rutas privadas por zona. |

## Reglas

- Campos en PascalCase por `db_column`.
- Tablas en estilo SQL Server: `Schema.Table`.
- UUID como llave principal.
- Auditoria minima: `CreatedAt`, `UpdatedAt`, `CreatedBy`, `UpdatedBy`.
- Indices en `Sha256`, `Status` y estado de jobs.

## Nota

El agent original tenia `Document0.FileProcessingResults`; se corrige a `Document.FileProcessingResults`.
