# Estado, configuracion y eventos de herramientas DocuCore

## Objetivo

Definir que herramientas de DocuCore pueden ejecutarse, cuales solo se muestran
como alcance futuro, que configuracion debe ver el usuario y que eventos deben
existir para trazabilidad.

Este documento complementa:

- `tools-catalog.md`
- `mvp-roadmap.md`
- `frontend-navigation-and-ux.md`
- `api-contracts.md`
- `execution-policy.md`
- `supported-file-types.md`
- `observability-and-diagnostics.md`

## Regla principal

```text
Catalogo backend -> feature gate frontend -> panel de configuracion -> proceso -> evento ERP.
```

La fuente operativa del catalogo es `API.PY.DJANGO.DocuCore`. El frontend puede
usar fallback local, pero no debe convertir una herramienta planeada en
ejecutable.

## Estado auditado 2026-06-01

| Herramienta | Slug | Funcion MVP | Configuracion UI | Evento requerido | Estado |
|---|---|---|---|---|---|
| Dividir PDF | `pdf-split` | ZIP con paginas/rangos/bloques visuales. | Panel MVP con seleccion manual, bloques visuales y cada N paginas. No muestra OCR, IA, marcadores generados, capitulos ni division semantica. | `tool_config_opened`, `tool_option_changed`, `pages_selected`, `document_blocks_changed`, `process_requested`, `execution_resource_event` | Lista MVP. |
| Unir PDF | `pdf-merge` | Normalizacion PDF y preparacion de union. | Panel guiado con orden de archivos y dependencia multiarchivo. Solo debe aparecer cuando existan 2 o mas PDFs y no haya mezcla de tipos. | `tool_config_opened`, `file_order_changed`, `process_requested`, `execution_resource_event` | Parcial: multiarchivo remoto pendiente. |
| Comprimir PDF | `pdf-compress` | PDF optimizado. | Panel base con perfil seguro y salida. | `tool_config_opened`, `compression_profile_selected`, `process_requested`, `execution_resource_event` | Lista MVP; parametros finos pendientes. |
| PDF a Word | `pdf-word` | DOCX con texto embebido. | Panel base con tipo de conversion y advertencia de OCR bloqueado. | `tool_config_opened`, `conversion_profile_selected`, `process_requested`, `execution_resource_event` | Lista MVP; OCR previo pendiente. |
| Word a PDF | `word-pdf` | PDF simple desde DOCX. | Panel contextual en `/workspace`; preview DOCX real pendiente. | `tool_config_opened`, `conversion_profile_selected`, `process_requested`, `execution_resource_event` | Ejecutable por upload/Workspace/Gateway. |
| Imagen a PDF | `image-pdf` | PDF desde imagen. | Panel contextual en `/workspace`; preview imagen avanzado pendiente. | `tool_config_opened`, `image_conversion_requested`, `process_requested`, `execution_resource_event` | Ejecutable por upload/Workspace/Gateway. |
| Excel a CSV | `excel-csv` | ZIP con CSV por hoja. | Panel contextual en `/workspace`; preview tabla pendiente. | `tool_config_opened`, `spreadsheet_conversion_requested`, `process_requested`, `execution_resource_event` | Ejecutable por upload/Workspace/Gateway. |
| CSV a Excel | `csv-excel` | XLSX desde CSV. | Panel contextual en `/workspace`; preview tabla pendiente. | `tool_config_opened`, `csv_conversion_requested`, `process_requested`, `execution_resource_event` | Ejecutable por upload/Workspace/Gateway. |
| Leer XML | `xml-read` | JSON con resumen XML. | Panel contextual en `/workspace`; vista XML estructurada pendiente. | `tool_config_opened`, `xml_read_requested`, `process_requested`, `execution_resource_event` | Ejecutable por upload/Workspace/Gateway. |
| Inspeccionar ZIP | `zip-extract` | JSON con listado de contenido. | Panel `archive-mode` en `/workspace`; arbol ZIP pendiente. | `archive_mode_opened`, `tool_config_opened`, `archive_extract_requested`, `execution_resource_event` | Ejecutable por upload/Workspace/Gateway. |
| Limpiar imagen | `image-clean` | Imagen normalizada. | Panel contextual en `/workspace`; editor de imagen pendiente. | `tool_config_opened`, `image_cleanup_requested`, `process_requested`, `execution_resource_event` | Ejecutable por upload/Workspace/Gateway. |
| OCR basico | `ocr-image` | Parcial segun Tesseract. | Bloqueado en UI publica. | `tool_blocked_viewed`, `engine_missing`, `execution_resource_event` cuando se habilite. | Bloqueado hasta motor productivo. |
| Generar indice | `document-index` | Indice JSON por reglas MVP documentado. | Bloqueado en Workspace por feature gate. | `tool_blocked_viewed`, `process_requested`, `execution_resource_event` cuando se habilite. | Pendiente por alcance IA documental. |
| PDF indexado | `indexed-pdf-export` | Artefacto indice/PDF normalizado documentado. | Bloqueado en UI publica. | `tool_blocked_viewed`, `process_requested`, `execution_resource_event` cuando se habilite. | Pendiente por alcance IA documental. |

## Mensajes de configuracion para usuario

Cada panel debe explicar tres cosas sin texto largo:

| Caso | Mensaje |
|---|---|
| Herramienta lista | "Configura la accion y revisa el resumen antes de aplicar cambios." |
| Motor parcial | "Esta opcion prepara el trabajo; algunas capacidades avanzadas dependen del backend productivo." |
| Herramienta bloqueada | "Esta herramienta esta documentada en el roadmap, pero no se puede ejecutar hasta tener motor real y validacion." |

## Eventos minimos por herramienta ejecutable

Todo proceso relevante debe poder reconstruirse con estos eventos:

| Evento | Proposito |
|---|---|
| `tool_config_opened` | Saber que el usuario abrio el panel de una herramienta. |
| `tool_option_changed` | Registrar cambios de configuracion no sensibles. |
| `pages_selected` | Registrar seleccion de paginas sin contenido documental. |
| `file_order_changed` | Registrar orden de archivos para union o pipelines. |
| `process_requested` | Inicio solicitado por el usuario. |
| `process_started` | Gateway/API acepto el trabajo. |
| `process_completed` | Se genero resultado o artefacto. |
| `process_failed` | Fallo normalizado. |
| `execution_resource_event` | Evento tecnico hacia ERP/ExecutionResourceManager. |

Los eventos no deben incluir texto completo del documento, binarios, OCR
completo, secretos ni rutas privadas.

Los codigos de error, etapas, prioridades, reglas de issue y retencion se
normalizan en `observability-and-diagnostics.md`.

## Paneles de configuracion obligatorios

| Superficie | Regla |
|---|---|
| `/workspace` | Toda herramienta activa visible en el drawer debe tener panel de configuracion, opciones, mensaje de usuario y eventos esperados. |
| `/upload` | Las herramientas no-PDF ejecutables pueden iniciar proceso desde tarjetas compatibles, pero deben migrar a workspace especializado por tipo documental. |
| `/jobs` | Debe mostrar resultado, estado y descarga; no debe sustituir la configuracion de herramientas. |
| Feature gate | Si no hay backend real, la herramienta se documenta como pendiente y no se ejecuta. |

## Faltantes detectados

- Falta contrato backend productivo de `Project`/`DocumentProject` para enviar
  varios archivos y sostener configuracion multiarchivo.
- Falta endpoint productivo de preview por tipo documental para Word, Excel,
  CSV, XML, ZIP, RAR e imagen avanzada.
- Faltan limites numericos por herramienta: paginas, MB, tiempo y memoria.
- Falta implementar emision real de eventos hacia
  `API.PY.DJANGO.ExecutionResourceManager`.
- Falta visor especializado por tipo documental; el panel contextual ya existe
  para las herramientas activas, pero las miniaturas reales no-PDF siguen
  pendientes.

## Workspace universal contextual 2026-06-01

`/workspace` usa un mapa central de compatibilidad por tipo de archivo. La UI
no debe mantener listas locales diferentes para Upload y Workspace.

Tipos reconocidos:

- `pdf`
- `word`
- `image`
- `excel`
- `csv`
- `xml`
- `zip`
- `rar`
- `sevenZip`
- `unknown`

Reglas:

- `document-mode` aplica a PDF, Word, imagen, Excel, CSV y XML.
- `archive-mode` aplica a ZIP, RAR y 7Z.
- Las herramientas activas del Gateway aparecen en el drawer solo si el tipo
  de archivo es compatible.
- Las herramientas bloqueadas por alcance futuro pueden aparecer como
  pendientes documentados, pero el boton de aplicar debe quedar deshabilitado.
- ZIP y 7Z solo pueden ejecutar `zip-extract` por ahora.
- RAR queda documentado como contenedor futuro y no debe prometer extraccion.
- No se aplican herramientas documentales directamente sobre ZIP/RAR/7Z;
  primero debe existir extraccion o contrato de contenedor.
- La configuracion derecha del workspace permanece vacia hasta seleccionar una
  herramienta. No se debe renderizar configuracion generica.
- `pdf-merge` no aparece con un solo PDF ni con documentos mezclados.
- `pdf-split` solo expone modos MVP: paginas, bloques visuales y cada N
  paginas. Marcadores PDF nativos quedan pendientes hasta lectura real de
  bookmarks embebidos; OCR, IA, capitulos y analisis semantico no se muestran.

Mapa operativo inicial:

| Tipo | Modo | Herramientas ejecutables |
|---|---|---|
| `pdf` | `document-mode` | `pdf-split`, `pdf-merge`, `pdf-compress`, `pdf-word` |
| `word` | `document-mode` | `word-pdf` |
| `image` | `document-mode` | `image-pdf`, `image-clean` |
| `excel` | `document-mode` | `excel-csv` |
| `csv` | `document-mode` | `csv-excel` |
| `xml` | `document-mode` | `xml-read` |
| `zip` | `archive-mode` | `zip-extract` |
| `sevenZip` | `archive-mode` | `zip-extract` |
| `rar` | `archive-mode` | Ninguna ejecutable; `rar-extract` pendiente |

Implementacion frontend:

- `lib/workspace/workspace-tool-compatibility.ts` define reglas y estados.
- `lib/workspace/detect-file-type.ts` detecta tipo por MIME/nombre.
- `lib/workspace/get-compatible-tools.ts` selecciona acciones compatibles y
  respeta feature gates.
- `lib/workspace/workspace-mode.ts` separa `document-mode` y `archive-mode`.
- `lib/workspace/execute-workspace-tool.ts` centraliza ejecucion Gateway sin
  simular resultados.

## Decision de implementacion

`WEB.NJ.NEXT.DocuCore` mantiene en `feature-gates.ts` el bloqueo frontend de
herramientas sin motor real. En `/workspace`, las herramientas activas del
drawer tienen ahora panel de configuracion declarativo con:

- resumen funcional;
- mensaje para el usuario;
- opciones listas o pendientes;
- eventos esperados.

Esto evita que el usuario vea un panel generico vacio y deja documentado que
las opciones avanzadas no deben prometerse hasta tener contrato backend.
