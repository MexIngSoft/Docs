# Roadmap MVP DocuCore

## Objetivo

Ordenar el alcance del conversor de archivos como plataforma documental
inteligente. DocuCore no debe tratarse como una maqueta ni como una lista de
botones: debe procesar archivos reales, generar artefactos descargables y
preparar resultados reutilizables por otros proyectos como LexNova.

## Estado actual

| Area | Estado | Nota |
|---|---|---|
| Upload | Implementado | Entrada por Gateway y persistencia en Document API. |
| Jobs | Implementado MVP | Ejecucion sincrona con estados y resultados persistidos. |
| Artefactos | Implementado MVP | Resultados en storage privado y descarga por Gateway. |
| Catalogo | Implementado MVP | Fuente backend en DocuCore API consumida por Web. |
| UI | Implementado MVP | Dashboard, upload, jobs, historial y descargas. |
| OCR | Parcial | Tesseract se usa si existe; motor productivo queda pendiente. |
| Sandbox | Pendiente | Requiere workers aislados por contenedor. |
| Logs por job | Parcial | Resultados y errores quedan en payload; falta log operacional detallado. |
| Retencion/cleanup | Pendiente | Politica documentada, scheduler no implementado. |

## Herramientas MVP implementadas

| Tool | Slug | Resultado |
|---|---|---|
| PDF Split | `pdf-split` | ZIP con paginas separadas. |
| PDF Merge | `pdf-merge` | PDF normalizado para flujo single-file. |
| PDF Compress | `pdf-compress` | PDF optimizado con PyMuPDF. |
| PDF to Word | `pdf-word` | DOCX con texto extraido. |
| Word to PDF | `word-pdf` | PDF simple desde contenido textual DOCX. |
| Image to PDF | `image-pdf` | PDF generado con Pillow. |
| Clean Image | `image-clean` | Imagen normalizada y optimizada. |
| Excel to CSV | `excel-csv` | ZIP con CSV por hoja. |
| CSV to Excel | `csv-excel` | XLSX generado desde CSV. |
| XML Read | `xml-read` | JSON con resumen de nodos XML. |
| ZIP Extract | `zip-extract` | JSON con listado de contenido ZIP/7z. |
| OCR | `ocr-image` | TXT si Tesseract esta disponible; JSON de requerimiento si no. |
| Document Index | `document-index` | Indice JSON por reglas MVP. |
| Indexed PDF Export | `indexed-pdf-export` | Artefacto descargable de indice/PDF normalizado. |

## Herramientas documentadas para fase posterior

Estas capacidades quedan fuera del MVP funcional actual y no deben mostrarse
como disponibles hasta tener procesador real y validacion:

- PDF Rotate.
- PDF Metadata Read.
- Image Resize.
- Image Compress avanzado.
- Image Format Convert.
- OCR estructurado por bloques y coordenadas.
- OCR por regiones.
- PDF buscable con capa OCR real.
- ZIP Extract con extraccion fisica segura.
- Batch upload y merge multiarchivo.

## Orden de desarrollo

1. Cerrar trazabilidad de jobs: logs, tiempos, tamanos original/resultado y
   fecha de expiracion.
2. Agregar validacion MIME real y deteccion de archivos peligrosos.
3. Implementar worker aislado para procesamiento pesado.
4. Completar OCR productivo con salidas TXT/JSON/HOCR.
5. Implementar herramientas pendientes solo cuando tengan engine real.
6. Agregar batch upload y pipelines visuales.
7. Agregar retencion, limpieza programada, cuotas y planes.
8. Versionar API publica cuando existan consumidores externos estables.

## Reglas de publicacion

- Ninguna herramienta debe entrar al catalogo como `enabled` si devuelve mock,
  placeholder o `queued-for-engine`.
- El frontend debe consumir `GET /api/gateway/tools/`.
- Los resultados descargables deben salir por Gateway.
- Document API conserva los archivos, artefactos y procesadores.
- DocuCore API conserva catalogo, configuracion y limites.
- Los proyectos consumidores no deben acoplarse a clases internas de DocuCore.
