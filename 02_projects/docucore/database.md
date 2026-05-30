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
| `Document.DocumentPageTexts` | Texto extraido por pagina, metodo de extraccion, idioma y confianza. |
| `Document.DocumentClassificationResults` | Clasificacion propuesta por perfil, tipo documental, confianza y version de reglas/modelo. |
| `Document.DocumentSections` | Secciones documentales propuestas o revisadas, con paginas y estado de revision. |
| `Document.DocumentIndexes` | Indice navegable generado para el archivo. |
| `Document.DocumentProcessingArtifacts` | Artefactos derivados, como PDF indexado futuro. |
| `Document.HumanReviewCorrections` | Correcciones humanas sobre clasificacion, secciones o estructura. |

## Reglas

- Campos en PascalCase por `db_column`.
- Tablas en estilo SQL Server: `Schema.Table`.
- UUID como llave principal.
- Auditoria minima: `CreatedAt`, `UpdatedAt`, `CreatedBy`, `UpdatedBy`.
- Indices en `Sha256`, `Status` y estado de jobs.
- `Document.Files` conserva origen, proveedor externo y contexto logico para
  permitir cargas desde dispositivo, camara, Drive, Dropbox, Mega, OneDrive,
  URL u otros proveedores sin acoplar el archivo a un caso desde el inicio.
- El archivo original existe una sola vez; texto, clasificacion, secciones,
  indices y artefactos se agregan como resultados trazables de procesamiento.

## Nota

El agent original tenia `Document0.FileProcessingResults`; se corrige a `Document.FileProcessingResults`.

## Tablas DocuCore

| Tabla | Proposito |
|---|---|
| `DocuCore.Modules` | Inventario de modulos funcionales de DocuCore: PDF, conversion, OCR, IA documental, expedientes, procesos, archivos, API y cuenta. |
| `DocuCore.Tools` | Inventario de herramientas ejecutables o planeadas, con estado activo/no activo, visibilidad, creditos, extensiones aceptadas y salida esperada. |
| `DocuCore.ProcessingHistory` | Historial ligero de ejecucion/configuracion del producto DocuCore. |

## Estados de herramientas

| Estado | Uso |
|---|---|
| `enabled` | Herramienta activa y ejecutable desde Gateway. |
| `planned` | Inventariada y visible como roadmap, pero no ejecutable. |
| `development` | Flujo visual o tecnico en construccion. |
| `beta` | Disponible solo para uso controlado. |
| `internal` | Solo operacion/admin/desarrollo. |
| `disabled` | No debe mostrarse publicamente. |

## Regla

Toda capacidad mencionada por documentacion o agents debe existir como fila de
catalogo antes de mostrarse en UI. Si no tiene motor real, `Enabled = false` y
`Status` no puede ser `enabled`.
