Puedes entregar a Codex una especificación como esta:

# DOCUCORE - ESTÁNDAR DE TIPOS DE ARCHIVO SOPORTADOS

## Objetivo

Controlar estrictamente los tipos de archivos permitidos en DocuCore durante el MVP, evitando que los usuarios suban formatos que todavía no cuentan con procesamiento, visualización, conversión o reglas de Workspace definidas.

---

# Estado de Soporte

Cada formato debe tener uno de los siguientes estados:

* ACTIVE
* PLANNED
* DEPRECATED
* DISABLED

## ACTIVE

Formatos completamente soportados en el MVP.

### PDF

* .pdf

Herramientas:

* Split
* Merge
* Compress
* PDF → Word
* Preview
* Reorder Pages
* Delete Pages

### Word

* .docx
* .doc

Herramientas:

* Word → PDF
* Preview

### Excel

* .xlsx
* .xls
* .csv

Herramientas:

* Excel → CSV
* Preview
* Sheet Reading

### Images

* .jpg
* .jpeg
* .png
* .webp
* .bmp
* .tiff

Herramientas:

* Image → PDF
* Preview
* Compression

### XML

* .xml

Herramientas:

* Read
* Validate

### Compressed Files

* .zip
* .rar
* .7z

Herramientas:

* Explore Content
* Extract Files
* Download Content

---

# PLANNED

Estos formatos NO deben poder subirse todavía.

Deben aparecer únicamente en documentación interna y roadmap.

## Office

* .ppt
* .pptx
* .odt
* .ods

## Text

* .txt
* .rtf

## Books

* .epub

## Email

* .eml
* .msg

## Structured Data

* .json
* .yaml
* .yml

## Web

* .html
* .htm

---

# Regla de Validación

Al subir archivos:

1. Validar extensión.
2. Validar MIME Type.
3. Validar estado del formato.
4. Validar tamaño máximo permitido.

Si el formato está marcado como ACTIVE:

* Permitir carga.
* Continuar procesamiento.

Si el formato está marcado como PLANNED:

* Bloquear carga.
* Mostrar mensaje amigable.

Ejemplo:

"Este formato está planificado para una futura versión de DocuCore y actualmente no se encuentra disponible."

---

# Configuración Centralizada

Crear un archivo único:

supported-file-types.ts

o

supported-file-types.json

Ejemplo:

{
"pdf": "ACTIVE",
"docx": "ACTIVE",
"doc": "ACTIVE",
"xlsx": "ACTIVE",
"xls": "ACTIVE",
"csv": "ACTIVE",
"jpg": "ACTIVE",
"jpeg": "ACTIVE",
"png": "ACTIVE",
"webp": "ACTIVE",
"bmp": "ACTIVE",
"tiff": "ACTIVE",
"xml": "ACTIVE",
"zip": "ACTIVE",
"rar": "ACTIVE",
"7z": "ACTIVE",

"ppt": "PLANNED",
"pptx": "PLANNED",
"odt": "PLANNED",
"ods": "PLANNED",
"txt": "PLANNED",
"rtf": "PLANNED",
"epub": "PLANNED",
"eml": "PLANNED",
"msg": "PLANNED",
"json": "PLANNED",
"yaml": "PLANNED",
"yml": "PLANNED",
"html": "PLANNED",
"htm": "PLANNED"
}

---

# Workspace

El Workspace debe trabajar únicamente con formatos ACTIVE.

Las herramientas visibles deben generarse dinámicamente según el tipo de archivo.

Ejemplo:

PDF:

* Split
* Merge
* Compress

Word:

* Convert to PDF

Excel:

* Export CSV

ZIP:

* Explore
* Extract

Nunca mostrar herramientas incompatibles con el archivo actual.

---

# Roadmap

Mantener una sección llamada:

Future File Types

Documentar:

* formato
* prioridad
* dependencias técnicas
* herramientas futuras
* estado

Sin habilitar el formato hasta que exista soporte real.

---

# Regla General

Ningún desarrollador podrá habilitar un formato nuevo únicamente agregando una extensión.

Para que un formato pase a ACTIVE debe existir:

1. Validación.
2. Preview.
3. Reglas de Workspace.
4. Diagnóstico y logs.
5. Manejo de errores.
6. Documentación.
7. Pruebas funcionales.
8. Integración con el sistema de permisos.

Hasta cumplir esos requisitos el formato deberá permanecer en estado PLANNED.

Además, para DocuCore te recomiendo agregar una categoría adicional llamada **EXPERIMENTAL**, que te permitirá probar formatos nuevos internamente sin exponerlos a los usuarios finales. Así tendrías:

```txt
ACTIVE
EXPERIMENTAL
PLANNED
DEPRECATED
DISABLED
```

Esto te ayudará mucho cuando empieces a incorporar PPTX, OCR avanzado, correos electrónicos o EPUB sin afectar la estabilidad del MVP.
