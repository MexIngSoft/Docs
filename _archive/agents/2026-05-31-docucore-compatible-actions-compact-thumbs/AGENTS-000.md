Sí, viendo el HTML ya encontré exactamente el problema.

Los elementos:

```html
<a class="primary-action-button action-card">
```

están heredando el estilo naranja del tema principal y por eso ocurre esto:

```text
Fondo naranja
+
Icono naranja
+
Texto naranja
=
Poco contraste
```

Además, visualmente no parecen acciones importantes sino simples enlaces.

Yo documentaría el cambio así:

## Corrección visual de las acciones compatibles después de la carga de archivos

### Ubicación exacta

La corrección aplica únicamente a la sección:

```html
<section>
    <div class="workspace-title">
        <p class="eyebrow">Acciones compatibles</p>
        <h2>Elige una acción para abrir el workspace</h2>
    </div>

    <div class="action-grid prep-actions">
        ...
    </div>
</section>
```

No afecta:

```text
- Cuadro de herramientas.
- Barra lateral.
- Workspace.
- Preview de páginas.
```

---

## Problema actual

Actualmente los botones:

```text
Dividir PDF
Unir PDF
Comprimir PDF
PDF a Word
OCR básico
Generar índice
Exportar PDF indexado
```

utilizan colores demasiado similares entre:

```text
Fondo
Iconos
Texto
```

Lo que provoca:

```text
Poco contraste.
Difícil lectura.
No parecen acciones importantes.
Aspecto de enlace y no de herramienta.
```

---

## Nuevo diseño obligatorio

Las acciones deben verse como tarjetas blancas.

Ejemplo:

```text
┌──────────────────────────┐
│ ✂️                       │
│ Dividir PDF              │
│ PDF → ZIP                │
└──────────────────────────┘
```

---

## Paleta visual

### Fondo

```css
background: #FFFFFF;
```

---

### Título

```css
color: #111827;
font-weight: 600;
```

---

### Subtítulo

```css
color: #6B7280;
```

---

### Icono

```css
color: var(--brand-primary);
```

No usar el mismo color del fondo.

---

### Borde

```css
border: 1px solid #E5E7EB;
```

---

### Sombra

```css
box-shadow:
0 2px 8px rgba(0,0,0,.05);
```

---

## Hover

Al pasar el cursor:

```css
transform: translateY(-2px);
```

y

```css
box-shadow:
0 8px 24px rgba(0,0,0,.10);
```

---

## Acción seleccionada

Cuando el usuario selecciona una herramienta:

```text
Dividir PDF
```

la tarjeta debe destacar.

Ejemplo:

```css
border: 2px solid var(--brand-primary);
background: #FFF7ED;
```

---

## Distribución visual

Actualmente:

```text
[icono] [texto]
```

Se ve muy comprimido.

Cambiar a:

```text
┌───────────────┐
│     ✂️        │
│               │
│ Dividir PDF   │
│ PDF → ZIP     │
└───────────────┘
```

Distribución vertical.

---

## Tamaño uniforme

Todas las tarjetas deben tener exactamente:

```text
Mismo ancho
Misma altura
Mismo espaciado
```

Sin importar el texto.

---

## Información secundaria

Actualmente aparece:

```text
zip
pdf
docx
txt
json
pdf-json
```

Esto es poco descriptivo.

Reemplazar por:

```text
PDF → ZIP
PDF → PDF
PDF → DOCX
Imagen → Texto
PDF → Índice
PDF → PDF Indexado
```

o una descripción funcional.

---

## Iconografía

Mantener Lucide Icons pero aumentar tamaño.

Actualmente:

```html
width="22"
height="22"
```

Cambiar a:

```html
width="28"
height="28"
```

o

```html
width="32"
height="32"
```

para mejorar identificación visual.

---

## Adaptación al archivo cargado

Las acciones compatibles deben ordenarse por prioridad.

Ejemplo:

Si el usuario carga un PDF:

```text
1. Dividir PDF
2. Unir PDF
3. Comprimir PDF
4. OCR
5. PDF a Word
```

Si carga imágenes:

```text
1. OCR
2. Convertir a PDF
3. Extraer texto
4. Optimizar imagen
```

No mostrar acciones irrelevantes primero.

---

## Relación con el preview

Al seleccionar una acción:

```text
Acción seleccionada
        ↓
Abrir workspace
        ↓
Mostrar preview
        ↓
Activar herramientas relacionadas
```

La acción elegida debe aparecer destacada dentro del workspace.

---

## Resultado esperado

```text
Acciones compatibles

┌──────────────┐
│      ✂️      │
│ Dividir PDF  │
│ PDF → ZIP    │
└──────────────┘

┌──────────────┐
│      📄      │
│ PDF a Word   │
│ PDF → DOCX   │
└──────────────┘

┌──────────────┐
│      🔍      │
│ OCR Básico   │
│ Imagen→Texto │
└──────────────┘
```

Las tarjetas deben ser blancas, con texto oscuro, iconos visibles, sombra suave y apariencia de herramienta profesional, no de enlace tradicional ni de botón naranja.

Además, yo agregaría una instrucción extra: **si hay más de 6 acciones compatibles, convertir automáticamente esa sección en un carrusel horizontal o en una cuadrícula responsive**, porque cuando DocuCore tenga 20, 30 o más herramientas, esa zona se va a saturar rápidamente.
