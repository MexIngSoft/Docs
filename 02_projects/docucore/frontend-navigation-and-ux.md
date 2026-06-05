# Navegacion e interfaz DocuCore

## Objetivo

Definir la experiencia de DocuCore como asistente documental inteligente. La UI
debe guiar el flujo de trabajo desde el archivo hacia acciones sugeridas,
procesamiento, resultado y siguiente paso.

## Principios

- Mostrar categorias antes que listas extensas de herramientas.
- Usar el catalogo backend como fuente de verdad.
- Mostrar todas las herramientas inventariadas, separando claramente activas y
  no activas.
- Mantener el upload como accion principal.
- Mostrar jobs, errores y descargas de forma visible.
- Sugerir siguientes acciones segun tipo de archivo y resultado.
- Separar experiencia DocuCore de interpretacion especializada de LexNova.
- Login y registro deben abrirse como modal para conservar herramienta,
  archivo, creditos y estado de trabajo.

## Navegacion principal

| Seccion | Proposito |
|---|---|
| Dashboard | Estado general, upload, herramientas recomendadas y jobs recientes. |
| Convertir | PDF, Word, Excel, CSV, imagenes y XML. |
| OCR e IA | Extraccion de texto, clasificacion, segmentacion e indice. |
| Organizar | Split, merge, rotacion y reordenamiento cuando existan procesadores reales. |
| Optimizar | Compresion y limpieza de documentos o imagenes. |
| Extraer | Texto, metadata, XML, tablas e informacion estructurada. |
| Jobs | Procesos activos, completados, fallidos y descargas. |
| Archivos | Historial documental, favoritos, temporales y procesados. |
| Integraciones | LexNova, webhooks y proveedores externos futuros. |
| Configuracion | Preferencias, limites, seguridad y API. |

## Layout interno

```text
Topbar
Sidebar
Contenido principal
Pipeline Assistant
```

### Topbar

Debe incluir breadcrumb, busqueda global futura, boton de upload, procesos
activos, notificaciones y perfil.

### Sidebar

Debe contener accesos a las secciones principales sin listar todas las
herramientas al mismo tiempo.

### Contenido principal

Debe cambiar segun contexto: dashboard, upload, resultado, jobs o historial.

### Pipeline Assistant

Debe mostrar siguiente accion sugerida. En el MVP puede ser una zona de estado
simple; en fases posteriores debe evolucionar a barra persistente.

## Estados obligatorios

| Estado | UI requerida |
|---|---|
| Sin archivo | Accion de upload y herramientas recomendadas. |
| Archivo seleccionado | Herramientas compatibles y formatos aceptados. |
| Upload completado | Metadata del archivo y accion de proceso. |
| Procesando | Progreso, job id y estado. |
| Completado | Descarga de artefacto y siguiente accion sugerida. |
| Fallido | Error normalizado y accion de reintento. |

## Rutas internas objetivo

```text
/
/upload
/jobs
/history
/tools
/tools/convert
/tools/ocr
/tools/organize
/tools/extract
/tools/optimize
/files
/files/[id]
/integrations
/settings
```

El MVP actual implementa `/`, `/upload`, `/jobs` y `/history`. Las demas rutas
quedan como expansion gradual.

## Sistema visual

- Estilo: panel empresarial funcional.
- Sensacion: rapido, claro, documental, confiable.
- Marca: logo propio de DocuCore con simbolo documental rojo, sin copiar marcas
  de terceros.
- Paleta: rojo documental familiar como color primario, neutros empresariales
  para superficies y estados, y acentos secundarios sobrios.
- Iconos: Lucide React.
- Componentes: botones con icono, tablas para jobs, formularios claros,
  estados de error y descarga.
- Evitar: saturacion de botones, landing como pantalla principal autenticada,
  herramientas hardcodeadas y procesos inexistentes.

## Ajuste UX 2026-05-30

La pantalla principal debe parecer un producto empresarial, no una maqueta ni
una landing simple:

- Hero operativo con accion primaria de upload.
- Panel de modulos a la izquierda.
- Catalogo completo filtrable por modulo y busqueda.
- Rail lateral con procesos sugeridos, creditos y acceso.
- Cards de herramientas con estado visible: activo, no activo, interno o beta.
- Botones de login/registro visibles en topbar y modal contextual.
- Las herramientas no activas pueden verse como roadmap, pero no ejecutarse.

## Ajuste de marca y sidebar 2026-05-30

La navegacion lateral debe ocupar poco espacio por defecto:

- Estado cerrado: solo iconos y marca compacta.
- Hover/focus: expandir panel y mostrar texto, etiquetas y estados.
- La marca debe aparecer en sidebar y en el primer viewport del dashboard.
- El catalogo de herramientas debe renderizarse aunque Gateway o API no esten
  disponibles; en ese caso se usa el registro local sincronizado con la semilla
  backend y se mantiene la misma regla de estados.

## Regla final

DocuCore debe guiar asi:

```text
Subir archivo
-> detectar tipo
-> sugerir herramienta
-> procesar
-> mostrar resultado
-> descargar o continuar flujo
```

## Ajuste de flujo upload 2026-05-30

La ruta `/upload` tiene dos modos de entrada:

- Entrada general desde sidebar o dashboard: el usuario sube un archivo,
  DocuCore detecta la extension y muestra herramientas compatibles.
- Entrada desde una herramienta: la ruta recibe `?tool=<slug>` y la herramienta
  queda preseleccionada; el usuario solo agrega el archivo compatible.

Ambos caminos usan el mismo contrato:

```text
POST /api/gateway/files/upload/
POST /api/gateway/process/{tool}/
GET /api/gateway/artifacts/{storage_key}/download/
```

La interfaz debe mostrar el avance en espanol:

```text
Subida -> Proceso -> Descarga
```

La animacion debe ser sutil y funcional: solo indicar que el proceso esta en
curso, sin simular progreso falso ni ocultar errores.

## Ajuste de workspace universal 2026-05-30

La ruta `/upload` deja de pedir herramienta antes del archivo. El flujo
principal queda:

```text
Subida de uno o varios archivos
-> analisis de tipos
-> acciones compatibles
-> configuracion
-> proceso
-> resultado
```

Reglas aplicadas:

- El selector de herramienta no aparece como primer paso.
- La pantalla inicial muestra zona de arrastre y capacidades visibles.
- El usuario puede agregar varios archivos desde el mismo workspace.
- DocuCore detecta familia documental por extension: PDF, Word, Excel,
  imagen, XML o contenedor ZIP/RAR/7Z; texto queda planeado hasta tener visor
  y validacion real.
- Las acciones se renderizan como tarjetas compatibles segun archivos
  seleccionados.
- ZIP combinado con otros tipos muestra advertencia y prioriza inspeccion ZIP.
- El panel lateral muestra resumen, tipos, peso, acciones, preview y proceso.
- La vista previa es informativa en MVP: paginas simuladas para PDF,
  miniatura conceptual para imagen y analisis previo para ZIP.
- El procesamiento conserva el contrato actual de Gateway por job. Hasta que
  exista contrato multiarchivo real, si hay varios archivos seleccionados se
  avisa que el primer archivo seleccionado sera el que se envie al job.

Este ajuste mantiene la regla de producto: el usuario trabaja en un espacio
documental inteligente y no en formularios separados por herramienta.

## Ajuste Workspace contextual 2026-06-01

`/workspace` queda como una superficie universal, no como una vista exclusiva
de PDF. El flujo esperado es:

```text
Archivo activo
-> detectar tipo documental
-> resolver document-mode o archive-mode
-> mostrar solo herramientas compatibles
-> configurar accion
-> ejecutar Gateway
-> mostrar job, error o descarga
```

Reglas UX:

- PDF conserva preview por paginas, seleccion, secciones y herramientas de
  pagina permitidas.
- Word, imagen, Excel, CSV y XML usan `document-mode` contextual mientras no
  exista visor real por tipo; la pantalla debe decir que la miniatura avanzada
  esta pendiente y no debe simular paginas reales.
- ZIP, RAR y 7Z usan `archive-mode`; el usuario debe entender que son contenedores,
  no documentos para dividir, convertir o comprimir directamente.
- ZIP puede ejecutar `zip-extract`; las demas acciones de archivo comprimido se
  muestran como pendientes si ayudan a explicar el roadmap, pero no se aplican.
- RAR queda bloqueado hasta tener procesador real.
- El drawer de herramientas debe explicar por que una accion esta pendiente en
  vez de permitir que falle como si fuera ejecutable.
- El boton Aplicar solo queda habilitado si la herramienta esta en estado
  ejecutable y existe archivo local disponible para enviar al Gateway.

## Sistema visual de bloques documentales 2026-06-01

El Workspace debe ayudar a identificar donde inicia y termina cada documento
dentro de un trabajo PDF grande. Las secciones visuales existentes funcionan
como bloques documentales locales y no deben formar parte del PDF final hasta
que exista exportacion backend confirmada.

Reglas UX:

- Cada bloque tiene color propio, nombre, rango de paginas y contador.
- Al inicio de cada bloque se muestra un separador visual.
- El separador intermedio usa dos colores: el bloque anterior y el bloque que
  inicia.
- Al final del ultimo bloque se muestra un separador de cierre.
- Cada pagina muestra una etiqueta/rail de bloque para no perder pertenencia al
  desplazarse.
- Con 1 a 4 bloques se usa modo expandido con etiquetas visibles.
- Con 5 o mas bloques se usa modo compacto para reducir saturacion visual.
- Un bloque fijado conserva informacion visible aunque el modo sea compacto.
- El usuario puede renombrar, cambiar color, fijar, fusionar con el bloque
  anterior o convertir todo en un documento.
- Las zonas de insercion existentes permiten crear nuevas divisiones
  documentales sin recargar el Workspace.
- Cuando existan varios bloques se muestra un mini mapa de colores para saltar
  rapidamente al bloque correspondiente.

Limites MVP:

- La reorganizacion y division son estado local del Workspace.
- La exportacion independiente por bloque requiere contrato backend
  multiarchivo/proyecto documental.
- El sistema no modifica binarios hasta ejecutar una herramienta Gateway.

## Ajuste de workspace especializado 2026-05-30

Cuando el usuario ya cargo archivos, `/upload` deja de mostrar el dropzone
principal. La pantalla cambia de proposito y se convierte en una estacion de
trabajo especializada:

```text
Herramientas compatibles | Vista del documento | Configuracion activa
```

Reglas aplicadas:

- Estado vacio: solo se muestra la zona de carga y las capacidades generales.
- Estado con archivos: desaparece el bloque central grande de carga.
- El boton para agregar mas archivos queda como control compacto dentro del
  workspace.
- Las herramientas compatibles se muestran en un rail izquierdo.
- La vista previa del documento queda en el centro.
- La configuracion de la herramienta activa queda en el panel derecho.
- `pdf-split` muestra opciones de configuracion profesionales: rango, paginas
  seleccionadas, cada X paginas, tamano, marcadores, una pagina por archivo y
  deteccion de separadores.
- El workspace conserva acciones sugeridas para continuar el flujo sin volver
  al inicio.

Esta regla aplica a PDF, Word, Excel, imagenes, OCR, ZIP y futuros modulos:
toda herramienta debe operar dentro de un workspace y no como pantalla aislada.

## Ajuste canvas PDF 2026-05-30

La experiencia de edicion PDF queda separada en dos superficies:

```text
/upload    -> preparacion de archivos y seleccion de accion compatible
/workspace -> edicion tipo canvas con preview central y herramientas bajo demanda
```

Reglas aplicadas:

- `/upload` no abre el workspace al cargar archivos.
- En estado vacio, `/upload` muestra una dropzone grande, clickeable y
  accionable.
- Cuando ya existen archivos, `/upload` oculta la dropzone grande, muestra la
  lista cargada, una dropzone compacta para agregar mas archivos y las acciones
  compatibles.
- Las etiquetas generales de formatos dejan de dominar la pantalla cuando ya
  hay archivos; el foco pasa a acciones compatibles.
- El workspace se abre solo cuando el usuario elige una accion.
- `/workspace` muestra header compacto, preview PDF central, miniaturas
  seleccionables, controles rapidos y barra inferior flotante.
- Las herramientas, configuracion, archivos, informacion y resultado se abren
  en drawers o controles bajo demanda.
- La configuracion de `pdf-split` incluye: rango, paginas seleccionadas, cada X
  paginas, tamano, marcadores, una pagina por archivo y deteccion de
  separadores.
- Despues de aplicar cambios, el usuario puede continuar con otra herramienta
  sin salir del workspace.

Pendiente tecnico:

- Renderizar miniaturas reales de PDF desde el archivo cargado. El MVP actual
  usa miniaturas renderizadas/conceptuales para validar estructura, flujo y
  layout sin introducir todavia un motor PDF en frontend.

## Regla de prioridad de preview 2026-05-30

La vista previa del documento siempre tiene prioridad sobre cualquier panel.

Si existe conflicto entre herramientas, configuracion, informacion y preview,
la preview gana. Los demas elementos deben colapsarse, ocultarse o convertirse
en overlays temporales.

Reglas aplicadas:

- Al entrar a una herramienta, la configuracion puede abrirse automaticamente
  para orientar la primera accion.
- Cuando el usuario interactua con paginas, zoom o area de trabajo, la
  configuracion debe colapsarse para liberar espacio.
- Debe existir un boton flotante de configuracion para volver a abrir el panel.
- Las herramientas se muestran como barra de iconos por defecto.
- La barra de herramientas puede expandirse por hover, focus, toque o fijarse
  si el usuario lo solicita.

## Correccion de acciones centralizadas 2026-05-30

Las herramientas del documento deben existir en un solo lugar centralizado.

Componentes activos:

| Componente | Ubicacion | Funcion | Activador | Contenido | Documento activo | Relacion |
|---|---|---|---|---|---|---|
| `ToolbarPrincipal` | Barra inferior flotante de `/workspace` | Accesos generales del workspace | Siempre visible con documento activo | Herramientas, configuracion, subir mas y resultado | Documento seleccionado | Activa drawers y paneles; no lista herramientas duplicadas. |
| `PanelAccionesDocumento` | Drawer izquierdo `Herramientas disponibles` | Lista unica de acciones documentales | Boton `Herramientas` de la barra principal | Dividir PDF, unir PDF, comprimir, PDF a Word, OCR, extraer imagenes, firmar y generar indice | Documento seleccionado | Reemplaza cualquier `tool-dock` o barra secundaria. |
| `PanelConfiguracionAccion` | Drawer derecho de configuracion | Parametros de la accion seleccionada | Seleccionar herramienta o boton `Configuracion` | Modo, rangos y opciones de la herramienta activa | Documento seleccionado | Depende de `PanelAccionesDocumento` y `selectedAction`. |
| `PanelArchivosWorkspace` | Drawer izquierdo de archivos | Ver, ordenar, eliminar o agregar archivos | Boton `Subir mas` | Lista de archivos cargados | Documento seleccionado o lista activa | No duplica acciones de herramienta. |
| `PanelResultado` | Drawer derecho de resultado | Mostrar salida y permitir continuar flujo | Boton `Resultado` o `Aplicar cambios` | Estado, descarga y usar otra herramienta | Documento seleccionado | Depende del job/resultado activo. |

Reglas aplicadas:

- No debe existir `tool-dock`, `tool-dock-pin` ni `tool-dock-item`.
- No se deben duplicar herramientas en barras laterales o flotantes.
- La fuente unica de acciones es la lista central `tools` del workspace.
- El estado unico de accion es `activeTool` y el panel visible es `drawer`.
- Toda accion actua sobre el documento seleccionado o activo.

## Estandar de acciones primarias DocuCore 2026-05-30

Toda accion que genera proceso, modificacion o resultado debe verse como boton
principal, no como texto plano ni tarjeta pasiva.

Acciones de nivel 1:

- Seleccionar archivos.
- Agregar mas archivos.
- Aplicar cambios.
- Procesar documento.
- Descargar resultado.
- Ejecutar OCR.
- Convertir archivo.
- Dividir PDF.
- Unir PDF.

Reglas visuales:

- Rojo corporativo DocuCore.
- Alto minimo de 48px.
- Icono visible.
- Texto en negrita.
- Hover y sombra suave.
- Misma familia visual para upload, workspace, acciones compatibles y
  resultado.

Regla de implementacion:

```text
PrimaryActionButton
```

Las acciones principales deben consumir el componente reutilizable de accion
primaria para evitar multiples estilos independientes dentro de DocuCore.

## Preview modular por tipo de archivo 2026-05-30

DocuCore no debe asumir que todos los archivos se previsualizan igual. La vista
previa se define por familia documental:

| Tipo | Preview esperado | Motor sugerido |
|---|---|---|
| PDF | Miniaturas por pagina, pagina activa, zoom, busqueda y seleccion de texto. | PDF.js como primera opcion MVP. |
| Word/DOCX | HTML temporal seguro, sin descargar archivo. | Mammoth.js o docx-preview. |
| Excel/CSV | Tabla HTML/JSON con selector de hojas, filtros y busqueda. | SheetJS. |
| Imagen | Imagen directa con zoom, rotacion, recorte y comparacion. | Render nativo + herramientas de imagen. |
| OCR | Vista dividida: documento/imagen y texto extraido. | Document API + motor OCR futuro. |
| ZIP | Arbol navegable de archivos internos. | Preview Service backend. |
| XML | XML original y vista estructurada. | Parser XML seguro backend/frontend. |
| TXT | Editor o tabla segun contenido. | Render texto/CSV seguro. |

Orden recomendado de implementacion:

1. PDF.js para PDF.
2. Imagenes.
3. Word con HTML temporal.
4. Excel/CSV como tabla.
5. OCR lado a lado.
6. ZIP navegable.
7. XML estructurado.

La infraestructura debe servir tambien a LexNova y otros proyectos porque el
preview vive en `API.PY.DJANGO.Document` y se consume por Gateway.

## Estandar de estados y acciones del workspace 2026-05-30

La pagina `/workspace` debe ejecutar acciones sobre un estado unico de
documento activo, sin duplicar controles ni bloquear la previsualizacion.

Estados obligatorios de pagina:

| Estado | Proposito | UI esperada |
|---|---|---|
| `idle` | No hay documento activo. | Redirigir al flujo de carga o mostrar accion principal de upload. |
| `metadata-loading` | DocuCore detecta tipo, peso y numero de paginas. | Header con nombre de archivo y skeleton de estructura. |
| `preview-loading` | Existe metadata y las paginas se renderizan progresivamente. | Placeholder por pagina y contador de paginas listas. |
| `page-ready` | Una pagina ya tiene preview utilizable. | Miniatura o render real seleccionable. |
| `page-error` | Una pagina no pudo cargarse. | Estado de error dentro de esa pagina, sin bloquear las demas. |
| `ready` | El documento esta disponible para trabajar. | Herramientas compatibles, configuracion y preview activa. |
| `applying` | Se ejecuta una accion. | Boton principal deshabilitado, job visible y preview conservada. |
| `result-ready` | Existe artefacto o resultado. | Drawer de resultado con descarga y siguiente accion. |
| `failed` | Fallo global de accion o job. | Error normalizado, reintento y datos de diagnostico. |

Acciones permitidas de pagina:

| Accion | Estado que modifica | Regla |
|---|---|---|
| `selectFiles` | `idle` -> `metadata-loading` | Viene desde `/upload`; no debe seleccionar herramienta antes del archivo. |
| `openToolsPanel` | `ready` | Abre la lista unica de acciones documentales. |
| `filterTools` | `ready` | Filtra por nombre, categoria, accion, sinonimo y compatibilidad documental. |
| `selectAction` | `ready` | Cambia `activeTool` y abre configuracion cuando aplique. |
| `selectPages` | `ready` | Cambia seleccion local sin bloquear render de paginas. |
| `applyChanges` | `ready` -> `applying` | Usa `PrimaryActionButton` y conserva contexto del documento. |
| `openResult` | `result-ready` | Muestra descarga y acciones posteriores. |
| `retryPagePreview` | `page-error` -> `preview-loading` | Reintenta solo la pagina fallida. |

Reglas del cuadro de herramientas:

- La barra inferior es compacta, basada en iconos y con tooltip/etiqueta por
  hover, focus o toque.
- La lista unica de herramientas vive en el drawer `Herramientas disponibles`.
- No se deben crear barras secundarias, rails duplicados ni accesos paralelos a
  las mismas acciones.
- La busqueda debe resolver coincidencia exacta, categoria, palabras clave y
  sinonimos de accion, por ejemplo `cortar`, `texto`, `reducir` o `firma`.
- Las herramientas visibles dependen del tipo documental y de la accion activa;
  PDF no debe mostrar de forma plana herramientas exclusivas de Excel, XML o
  ZIP.

Reglas de previsualizacion progresiva:

- Al tener metadata, la UI debe pintar todos los placeholders de paginas antes
  de terminar de renderizar previews reales.
- Cada pagina tiene estado independiente: `pending`, `loading`, `ready` o
  `error`.
- La pagina visible y las cercanas tienen prioridad de render.
- Si una pagina no puede cargarse, muestra preloader/error local y no bloquea
  herramientas, seleccion de paginas ni configuracion.
- El MVP puede usar miniaturas conceptuales mientras no exista motor PDF.js o
  endpoint real de preview; debe quedar marcado como deuda tecnica documentada.

## Implementacion frontend de miniaturas PDF 2026-05-30

La ruta `/upload` debe transferir el PDF seleccionado al workspace antes de
navegar a `/workspace`. Mientras no exista backend de preview por `file_id`, el
frontend usa una sesion local temporal:

```text
sessionStorage["docucore.workspace.document"]
```

Contenido minimo:

- `documentId`
- `fileName`
- `fileType`
- `extension`
- `size`
- `objectUrl`
- `createdAt`

Reglas aplicadas:

- `/upload` crea un `objectUrl` del archivo real seleccionado y lo registra en
  `sessionStorage` antes de abrir `/workspace`.
- `/workspace` lee esa sesion, valida que sea PDF y usa PDF.js para obtener el
  numero real de paginas.
- Las miniaturas se renderizan en canvas y se convierten a imagen de preview
  por pagina.
- Cada pagina conserva estado independiente `pending`, `loading`, `ready` o
  `error`.
- Si el usuario abre `/workspace` directamente sin PDF activo, se muestra error
  local y se indica volver a `/upload`.
- Esta implementacion es puente frontend MVP. Cuando Gateway entregue previews
  por `file_id`, debe sustituirse `objectUrl` por los endpoints documentados en
  `api-contracts.md`.

## Correccion de marcos adaptativos de preview 2026-05-30

Cada miniatura del workspace debe respetar la proporcion real de la pagina o
imagen previsualizada. No se permite usar un rectangulo fijo universal para
todas las paginas.

Metadata minima por pagina:

```ts
{
  page: 1,
  status: "ready",
  previewUrl: "data:image/webp;base64,...",
  width: 612,
  height: 792,
  sizeName: "Carta",
  orientation: "portrait"
}
```

Reglas aplicadas:

- PDF.js obtiene `width` y `height` reales con escala 1 antes de renderizar la
  miniatura.
- El frontend detecta tamano aproximado: A5, A4, Carta, Oficio, Legal o
  Personalizado.
- El frontend detecta orientacion: vertical, horizontal o cuadrada.
- El marco visual usa la proporcion real mediante `aspect-ratio`.
- La imagen renderizada usa `object-fit: contain` y `overflow: hidden` para no
  salirse del contenedor.
- Cada pagina muestra metadata visible, por ejemplo:

```text
Pagina 1
Carta | V
```

Pendiente:

- Mover esta metadata al contrato real de Gateway cuando exista preview por
  `file_id`.
- La metadata completa debe quedar en `title`, tooltip o panel contextual, no
  como texto permanente dentro de una miniatura pequena.

## Acciones rapidas por pagina 2026-05-31

Cada pagina del preview debe exponer acciones frecuentes sin obligar al usuario
a abrir otro panel ni salir del workspace.

Acciones visibles al pasar cursor, enfocar o seleccionar una pagina:

| Accion | Alcance | Estado MVP |
|---|---|---|
| Girar izquierda | Pagina seleccionada | Preparado en UI. |
| Girar derecha | Pagina seleccionada | Preparado en UI. |
| Extraer pagina | Pagina seleccionada | Preparado en UI. |
| Duplicar pagina | Pagina seleccionada | Preparado en UI. |
| Eliminar pagina | Pagina seleccionada con confirmacion futura | Preparado en UI. |
| Mas opciones | Menu avanzado por pagina | Preparado en UI. |

Reglas:

- La barra rapida aparece sobre la pagina en hover/focus o cuando la pagina ya
  esta seleccionada.
- Las acciones deben mantener la seleccion activa y mostrar retroalimentacion
  inmediata.
- Las acciones avanzadas futuras incluyen OCR por pagina, notas, etiquetas,
  marcadores, reordenamiento, descarga individual, recorte, correccion de
  inclinacion, mejora de contraste, firma, marca de agua y traduccion.
- Mientras no existan motores backend para modificar el PDF, la UI solo deja el
  estado preparado y no debe prometer descarga final real.

## Correccion de acciones compatibles en upload 2026-05-31

La seccion `Acciones compatibles` de `/upload` usa tarjetas de decision, no
botones de ejecucion inmediata.

Reglas obligatorias:

- Las tarjetas deben mantenerse blancas, con titulo oscuro, subtitulo gris,
  borde `#E5E7EB`, sombra suave e icono rojo DocuCore.
- El estado activo usa borde `var(--brand-primary)` o `var(--primary)` y fondo
  rojo muy claro, sin convertir la tarjeta en bloque rojo solido.
- Las acciones se ordenan por prioridad del tipo de archivo. Para PDF el orden
  preferente es: Dividir PDF, Unir PDF, Comprimir PDF, PDF a Word, OCR,
  Generar indice y Exportar PDF indexado.
- Las etiquetas de salida deben ser legibles para usuario final:
  `PDF -> ZIP`, `PDF -> PDF`, `PDF -> DOCX`, `Imagen -> Texto`,
  `PDF -> Indice` y `PDF -> PDF Indexado`.
- Si existen mas de seis acciones compatibles, la UI puede usar grid
  responsive o carrusel, siempre sin romper el layout mobile first.

## Correccion compacta de miniaturas PDF 2026-05-31

`pdf-thumb` debe ser una tarjeta compacta y accesible. La tarjeta no debe
contener un boton que a su vez contenga otros elementos con `role="button"` o
botones internos.

Estructura esperada:

```tsx
<article className="pdf-thumb">
  <button className="thumb-select" type="button">...</button>
  <div className="page-quick-actions">
    <button className="page-action" type="button">...</button>
  </div>
</article>
```

Reglas:

- Dentro de la miniatura solo se muestra `Pagina N`, metadata corta y un punto
  visual de estado.
- La imagen renderizada debe usar `object-fit: contain`, `overflow: hidden` y
  `aspect-ratio` calculado desde la pagina real.
- En tarjetas pequenas solo se muestran girar izquierda, girar derecha y mas
  opciones. Extraer, duplicar, eliminar, metadata, descargar, reemplazar,
  insertar, OCR, nota, etiqueta e importante viven en el menu.
- La eliminacion requiere confirmacion o undo antes de modificar el estado del
  workspace.
- Las rotaciones pueden aplicarse visualmente en frontend, pero la persistencia
  real queda pendiente del motor backend o contrato de job.

## Roadmap interactivo del workspace PDF 2026-05-31

El workspace de DocuCore adopta un modelo progresivo para manipulacion de
paginas y division de PDF. El frontend puede preparar y visualizar cambios,
pero el motor real de escritura de PDF sigue pendiente de contrato backend.

Orden funcional:

1. Estado individual por pagina: rotacion, modificacion, papelera y metadata
   visual.
2. Acciones rapidas: girar, copiar, cortar, pegar, duplicar, descartar,
   restaurar y marcar.
3. Reordenamiento: arrastrar y soltar paginas dentro del preview.
4. Menu avanzado por pagina: agrupa acciones destructivas, metadata, descargas,
   reemplazo, insercion y acciones futuras permitidas por feature gate.
5. Dividir PDF por modos MVP: paginas, bloques visuales y cada N paginas.
6. Bloques visuales: cada bloque tiene nombre, color y paginas asociadas.
7. Papelera reversible: descartar no elimina inmediatamente; las paginas se
   pueden ocultar, restaurar o eliminar permanentemente.
8. Seleccion avanzada: seleccion individual, presets, rangos escritos y
   acciones masivas.
9. Marcadores PDF nativos: pendientes hasta poder leer bookmarks embebidos del
   archivo real.
10. Division inteligente, OCR, capitulos y analisis semantico: fuera del MVP.

Reglas de estado:

- Una pagina rotada debe intercambiar ancho y alto para calcular su marco
  visual cuando la rotacion sea 90 o 270 grados.
- Toda pagina modificada debe mostrar una insignia breve: Girado, Copiado,
  Cortado, Pegado, Movido, Descartado, Importante o Etiqueta.
- Copiar no elimina la pagina original.
- Cortar no elimina la pagina original hasta que el usuario pega en una zona.
- Pegar limpia el portapapeles.
- Descartar manda la pagina a papelera reversible.
- OCR, marcadores automaticos y division inteligente no se muestran como
  acciones MVP si no existe motor backend real.

Modos de `Dividir PDF`:

| Modo | Uso | Estado MVP |
|---|---|---|
| Paginas | Seleccionar paginas por texto, rango o presets. | Implementado en frontend local. |
| Bloques visuales | Crear bloques con paginas seleccionadas, arrastre y separadores visibles. | Implementado en frontend local. |
| Cada N paginas | Crear bloques por intervalos simples de 5, 10 o 20 paginas. | Implementado en frontend local. |

Pendiente backend:

- Persistir operaciones reales de PDF: rotar, mover, cortar, pegar, duplicar,
  descartar y restaurar.
- Leer bookmarks PDF nativos cuando el archivo los tenga embebidos.
- Ejecutar OCR real por pagina o documento y devolver texto, confianza,
  bloques y errores cuando se reactive como fase futura.
- Generar propuesta inteligente real por paginas en blanco, QR, layout, texto
  personalizado e IA documental cuando exista contrato backend.

## Optimizacion ergonomica del workspace 2026-06-01

El workspace de documentos debe maximizar el area util del preview. La
prioridad visual es:

```text
Documento / preview
-> herramientas necesarias
-> informacion contextual
-> navegacion secundaria
```

Reglas aplicadas:

- `canvas-header` deja de ser un bloque alto y pasa a resumen compacto flotante
  con blur, nombre de archivo truncado, peso, paginas y seleccion.
- Las acciones frecuentes viven en `floating-toolbar`: herramientas,
  configuracion, seleccion, subir mas, informacion, resultado y aplicar
  cambios.
- `floating-toolbar` muestra solo iconos por defecto, usa `data-label` para
  tooltips y no debe generar scrollbar horizontal.
- Los accesos duplicados `config-fab` e `info-fab` no deben renderizarse cuando
  esas acciones ya estan disponibles en la barra inferior.
- Los controles de seleccion de paginas se mueven fuera de `pdf-toolbar` a un
  panel dedicado de `Seleccion`.
- `pdf-toolbar` queda como estado compacto de preview, sin controles de accion
  que roben altura al documento.
- `canvas-workspace` y `canvas-main` deben mantener `max-width: 100vw` y
  `overflow-x: hidden` para evitar desplazamiento lateral.
- `page-grid` ocupa el alto disponible del viewport con padding reservado para
  header y toolbar, manteniendo scroll interno solo para paginas.

Pendiente:

- Validar con captura visual Playwright en desktop y mobile cuando el entorno
  tenga navegador automatizado disponible.
- Definir si la toolbar inferior debe permitir atajo de teclado para cada
  accion frecuente.

## Cierre instruccion por instruccion 2026-06-01

Matriz de cumplimiento del agent ergonomico:

| Instruccion | Estado | Evidencia |
|---|---|---|
| Corregir `floating-toolbar` sin scrollbar horizontal | Cumplido | Toolbar fija centrada, `overflow: visible`, icon-only y `data-label` para tooltip. |
| Mover acciones superiores a barra inferior | Cumplido | Toolbar inferior contiene herramientas, configuracion, seleccion, subir mas, informacion, resultado y aplicar cambios. |
| Reducir `canvas-header` | Cumplido | Header compacto flotante con nombre truncado y resumen del documento; no contiene accion primaria duplicada. |
| Corregir `canvas-workspace` | Cumplido | Workspace ocupa `100dvh`, elimina marco externo y reserva espacio solo para overlays. |
| Optimizar `pdf-toolbar` | Cumplido | La toolbar del PDF queda como estado compacto de carga/preview; los controles de seleccion viven en panel dedicado. |
| Topbar de inicio de sesion | Cumplido | Topbar fija, semitransparente, compacta, con hover/focus y botones globales de login/registro. |
| Sidebar colapsable | Cumplido | Sidebar inicia oculta, se abre con pestaña lateral, soporta modo iconos, expansion por hover, pin y cierre con Escape. |
| Eventos de toolbar/sidebar/topbar | Cumplido MVP | Toolbar abre drawers; sidebar usa click/hover/pin/Escape; topbar abre modal global de login/registro y conserva el shell. |
| Regla contra duplicacion | Cumplido | No se renderizan ni quedan estilos activos para `page-controls`, `config-fab` o `info-fab`. |
| Layout final esperado | Cumplido | Topbar semitransparente arriba, sidebar por pestaña lateral, preview central y toolbar inferior sin scroll. |

Nota de alcance:

- `Aplicar cambios` sigue abriendo `Resultado` como confirmacion MVP porque el
  contrato backend para escribir PDFs modificados sigue pendiente.
- La validacion automatizada fue tecnica (`lint`, `build`, rutas y CSS). La
  validacion visual con captura Playwright queda como mejora de QA.

## Cierre MVP agents workspace PDF 2026-06-01

Se integraron en el frontend las fases activas del workspace PDF sin prometer
motores backend inexistentes.

| Fase | Estado frontend | Pendiente backend |
|---|---|---|
| OCR avanzado | Resultado OCR normalizado por pagina con motor primario, fallback, combinacion y confianza. | Conectar Tesseract/PaddleOCR reales desde Document API. |
| Acciones futuras por pagina | Acciones centralizadas en `PageActionConfig` dentro del menu de tres puntos. | Jobs reales para firma, marca de agua, traduccion, imagenes e insercion. |
| Secciones visuales | Leyenda, color por seccion, zonas `Dividir aqui`, colapsar/fusionar y vista previa por secciones. | Persistencia de proyecto y exportacion real por seccion. |
| Colores e identificacion | Bordes por seccion, estados visuales de OCR, descartado, firmado, marca, numerado, traducido y salida. | Guardar colores/preferencias por proyecto/usuario. |
| Papelera inteligente | Descartar no elimina; restaurar individual, restaurar masivo y eliminar permanente local. | Papelera persistente con auditoria. |
| Visibilidad de descartadas | Modos visible, compacta y oculta independientes del estado documental. | Guardar preferencia en perfil/proyecto. |
| Seleccion de paginas | Presets, rango manual, invertir seleccion y acciones masivas MVP. | Seleccion por arrastre y Shift completa con pruebas visuales. |
| Marcadores e indices | Marcadores manuales, navegacion por leyenda/seccion y base para division por marcadores. | Detectar bookmarks reales del PDF y OCR de titulos. |
| Division automatica | Sugerencias reversibles por regla, bookmarks, layout y OCR sin aplicar cambios automaticamente. | Detectores reales por paginas en blanco, QR, texto personalizado e IA documental. |

Regla de producto:

- Todo lo anterior es estado local frontend para revision y preparacion. La
  escritura real de PDF, OCR productivo, persistencia de proyecto y exportacion
  final deben ejecutarse por Gateway/Document API.

## Correccion de alcance del shell global 2026-06-01

El shell historico de DocuCore mantiene sidebar y header persistentes para las
rutas generales del producto. Los cambios solicitados para ocultamiento,
transparencia y navegacion compacta aplican solo al workspace documental.

Reglas aplicadas:

- El layout global conserva `shell` en dos columnas: sidebar compacta fija /
  sticky y contenido principal.
- La topbar global conserva posicion superior persistente dentro del flujo de
  la pagina, con fondo claro y borde inferior.
- La sidebar global inicia en modo iconos y puede expandirse por hover, focus o
  pin; no debe quedar oculta por defecto.
- El boton lateral de apertura (`sidebar-tab`) solo se renderiza en
  `/workspace`.
- Los estilos flotantes, translucidos y de ocultamiento se limitan a
  `.shell-workspace`.
- En `/workspace`, la sidebar puede iniciar oculta para maximizar la preview, y
  la topbar compacta flotante puede mantenerse transparente.
- Ninguna mejora del workspace debe modificar el comportamiento base de `/`,
  `/upload`, `/jobs`, `/history` u otras rutas generales.

Decision tecnica:

- `AppShell` detecta la ruta activa y agrega `.shell-workspace` solo en
  `/workspace`.
- Los selectores CSS del modo flotante quedan scopeados bajo
  `.shell-workspace` para evitar regresiones visuales globales.

Informacion faltante:

- No existe aun una prueba visual automatizada obligatoria para bloquear
  regresiones de shell global vs workspace. Se recomienda agregar captura de
  `/`, `/upload` y `/workspace` en el protocolo de QA visual.

## Workspace limpio a pantalla completa 2026-06-01

La ruta `/workspace` debe tratar el preview como superficie principal. La
informacion operativa no debe competir con las miniaturas.

Reglas aplicadas:

- `canvas-header` no se renderiza como bloque permanente dentro del workspace.
- `pdf-toolbar` no se renderiza encima del preview.
- `workspace-status-row` y `section-legend` no ocupan espacio permanente.
- La informacion de documento se abre desde el boton inferior `Documento`.
- El estado de miniaturas, carga e incidencias se abre desde el boton inferior
  `Estado`.
- La leyenda de bloques se abre desde el boton inferior `Bloques`.
- El area `page-grid` es el contenido principal visible de `pdf-stage`.
- `canvas-main`, `pdf-stage` y `page-grid` usan `overflow: visible`; el scroll
  vertical esperado es el del navegador.
- La barra inferior concentra herramientas, documento, estado, bloques,
  configuracion, seleccion, subir mas, resultado y aplicar cambios.
- Las zonas intermedias `section-split-zone` y `page-insert-zone` son guias
  delgadas, semitransparentes y de bajo peso visual. Solo resaltan por hover,
  focus, copia/corte o arrastre.

Decision tecnica:

- Se mantuvieron drawers existentes en vez de introducir un sistema nuevo de
  popovers, porque ya existian cierre por backdrop, foco visual y patron
  consistente con el workspace.
- Los agents de OCR, marcadores y division automatica quedan como pendientes
  si dependen de backend real. El MVP actual conserva solo bloques visuales,
  seleccion de paginas y cada N paginas.

Informacion faltante:

- Motor backend para aplicar escritura real de PDF.
- Persistencia real de proyecto de workspace.
- Pruebas visuales automatizadas para confirmar que el unico scroll vertical
  sea el del navegador en desktop y mobile.

## Borrador documental persistente 2026-06-01

El workspace debe conservar el avance del usuario aunque recargue la pagina,
cambie de ruta o vuelva desde `/upload`.

Reglas aplicadas:

- El nombre visible del trabajo pendiente es `Borrador documental`; no se usa
  `Trabajo sin nombre`.
- `/upload` revisa borradores locales y muestra `Continuar trabajo anterior`
  con nombre, herramienta, numero de paginas y fecha de ultima modificacion.
- Las acciones disponibles para cada borrador son Abrir, Duplicar, Renombrar y
  Eliminar.
- `/workspace` guarda automaticamente estado local ante cambios, navegacion,
  `beforeunload`, `visibilitychange` y `pagehide`.
- La navegacion desde la sidebar emite guardado antes de cambiar de ruta y
  muestra el toast `Trabajo guardado automaticamente.`
- La sidebar de `/workspace` se abre con la pestaña lateral, se mantiene abierta
  si hay interaccion y se cierra automaticamente si no hay actividad.
- Los datos pequenos del indice de borradores viven en `localStorage`.
- Los documentos cargados y el estado completo del borrador se guardan en
  `IndexedDB` como base local para futura sincronizacion con usuario.
- La recuperacion intenta restaurar archivo, paginas, seleccion, bloques,
  vista de descartadas, modo de trabajo y posicion de scroll.

Reglas de zonas de insercion:

- Las zonas entre paginas no se renderizan como tarjetas independientes.
- Cada pagina expone una guia vertical delgada en su borde derecho como punto
  de insercion, division, pegado y reordenamiento.
- La guia ocupa el alto util de la miniatura, se expande por hover/focus y
  muestra menu contextual con nueva pagina vacia, dividir, pegar, insertar PDF
  e insertar imagen.
- Copiar/cortar/arrastrar cambia el estado visual de las zonas.
- Al soltar o pegar se resalta la posicion durante dos segundos.
- Toda pagina modificada conserva borde/insignia de modificacion segun la
  accion preparada.

Pendiente backend:

- Persistir borradores en cuenta de usuario cuando exista autenticacion real.
- Sincronizar el indice local con proyecto remoto.
- Ejecutar insercion real de PDF/imagen y escritura final de PDF desde
  Gateway/Document API.

## Correccion de previews rotadas e insercion 2026-06-01

Las miniaturas PDF deben separar tarjeta, area clickeable, marco visual,
rotador interno y acciones flotantes para evitar que una pagina rotada rompa el
grid.

Reglas aplicadas:

- Cuando una pagina rota 90 o 270 grados, el frontend invierte ancho y alto
  para calcular la proporcion visual.
- La metadata corta y larga usa la orientacion visual final, no solo la
  orientacion original del PDF.
- `.paper-mini` reserva la proporcion visual y `.paper-rotator` rota el
  contenido interno con la proporcion original.
- La barra `page-quick-actions` queda oculta por defecto y se muestra solo por
  hover, focus, menu abierto o interaccion tactil.
- La seleccion de pagina no vuelve permanente la barra rapida.
- El check de seleccion permanece fijo en la tarjeta y no rota con la hoja.
- Las zonas `.smart-insertion-zone` usan variables de separacion para quedar
  centradas entre previews; tambien existen al inicio y al final del grid.
- El menu de insercion flota sobre la zona y no debe empujar el layout.
- Drag and drop se conserva sobre toda la tarjeta aunque la pagina este rotada.

Pendiente:

- Validacion visual manual en navegador con PDFs horizontales y verticales
  reales, incluyendo hover, focus y tactil.
- Prueba automatizada visual futura para casos de rotacion 90/270 e insercion
  entre pagina normal y pagina rotada.

## Menus flotantes del workspace 2026-06-01

Los menus de pagina e insercion del workspace deben comportarse como controles
flotantes de primer nivel, no como contenido interno de la miniatura.

Reglas aplicadas:

- Solo puede existir un menu flotante abierto a la vez.
- Los menus `page-menu` e `insertion-menu` se renderizan en un portal sobre
  `document.body` mediante una capa `floating-menu-layer`.
- La posicion se calcula desde el rectangulo real del boton o zona que abrio el
  menu y se ajusta a los bordes visibles del viewport.
- Los menus se cierran al hacer clic fuera, presionar `Escape`, hacer scroll,
  cambiar el tamano de ventana, iniciar arrastre, ejecutar una accion o abrir
  la sidebar del workspace.
- Las acciones del menu de pagina filtran opciones incompatibles con papelera
  o portapapeles: restaurar/eliminar permanente solo aparecen en descartadas y
  pegar solo aparece cuando hay contenido copiado o cortado.
- Las acciones del menu de insercion ejecutan hoja en blanco, nueva seccion,
  pegar, insertar PDF e insertar imagen sin mover el layout ni tapar el grid.
- La pestaña lateral `sidebar-tab` solo aparece cuando la sidebar del workspace
  esta oculta.
- El boton `Registrarme` conserva estado primario visible, hover/focus/active y
  disabled para evitar regresiones visuales en topbar.

Pendiente:

- Agregar prueba visual automatizada para z-index, cierre por eventos globales
  y posicionamiento en bordes superior/inferior del viewport.
- Confirmar manualmente en navegador con PDF real que los menus flotantes no se
  recortan en desktop, tablet y mobile.

## Regla estricta de rotacion PDF 2026-06-01

La rotacion de miniaturas PDF no debe resolverse reduciendo artificialmente la
imagen. El layout debe adaptarse a la orientacion visual final.

Reglas aplicadas:

- La funcion pura `getPageVisualBox` normaliza rotacion y calcula dimensiones
  originales, dimensiones visuales, aspectos y orientacion visual.
- Para rotaciones 90 y 270 grados se intercambian ancho y alto: una pagina
  `1000 x 563` rotada a `270` se trata visualmente como `563 x 1000`.
- `.paper-mini` reserva el aspecto visual final mediante
  `--paper-visual-aspect`.
- `.paper-rotator` conserva el aspecto original y solo rota el contenido.
- No se permite usar `scale()` ni variables de ancho reducido como parche para
  hacer caber previews rotadas.
- `page-grid` usa flex wrap para permitir que las tarjetas reacomoden a sus
  vecinas segun el tamano visual real.
- El menu de tres puntos tiene altura maxima, scroll interno y z-index alto
  para no quedar debajo de previews ni salirse del viewport.

Validacion tecnica:

- `getPageVisualBox(1000, 563, 270)` devuelve `563 x 1000` y orientacion `V`.
- La busqueda local no debe encontrar `scale(`, `--paper-original-width`,
  `56.3` ni `--preview-aspect` en Workspace/CSS.

Pendiente:

- Validacion visual manual con PDF real rotando una pagina horizontal a 270
  grados y revisando hover, focus, cierre del menu y reacomodo del grid.

## Ancho real de previews rotadas 2026-06-01

La rotacion correcta de previews PDF tambien exige cambiar el ancho real de la
tarjeta cuando la pagina queda visualmente horizontal.

Reglas aplicadas:

- `getPageLayoutBox` extiende el calculo visual con `thumbWidthPx` y
  `thumbHeightPx`.
- El `article.pdf-thumb` recibe `--thumb-width` y cambia su `flex-basis`,
  `inline-size`, `min-inline-size` y `max-inline-size`.
- `.thumb-select` y `.paper-mini` usan el ancho completo de la tarjeta.
- `.paper-mini` usa `--thumb-preview-height` para mantener altura visual
  coherente por orientacion.
- Las paginas visualmente horizontales se vuelven mas anchas; las verticales
  conservan ancho base y crecen en altura.
- En rotaciones 90/270, `.paper-rotator` toma como ancho el alto visual del
  preview para que al rotar ocupe el contenedor real sin usar escalas.
- Queda prohibido corregir este caso con `scale()`, `width: 56%`,
  `--paper-rotator-ratio`, `--paper-original-width` o anchos artificiales.

Validacion tecnica:

- `getPageLayoutBox(563, 1000, 90)` devuelve orientacion `H`, ancho `302px` y
  alto `170px` con base `170`.
- `getPageLayoutBox(1000, 563, 270)` conserva ancho `170px` y alto `302px` al
  quedar vertical.

Pendiente:

- Validar manualmente en navegador que al rotar pagina 3 a horizontal el DOM
  tenga `articleWidth > ancho de pagina vertical` y `paperWidth > paperHeight`.

## Altura real de previews horizontales 2026-06-01

Una pagina visualmente horizontal debe ser mas ancha y tambien mas baja. No
debe conservar el alto de una tarjeta vertical ni empujar la metadata hacia
abajo.

Reglas aplicadas:

- `page-grid` usa `align-items: flex-start` para permitir alturas distintas por
  tarjeta sin estirar la fila.
- `.pdf-thumb` usa `block-size: auto`, `height: auto`,
  `min-block-size: auto` y `min-height: auto`.
- `.thumb-select` usa altura automatica, `min-block-size: unset` y filas
  compactas para preview, titulo, metadata, badge y estado.
- `.paper-mini` usa exactamente `--thumb-preview-height` como `block-size`,
  `height` y `max-block-size`.
- `.paper-mini` y `.paper-viewport` usan `overflow: hidden` para evitar que la
  imagen rotada invada tarjetas vecinas.
- Las paginas horizontales fuerzan visibilidad de titulo, metadata, badge y
  punto de estado inmediatamente debajo del preview.
- No se permiten `min-height` fijos en `.pdf-thumb`, alturas fijas en
  `.thumb-select`, padding inferior grande ni `align-self: stretch` para las
  tarjetas horizontales.

Pendiente:

- Validar manualmente en navegador que la pagina horizontal tenga menor altura
  visual, metadata visible y sin espacio vacio grande debajo de la imagen.

## Fila estable y centrado de preview horizontal 2026-06-01

Las paginas horizontales rotadas deben centrarse dentro de su marco sin alterar
la altura normal de las paginas verticales de la misma fila.

Reglas aplicadas:

- `page-grid` conserva `display: flex`, `flex-wrap: wrap` y
  `align-items: flex-start`.
- `.thumb-select`, `.paper-mini`, `.paper-viewport` y `.paper-rotator` usan
  flex para centrar la hoja dentro del marco.
- `.paper-mini` y `.paper-viewport` mantienen `overflow: hidden`; la imagen no
  debe salirse del borde de preview.
- En paginas rotadas 90/270, `.paper-rotator` intercambia dimensiones:
  `inline-size: var(--thumb-preview-height)` y
  `block-size: var(--thumb-width)`.
- En paginas rotadas 90/270, la imagen usa altura completa del rotador,
  `inline-size: auto`, `max-inline-size: none` y `object-fit: contain`.
- `.pdf-thumb.is-landscape .thumb-select` centra el contenido verticalmente y
  `.paper-mini` mantiene margen inferior corto para que metadata y badge sigan
  visibles.
- No se modifica la altura de paginas verticales para compensar horizontales.

Pendiente:

- Validar manualmente en DOM con PDF real que `imgInsideX` e `imgInsideY` sean
  verdaderos y que las paginas vecinas conserven su altura normal.

## Normalizacion logica por filas de preview 2026-06-01

El ajuste de previews rotadas no debe depender solo de CSS global. El workspace
normaliza cada fila despues del render para que las paginas verticales de la
misma fila compartan el alto visual de la vertical mas alta, mientras las
horizontales se centran sin deformar la fila.

Reglas aplicadas:

- `DocumentWorkspacePreview` calcula filas logicas agrupando `.pdf-thumb` por
  `offsetTop`.
- Antes de agrupar, cada miniatura limpia `--row-preview-height` para evitar
  arrastrar medidas obsoletas despues de rotar, reordenar u ocultar paginas.
- Cada fila calcula el mayor `offsetHeight` de `.paper-mini` entre paginas
  `is-portrait`.
- Si la fila tiene paginas verticales, todas las miniaturas de esa fila reciben
  `--row-preview-height`.
- `.thumb-select` usa `min-block-size:
  calc(var(--row-preview-height, var(--thumb-preview-height)) + 92px)` para
  reservar espacio estable para preview, titulo, metadata, badge y estado.
- La normalizacion corre despues del render, al cambiar paginas visibles, al
  redimensionar ventana y cuando carga una miniatura.
- `.paper-mini` y `.paper-viewport` mantienen `overflow: hidden`; la imagen
  rotada debe verse completa dentro del marco.

Pendiente:

- Validar manualmente en navegador con PDF real que la imagen rotada no pierda
  izquierda/derecha/arriba/abajo y que las paginas verticales de la fila no se
  deformen.

## Viewport exacto para previews rotadas 2026-06-01

El preview rotado debe verse completo dentro del marco visible. La solucion no
puede depender de `overflow: visible`, `scale()` ni de reducir artificialmente
la imagen.

Reglas aplicadas:

- La estructura obligatoria de preview es `paper-mini` -> `paper-viewport` ->
  `paper-rotator` -> `img`.
- `.paper-mini` mide exactamente `--thumb-width` por
  `--thumb-preview-height`, sin padding interno que reduzca el viewport real.
- `.paper-viewport` ocupa 100% del marco y conserva `overflow: hidden`.
- Para 90 y 270 grados, `.paper-rotator` invierte dimensiones:
  `inline-size: var(--thumb-preview-height)` y
  `block-size: var(--thumb-width)`.
- Para 0 y 180 grados, `.paper-rotator` usa `inline-size:
  var(--thumb-width)` y `block-size: var(--thumb-preview-height)`.
- La imagen siempre usa `object-fit: contain` dentro del rotador y no usa
  `max-width`/`max-height` como limite falso que recorte al rotar.
- Se conserva metadata, numero de pagina, insignia de cambio y punto de estado
  fuera del rotador.

Validacion tecnica:

- `npm run lint` aprobado.
- `npm run build` aprobado.
- Pruebas puras de layout de miniaturas aprobadas.
- Busqueda local sin `scale()`, anchos `56%` ni variables de parche.

Pendiente:

- Validacion visual manual con PDF real en navegador para confirmar que
  `imgBox` queda dentro de `.paper-viewport` en izquierda, derecha, arriba y
  abajo para 90, 180 y 270 grados.

## Altura exacta de previews verticales 2026-06-01

La altura de una pagina vertical debe salir de su aspecto visual real, no de la
altura mayor de toda la fila.

Reglas aplicadas:

- `getPageLayoutBox` calcula `thumbWidthPx` y `thumbHeightPx` desde
  `visualWidth` y `visualHeight`.
- Para una pagina vertical, el ancho base se mantiene en `170px` y la altura
  se calcula como `Math.round(170 * (visualHeight / visualWidth))`.
- Para una pagina horizontal, el ancho crece segun proporcion y la altura base
  se mantiene compacta.
- `--row-preview-height` puede reservar espacio y centrar previews de menor
  altura dentro de su fila, pero no define la altura de `.paper-mini`.
- `.paper-mini` usa siempre `height`, `min-height` y `max-height` con
  `--thumb-preview-height`.
- Si una pagina es mas baja que la mayor de su fila, se centra con
  `margin-block-start` calculado desde la diferencia de fila, sin estirar el
  preview.

Validacion tecnica:

- `getPageLayoutBox(639, 1000, 0)` devuelve ancho `170px` y alto `266px`.
- La suite `page-visual-box.test.ts` cubre 7 casos de rotacion, orientacion y
  proporcion visual.

Pendiente:

- Agregar prueba visual automatizada que mida `getBoundingClientRect()` de
  `.paper-mini`, `.paper-viewport` e `img` en un PDF real con paginas mixtas.

## Correccion de marco y tarjeta de preview 2026-06-01

La tarjeta de una pagina PDF no puede medir lo mismo que el viewport real del
documento si tambien tiene padding, borde lateral de seccion, check de
seleccion y zonas de insercion. Esa configuracion provoca desbordes laterales
en paginas verticales y deja el marco horizontal pegado a la imagen.

Reglas aplicadas:

- `--thumb-width` y `--thumb-preview-height` representan el viewport real de
  la pagina renderizada.
- `.paper-mini` representa el marco visual y agrega padding interno propio sin
  cambiar el tamano del viewport.
- `.paper-viewport` ocupa el contenido util de `.paper-mini`; ahi vive la hoja
  real, sin recortes ni `scale()`.
- `.pdf-thumb` usa un ancho de tarjeta mayor que `--thumb-width` para reservar
  padding, borde y marco.
- Las paginas verticales no deben desbordar el borde rojo/naranja de la
  tarjeta.
- Las paginas horizontales deben mostrar aire entre imagen y marco sin reducir
  artificialmente la miniatura.
- La separacion visual debe lograrse ampliando tarjeta y marco, no achicando
  la pagina renderizada.

Validacion esperada:

- En vertical, `.paper-mini` queda contenido dentro de `.pdf-thumb`.
- En horizontal, la imagen no queda pegada al borde del marco.
- La metadata, insignia y punto verde quedan centrados bajo el preview.
- Las zonas de insercion no invaden la imagen ni el bloque de detalles.

## Correccion de selector e insercion entre previews 2026-06-01

La preview del workspace debe conservar controles de pagina predecibles aunque
la pagina no este seleccionada y aunque existan paginas verticales y
horizontales mezcladas.

Reglas aplicadas:

- El selector de pagina se mantiene visible en estado neutro gris cuando la
  pagina no esta seleccionada.
- El selector cambia a verde solo cuando la pagina queda seleccionada.
- La guia de insercion entre paginas debe centrarse con base en el espacio real
  medido entre tarjetas de la misma fila, no solo con el `page-gap` teorico.
- La guia de insercion no debe pegarse al borde de una tarjeta ni invadir el
  marco de la pagina vecina.
- El marco de preview debe ser delgado: suficiente para separar hoja y tarjeta,
  pero sin crear un margen pesado alrededor de la imagen.
- El ajuste de marco no debe reducir artificialmente la imagen renderizada ni
  usar `scale()`.

Validacion esperada:

- Entre dos paginas, la barra azul queda visualmente centrada en el canal entre
  tarjetas.
- Paginas no seleccionadas muestran selector gris y paginas seleccionadas
  muestran selector verde.
- El marco de cada imagen queda mas compacto sin que la miniatura desborde en
  paginas verticales ni quede pegada en paginas horizontales.

## Correccion de shell, sidebar y pestaña Workspace 2026-06-01

La navegacion principal de DocuCore debe mantenerse legible por encima del
contenido operativo sin que el header la recorte cuando la sidebar se expande.
En Workspace, la pestaña que abre la sidebar oculta debe verse como un control
centrado y no como una barra incompleta.

Reglas aplicadas:

- En rutas normales, la sidebar debe ser fija para que el usuario siempre pueda
  acceder a la navegacion al desplazarse.
- En rutas generales como `/`, la sidebar expandida debe tener prioridad visual
  sobre el header para no quedar cortada por la topbar.
- La topbar conserva posicion sticky, no fija global, para acompanar el flujo
  sin competir con la sidebar ni bloquear contenido.
- `/workspace` es la excepcion: su sidebar puede ocultarse y funcionar como
  panel flotante para priorizar el canvas documental.
- En `/workspace`, el boton lateral `sidebar-tab` debe centrar su icono vertical
  y horizontalmente dentro de la pestaña.
- La pestaña lateral solo abre la navegacion; no debe competir con controles de
  pagina, menus flotantes ni preview del documento.

Validacion esperada:

- En `/upload`, `/jobs`, `/history` y rutas generales, la sidebar se mantiene
  fija durante el scroll.
- En Home, al expandir la sidebar, el panel se ve completo desde arriba hasta
  abajo y no queda cubierto por el header.
- En Workspace, la pestaña lateral muestra el icono centrado dentro del boton.

## Centrado vertical de previews horizontales 2026-06-01

Las paginas horizontales deben ser faciles de distinguir dentro de una fila con
paginas verticales. No deben estirarse hasta ocupar toda la altura de la fila,
pero tampoco deben quedar pegadas arriba con todo el hueco visual abajo.

Reglas aplicadas:

- `.pdf-thumb.is-landscape` se centra verticalmente dentro de la fila flex.
- La tarjeta horizontal conserva altura compacta y no hereda la altura completa
  de las paginas verticales vecinas.
- La metadata de pagina, orientacion, badge y punto de estado siguen debajo del
  preview horizontal.
- Las guias de insercion permanecen asociadas a cada tarjeta y no se convierten
  en etiquetas verticales de fila completa.

Validacion esperada:

- En filas mixtas, la pagina horizontal queda visualmente centrada respecto a
  las paginas verticales.
- El usuario puede detectar rapidamente cuales previews son horizontales por su
  tarjeta compacta.

## Proyectos documentales en Upload 2026-06-01

La pantalla `/upload` no debe presentar borradores como documentos sueltos
repetidos. Debe tratarlos como proyectos documentales recientes, porque el
usuario vuelve a un trabajo completo: documentos, paginas, accion activa,
workspace, modificaciones y siguiente paso.

Modelo funcional MVP:

```text
Proyecto documental
-> Documentos
-> Workspace
-> Historial local
-> Jobs futuros o ejecuciones reales
```

Reglas aplicadas:

- `/upload` muestra tarjetas de proyecto documental en `Continuar trabajos
  anteriores`.
- Cada tarjeta muestra nombre del proyecto, estado, paso actual, accion
  pendiente, cantidad de documentos, paginas y fecha de ultima actualizacion.
- Los documentos internos se muestran dentro de la tarjeta del proyecto, no
  como filas principales independientes.
- Abrir, duplicar, renombrar y eliminar operan sobre el proyecto/borrador.
- Los borradores antiguos que solo tengan `name`, `tool` y `pageCount` se
  normalizan como proyecto de un documento para no romper recuperacion local.
- `Workspace` guarda en el resumen local `status`, `currentStep`,
  `documentCount` y `documents` como puente MVP.
- `/jobs` queda reservado para ejecuciones reales, historial, resultados y
  descargas; no reemplaza la lista de proyectos recientes de `/upload`.

Diferencia obligatoria:

```text
Proyecto documental = agrupacion editable de documentos y modificaciones.
Job = ejecucion concreta de una accion sobre un proyecto o documento.
```

Pendiente backend:

- Crear contrato productivo `Project`/`DocumentProject` si DocuCore requiere
  persistencia remota por usuario.
- Definir si eliminar proyecto es archive o hard delete.
- Definir si duplicar proyecto duplica binarios o solo referencias.
- Relacionar `Document.FileProcessingJobs` con `project_id` cuando existan
  jobs multiarchivo o ejecuciones de larga duracion.

## Gate MVP de vistas y herramientas 2026-06-01

DocuCore debe salir con un MVP enfocado en herramientas con backend real. Las
capacidades documentales avanzadas se documentan como vision de producto, pero
no deben ejecutarse ni verse como listas para usar.

Reglas aplicadas:

- `feature-gates.ts` es la fuente frontend para decidir que herramienta, vista
  o accion se puede usar.
- El dashboard puede mostrar tarjetas aplazadas como `Proximamente` para
  validar interes, sin abrir procesos.
- `/upload` filtra herramientas no ejecutables antes de calcular acciones
  compatibles.
- `/workspace` filtra herramientas internas del drawer y acciones de pagina
  futuras.
- La navegacion global oculta vistas que no sean `released` o `mvp` publicas.
- El acceso directo por URL puede existir para desarrollo, pero no debe
  prometer disponibilidad publica ni iniciar jobs sin backend.

Bloqueado por ahora:

- OCR por pagina, OCR por lotes y OCR por regiones.
- Generacion de indices, PDF indexado y busqueda documental.
- IA documental, clasificacion, resumen y extraccion estructurada.
- Firma, marca de agua, numeracion, traduccion y extraccion de imagenes como
  acciones de pagina.
- Integraciones cloud, portal API publico, workflows OCR e insercion externa
  de PDF/imagen.

Pendiente:

- Conectar JobCron/FeatureAvailability productivo con permisos por usuario,
  ambiente y pais.
- Agregar pruebas de UI que confirmen que herramientas aplazadas no aparecen
  en `/upload` ni en el drawer de `/workspace`.

## Arquitectura visual Workspace 2026-06-05

El Workspace debe priorizar el documento y separar claramente navegacion,
herramientas y configuracion. Cuando el usuario ya esta en `/workspace`, la
navegacion global queda como excepcion colapsable del shell y no debe competir
con el area de trabajo documental.

Reglas aplicadas:

- La cabecera del Workspace es compacta y muestra solo estado operativo:
  documento activo, paginas, bloques, previews listas y estado de guardado o
  proceso.
- Las herramientas compatibles viven en un rail izquierdo propio del Workspace.
  Este rail no reemplaza la navegacion global; solo cambia la herramienta
  activa del documento.
- La configuracion de la herramienta activa vive en un panel derecho
  persistente. No debe repetirse como toolbar por pagina ni como lista flotante
  permanente sobre el documento.
- El centro queda reservado para la preview y las miniaturas. Los paneles
  secundarios de documento, estado, bloques, seleccion, archivos, informacion y
  resultado se abren bajo demanda.
- La barra inferior queda limitada a accesos secundarios y accion de aplicar;
  no debe duplicar la lista de herramientas ni la configuracion principal.
- En pantallas estrechas, el rail puede compactarse como tira horizontal y la
  configuracion puede colapsarse para no tapar la preview.

Validacion esperada:

- `/workspace` muestra tres zonas reconocibles: herramientas, documento y
  configuracion.
- El documento conserva mas area util que los controles.
- No hay herramientas repetidas por cada pagina.
- Las herramientas no ejecutables siguen bloqueadas por `feature-gates.ts` y
  por el mapa de compatibilidad del Workspace.

Pendiente:

- Agregar prueba visual automatizada desktop/mobile para medir que el rail,
  panel derecho, header compacto y barra inferior no se solapan.
- Definir comportamiento completo de configuracion colapsada en mobile si se
  requiere operar herramientas complejas desde telefono.

## Workspace multi-documento y configuracion simple 2026-06-05

El Workspace debe permitir que un proyecto local contenga varios documentos sin
reemplazar el documento anterior. Cada archivo agregado desde Upload o desde el
drawer de Archivos recibe `documentId` propio, se conserva en IndexedDB y se
registra con `requestId` en consola tecnica del navegador hasta que exista log
remoto de proyecto documental.

Reglas aplicadas:

- El documento activo es el unico que se renderiza en el area central.
- El selector de documentos aparece cuando el proyecto tiene dos o mas
  documentos.
- Las herramientas se ejecutan solo sobre el archivo activo, salvo que el
  contrato de herramienta soporte multiarchivo.
- Agregar archivos desde Workspace no debe crear automaticamente otro proyecto;
  debe sumar documentos al proyecto local abierto.
- El panel derecho de configuracion puede ocultarse y recuperarse con un boton
  visible. Al ocultarse, el area central usa el espacio disponible.
- El zoom de previews afecta solo miniaturas, no la interfaz completa. Rango
  permitido: 60% a 180%, default 100%, persistido en `localStorage`.
- El panel derecho no debe generar scroll horizontal. Sus controles deben
  ajustarse al ancho disponible.

Configuracion visible de `Dividir PDF`:

- Dividir por rango de paginas.
- Extraer paginas seleccionadas.
- Separar cada pagina en un PDF.
- Dividir cada N paginas.

Los eventos internos, `requestId`, nombres tecnicos, portapapeles, bloques
visuales y logs no deben mostrarse en el panel de usuario. Esa informacion
pertenece a consola tecnica, diagnostico admin u Observability.

Pendiente:

- Persistir proyectos/documentos multiarchivo en backend cuando exista contrato
  productivo de proyecto documental.
- Agregar prueba visual automatizada que cubra selector multi-documento, panel
  oculto/visible y zoom en desktop/mobile.

## Layout aislado del Workspace 2026-06-05

El Workspace debe vivir como superficie aislada dentro de DocuCore. Sus headers,
paneles, zoom, pestañas flotantes, rail de herramientas y configuracion no
deben modificar ni depender de reglas globales usadas por Upload, Jobs,
History, Results, Home o Landing Pages.

Reglas aplicadas:

- En `/workspace`, la topbar global del shell no se renderiza. La barra unica
  superior pertenece al Workspace y contiene el contexto operativo dinamico.
- `workspace-status-header` queda dentro de `workspace-root` y no usa
  `position: fixed`.
- `workspace-body` usa grid interno:
  `herramientas | documento | configuracion`.
- Cuando la configuracion esta oculta, el grid elimina la columna derecha y el
  documento ocupa el espacio disponible.
- El rail de herramientas y el panel de configuracion ya no flotan sobre la
  preview cuando estan fijados.
- La configuracion se controla desde una pestaña lateral siempre disponible.
- El zoom se abre desde una segunda pestaña lateral y aparece como popover
  temporal; no ocupa espacio permanente ni cambia el tamaño de toda la UI.
- Los separadores de bloque quedan compactos y proporcionales a las previews.
  Sus acciones secundarias solo aparecen en hover o foco.
- Las reglas CSS nuevas del layout estan encapsuladas bajo
  `.shell-workspace` y clases `workspace-*`.

Validacion esperada:

- En `/workspace`, la topbar global no se encima con el header del documento.
- El panel derecho no tapa previews cuando esta fijado.
- Las pestañas de configuracion y zoom quedan visibles en el lado derecho del
  area documental.
- No hay scroll horizontal en el panel de configuracion.
- Upload, Results, Jobs, History y Home conservan su layout previo.

Pendiente:

- Prueba visual automatizada con captura desktop/mobile para confirmar que no
  hay encimamientos entre topbar, header, rail, preview, tabs y panel derecho.

## Vista completa de proyecto documental en Workspace 2026-06-05

Cuando un proyecto contiene dos o mas PDF, el area central del Workspace debe
mostrar todos los documentos del proyecto en el mismo canvas. Las pestañas
superiores indican documento activo para acciones, pero no deben ocultar los
demas documentos del proyecto.

Reglas aplicadas:

- Cada pagina de preview conserva `documentId`, nombre de documento y numero de
  pagina interno.
- Cada PDF se renderiza como bloque documental propio con separador visible.
- El separador marca el inicio del documento y muestra el rango de paginas de
  ese PDF dentro del proyecto.
- Las miniaturas muestran el numero de pagina interno del PDF, no solo el
  indice global del proyecto.
- El documento activo sigue definiendo el archivo que se envia a herramientas
  de backend que aun no soportan multiarchivo.
- La vista completa del proyecto no debe crear un proyecto nuevo ni reemplazar
  documentos anteriores.

Pendiente:

- Definir contrato backend multiarchivo para aplicar herramientas sobre varios
  documentos al mismo tiempo cuando la herramienta lo soporte.

## Pestañas Tools y Zoom del Workspace 2026-06-05

El Workspace no debe mostrar dos barras verticales encimadas en el borde del
area documental. La navegacion de herramientas y el control de zoom se tratan
como pestañas alternas.

Reglas aplicadas:

- `Tools` es la pestaña/barra visible por defecto.
- El control de zoom permanece oculto hasta que el usuario presiona la pestaña
  de zoom.
- Al abrir zoom, la barra de Tools permanece visible; solo aparece el popover
  con herramientas de zoom.
- Mientras el usuario mueve el slider o botones de zoom, el control permanece
  visible.
- Si no hay interaccion con el zoom durante el tiempo de inactividad definido,
  el slider se oculta sin cambiar la pestaña activa de Tools.
- El ultimo porcentaje de zoom usado se guarda localmente y se restaura al
  volver a abrir el workspace en otra sesion del navegador.
- Las pestañas se ubican dentro del contexto de Workspace y no deben encimarse
  con la sidebar global ni con el rail de herramientas.

Validacion esperada:

- En `/workspace`, Tools y Zoom no aparecen como dos barras simultaneas una
  encima de otra.
- Abrir Zoom no oculta Tools.
- Cerrar Zoom o esperar inactividad solo cierra el popover de zoom.
- Recargar o volver a abrir el workspace conserva el ultimo zoom usado por el
  usuario.

## Barra superior unica de Workspace 2026-06-05

El Workspace debe tener una sola barra superior. No debe renderizar una topbar
global adicional ni una segunda subbarra documental. El contenido visible de la
barra cambia segun el estado del area de trabajo y el documento activo.

Reglas aplicadas:

- En `/workspace`, la topbar global del shell se omite.
- `workspace-status-header` es la unica barra superior.
- La barra muestra contexto dinamico: nombre del workspace, estado de proceso,
  documento activo, paginas, documentos y estado de guardado o proceso.
- La barra conserva acciones de cuenta (`Iniciar sesion` y `Registrarme`)
  dentro del mismo header para permitir guardar o recuperar trabajo sin crear
  una segunda topbar.
- Si el usuario activa una herramienta o proceso, el texto principal puede
  cambiar para orientar la accion actual.
- El nombre del documento se muestra en una sola linea con elipsis si no cabe.
- Las metricas de paginas, documentos y estado se muestran como pills
  compactas en la misma fila.
- La barra no debe crecer mas que lo necesario; la preview conserva prioridad
  de espacio.
- Esta regla aplica solo bajo `.shell-workspace` para no modificar Upload,
  Jobs, History, Home ni otras rutas.

Validacion esperada:

- En `/workspace`, existe una sola barra superior visible.
- No queda espacio reservado para una topbar inexistente.
- No hay solape entre la barra superior, pestañas flotantes, tools, zoom ni
  preview.

## Orden ergonomico de controles laterales Workspace 2026-06-05

El Workspace separa controles por responsabilidad para evitar que zoom,
configuracion y herramientas compitan por el mismo borde visual.

Reglas aplicadas:

- El borde izquierdo pertenece a los modos de trabajo del documento.
- `Tools` y `Zoom` se muestran como dos pestañas compactas del mismo grupo.
- `Tools` permanece activo y visible por defecto.
- Al abrir `Zoom`, el rail de herramientas se oculta temporalmente y el popover
  de zoom queda anclado al grupo izquierdo.
- Si el usuario cierra `Zoom` o deja de interactuar con el control, vuelve
  `Tools`.
- La configuracion de la herramienta activa no vive en el grupo izquierdo; se
  controla desde una pestaña derecha asociada al panel de configuracion.
- La pestaña derecha debe permanecer disponible aunque el panel este oculto.
- La pestaña que abre la sidebar global no forma parte del rail de
  herramientas; debe quedar anclada al borde del canvas y fuera del flujo de
  botones `Tools`.
- La sidebar global y el rail de herramientas se comportan como estados
  alternos de la misma bahia izquierda: al abrir sidebar se oculta `Tools`, y
  al cerrarse o auto-ocultarse vuelve `Tools`.
- La bahia izquierda conserva siempre el mismo ancho para evitar que las hojas
  del preview se reacomoden al cambiar entre navegacion, herramientas o zoom.
- La transicion entre sidebar y toolbar se controla con dos pestañas visibles
  del mismo selector lateral: navegacion y herramientas. La pestaña activa debe
  marcarse visualmente.
- Las dos pestañas del selector lateral se muestran en vertical. La pestaña
  seleccionada queda visualmente al frente y la inactiva aparece mas opaca.
- Las pestañas no deben tener contenedor flotante independiente. Cada pestaña
  debe verse como una extension del rail activo, con el mismo fondo, borde y
  transicion de la barra.
- La pestaña inactiva debe quedar parcialmente sumida dentro de la bahia
  izquierda. Solo la pestaña activa sobresale completamente.
- Al ocultarse o mostrarse una barra lateral, la pestaña debe animarse junto
  con la barra para evitar que parezca un elemento fijo separado.
- Si la sidebar se expande, el selector lateral debe desplazarse con el borde
  derecho de la sidebar para conservar la lectura de una sola pieza.
- Cuando la sidebar esta abierta, la pestaña de herramientas permite invertir
  el estado sin dejar controles encimados.
- Ninguna pestaña lateral debe tapar botones de herramienta, el preview, la
  barra superior unica ni la sidebar global.

Validacion esperada:

- La configuracion aparece del lado derecho del Workspace.
- El lado izquierdo no muestra tres controles amontonados.
- Abrir Zoom deja de encimar el slider sobre las herramientas.
- Cerrar Zoom restaura el rail de herramientas sin cambiar la herramienta
  activa.
- La pestaña de sidebar no cubre acciones como dividir, unir, comprimir o
  convertir PDF.
- Abrir la sidebar reemplaza visualmente al rail de herramientas y no lo tapa.
- Al auto-ocultarse la sidebar, el rail de herramientas vuelve a ocupar la
  bahia izquierda.
- Cambiar entre sidebar, toolbar y zoom no desplaza ni recalcula la distribucion
  de miniaturas del preview.

## Preloader y cache de previews Workspace 2026-06-05

La carga de miniaturas PDF debe comunicar avance por pagina y evitar trabajo
repetido durante la misma sesion de usuario.

Reglas aplicadas:

- Cada pagina de preview usa estados `pending`, `loading`, `ready` y `error`.
- Las paginas pendientes muestran un preloader circular con texto `En cola`.
- La pagina en render muestra preloader circular activo con texto `Cargando`.
- La barra superior puede mostrar avance de previews como `Cargando previews
  listas/total`.
- Las miniaturas generadas se guardan en cache temporal de memoria por
  `documentId:pageNumber` durante la sesion del navegador.
- Si la miniatura ya existe en cache temporal, la pagina entra directo a
  `ready` sin volver a renderizar PDF.js.
- La cache temporal no reemplaza persistencia productiva de previews. Si se
  requiere cache durable por usuario, debe definirse contrato backend o
  IndexedDB con politicas de limpieza.

Validacion esperada:

- El usuario ve feedback por hoja aunque la preview tarde.
- Reabrir el mismo documento durante la sesion evita recalcular miniaturas ya
  generadas.
- Fallar una miniatura no debe bloquear el documento completo.

## Algoritmo de slots para preview PDF 2026-06-05

El preview del Workspace no debe depender de `flex-wrap` para ordenar paginas
cuando existen documentos mixtos, paginas horizontales, verticales y
separadores. El layout debe usar una grilla de slots estables para conservar la
secuencia documental y evitar filas desalineadas al final del documento.

Reglas aplicadas:

- El orden del DOM sigue siendo el orden documental real.
- Cada pagina vertical ocupa 1 slot de grilla.
- Cada pagina horizontal ocupa 2 slots de grilla.
- Los separadores de inicio y fin de bloque ocupan 1 slot y deben parecer una
  hoja compacta distinguible, usando el color del bloque documental.
- Los separadores no deben crear huecos grandes ni ocupar media pantalla salvo
  que el viewport sea mobile y necesiten una fila completa.
- El gap horizontal debe ser compacto por defecto; solo puede crecer por
  necesidad de zoom, ancho disponible o legibilidad de insercion.
- La guia de insercion se calcula desde el canal real entre previews y debe
  quedar centrada aunque cambie el gap o el tipo de pagina.
- El canal real se mide por fila despues del render. Cada miniatura puede
  exponer `--next-channel-width` para centrar su guia de insercion respecto a
  la siguiente preview visible.
- Los separadores de inicio y fin de documento tambien participan en la
  medicion de canales. La guia debe centrarse entre separador y pagina, o entre
  pagina y separador final, no pegarse al borde de la pagina.
- La guia posterior de un separador debe usar el canal real hacia la siguiente
  preview; no debe volver al `page-gap` teorico.
- La guia inicial de un separador debe tener aire suficiente respecto al borde
  del separador para no parecer parte de la tarjeta.
- Los separadores deben alinearse al inicio de la fila (`align-self: start`) y
  no centrarse verticalmente, porque la medicion de canales agrupa elementos por
  fila real.
- Todo separador debe exponer guia de insercion antes y despues para permitir
  insertar documentos en ambas fronteras del bloque.
- Si la siguiente pieza del flujo es un separador, la pagina anterior no debe
  renderizar su propia guia `end`; la frontera queda representada solo por la
  guia alta del separador para evitar dobles barras.
- Si despues de la ultima pagina visible aparece el separador final del bloque,
  la pagina final tampoco debe renderizar guia `end`; la frontera queda bajo la
  guia alta del separador final.
- No se usa `grid-auto-flow: dense`, porque puede rellenar huecos con paginas
  posteriores y romper la lectura secuencial.
- La normalizacion por filas sigue permitida para igualar alturas visuales, pero
  no debe cambiar el orden ni la columna asignada por el algoritmo de slots.
- En mobile, todas las paginas y separadores ocupan la fila completa para evitar
  scroll horizontal o columnas implicitas.

Validacion esperada:

- Las paginas se ven formadas una tras otra aunque haya mezcla de orientaciones.
- Una pagina horizontal reserva el espacio de dos paginas verticales.
- Los separadores se leen como tarjetas/hojas de bloque, no como banners
  gigantes.
- La barra de insertar queda en medio de dos previews, no pegada a una pagina ni
  perdida en el gap.
- Cambiar zoom, rotar paginas, ocultar descartadas o alternar sidebar/tools no
  debe reordenar las miniaturas.

## Checkpoint de cambios Workspace 2026-06-05

Antes de continuar con nuevos ajustes visuales, se registra el estado acumulado
del Workspace para preservar trazabilidad y permitir commits separados por
repositorio.

Cambios documentados:

- `AppShell` en Workspace alterna sidebar y toolbar como estados de una misma
  bahia izquierda.
- Las pestañas de sidebar/toolbar se integran visualmente al rail y no deben
  flotar como controles independientes.
- Zoom abre un popover de herramientas sin ocultar `Tools` y conserva el ultimo
  porcentaje usado en almacenamiento local.
- El preview usa grilla de slots: paginas verticales ocupan 1 slot,
  horizontales 2 slots y separadores 1 slot compacto.
- Los separadores de bloque se muestran como tarjetas tipo hoja usando el color
  del bloque.
- Las guias de insercion se centran por canal real medido entre elementos del
  flujo, incluyendo separadores.
- Se eliminaron dobles guias cuando una frontera queda representada por un
  separador.

Validaciones ya ejecutadas antes del checkpoint:

- `npm run lint` en `WEB.NJ.NEXT.DocuCore`.
- `npm run build` en `WEB.NJ.NEXT.DocuCore`.
- Reinicio de `web-frontend-node`.
- Verificacion HTTP de `/workspace` con respuesta `200`.

Pendiente despues del checkpoint:

- Ajustar prioridad visual entre pestaña sidebar y popover de zoom.
- Corregir reflow de miniaturas al cambiar zoom para que generen nuevas filas
  sin encimarse.

No incluido:

- `.runtime/` del frontend contiene logs locales de servidor y no forma parte
  del codigo fuente ni de la documentacion canonica.
