Claro. Aquí tienes la **Fase 1 detallada para Codex**.

````text
# FASE 1 — Correcciones críticas del preview

## Objetivo general

Corregir el comportamiento visual de las páginas dentro del preview del workspace, especialmente cuando una página se gira o se modifica mediante una acción rápida.

Esta fase debe resolver dos problemas principales:

1. Cuando se gira una página, actualmente solo rota la imagen, pero el contenedor no cambia de tamaño ni orientación.
2. Cuando una página se modifica, debe quedar visualmente marcada para que el usuario sepa que el documento cambió.

---

# 1. Rotación inteligente de página

## Problema actual

Al usar las acciones:

- Girar izquierda
- Girar derecha

la imagen de la página rota correctamente, pero el contenedor visual de la página permanece igual.

Esto genera un error visual:

- La imagen queda girada.
- El marco sigue en orientación anterior.
- La proporción no se actualiza.
- El preview se ve desalineado.
- La metadata no refleja correctamente el nuevo estado.

---

## Comportamiento esperado

Cuando el usuario gire una página:

- Debe rotar la imagen.
- Debe rotar o recalcularse el contenedor.
- Debe intercambiarse ancho y alto cuando corresponda.
- Debe actualizarse la orientación visual.
- Debe actualizarse la metadata visible.
- La página debe marcarse como modificada.

---

## Reglas de rotación

La página solo debe aceptar estos valores:

```ts
type PageRotation = 0 | 90 | 180 | 270;
````

Al girar derecha:

```ts
nextRotation = (currentRotation + 90) % 360;
```

Al girar izquierda:

```ts
nextRotation = (currentRotation + 270) % 360;
```

---

## Reglas de dimensiones

Si la rotación es:

```text
0° o 180°
```

usar dimensiones originales:

```ts
displayWidth = originalWidth;
displayHeight = originalHeight;
```

Si la rotación es:

```text
90° o 270°
```

intercambiar dimensiones:

```ts
displayWidth = originalHeight;
displayHeight = originalWidth;
```

---

## Ejemplo

Antes:

```text
Página 1 · Legal · Vertical · 606 × 1002 px
```

Después de girar derecha:

```text
Página 1 · Legal · Horizontal · 1002 × 606 px
```

---

## Estado recomendado por página

Agregar o verificar que cada página tenga este estado:

```ts
type PreviewPage = {
  id: string;
  documentId: string;
  pageNumber: number;

  previewUrl: string;

  originalWidth: number;
  originalHeight: number;

  displayWidth: number;
  displayHeight: number;

  sizeName: string;
  orientation: "portrait" | "landscape";

  rotation: 0 | 90 | 180 | 270;

  status: "pending" | "loading" | "ready" | "error";

  modified: boolean;
  modifiedReason?: "rotated" | "duplicated" | "cut" | "copied" | "pasted" | "moved" | "deleted" | "ocr";
};
```

---

## Función recomendada

```ts
function getRotatedPageDimensions(page: PreviewPage) {
  const shouldSwap = page.rotation === 90 || page.rotation === 270;

  return {
    displayWidth: shouldSwap ? page.originalHeight : page.originalWidth,
    displayHeight: shouldSwap ? page.originalWidth : page.originalHeight,
    orientation: shouldSwap
      ? page.originalHeight > page.originalWidth
        ? "portrait"
        : "landscape"
      : page.originalWidth > page.originalHeight
        ? "landscape"
        : "portrait"
  };
}
```

---

## Handler girar derecha

```ts
function onRotateRight(pageId: string) {
  updatePage(pageId, (page) => {
    const rotation = ((page.rotation + 90) % 360) as PageRotation;

    const updatedPage = {
      ...page,
      rotation,
      modified: true,
      modifiedReason: "rotated"
    };

    return {
      ...updatedPage,
      ...getRotatedPageDimensions(updatedPage)
    };
  });
}
```

---

## Handler girar izquierda

```ts
function onRotateLeft(pageId: string) {
  updatePage(pageId, (page) => {
    const rotation = ((page.rotation + 270) % 360) as PageRotation;

    const updatedPage = {
      ...page,
      rotation,
      modified: true,
      modifiedReason: "rotated"
    };

    return {
      ...updatedPage,
      ...getRotatedPageDimensions(updatedPage)
    };
  });
}
```

---

# 2. Contenedor adaptable al giro

## Regla visual

El contenedor de la página debe usar `displayWidth` y `displayHeight`, no los valores originales.

No usar siempre:

```ts
originalWidth
originalHeight
```

Usar:

```ts
displayWidth
displayHeight
```

---

## CSS recomendado

```css
.preview-page-frame {
  width: var(--page-display-width);
  height: var(--page-display-height);
  max-width: 100%;
  overflow: hidden;
  background: #ffffff;
  border-radius: 10px;
  box-sizing: border-box;
  transition:
    width 180ms ease,
    height 180ms ease,
    transform 180ms ease,
    border-color 180ms ease,
    background-color 180ms ease;
}

.preview-page-frame img,
.preview-page-frame canvas {
  width: 100%;
  height: 100%;
  object-fit: contain;
  display: block;
}
```

---

## Aplicación del estilo

```tsx
<div
  className="preview-page-frame"
  style={{
    "--page-display-width": `${page.displayWidth * zoom}px`,
    "--page-display-height": `${page.displayHeight * zoom}px`
  } as React.CSSProperties}
>
  <img
    src={page.previewUrl}
    alt={`Página ${page.pageNumber}`}
    style={{
      transform: `rotate(${page.rotation}deg)`
    }}
  />
</div>
```

Importante:

Si se rota la imagen con `transform`, cuidar que el contenedor también use dimensiones rotadas.

---

# 3. Metadata actualizada

La metadata visible debe actualizarse después del giro.

## Antes

```text
Legal · Vertical · 606 × 1002 px
```

## Después

```text
Legal · Horizontal · 1002 × 606 px
```

---

## Función recomendada

```ts
function getPageMetadataLabel(page: PreviewPage) {
  const orientationLabel = page.orientation === "portrait" ? "Vertical" : "Horizontal";

  return `${page.sizeName} · ${orientationLabel} · ${page.displayWidth} × ${page.displayHeight} px`;
}
```

---

# 4. Estado visual de página modificada

## Problema actual

Cuando se duplica una página, el contenedor cambia de color y eso ayuda a entender que hubo una modificación.

Ese mismo patrón debe aplicarse a todas las acciones rápidas que alteren la página.

---

## Acciones que deben marcar modificación

En esta fase, implementar al menos:

```text
- Girar izquierda
- Girar derecha
- Duplicar página
```

Dejar preparado para fases siguientes:

```text
- Cortar
- Copiar
- Pegar
- Reordenar
- Eliminar
- OCR
```

---

## Clases recomendadas

```tsx
const pageClassName = clsx(
  "preview-page-frame",
  page.modified && "is-modified",
  page.modifiedReason && `modified-${page.modifiedReason}`
);
```

---

## CSS recomendado

```css
.preview-page-frame.is-modified {
  border: 2px solid #F59E0B;
  background: #FFFBEB;
  box-shadow: 0 10px 28px rgba(245, 158, 11, 0.18);
}

.preview-page-frame.modified-rotated {
  border-color: #3B82F6;
  background: #EFF6FF;
}

.preview-page-frame.modified-duplicated {
  border-color: #10B981;
  background: #ECFDF5;
}
```

---

# 5. Insignia de modificación

Cada página modificada debe mostrar una insignia pequeña.

Ejemplos:

```text
Girado
Duplicado
Modificado
```

---

## Ejemplo visual

```text
Página 1 · Legal · Horizontal
[ Girado ]
```

---

## JSX recomendado

```tsx
{page.modified && (
  <span className={`page-modified-badge modified-${page.modifiedReason}`}>
    {getModifiedLabel(page.modifiedReason)}
  </span>
)}
```

---

## Función recomendada

```ts
function getModifiedLabel(reason?: PreviewPage["modifiedReason"]) {
  switch (reason) {
    case "rotated":
      return "Girado";
    case "duplicated":
      return "Duplicado";
    case "cut":
      return "Cortado";
    case "copied":
      return "Copiado";
    case "pasted":
      return "Pegado";
    case "moved":
      return "Movido";
    case "deleted":
      return "Eliminado";
    case "ocr":
      return "OCR aplicado";
    default:
      return "Modificado";
  }
}
```

---

## CSS de insignia

```css
.page-modified-badge {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: fit-content;
  max-width: 100%;
  padding: 3px 8px;
  border-radius: 999px;
  font-size: 11px;
  font-weight: 600;
  line-height: 1;
  white-space: nowrap;
}

.page-modified-badge.modified-rotated {
  background: #DBEAFE;
  color: #1D4ED8;
}

.page-modified-badge.modified-duplicated {
  background: #D1FAE5;
  color: #047857;
}
```

---

# 6. Miniaturas `pdf-thumb`

La misma lógica de modificación debe verse también en las miniaturas.

Si una página fue girada:

```text
- La miniatura debe reflejar la rotación.
- La metadata corta debe actualizarse.
- Debe aparecer una marca visual.
```

---

## Metadata corta

En miniaturas pequeñas usar:

```text
Legal · H
```

o:

```text
Legal · V
```

---

## Función recomendada

```ts
function getShortPageMetadata(page: PreviewPage) {
  const orientation = page.orientation === "portrait" ? "V" : "H";

  return `${page.sizeName} · ${orientation}`;
}
```

---

## CSS para miniatura modificada

```css
.pdf-thumb.is-modified {
  border-color: #F59E0B;
  background: #FFFBEB;
}

.pdf-thumb.modified-rotated {
  border-color: #3B82F6;
  background: #EFF6FF;
}

.pdf-thumb.modified-duplicated {
  border-color: #10B981;
  background: #ECFDF5;
}
```

---

# 7. Criterios de aceptación

La fase 1 se considera lista cuando:

```text
1. Al girar una página, la imagen rota correctamente.
2. Al girar una página, el contenedor cambia de orientación.
3. Al girar 90° o 270°, ancho y alto se intercambian.
4. La metadata visible cambia de Vertical a Horizontal o viceversa.
5. La página girada queda marcada como modificada.
6. La página duplicada queda marcada como modificada.
7. La miniatura también refleja el estado modificado.
8. Ninguna imagen se desborda del contenedor.
9. El cambio visual no rompe el zoom.
10. El usuario puede identificar claramente qué páginas fueron modificadas.
```

---

# 8. Instrucción final para Codex

Implementar la Fase 1 de acciones rápidas del preview. Corregir la rotación de página para que no solo rote la imagen, sino también el contenedor visual, recalculando ancho, alto, orientación y metadata. Usar `displayWidth` y `displayHeight` derivados de `originalWidth`, `originalHeight` y `rotation`. Cuando la rotación sea 90° o 270°, intercambiar ancho y alto. Toda página modificada debe marcarse visualmente con borde, fondo suave e insignia de modificación. Aplicar este patrón inicialmente a las acciones de girar izquierda, girar derecha y duplicar página. La misma marca visual debe reflejarse tanto en el preview principal como en las miniaturas `pdf-thumb`.

```
```
