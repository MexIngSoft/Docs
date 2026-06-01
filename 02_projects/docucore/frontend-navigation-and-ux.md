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
  imagen, ZIP, XML, texto u otro.
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

1. Estado individual por pagina: rotacion, modificacion, papelera, OCR y
   metadata visual.
2. Acciones rapidas: girar, copiar, cortar, pegar, duplicar, descartar,
   restaurar y marcar.
3. Reordenamiento: arrastrar y soltar paginas dentro del preview.
4. Menu avanzado por pagina: agrupa acciones destructivas, OCR, metadata,
   descargas, reemplazo, insercion y acciones futuras.
5. Dividir PDF por modos: secciones, paginas, marcadores, automatico y
   avanzado.
6. Secciones visuales: cada seccion tiene nombre, color y paginas asociadas.
7. Papelera reversible: descartar no elimina inmediatamente; las paginas se
   pueden ocultar, restaurar o eliminar permanentemente.
8. Seleccion avanzada: seleccion individual, presets, rangos escritos y
   acciones masivas.
9. Marcadores: estructura manual inicial para navegar y dividir documentos.
10. Division automatica: solo genera sugerencias; nunca aplica cambios sin
    confirmacion.

Reglas de estado:

- Una pagina rotada debe intercambiar ancho y alto para calcular su marco
  visual cuando la rotacion sea 90 o 270 grados.
- Toda pagina modificada debe mostrar una insignia breve: Girado, Copiado,
  Cortado, Pegado, Movido, Descartado, OCR, Importante o Etiqueta.
- Copiar no elimina la pagina original.
- Cortar no elimina la pagina original hasta que el usuario pega en una zona.
- Pegar limpia el portapapeles.
- Descartar manda la pagina a papelera reversible.
- OCR, marcadores automaticos y division inteligente se muestran como estados
  preparados cuando no exista motor backend real.

Modos de `Dividir PDF`:

| Modo | Uso | Estado MVP |
|---|---|---|
| Secciones | Crear bloques visuales con paginas seleccionadas. | Implementado en frontend local. |
| Paginas | Seleccionar paginas por texto, rango o presets. | Implementado en frontend local. |
| Marcadores | Crear marcadores manuales y navegar/dividir por ellos. | Implementado como estructura local inicial. |
| Automatico | Generar sugerencias reversibles por reglas. | Implementado como analisis local simulado. |
| Avanzado | Preparar OCR, sensibilidad y reglas futuras. | Documentado/preparado; requiere backend. |

Pendiente backend:

- Persistir operaciones reales de PDF: rotar, mover, cortar, pegar, duplicar,
  descartar y restaurar.
- Ejecutar OCR real por pagina o documento y devolver texto, confianza,
  bloques y errores.
- Detectar bookmarks PDF reales y estructuras OCR automaticamente.
- Generar propuesta inteligente real por paginas en blanco, QR, layout, texto
  personalizado e IA documental.

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
- La leyenda de secciones se abre desde el boton inferior `Secciones`.
- El area `page-grid` es el contenido principal visible de `pdf-stage`.
- `canvas-main`, `pdf-stage` y `page-grid` usan `overflow: visible`; el scroll
  vertical esperado es el del navegador.
- La barra inferior concentra herramientas, documento, estado, secciones,
  configuracion, seleccion, subir mas, resultado y aplicar cambios.
- Las zonas intermedias `section-split-zone` y `page-insert-zone` son guias
  delgadas, semitransparentes y de bajo peso visual. Solo resaltan por hover,
  focus, copia/corte o arrastre.

Decision tecnica:

- Se mantuvieron drawers existentes en vez de introducir un sistema nuevo de
  popovers, porque ya existian cierre por backdrop, foco visual y patron
  consistente con el workspace.
- Los agents de OCR, papelera, secciones, marcadores y division automatica se
  mantienen como MVP frontend/preparado cuando dependen de backend real.

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
- La recuperacion intenta restaurar archivo, paginas, seleccion, secciones,
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
