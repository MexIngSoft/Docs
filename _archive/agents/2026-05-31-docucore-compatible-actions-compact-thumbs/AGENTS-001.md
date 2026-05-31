Sí, aquí el problema está en el componente:

```html
<button class="pdf-thumb ready">
```

Está intentando mostrar demasiadas cosas dentro de una tarjeta pequeña: miniatura, título, metadata, estado y 6 acciones rápidas. Eso provoca desbordes.

## Corrección del componente `pdf-thumb`

### Ubicación exacta

La corrección aplica al componente:

```html
<button class="pdf-thumb ready" type="button">
```

Este elemento representa una miniatura de página dentro del preview o panel de páginas.

---

## Problemas detectados

Actualmente el componente contiene demasiados elementos visibles al mismo tiempo:

```text
- Miniatura de página
- Nombre de página
- Metadata completa
- Estado de preview
- Acciones rápidas
- Iconos de acción
```

Cuando el elemento es pequeño, ocurre lo siguiente:

```text
- La imagen se desborda.
- El texto se amontona.
- La metadata ocupa demasiado espacio.
- La barra de acciones se sale del contenedor.
- Los iconos quedan apretados.
- La tarjeta pierde legibilidad.
```

---

## Regla principal

El componente `pdf-thumb` debe ser compacto.

No debe mostrar toda la información completa dentro de la tarjeta.

Debe mostrar solo la información esencial y mover los detalles a tooltip, menú o panel lateral.

---

# Estructura visual recomendada

## Vista normal compacta

```text
┌──────────────┐
│              │
│  Miniatura   │
│              │
├──────────────┤
│ Página 1     │
│ Legal · V    │
└──────────────┘
```

---

## Vista al pasar el cursor

```text
┌──────────────┐
│ ↶ ↷ ⋮        │
│  Miniatura   │
│              │
├──────────────┤
│ Página 1     │
│ Legal · V    │
└──────────────┘
```

---

## Vista con menú expandido

```text
Más opciones:
- Extraer página
- Duplicar página
- Eliminar página
- Ver metadata
```

---

# Corrección de imagen desbordada

La miniatura debe quedar siempre contenida dentro de `paper-mini`.

No debe salirse aunque el preview sea vertical, oficio, legal, carta, A5 o imagen personalizada.

Usar:

```css
.pdf-thumb {
  width: 100%;
  min-width: 0;
  overflow: hidden;
}

.paper-mini {
  width: 100%;
  max-width: 100%;
  aspect-ratio: var(--preview-aspect);
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #ffffff;
  border-radius: 10px;
}

.paper-mini img,
.paper-mini canvas {
  width: 100%;
  height: 100%;
  object-fit: contain;
  display: block;
}
```

---

## No usar imagen libre

No permitir que la imagen tenga tamaño propio sin restricción.

Evitar:

```css
.paper-mini img {
  width: auto;
  height: auto;
}
```

porque puede desbordarse.

---

# Organización del texto

Actualmente se muestra algo como:

```text
Pagina 1
Legal · Vertical · 606 x 1002 px
Preview lista
```

Eso es demasiado para una tarjeta pequeña.

Cambiar a:

```text
Página 1
Legal · V
```

La información completa debe verse al pasar el cursor o al seleccionar la página.

---

## Metadata corta visible

Mostrar solo:

```text
Legal · V
```

o

```text
Carta · H
```

o

```text
A5 · V
```

Donde:

```text
V = Vertical
H = Horizontal
```

---

## Metadata completa oculta

Mostrar en tooltip o panel de detalles:

```text
Página 1
Tamaño: Legal
Orientación: Vertical
Dimensiones: 606 × 1002 px
Estado: Preview lista
```

---

# Estado del preview

El texto:

```text
Preview lista
```

no debe ocupar una línea completa dentro de tarjetas pequeñas.

Debe cambiarse por un indicador visual.

Ejemplo:

```text
●
```

Estados:

```text
Verde: lista
Amarillo: cargando
Rojo: error
Gris: pendiente
```

Con tooltip:

```text
Preview lista
```

---

# Acciones rápidas

La barra:

```html
<span class="page-quick-actions">
```

no debe ocupar espacio permanente.

Debe aparecer solo:

```text
- Al pasar el cursor.
- Al seleccionar la página.
- Al enfocar con teclado.
```

---

## Acciones visibles permitidas en tarjeta pequeña

En tarjeta pequeña mostrar únicamente:

```text
↶ Girar izquierda
↷ Girar derecha
⋮ Más opciones
```

No mostrar las seis acciones al mismo tiempo.

---

## Acciones en menú de más opciones

Mover al menú:

```text
- Extraer página
- Duplicar página
- Eliminar página
- Ver metadata
```

Esto evita que la barra se desborde.

---

# CSS recomendado para acciones rápidas

```css
.page-quick-actions {
  position: absolute;
  top: 6px;
  left: 6px;
  right: 6px;
  display: flex;
  justify-content: center;
  gap: 4px;
  opacity: 0;
  pointer-events: none;
  overflow: hidden;
}

.pdf-thumb:hover .page-quick-actions,
.pdf-thumb:focus-within .page-quick-actions,
.pdf-thumb.selected .page-quick-actions {
  opacity: 1;
  pointer-events: auto;
}

.page-action {
  width: 24px;
  height: 24px;
  min-width: 24px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 999px;
  background: rgba(255,255,255,.92);
  border: 1px solid #E5E7EB;
}
```

---

# Comportamiento responsive

Cuando la tarjeta sea pequeña:

```text
Ancho menor a 140px
```

mostrar solo:

```text
- Miniatura
- Página
- Tamaño corto
- Menú de más opciones
```

Cuando sea mediana:

```text
Ancho mayor a 180px
```

se pueden mostrar:

```text
- Girar izquierda
- Girar derecha
- Más opciones
```

Cuando sea grande:

```text
Ancho mayor a 240px
```

se pueden mostrar más acciones si no se desbordan.

---

# Regla de no desbordamiento

Ningún elemento interno de `pdf-thumb` debe salirse del botón.

Aplicar:

```css
.pdf-thumb,
.pdf-thumb * {
  box-sizing: border-box;
}

.pdf-thumb {
  overflow: hidden;
}

.pdf-thumb strong,
.pdf-thumb small {
  max-width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.page-quick-actions {
  max-width: calc(100% - 12px);
}
```

---

# Accesibilidad

Aunque las acciones se oculten visualmente, deben seguir siendo accesibles mediante teclado cuando la página esté seleccionada.

Cada acción debe tener:

```text
aria-label
title
focus visible
```

---

# Resultado esperado

El componente debe quedar así:

```text
┌──────────────┐
│   ↶ ↷ ⋮      │
│              │
│  Miniatura   │
│              │
├──────────────┤
│ Página 1     │
│ Legal · V  ● │
└──────────────┘
```

Y al abrir más opciones:

```text
Extraer página
Duplicar página
Eliminar página
Ver metadata
```

---

## Instrucción final para desarrollo

Refactorizar el componente `pdf-thumb` para que sea compacto, responsive y sin desbordamientos. La miniatura debe quedar siempre dentro de `paper-mini` usando `object-fit: contain`, `overflow: hidden` y `aspect-ratio` basado en la metadata real. Reducir el texto visible a `Página N` y metadata corta como `Legal · V`, moviendo dimensiones, estado completo y detalles al tooltip o panel de detalles. La barra `page-quick-actions` no debe mostrarse permanentemente ni contener todas las acciones en tarjetas pequeñas; debe aparecer solo en hover, focus o selección, mostrando únicamente girar izquierda, girar derecha y más opciones. Las acciones de extraer, duplicar, eliminar y metadata deben moverse al menú de más opciones para evitar desbordes.
