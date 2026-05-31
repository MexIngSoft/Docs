Claro. Aquí va la **Fase 3: reordenamiento de páginas por arrastrar y soltar** lista para Codex.

# FASE 3 — Reordenamiento de páginas por arrastrar y soltar

## Objetivo general

Permitir que el usuario cambie el orden de las páginas dentro del preview del workspace usando clic sostenido, arrastre y suelte.

El usuario debe poder tomar una página y moverla entre otras páginas de forma visual, clara y sin perder metadata, preview, estado de modificación ni relación con el documento.

---

# 1. Comportamiento esperado

El flujo debe ser:

```text
Usuario mantiene clic sobre una página
        ↓
La página entra en modo arrastre
        ↓
Aparecen zonas de inserción entre páginas
        ↓
El usuario arrastra la página hacia una nueva posición
        ↓
La zona destino se resalta
        ↓
El usuario suelta la página
        ↓
La página cambia de posición
        ↓
La página queda marcada como modificada
```

---

# 2. Estado necesario por página

Cada página debe poder manejar estado de arrastre.

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

  isDragging?: boolean;
  isDragOver?: boolean;
};
```

---

# 3. Estado global de arrastre

Crear un estado global para saber qué página se está moviendo.

```ts
type PageDragState = {
  isDragging: boolean;
  sourcePageId: string | null;
  sourceDocumentId: string | null;
  sourceIndex: number | null;
  targetDocumentId: string | null;
  targetIndex: number | null;
};
```

Estado inicial:

```ts
const pageDragState = {
  isDragging: false,
  sourcePageId: null,
  sourceDocumentId: null,
  sourceIndex: null,
  targetDocumentId: null,
  targetIndex: null
};
```

---

# 4. Zonas de destino durante arrastre

Mientras una página se arrastra, deben mostrarse zonas de inserción entre páginas.

Estructura:

```text
[ Soltar aquí ]

Página 1

[ Soltar aquí ]

Página 2

[ Soltar aquí ]

Página 3

[ Soltar aquí ]
```

Estas zonas pueden reutilizar la lógica visual de `PageInsertZone`, pero con texto diferente:

```text
Soltar aquí
```

---

# 5. Componente recomendado

Crear o reutilizar:

```text
PageDropZone
```

Props sugeridas:

```ts
type PageDropZoneProps = {
  targetDocumentId: string;
  targetIndex: number;
  isActive: boolean;
  isHighlighted: boolean;
  onDropPage: (targetDocumentId: string, targetIndex: number) => void;
};
```

---

# 6. Inicio del arrastre

Al iniciar arrastre:

```ts
function onDragStartPage(pageId: string, documentId: string, index: number) {
  setPageDragState({
    isDragging: true,
    sourcePageId: pageId,
    sourceDocumentId: documentId,
    sourceIndex: index,
    targetDocumentId: null,
    targetIndex: null
  });

  updatePage(pageId, {
    isDragging: true
  });
}
```

---

# 7. Durante el arrastre

Cuando el usuario pase sobre una zona de destino:

```ts
function onDragOverDropZone(targetDocumentId: string, targetIndex: number) {
  setPageDragState((state) => ({
    ...state,
    targetDocumentId,
    targetIndex
  }));
}
```

La zona debe resaltarse.

---

# 8. Soltar página

Al soltar:

```ts
function onDropPage(targetDocumentId: string, targetIndex: number) {
  if (!pageDragState.sourcePageId) return;

  movePageToPosition({
    pageId: pageDragState.sourcePageId,
    fromDocumentId: pageDragState.sourceDocumentId,
    fromIndex: pageDragState.sourceIndex,
    toDocumentId: targetDocumentId,
    toIndex: targetIndex
  });

  updatePage(pageDragState.sourcePageId, {
    modified: true,
    modifiedReason: "moved",
    isDragging: false
  });

  clearPageDragState();
}
```

---

# 9. Cancelar arrastre

Si el usuario suelta fuera de una zona válida o presiona Escape:

```ts
function cancelPageDrag() {
  if (pageDragState.sourcePageId) {
    updatePage(pageDragState.sourcePageId, {
      isDragging: false
    });
  }

  clearPageDragState();
}
```

---

# 10. Reglas visuales

## Página arrastrada

```css
.preview-page-frame.is-dragging,
.pdf-thumb.is-dragging {
  opacity: 0.55;
  transform: scale(0.98);
  border: 2px dashed #2563EB;
}
```

## Zona de destino

```css
.page-drop-zone {
  width: 100%;
  min-height: 44px;
  border: 2px dashed #CBD5E1;
  border-radius: 12px;
  background: #F8FAFC;
  color: #475569;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

## Zona activa

```css
.page-drop-zone.is-active {
  border-color: #2563EB;
  background: #EFF6FF;
  color: #1D4ED8;
}
```

## Página movida

```css
.preview-page-frame.modified-moved,
.pdf-thumb.modified-moved {
  border-color: #8B5CF6;
  background: #F5F3FF;
}
```

---

# 11. Reglas funcionales

```text
- El arrastre debe mover la página, no duplicarla.
- La página movida debe conservar su preview.
- La página movida debe conservar metadata.
- La página movida debe conservar rotación.
- La página movida debe conservar notas y etiquetas.
- Después de moverla, se debe recalcular el número visual de página.
- La página movida debe marcarse como modificada.
```

---

# 12. Numeración después del reordenamiento

Después de mover una página, recalcular:

```ts
page.pageNumber
```

según su nueva posición.

Ejemplo:

```text
Antes:
Página 1
Página 2
Página 3

Mover Página 3 al inicio:

Después:
Página 1 antigua 3
Página 2 antigua 1
Página 3 antigua 2
```

---

# 13. Reglas con documentos múltiples

Si hay varios documentos cargados:

```text
- Permitir mover páginas dentro del mismo documento.
- Preparar estructura para mover páginas entre documentos.
- Si existe separador entre documentos, respetarlo.
```

Si la fase de documentos múltiples aún no está completa, limitar esta fase a:

```text
Reordenar dentro del documento activo.
```

---

# 14. Accesibilidad mínima

El drag & drop debe tener alternativa por menú.

En “Más opciones” agregar:

```text
Mover antes de...
Mover después de...
Mover al inicio
Mover al final
```

Esto es necesario para usuarios que no pueden usar arrastre.

---

# 15. Criterios de aceptación

La fase 3 queda lista cuando:

```text
1. El usuario puede mantener clic sobre una página y arrastrarla.
2. Al arrastrar, aparecen zonas de destino entre páginas.
3. La página arrastrada se ve semitransparente.
4. La zona destino se resalta.
5. Al soltar, la página cambia de posición.
6. La página movida queda marcada como modificada.
7. La numeración visual se recalcula.
8. La página conserva preview, metadata, rotación, notas y etiquetas.
9. Si se cancela el arrastre, no se modifica el documento.
10. Existe alternativa en menú para mover sin arrastrar.
```

---

# 16. Instrucción final para Codex

Implementar la Fase 3 del preview: reordenamiento de páginas por arrastrar y soltar. El usuario debe poder mantener clic sobre una página, arrastrarla y soltarla entre otras páginas usando zonas de destino visibles. Durante el arrastre, la página debe mostrarse semitransparente y las zonas de destino deben resaltarse. Al soltar, mover la página a la nueva posición, recalcular la numeración visual, conservar preview, metadata, rotación, notas y etiquetas, y marcar la página como modificada con `modifiedReason: "moved"`. Agregar una alternativa accesible en el menú de tres puntos para mover la página al inicio, al final, antes o después de otra página.
