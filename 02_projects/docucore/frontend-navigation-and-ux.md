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
