# Navegacion e interfaz DocuCore

## Objetivo

Definir la experiencia de DocuCore como asistente documental inteligente. La UI
debe guiar el flujo de trabajo desde el archivo hacia acciones sugeridas,
procesamiento, resultado y siguiente paso.

## Principios

- Mostrar categorias antes que listas extensas de herramientas.
- Usar el catalogo backend como fuente de verdad.
- Mantener el upload como accion principal.
- Mostrar jobs, errores y descargas de forma visible.
- Sugerir siguientes acciones segun tipo de archivo y resultado.
- Separar experiencia DocuCore de interpretacion especializada de LexNova.

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

- Estilo: minimalismo funcional.
- Sensacion: rapido, claro, documental, confiable.
- Iconos: Lucide React.
- Componentes: botones con icono, tablas para jobs, formularios claros,
  estados de error y descarga.
- Evitar: saturacion de botones, landing como pantalla principal autenticada,
  herramientas hardcodeadas y procesos inexistentes.

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
