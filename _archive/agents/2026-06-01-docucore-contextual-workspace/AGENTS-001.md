Sí, esa idea mejora mucho el diseño: **un solo Workspace universal**, no varios Workspaces separados.

Te la dejo corregida para Codex:

Nueva decisión de arquitectura para DocuCore Workspace:

El Workspace no debe ser exclusivo para PDF. Debe evolucionar a un Workspace universal de documentos.

Objetivo:

Todas las herramientas activas deben poder probarse y ejecutarse desde Workspace, pero las herramientas visibles, permitidas y configurables deben cambiar según el tipo de documento cargado.

Regla principal:

El Workspace es único, pero sus acciones son contextuales.

Ejemplo:

* Si el usuario carga PDF, mostrar herramientas PDF:

  * dividir PDF
  * unir PDF
  * comprimir PDF
  * convertir PDF a Word

* Si el usuario carga Word, mostrar herramientas compatibles:

  * convertir Word a PDF

* Si el usuario carga imágenes, mostrar herramientas compatibles:

  * imagen a PDF
  * limpiar imagen

* Si el usuario carga Excel o CSV, mostrar herramientas compatibles:

  * Excel a CSV
  * CSV a Excel

* Si el usuario carga XML, mostrar:

  * leer XML
  * extraer información compatible

* Si el usuario carga ZIP, no debe tratarse como documento editable directo.
  El ZIP debe manejarse como contenedor.
  Solo puede adjuntarse al proyecto o extraerse si contiene documentos compatibles con herramientas activas.

Reglas para ZIP:

1. Un ZIP no se edita directamente en Workspace.
2. El ZIP puede agregarse como archivo de proyecto.
3. El sistema debe analizar su contenido.
4. Si contiene PDFs, imágenes, Word, Excel, CSV o XML, entonces esos archivos internos pueden ofrecer herramientas compatibles.
5. Si el ZIP no contiene documentos compatibles, mostrar mensaje claro:
   “Este ZIP no contiene archivos compatibles para trabajar en Workspace.”
6. No permitir acciones directas como dividir, comprimir PDF o convertir si el ZIP no ha sido extraído o analizado.
7. Documentar esta regla en la documentación canónica de Workspace.

Cambio sobre la recomendación anterior:

Antes:
Solo probar en Workspace:

* `pdf-split`
* `pdf-merge`
* `pdf-compress`
* `pdf-word`

Ahora:
Todas las herramientas activas deben poder probarse desde Workspace, pero mediante reglas contextuales por tipo de archivo.

Herramientas activas para Workspace contextual:

* `pdf-split`
* `pdf-merge`
* `pdf-compress`
* `pdf-word`
* `word-pdf`
* `image-pdf`
* `image-clean`
* `excel-csv`
* `csv-excel`
* `xml-read`
* `zip-extract`

Herramientas que deben seguir bloqueadas:

* OCR
* IA documental
* índice documental
* clasificación documental
* segmentación documental
* firma PDF
* watermark
* traducción
* importación desde nube
* API keys
* workflows internos no terminados

Reglas de interfaz:

1. `/upload` debe aceptar distintos tipos de archivo.
2. Después de subir archivos, enviar al mismo Workspace.
3. Workspace debe detectar el tipo de archivo.
4. Workspace debe mostrar solo herramientas compatibles.
5. Las herramientas incompatibles no deben aparecer como disponibles.
6. Si se muestran herramientas no compatibles, deben aparecer deshabilitadas y con explicación clara.
7. El botón `Aplicar cambios` debe ejecutar la herramienta real por Gateway.
8. Si una herramienta todavía no está conectada al Gateway, no debe prometer ejecución real.
9. No usar mocks para aparentar éxito.
10. El usuario siempre debe entender qué puede hacer con el archivo actual.

Reglas técnicas:

1. Crear o ajustar un mapa de compatibilidad por tipo de archivo.
2. Separar:

   * herramientas visibles;
   * herramientas ejecutables;
   * herramientas bloqueadas;
   * herramientas futuras.
3. Usar `feature-gates.ts` para mantener apagadas las herramientas no listas.
4. Evitar lógica dispersa con muchos `if`.
5. Centralizar reglas en una configuración clara.
6. Documentar las decisiones en la documentación canónica.
7. Mantener el alcance del MVP sin activar OCR ni IA.

Resultado esperado:

DocuCore debe funcionar como una plataforma de trabajo documental general:

* un solo Workspace;
* múltiples tipos de archivo;
* herramientas contextuales;
* reglas claras;
* ejecución real por Gateway;
* ZIP tratado como contenedor;
* funciones futuras ocultas o bloqueadas.

Esta corrección es mejor que limitar la web solo a PDF, porque deja preparado DocuCore como plataforma real y no como editor PDF aislado.
