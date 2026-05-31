## Ajuste de comportamiento del Cuadro de Herramientas

### Objetivo

El Cuadro de Herramientas es uno de los elementos principales de DocuCore y debe funcionar como una herramienta de productividad, similar a una combinación entre Adobe, Figma, Visual Studio Code y Notion.

No debe mostrarse como una lista extensa de botones con texto visible permanentemente.

Debe priorizar el espacio de trabajo del documento.

---

## Diseño General

El Cuadro de Herramientas debe mostrarse inicialmente como una barra compacta de iconos.

Ejemplo:

```text
┌─────────────────────────────────────────────┐
│ ✂️ 📄 🔄 📝 🔍 🖼️ ✍️ 📑 ⚙️             │
└─────────────────────────────────────────────┘
```

El usuario ve únicamente los iconos.

Esto reduce ruido visual y permite que el documento tenga mayor protagonismo.

---

## Comportamiento Hover

Cuando el usuario coloque el cursor sobre un icono:

```text
✂️
```

Debe aparecer automáticamente:

```text
✂️ Dividir PDF
```

como tooltip o etiqueta contextual.

Ejemplo:

```text
┌─────────────┐
│ Dividir PDF │
└─────────────┘
```

No debe requerir clic.

La información debe aparecer instantáneamente.

---

## Expansión Inteligente

Cuando el usuario mantenga el cursor sobre la barra durante algunos segundos o pulse un botón de expansión:

La barra podrá expandirse.

Ejemplo:

```text
✂️ Dividir PDF
📄 Unir PDF
🔄 Comprimir PDF
📝 PDF a Word
🔍 OCR
🖼️ Extraer imágenes
✍️ Firmar PDF
📑 Generar índice
```

Al abandonar el área:

La barra puede volver automáticamente al modo compacto.

---

## Buscador de Herramientas

Debe existir un buscador integrado.

Ejemplo:

```text
🔍 Buscar herramienta...
```

Al escribir:

```text
pdf
```

Mostrar:

```text
Dividir PDF
Unir PDF
Comprimir PDF
Firmar PDF
PDF a Word
```

Al escribir:

```text
ocr
```

Mostrar:

```text
OCR PDF
OCR Imagen
OCR Lote
```

---

## Búsqueda Inteligente

La búsqueda debe aceptar:

### Nombre exacto

```text
Dividir PDF
```

### Palabras clave

```text
separar pdf
```

Resultado:

```text
Dividir PDF
```

---

### Sinónimos

```text
juntar pdf
```

Resultado:

```text
Unir PDF
```

---

### Acciones

```text
convertir word
```

Resultado:

```text
PDF a Word
Word a PDF
```

---

## Organización por Categorías

Internamente las herramientas deben estar agrupadas.

```text
PDF
 ├─ Dividir
 ├─ Unir
 ├─ Comprimir
 ├─ Firmar

Conversión
 ├─ PDF a Word
 ├─ Word a PDF
 ├─ Imagen a PDF

OCR
 ├─ OCR PDF
 ├─ OCR Imagen
 ├─ OCR Lote

Imágenes
 ├─ Extraer imágenes
 ├─ Convertir imagen
 ├─ Optimizar imagen

Documentos
 ├─ Generar índice
 ├─ Numerar páginas
 ├─ Marcas de agua
```

---

## Relación con el Documento

Las herramientas visibles deben depender del documento cargado.

### Si se carga PDF

Mostrar prioritariamente:

```text
Dividir PDF
Unir PDF
Comprimir PDF
OCR
Firmar PDF
```

---

### Si se carga Word

Mostrar prioritariamente:

```text
Word a PDF
OCR
Convertir
```

---

### Si se carga Imagen

Mostrar prioritariamente:

```text
OCR Imagen
Convertir a PDF
Optimizar Imagen
```

---

## Regla de Visibilidad

No mostrar todas las herramientas del sistema al mismo tiempo.

Mostrar:

```text
Herramientas recomendadas
```

según:

* Tipo de archivo.
* Acción anterior.
* Herramientas más utilizadas.
* Historial del usuario.

---

## Regla de No Duplicación

La barra de herramientas es el único punto de acceso principal a las acciones.

No crear:

* Barras duplicadas.
* Menús duplicados.
* Paneles con las mismas acciones.
* Toolbars secundarias con herramientas repetidas.

Toda acción debe existir una sola vez dentro del sistema.

---

## Resultado Esperado

```text
┌─────────────────────────────────────────────┐
│ 🔍 Buscar herramienta...                     │
├─────────────────────────────────────────────┤
│ ✂️ 📄 🔄 📝 🔍 🖼️ ✍️ 📑 ⚙️              │
└─────────────────────────────────────────────┘

               Documento

┌─────────────────────────────────────────────┐
│                                             │
│             Vista previa                    │
│                                             │
└─────────────────────────────────────────────┘
```

La interfaz debe ser minimalista, rápida, moderna, profesional y enfocada en el documento, utilizando iconos como vista principal y mostrando texto únicamente cuando el usuario interactúe con ellos o utilice el buscador.
