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
