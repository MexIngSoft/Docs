# Tipos de archivo soportados DocuCore

## Estado

Activo como estandar canonico del MVP.

## Objetivo

Controlar estrictamente que formatos puede subir y abrir DocuCore durante el
MVP, evitando que aparezcan archivos sin preview, herramientas, diagnostico,
logs o reglas de Workspace.

Este documento complementa:

- `api-contracts.md`
- `mvp-roadmap.md`
- `tool-readiness-and-configuration.md`
- `observability-and-diagnostics.md`

## Estados

| Estado | Uso |
|---|---|
| `ACTIVE` | Formato permitido para carga y Workspace MVP. |
| `EXPERIMENTAL` | Formato interno para pruebas, no publico. |
| `PLANNED` | Formato documentado para roadmap; no debe subirse todavia. |
| `DEPRECATED` | Formato soportado antes, en retiro controlado. |
| `DISABLED` | Formato bloqueado por seguridad, costo o decision de producto. |

## Formatos ACTIVE

| Categoria | Extensiones | Workspace | Herramientas MVP |
|---|---|---|---|
| PDF | `.pdf` | `document-mode` | Dividir, unir, comprimir, PDF a Word, preview, reorden local, descartar/restaurar paginas. |
| Word | `.doc`, `.docx` | `document-mode` | Word a PDF, preview contextual pendiente de visor real. |
| Excel | `.xls`, `.xlsx`, `.csv` | `document-mode` | Excel a CSV, CSV a Excel, lectura/exportacion por Gateway. |
| Imagenes | `.jpg`, `.jpeg`, `.png`, `.webp`, `.bmp`, `.tiff` | `document-mode` | Imagen a PDF, limpieza/normalizacion, preview. |
| XML | `.xml` | `document-mode` | Lectura, validacion base y resumen estructurado. |
| Comprimidos | `.zip`, `.rar`, `.7z` | `archive-mode` | Inspeccion/extraccion segun procesador real disponible. |

## Reglas para comprimidos

Los comprimidos son contenedores. No se debe editar directamente un PDF, Word,
Excel, XML o imagen dentro de un ZIP/RAR/7Z.

Flujo requerido:

```text
Extraer archivo interno
  -> crear documento de trabajo independiente
  -> abrir Workspace en modo documento
```

Hasta que exista extraccion fisica segura y contrato de documentos internos,
las acciones avanzadas de contenedor permanecen bloqueadas o parciales.

## Formatos PLANNED

Estos formatos no deben poder subirse en el MVP publico:

| Categoria | Extensiones |
|---|---|
| Office | `.ppt`, `.pptx`, `.odt`, `.ods` |
| Texto | `.txt`, `.rtf` |
| Libros | `.epub` |
| Email | `.eml`, `.msg` |
| Datos estructurados | `.json`, `.yaml`, `.yml` |
| Web | `.html`, `.htm` |

Mensaje de usuario:

```text
Este formato esta planificado para una futura version de DocuCore y actualmente no esta disponible.
```

## Validacion obligatoria

Al subir archivos:

1. Validar extension.
2. Validar MIME Type.
3. Validar estado del formato.
4. Validar tamano maximo permitido.
5. Bloquear formatos peligrosos.

Si el formato esta `ACTIVE`, se permite la carga y se continua el flujo.

Si el formato esta `PLANNED`, se bloquea la carga con mensaje amigable.

Si el formato es desconocido o peligroso, se bloquea con codigo de error.

## Configuracion centralizada

La Web mantiene el mapa frontend en:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/supported-file-types.ts
```

Document API valida el contrato backend en:

```text
Docker.API.PY/API.PY.DJANGO.Document/validation/services.py
```

Regla: ningun desarrollador debe habilitar un formato nuevo solo agregando una
extension. Para pasar a `ACTIVE` deben existir:

- validacion;
- preview o mensaje contextual seguro;
- reglas de Workspace;
- herramientas compatibles;
- diagnostico y codigos de error;
- documentacion;
- pruebas funcionales;
- integracion con permisos cuando aplique.

## Eventos y diagnostico

Los bloqueos deben mapearse a errores normalizados:

| Codigo | Uso |
|---|---|
| `EXTENSION_NOT_ALLOWED` | Extension desconocida o no soportada. |
| `FILE_TYPE_PLANNED` | Formato documentado para futuro, no activo. |
| `MIME_TYPE_NOT_ALLOWED` | MIME incompatible con extension activa. |
| `DANGEROUS_EXTENSION` | Extension ejecutable o riesgosa. |
| `MAX_SIZE_EXCEEDED` | Archivo supera limite. |
| `EMPTY_FILE` | Archivo vacio. |

Estos errores no crean issue automatico salvo recurrencia o impacto tecnico
segun `observability-and-diagnostics.md`.

## Decision MVP

Se mantiene el MVP pequeno y estable. OCR avanzado, indexacion inteligente,
correos, EPUB, PowerPoint y documentos OpenDocument quedan fuera de carga
publica hasta tener motor, preview, permisos y validacion real.
