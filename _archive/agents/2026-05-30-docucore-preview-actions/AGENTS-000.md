Para **DocuCore**, la previsualización de documentos debe pensarse como un sistema modular porque no todos los archivos se visualizan igual.

## Opción recomendada para DocuCore

### 1. PDF

La más sencilla.

**Frontend (Next.js)**

* PDF.js
* React PDF Viewer
* PDFium WebAssembly

Recomendación:

* PDF.js para renderizado.
* Miniaturas de páginas.
* Zoom.
* Búsqueda de texto.
* Selección de texto.

Vista:

```text
┌──────────────────────┬─────────────────────────────┐
│ Miniaturas           │ Página PDF                 │
│ Página 1             │                             │
│ Página 2             │       Documento             │
│ Página 3             │                             │
└──────────────────────┴─────────────────────────────┘
```

---

### 2. Word (DOCX)

No mostrar el archivo directamente.

Convertir a HTML temporal.

Librerías:

* Mammoth.js
* docx-preview

Proceso:

```text
DOCX
 ↓
HTML
 ↓
Previsualización
```

El usuario ve:

```text
Título

Texto...

Tabla...

Imagen...
```

sin descargar el archivo.

---

### 3. Excel

Librerías:

* SheetJS (xlsx)

Proceso:

```text
Excel
 ↓
JSON
 ↓
Tabla HTML
```

Vista:

| Nombre  | Precio |
| ------- | ------ |
| Mouse   | 150    |
| Teclado | 350    |

Además:

* Selección de hojas
* Filtros
* Búsquedas

---

### 4. Imágenes

Directamente:

```html
jpg
png
webp
gif
bmp
tiff
```

Con:

* Zoom
* Rotar
* Recortar
* Comparar antes/después

---

### 5. Archivos OCR

Cuando el OCR termine:

Vista dividida:

```text
┌──────────────┬────────────────┐
│ Imagen       │ Texto OCR      │
│              │                │
│ Documento    │ Contenido      │
│ Escaneado    │ Extraído       │
└──────────────┴────────────────┘
```

Esto es exactamente lo que hacen las plataformas profesionales.

---

### 6. ZIP

No descargar inmediatamente.

Mostrar:

```text
📁 archivo.zip

├── contrato.pdf
├── foto1.jpg
├── foto2.jpg
└── carpeta/
    └── datos.xlsx
```

Y permitir abrir cada archivo.

---

### 7. XML

Vista doble:

```text
XML Original
```

```xml
<cliente>
    <nombre>Juan</nombre>
</cliente>
```

Y:

```text
Vista estructurada

Cliente
 └ Nombre: Juan
```

---

### 8. TXT / CSV

Tabla o editor:

```text
Linea 1
Linea 2
Linea 3
```

o

| Campo  | Valor |
| ------ | ----- |
| Nombre | Juan  |

---

# Lo que hacen Adobe, SmallPDF y otros

Generan primero una representación interna:

```text
Archivo
     ↓
Procesador
     ↓
Representación interna
     ↓
Vista Web
```

Por eso nunca renderizan directamente el archivo original.

---

# Lo que yo haría para DocuCore

Crearía un módulo independiente:

```text
API.PY.DJANGO.Document
```

### Preview Service

```text
/api/v1/preview/pdf/
/api/v1/preview/docx/
/api/v1/preview/excel/
/api/v1/preview/image/
/api/v1/preview/xml/
/api/v1/preview/zip/
```

Este servicio genera:

```json
{
  "type":"pdf",
  "pages":25,
  "thumbnails":[...],
  "preview_url":"..."
}
```

y el frontend solo consume la vista.

---

## Para el MVP de DocuCore

Implementaría en este orden:

1. PDF.js (PDF)
2. Imágenes
3. Word (docx-preview)
4. Excel (SheetJS)
5. OCR lado a lado
6. ZIP navegable
7. XML estructurado

Con esos 7 tipos cubrirías aproximadamente el **95% de los archivos** que normalmente suben los usuarios a una plataforma documental. Además, la misma infraestructura servirá después para Lex Nova, porque los expedientes jurídicos suelen estar compuestos principalmente por PDF, imágenes escaneadas, Word y Excel.
