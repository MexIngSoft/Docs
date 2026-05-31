Sí. En el HTML que compartiste se ven estas acciones por página:

```text
Girar izquierda
Girar derecha
Extraer página
Duplicar página
Eliminar página
Más opciones
```

Te dejo la documentación lista para usarla como instrucción en Codex.

# Documentación para Codex: acciones rápidas por página en `pdf-thumb`

## Objetivo

Documentar y corregir las acciones rápidas que existen dentro de cada miniatura de página del preview.

El componente afectado es:

```html
<button class="pdf-thumb ready" type="button">
```

Este componente representa una página individual del documento dentro del panel de miniaturas o preview lateral.

---

## Acciones detectadas actualmente

Dentro del componente existe una barra:

```html
<span class="page-quick-actions" aria-label="Acciones rapidas de pagina 1">
```

Esta barra contiene las siguientes acciones:

```text
1. Girar izquierda
2. Girar derecha
3. Extraer página
4. Duplicar página
5. Eliminar página
6. Más opciones
```

---

# 1. Girar izquierda

## Selector actual

```html
<span
  aria-label="Girar izquierda pagina 1"
  class="page-action"
  role="button"
  tabindex="0"
  title="Girar izquierda"
>
```

## Icono

```text
rotate-ccw
```

## Función

Rotar la página seleccionada 90 grados hacia la izquierda.

## Acción esperada

```text
rotation = rotation - 90
```

Si llega a -90, normalizar a:

```text
270
```

## Estado que debe modificar

```ts
page.rotation
```

## Ejemplo

```ts
rotatePage(pageId, -90)
```

---

# 2. Girar derecha

## Selector actual

```html
<span
  aria-label="Girar derecha pagina 1"
  class="page-action"
  role="button"
  tabindex="0"
  title="Girar derecha"
>
```

## Icono

```text
rotate-cw
```

## Función

Rotar la página seleccionada 90 grados hacia la derecha.

## Acción esperada

```text
rotation = rotation + 90
```

Si llega a 360, normalizar a:

```text
0
```

## Estado que debe modificar

```ts
page.rotation
```

## Ejemplo

```ts
rotatePage(pageId, 90)
```

---

# 3. Extraer página

## Selector actual

```html
<span
  aria-label="Extraer pagina pagina 1"
  class="page-action"
  role="button"
  tabindex="0"
  title="Extraer pagina"
>
```

## Icono

```text
scissors
```

## Función

Crear un nuevo documento a partir de la página seleccionada.

## Acción esperada

```text
Tomar página seleccionada
        ↓
Crear archivo independiente
        ↓
Generar nuevo PDF o imagen
        ↓
Mostrar opción de descarga
```

## Resultado esperado

```text
pagina_1.pdf
```

o:

```text
documento_original_pagina_1.pdf
```

## Estado que debe modificar

No debe eliminar la página original.

Debe generar un nuevo recurso derivado.

## Ejemplo

```ts
extractPage(documentId, pageNumber)
```

---

# 4. Duplicar página

## Selector actual

```html
<span
  aria-label="Duplicar pagina pagina 1"
  class="page-action"
  role="button"
  tabindex="0"
  title="Duplicar pagina"
>
```

## Icono

```text
copy
```

## Función

Crear una copia de la página seleccionada dentro del mismo documento.

## Acción esperada

```text
Página 1
Página 1 copia
Página 2
Página 3
```

## Estado que debe modificar

Debe insertar una nueva página inmediatamente después de la original.

## Ejemplo

```ts
duplicatePage(documentId, pageNumber)
```

---

# 5. Eliminar página

## Selector actual

```html
<span
  aria-label="Eliminar pagina pagina 1"
  class="page-action danger"
  role="button"
  tabindex="0"
  title="Eliminar pagina"
>
```

## Icono

```text
trash-2
```

## Función

Eliminar la página seleccionada del documento.

## Acción esperada

Debe pedir confirmación antes de eliminar.

```text
¿Eliminar página 1?
```

## Regla importante

No eliminar directamente al primer clic.

Debe existir confirmación o deshacer.

## Opciones aceptadas

```text
Confirmación modal
```

o:

```text
Eliminar con opción de deshacer
```

## Estado que debe modificar

```ts
page.deleted = true
```

o remover la página del arreglo si el sistema ya soporta historial.

## Ejemplo

```ts
deletePage(documentId, pageNumber)
```

---

# 6. Más opciones

## Selector actual

```html
<span
  aria-label="Mas opciones pagina 1"
  class="page-action"
  role="button"
  tabindex="0"
  title="Mas opciones"
>
```

## Icono

```text
ellipsis
```

## Función

Abrir un menú contextual con acciones secundarias.

## Acciones sugeridas dentro del menú

```text
- Ver metadata completa
- Descargar página
- Reemplazar página
- Insertar página después
- Ejecutar OCR en esta página
- Agregar nota
- Agregar etiqueta
- Marcar como importante
```

---

## Reglas visuales de la barra de acciones

La barra:

```html
.page-quick-actions
```

no debe estar visible permanentemente.

Debe mostrarse únicamente cuando:

```text
- El usuario pasa el cursor sobre la miniatura.
- La página está seleccionada.
- El componente tiene foco por teclado.
```

---

## Acciones visibles por defecto

En miniaturas pequeñas mostrar solo:

```text
Girar izquierda
Girar derecha
Más opciones
```

Mover al menú:

```text
Extraer página
Duplicar página
Eliminar página
```

---

## Acciones visibles en miniaturas medianas o grandes

Si el espacio lo permite, mostrar:

```text
Girar izquierda
Girar derecha
Extraer
Duplicar
Eliminar
Más opciones
```

---

## Reglas de seguridad visual

El botón de eliminar debe tener clase:

```css
danger
```

y debe diferenciarse visualmente.

No debe ejecutarse sin confirmación.

---

## Estado recomendado por página

Cada página debe manejar su propio estado:

```ts
type PreviewPage = {
  id: string;
  pageNumber: number;
  previewUrl: string;
  width: number;
  height: number;
  sizeName: string;
  orientation: "portrait" | "landscape";
  rotation: 0 | 90 | 180 | 270;
  status: "pending" | "loading" | "ready" | "error";
  selected: boolean;
  deleted?: boolean;
};
```

---

## Handlers recomendados

```ts
onRotateLeft(pageId)
onRotateRight(pageId)
onExtractPage(pageId)
onDuplicatePage(pageId)
onDeletePage(pageId)
onOpenPageMenu(pageId)
```

---

## Accesibilidad

Cada acción debe funcionar con:

```text
Clic
Enter
Barra espaciadora
```

Cada acción debe conservar:

```text
aria-label
title
tabindex
focus-visible
```

---

## Evitar propagación de eventos

Como las acciones están dentro de:

```html
<button class="pdf-thumb">
```

se debe evitar que el clic en una acción active también la selección de la miniatura.

Cada acción debe ejecutar:

```ts
event.stopPropagation()
```

y cuando sea necesario:

```ts
event.preventDefault()
```

---

## Recomendación importante de estructura HTML

Evitar tener elementos con:

```html
role="button"
```

dentro de un:

```html
<button>
```

Esto puede causar problemas de accesibilidad y eventos.

Mejor estructura recomendada:

```html
<div class="pdf-thumb" role="button" tabindex="0">
  <button class="page-action">...</button>
</div>
```

o:

```html
<article class="pdf-thumb">
  <button class="thumb-select">...</button>
  <div class="page-quick-actions">
    <button class="page-action">...</button>
  </div>
</article>
```

---

## Resultado esperado

Cada página debe permitir acciones rápidas sin desbordarse:

```text
┌──────────────┐
│ ↶ ↷ ⋮        │
│              │
│  Miniatura   │
│              │
├──────────────┤
│ Página 1     │
│ Legal · V ●  │
└──────────────┘
```

Cuando el usuario abra más opciones:

```text
Ver metadata
Extraer página
Duplicar página
Eliminar página
Ejecutar OCR
Agregar nota
```

---

## Instrucción final para Codex

Refactorizar las acciones rápidas del componente `pdf-thumb`. Las acciones existentes son: girar izquierda, girar derecha, extraer página, duplicar página, eliminar página y más opciones. Cada acción debe tener un handler independiente, actuar únicamente sobre la página seleccionada y evitar propagación de eventos hacia el contenedor principal. La barra de acciones no debe desbordarse ni mostrarse permanentemente; debe aparecer en hover, focus o selección. En miniaturas pequeñas mostrar solo girar izquierda, girar derecha y más opciones; mover extraer, duplicar y eliminar al menú contextual. Evitar elementos `role="button"` dentro de un `<button>` y reemplazar la estructura por botones reales accesibles.
