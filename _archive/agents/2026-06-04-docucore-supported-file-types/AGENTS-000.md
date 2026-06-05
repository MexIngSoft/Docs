Con base en la documentación y decisiones que hemos trabajado para el MVP de DocuCore, actualmente los tipos de archivos que deberían poder subirse son:

| Categoría   | Extensiones                                       |
| ----------- | ------------------------------------------------- |
| PDF         | `.pdf`                                            |
| Word        | `.doc`, `.docx`                                   |
| Excel       | `.xls`, `.xlsx`, `.csv`                           |
| Imágenes    | `.jpg`, `.jpeg`, `.png`, `.webp`, `.bmp`, `.tiff` |
| XML         | `.xml`                                            |
| Comprimidos | `.zip`, `.rar`, `.7z`                             |

## Reglas especiales

### PDF

Permite:

* Dividir
* Unir
* Comprimir
* Convertir a Word
* Extraer páginas
* Generar vista previa

### Word

Permite:

* Convertir a PDF
* Lectura
* Vista previa

### Excel

Permite:

* Convertir a CSV
* Lectura de hojas
* Exportaciones

### Imágenes

Permite:

* Convertir a PDF
* OCR (cuando se implemente)
* Compresión
* Vista previa

### XML

Permite:

* Lectura
* Validación
* Conversión futura

### ZIP / RAR / 7Z

Tienen reglas distintas:

* Se pueden subir al proyecto.
* Se pueden abrir en modo explorador de archivos.
* Se puede visualizar su contenido.
* Se pueden extraer archivos internos.

Pero si el usuario quiere trabajar directamente con un PDF, Word o Excel que está dentro del comprimido, el sistema debe:

```txt
Extraer el archivo
↓
Crear un documento de trabajo independiente
↓
Abrir Workspace en modo documento
```

No debería editarse el PDF directamente dentro del ZIP.

---

## Tipos que quedarían pendientes para fases posteriores

```txt
.odt
.ods
.ppt
.pptx
.epub
.txt
.rtf
.json
.html
.eml
.msg
```

---

## Recomendación para DocuCore

Yo definiría tres niveles:

### Nivel 1 (MVP)

```txt
PDF
DOCX
XLSX
CSV
JPG
PNG
WEBP
XML
ZIP
RAR
7Z
```

### Nivel 2

```txt
PPTX
ODT
ODS
RTF
TXT
```

### Nivel 3

```txt
EML
MSG
EPUB
JSON
HTML
```

Así mantienes el MVP pequeño y estable, que era uno de los objetivos que habías definido para sacar DocuCore rápido sin depender todavía de OCR avanzado ni indexación inteligente.
