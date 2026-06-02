Sí, para una primera versión (MVP) de DocuCore enfocada en salir rápido al mercado, tiene sentido aplazar OCR e indexación documental.

Al analizar el esfuerzo de desarrollo, complejidad técnica, consumo de recursos, costos de infraestructura, monitoreo y soporte, OCR e indexación son de los módulos más costosos y complejos del ecosistema.

### Estado recomendado de los módulos

## Fase 1 — MVP (Desarrollar ahora)

### PDF

* Unir PDF
* Dividir PDF
* Reordenar páginas
* Rotar páginas
* Eliminar páginas
* Extraer páginas
* Comprimir PDF
* Proteger PDF
* Desproteger PDF
* Agregar marca de agua
* Numerar páginas

### Conversión

* PDF → Word
* Word → PDF
* Imagen → PDF
* PDF → Imagen
* Excel → CSV
* CSV → Excel
* PowerPoint → PDF

### Imágenes

* Redimensionar
* Recortar
* Rotar
* Convertir formato
* Comprimir imágenes

### Archivos

* Comprimir ZIP
* Descomprimir ZIP
* Vista previa de archivos
* Descarga de archivos procesados

### Gestión

* Historial de trabajos
* Créditos de usuario
* Sistema de proyectos
* Cola de procesamiento
* Eliminación automática de archivos

---

## Fase 2 — Próximamente

Estas funciones deben mostrarse en la web pero marcadas como:

> 🚧 Próximamente

### OCR

* Imagen → Texto
* PDF escaneado → Texto
* PDF escaneado → Word
* OCR por lotes
* OCR multilenguaje

### Indexación documental

* Creación automática de índices
* Tabla de contenido
* Numeración inteligente
* Índices jurídicos
* Índices académicos
* Índices por capítulos
* Índices por marcadores

### Búsqueda documental

* Buscar dentro de documentos
* Buscar por contenido OCR
* Buscar frases
* Buscar por metadatos

---

## Fase 3 — Profesional

### IA documental

* Resúmenes
* Extracción de datos
* Clasificación automática
* Identificación de contratos
* Identificación de facturas
* Identificación de expedientes

### Integraciones

* Google Drive
* OneDrive
* Dropbox
* SharePoint

### Firma electrónica

* Firmas
* Validación
* Certificados

---

# Cambios que recomiendo en la web

En lugar de ocultar OCR e índices:

### Mostrar las tarjetas

Ejemplo:

```
PDF
Word
Imagen
Excel
ZIP
OCR 🚧 Próximamente
Índices Documentales 🚧 Próximamente
IA Documental 🚧 Próximamente
```

Cuando el usuario haga clic:

```
Esta herramienta estará disponible en una próxima actualización.

¿Desea recibir una notificación cuando sea liberada?
```

Esto tiene varias ventajas:

* Muestra la visión completa de DocuCore.
* Permite validar interés de los usuarios.
* Genera expectativa.
* Evita que parezca una plataforma pequeña.
* No obliga a desarrollar todo antes del lanzamiento.

# Documentación que debe actualizarse

En los cuatro proyectos:

### API.PY.DJANGO.DocuCore

Agregar:

```
Estado:
MVP Activo

OCR:
Planeado

Indexación:
Planeada

IA:
Planeada
```

### API.PY.DJANGO.DocuCore.Gateway

Solo enrutar módulos activos.

Los endpoints OCR e Index pueden existir pero responder:

```
HTTP 501 Not Implemented
```

o

```json
{
  "status": "coming_soon",
  "message": "Feature coming soon"
}
```

### WEB.NJ.NEXT.DocuCore

Mostrar herramientas futuras con badge:

```
Próximamente
```

y página informativa.

### API.PY.DJANGO.Document

Eliminar dependencias obligatorias de OCR para el MVP y dejar únicamente los contratos de integración documentados para futuras versiones.

# Prioridad actual de desarrollo

1. Infraestructura base.
2. Sistema de carga de archivos.
3. Procesamiento PDF.
4. Conversión de formatos.
5. Gestión de proyectos.
6. Sistema de créditos.
7. Historial.
8. Publicidad no invasiva.
9. Lanzamiento MVP.
10. OCR.
11. Indexación documental.
12. IA documental.

Con esta estrategia DocuCore puede salir mucho antes al mercado y comenzar a generar usuarios, métricas y retroalimentación sin esperar el desarrollo de OCR e indexación, que pueden incorporarse posteriormente como una expansión natural de la plataforma.
