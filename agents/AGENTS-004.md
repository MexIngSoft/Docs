Claro. Aquí va la **Fase 4: menú de acciones rápidas** detallada para Codex.

# FASE 4 — Menú de acciones rápidas por página

## Objetivo general

Corregir y reorganizar el menú de tres puntos de cada página.

Actualmente, al dar clic en los tres puntos, el menú aparece, pero queda por debajo de otros previews o se corta dentro del contenedor.

Esta fase debe resolver:

```text
- Menú oculto debajo de páginas.
- Problemas de z-index.
- Problemas de overflow.
- Mala organización de acciones.
- Acciones demasiado largas o difíciles de encontrar.
```

---

# 1. Acciones actuales del menú

Las acciones actuales son:

```text
- Extraer página
- Duplicar página
- Ver metadata
- Descargar página
- Reemplazar página
- Insertar después
- OCR por página
- Agregar nota
- Etiquetar página
- Marcar importante
- Eliminar página
```

---

# 2. Nuevo orden recomendado

## Grupo 1: Edición de página

```text
- Cortar página
- Copiar página
- Duplicar página
- Reemplazar página
- Insertar después
```

## Grupo 2: Información y descarga

```text
- Ver metadata
- Descargar página
```

## Grupo 3: OCR y análisis

```text
- OCR por página
```

## Grupo 4: Organización

```text
- Agregar nota
- Etiquetar página
- Marcar importante
```

## Grupo 5: Acción peligrosa

```text
- Eliminar página
```

---

# 3. Cambio de nombre importante

La acción:

```text
Extraer página
```

debe cambiarse por:

```text
Cortar página
```

La acción:

```text
Extraer como archivo
```

puede agregarse después dentro de acciones avanzadas, pero no debe confundirse con cortar.

---

# 4. Problema actual del menú

Al abrir el menú:

```text
- Solo se ven las primeras acciones.
- Las acciones inferiores quedan ocultas.
- El menú queda debajo de otros previews.
- El contenedor padre probablemente lo está recortando.
```

Causas probables:

```text
- overflow: hidden en contenedor padre.
- z-index bajo.
- position absolute dentro de un contenedor limitado.
- menú renderizado dentro de la tarjeta de página.
```

---

# 5. Solución requerida

El menú debe renderizarse fuera del contenedor de la página, usando un portal.

Recomendado:

```text
React Portal
```

Ejemplo:

```tsx
createPortal(
  <PageActionMenu />,
  document.body
)
```

Esto evita que el menú quede recortado por:

```text
- preview-page-frame
- pdf-thumb
- workspace
- contenedores con overflow hidden
```

---

# 6. Posicionamiento del menú

El menú debe posicionarse tomando como referencia el botón de tres puntos.

```ts
const rect = buttonRef.current.getBoundingClientRect();
```

Posición sugerida:

```ts
top: rect.bottom + 8;
left: rect.left;
```

Si no cabe hacia abajo, abrir hacia arriba.

Si no cabe hacia la derecha, alinear hacia la izquierda.

---

# 7. Estado recomendado

```ts
type PageActionMenuState = {
  isOpen: boolean;
  pageId: string | null;
  documentId: string | null;
  anchorRect: DOMRect | null;
};
```

Estado inicial:

```ts
const pageActionMenu = {
  isOpen: false,
  pageId: null,
  documentId: null,
  anchorRect: null
};
```

---

# 8. Abrir menú

```ts
function onOpenPageActionMenu(event: React.MouseEvent, pageId: string, documentId: string) {
  event.stopPropagation();
  event.preventDefault();

  const rect = event.currentTarget.getBoundingClientRect();

  setPageActionMenu({
    isOpen: true,
    pageId,
    documentId,
    anchorRect: rect
  });
}
```

---

# 9. Cerrar menú

El menú debe cerrarse cuando:

```text
- El usuario selecciona una acción.
- El usuario da clic fuera.
- El usuario presiona Escape.
- El usuario hace scroll fuerte en el workspace.
- El usuario cambia de página activa.
```

Handler:

```ts
function closePageActionMenu() {
  setPageActionMenu({
    isOpen: false,
    pageId: null,
    documentId: null,
    anchorRect: null
  });
}
```

---

# 10. CSS base del menú

```css
.page-action-menu {
  position: fixed;
  z-index: 9999;
  min-width: 260px;
  max-width: 320px;
  max-height: min(80vh, 520px);
  overflow-y: auto;
  padding: 8px;
  border-radius: 16px;
  background: #FFFFFF;
  border: 1px solid #E5E7EB;
  box-shadow: 0 20px 50px rgba(15, 23, 42, 0.18);
}
```

---

# 11. CSS de opción

```css
.page-action-menu-item {
  width: 100%;
  min-height: 40px;
  padding: 9px 10px;
  display: flex;
  align-items: center;
  gap: 10px;
  border: 0;
  border-radius: 10px;
  background: transparent;
  color: #111827;
  font-size: 14px;
  font-weight: 500;
  text-align: left;
  cursor: pointer;
}

.page-action-menu-item:hover {
  background: #F3F4F6;
}
```

---

# 12. Separadores por grupo

```css
.page-action-menu-section {
  padding: 4px 0;
}

.page-action-menu-section + .page-action-menu-section {
  border-top: 1px solid #E5E7EB;
  margin-top: 6px;
  padding-top: 6px;
}
```

---

# 13. Acción peligrosa

Eliminar página debe verse diferente.

```css
.page-action-menu-item.danger {
  color: #DC2626;
}

.page-action-menu-item.danger:hover {
  background: #FEF2F2;
}
```

Regla:

```text
Eliminar página nunca debe ejecutarse sin confirmación o sin opción de deshacer.
```

---

# 14. Acciones del menú y handlers

## Cortar página

```ts
onCutPage(pageId, documentId)
```

## Copiar página

```ts
onCopyPage(pageId, documentId)
```

## Duplicar página

```ts
onDuplicatePage(pageId, documentId)
```

## Ver metadata

```ts
onOpenPageMetadata(pageId, documentId)
```

## Descargar página

```ts
onDownloadPage(pageId, documentId)
```

## Reemplazar página

```ts
onReplacePage(pageId, documentId)
```

## Insertar después

```ts
onInsertAfterPage(pageId, documentId)
```

## OCR por página

```ts
onRunOcrForPage(pageId, documentId)
```

## Agregar nota

```ts
onAddPageNote(pageId, documentId)
```

## Etiquetar página

```ts
onTagPage(pageId, documentId)
```

## Marcar importante

```ts
onMarkPageImportant(pageId, documentId)
```

## Eliminar página

```ts
onRequestDeletePage(pageId, documentId)
```

---

# 15. Estructura recomendada de datos

```ts
type PageActionMenuItem = {
  key: string;
  label: string;
  icon: React.ReactNode;
  group: "edit" | "info" | "ocr" | "organize" | "danger";
  danger?: boolean;
  disabled?: boolean;
  handler: (pageId: string, documentId: string) => void;
};
```

---

# 16. Acciones recomendadas

```ts
const pageActionMenuItems: PageActionMenuItem[] = [
  {
    key: "cut",
    label: "Cortar página",
    group: "edit",
    handler: onCutPage
  },
  {
    key: "copy",
    label: "Copiar página",
    group: "edit",
    handler: onCopyPage
  },
  {
    key: "duplicate",
    label: "Duplicar página",
    group: "edit",
    handler: onDuplicatePage
  },
  {
    key: "replace",
    label: "Reemplazar página",
    group: "edit",
    handler: onReplacePage
  },
  {
    key: "insert-after",
    label: "Insertar después",
    group: "edit",
    handler: onInsertAfterPage
  },
  {
    key: "metadata",
    label: "Ver metadata",
    group: "info",
    handler: onOpenPageMetadata
  },
  {
    key: "download",
    label: "Descargar página",
    group: "info",
    handler: onDownloadPage
  },
  {
    key: "ocr",
    label: "OCR por página",
    group: "ocr",
    handler: onRunOcrForPage
  },
  {
    key: "note",
    label: "Agregar nota",
    group: "organize",
    handler: onAddPageNote
  },
  {
    key: "tag",
    label: "Etiquetar página",
    group: "organize",
    handler: onTagPage
  },
  {
    key: "important",
    label: "Marcar importante",
    group: "organize",
    handler: onMarkPageImportant
  },
  {
    key: "delete",
    label: "Eliminar página",
    group: "danger",
    danger: true,
    handler: onRequestDeletePage
  }
];
```

---

# 17. Accesibilidad

El menú debe tener:

```tsx
role="menu"
```

Cada opción:

```tsx
role="menuitem"
```

Debe permitir:

```text
- Navegar con teclado.
- Cerrar con Escape.
- Activar con Enter.
- Activar con barra espaciadora.
```

---

# 18. Evitar propagación de eventos

Como el menú se abre desde una página seleccionable, cada acción debe ejecutar:

```ts
event.stopPropagation();
```

y si aplica:

```ts
event.preventDefault();
```

---

# 19. Responsive

En pantallas pequeñas:

```text
- El menú no debe salirse de la pantalla.
- Debe tener scroll interno.
- Debe abrirse como bottom sheet si el ancho es muy reducido.
```

Regla recomendada:

```text
Si width < 640px, mostrar menú como panel inferior.
```

---

# 20. Criterios de aceptación

La fase 4 queda lista cuando:

```text
1. El menú de tres puntos aparece por encima de todos los previews.
2. El menú ya no queda recortado ni oculto.
3. Las acciones están agrupadas por tipo.
4. “Extraer página” fue reemplazado por “Cortar página”.
5. Eliminar página aparece como acción peligrosa.
6. El menú puede cerrarse con clic fuera y Escape.
7. Las opciones funcionan con teclado.
8. En móvil, el menú no se desborda.
9. Cada acción llama a su handler correcto.
10. El menú no activa accidentalmente la selección de página.
```

---

# 21. Instrucción final para Codex

Implementar la Fase 4 del menú de acciones rápidas por página. Corregir el menú de tres puntos para que se renderice mediante portal fuera del contenedor del preview, evitando problemas de `overflow` y `z-index`. Posicionar el menú usando el `getBoundingClientRect()` del botón activador y ajustar automáticamente si no cabe en pantalla. Reorganizar las acciones en grupos: edición, información, OCR, organización y peligro. Cambiar “Extraer página” por “Cortar página” y mover “Extraer como archivo” a una acción avanzada futura. El menú debe cerrarse con clic fuera, Escape o al ejecutar una acción. Debe ser accesible con teclado y no debe activar accidentalmente la selección de la página.
