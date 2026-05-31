nEntiendo que ahora vamos con la **Fase 2: copiar, cortar y pegar páginas** para Codex.

# FASE 2 — Sistema de copiar, cortar y pegar páginas

## Objetivo general

Implementar el sistema de manipulación de páginas mediante acciones rápidas:

* Copiar página
* Cortar página
* Pegar página
* Mostrar zonas de inserción
* Marcar visualmente páginas copiadas, cortadas y pegadas

Esta fase depende de que cada página tenga estado individual y pueda modificarse sin perder su metadata, preview, orden y relación con el documento.

---

# 1. Renombrar acción “Extraer página” a “Cortar página”

## Estado actual

Actualmente existe la acción:

```text
Extraer página
```

Pero por el comportamiento esperado debe cambiarse a:

```text
Cortar página
```

## Regla

La acción rápida principal debe llamarse:

```text
Cortar página
```

La acción:

```text
Extraer como archivo
```

debe moverse al menú avanzado.

---

# 2. Estado global de portapapeles de páginas

Crear un estado global para saber si existe una página copiada o cortada.

```ts
type PageClipboard = {
  type: "copy" | "cut" | null;
  pageId: string | null;
  documentId: string | null;
};
```

Estado inicial:

```ts
const pageClipboard = {
  type: null,
  pageId: null,
  documentId: null
};
```

---

# 3. Copiar página

## Comportamiento esperado

Cuando el usuario copie una página:

* La página original no se elimina.
* La página queda marcada visualmente.
* Se activa el modo pegar.
* Se muestran zonas de inserción entre páginas.

## Handler recomendado

```ts
function onCopyPage(pageId: string, documentId: string) {
  setPageClipboard({
    type: "copy",
    pageId,
    documentId
  });

  updatePage(pageId, {
    modified: true,
    modifiedReason: "copied",
    clipboardState: "copied"
  });
}
```

## Visual esperado

```text
Página copiada
Fondo gris suave
Icono de copiar
```

---

# 4. Cortar página

## Comportamiento esperado

Cuando el usuario corte una página:

* La página no debe desaparecer inmediatamente.
* Debe quedar marcada en gris.
* Debe aparecer icono de tijeras.
* Se activan las zonas de inserción.

## Handler recomendado

```ts
function onCutPage(pageId: string, documentId: string) {
  setPageClipboard({
    type: "cut",
    pageId,
    documentId
  });

  updatePage(pageId, {
    modified: true,
    modifiedReason: "cut",
    clipboardState: "cut"
  });
}
```

## Visual esperado

```text
Página cortada
Fondo gris
Opacidad reducida
Icono de tijeras
```

---

# 5. Activar zonas de inserción

Las zonas de inserción solo deben mostrarse cuando exista una página copiada o cortada.

```ts
const shouldShowInsertZones = pageClipboard.type !== null;
```

Estructura esperada:

```text
[ Pegar aquí ]

Página 1

[ Pegar aquí ]

Página 2

[ Pegar aquí ]

Página 3

[ Pegar aquí ]
```

---

# 6. Componente recomendado

Crear un componente:

```text
PageInsertZone
```

Debe recibir:

```ts
type PageInsertZoneProps = {
  targetDocumentId: string;
  targetIndex: number;
  positionLabel: string;
  disabled?: boolean;
};
```

Ejemplo:

```tsx
<PageInsertZone
  targetDocumentId={document.id}
  targetIndex={index}
  positionLabel="Pegar aquí"
/>
```

---

# 7. Pegar página

## Comportamiento esperado

Si el portapapeles es tipo:

```text
copy
```

crear una copia de la página en la posición seleccionada.

Si el portapapeles es tipo:

```text
cut
```

mover la página original a la posición seleccionada.

## Handler recomendado

```ts
function onPastePage(targetDocumentId: string, targetIndex: number) {
  if (!pageClipboard.type || !pageClipboard.pageId) return;

  if (pageClipboard.type === "copy") {
    duplicatePageAtPosition(pageClipboard.pageId, targetDocumentId, targetIndex);
  }

  if (pageClipboard.type === "cut") {
    movePageToPosition(pageClipboard.pageId, targetDocumentId, targetIndex);
  }

  markPastedPage(targetDocumentId, targetIndex);

  clearPageClipboard();
}
```

---

# 8. Página pegada

Toda página pegada debe marcarse visualmente.

```ts
modified: true;
modifiedReason: "pasted";
```

Visual:

```text
Página pegada
Borde destacado
Fondo suave
Etiqueta "Pegada"
```

---

# 9. Clic derecho para pegar

Cuando exista una página copiada o cortada, el usuario puede dar clic derecho sobre una página.

Mostrar menú contextual:

```text
Pegar antes de esta página
Pegar después de esta página
Cancelar
```

Regla:

```text
Este menú solo aparece si pageClipboard.type no es null.
```

---

# 10. Reglas visuales

## Página copiada

```css
.preview-page-frame.modified-copied {
  border-color: #6B7280;
  background: #F3F4F6;
}
```

## Página cortada

```css
.preview-page-frame.modified-cut {
  border-color: #9CA3AF;
  background: #E5E7EB;
  opacity: 0.72;
}
```

## Página pegada

```css
.preview-page-frame.modified-pasted {
  border-color: #8B5CF6;
  background: #F5F3FF;
}
```

## Zona de inserción

```css
.page-insert-zone {
  width: 100%;
  min-height: 44px;
  border: 2px dashed #CBD5E1;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #475569;
  background: #F8FAFC;
  cursor: pointer;
}

.page-insert-zone:hover {
  border-color: #2563EB;
  background: #EFF6FF;
  color: #1D4ED8;
}
```

---

# 11. Reglas funcionales

* Copiar no elimina la página original.
* Cortar no elimina inmediatamente la página; solo la marca como cortada.
* Pegar una página cortada debe moverla.
* Pegar una página copiada debe duplicarla.
* Pegar debe limpiar el portapapeles.
* Cancelar debe limpiar el portapapeles sin modificar el documento.
* Las zonas de inserción no deben mostrarse si no hay página copiada o cortada.

---

# 12. Accesibilidad

Cada zona de inserción debe poder activarse con teclado.

```html
<button class="page-insert-zone">
  Pegar aquí
</button>
```

Evitar `div` clickeables sin accesibilidad.

---

# 13. Criterios de aceptación

La fase 2 queda lista cuando:

1. “Extraer página” se cambió a “Cortar página”.
2. “Extraer como archivo” quedó en menú avanzado.
3. Copiar página marca visualmente la página.
4. Cortar página marca visualmente la página.
5. Al copiar o cortar, aparecen zonas de inserción entre páginas.
6. Al pegar una página copiada, se crea una copia en la posición elegida.
7. Al pegar una página cortada, se mueve la página original.
8. La página pegada queda marcada como modificada.
9. El clic derecho permite pegar antes o después.
10. Al terminar de pegar, el portapapeles queda limpio.

---

# 14. Instrucción final para Codex

Implementar la Fase 2 del sistema de acciones rápidas por página. Cambiar la acción rápida “Extraer página” por “Cortar página”, dejando “Extraer como archivo” en el menú avanzado. Crear un estado global `pageClipboard` para manejar páginas copiadas o cortadas. Al copiar o cortar una página, marcarla visualmente en gris con el icono correspondiente y mostrar zonas de inserción entre páginas. La acción “Pegar” solo debe estar disponible cuando exista contenido copiado o cortado. Al pegar, si la página fue copiada debe duplicarse en la posición seleccionada; si fue cortada debe moverse. Permitir pegar mediante zonas intermedias y mediante clic derecho con opciones “Pegar antes” y “Pegar después”. Toda página pegada debe quedar marcada como modificada.
