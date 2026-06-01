Sí, tienes razón. Para Codex conviene darle **instrucciones accionables**, con nombres de estados, eventos, estructura sugerida, CSS/TS de referencia y checklist de validación.

Te dejo una versión más útil para implementar:

# Instrucción detallada para Codex: corregir menús, rotación, zonas de inserción, sidebar y botón de registro

Antes de modificar código, revisar los componentes relacionados con:

```text
pdf-thumb
thumb-select
paper-mini
paper-viewport
paper-rotator
page-quick-actions
page-menu
smart-insertion-zone
insertion-menu
sidebar-tab
topbar-primary
```

No hacer cambios globales sin identificar primero dónde se renderizan estos elementos.

---

## 1. Objetivo general

Corregir la interfaz de previews PDF para que:

```text
1. Los menús siempre aparezcan por encima de los previews.
2. Los menús se cierren al hacer clic fuera, al ejecutar una acción o al abrir otro menú.
3. Las páginas rotadas no se reduzcan dentro del mismo espacio incorrecto.
4. El contenedor visual de la página se adapte a la rotación.
5. El grid reacomode páginas cuando una hoja cambia de vertical a horizontal o viceversa.
6. Las zonas de inserción queden centradas entre páginas.
7. La barra rápida solo aparezca cuando corresponda.
8. El botón sidebar-tab desaparezca cuando el sidebar esté visible.
9. El botón Registrarme conserve estilo destacado.
10. Todo lo anterior quede validado con pruebas o checklist técnico.
```

---

# A. Estado único de menús flotantes

## A.1 Crear un estado centralizado

Debe existir un solo menú abierto a la vez.

Usar un estado parecido a:

```ts
type FloatingMenuType = "page-menu" | "insertion-menu" | null;

type FloatingMenuState = {
  type: FloatingMenuType;
  pageId?: string;
  insertionAfterPageId?: string;
  anchorElement?: HTMLElement | null;
};
```

Ejemplo:

```ts
const [floatingMenu, setFloatingMenu] = useState<FloatingMenuState>({
  type: null,
});
```

## A.2 Abrir menú de página

```ts
function openPageMenu(pageId: string, anchorElement: HTMLElement) {
  setFloatingMenu({
    type: "page-menu",
    pageId,
    anchorElement,
  });
}
```

## A.3 Abrir menú de inserción

```ts
function openInsertionMenu(afterPageId: string, anchorElement: HTMLElement) {
  setFloatingMenu({
    type: "insertion-menu",
    insertionAfterPageId: afterPageId,
    anchorElement,
  });
}
```

## A.4 Cerrar cualquier menú

```ts
function closeFloatingMenu() {
  setFloatingMenu({ type: null });
}
```

---

# B. Cierre automático de menús

## B.1 Eventos obligatorios de cierre

Codex debe implementar cierre en estos eventos:

```text
- click fuera del menú
- pointerdown fuera del menú
- tecla ESC
- scroll del contenedor de previews
- resize de ventana
- inicio de drag & drop
- apertura de otro menú
- ejecución de cualquier acción del menú
- apertura del sidebar
- cambio de documento
- cambio de página activa
```

## B.2 Hook sugerido

Crear o reutilizar un hook:

```ts
function useFloatingMenuClose({
  isOpen,
  menuRef,
  anchorRef,
  onClose,
}: {
  isOpen: boolean;
  menuRef: React.RefObject<HTMLElement>;
  anchorRef?: React.RefObject<HTMLElement>;
  onClose: () => void;
}) {
  useEffect(() => {
    if (!isOpen) return;

    function handlePointerDown(event: PointerEvent) {
      const target = event.target as Node;

      const clickedMenu = menuRef.current?.contains(target);
      const clickedAnchor = anchorRef?.current?.contains(target);

      if (!clickedMenu && !clickedAnchor) {
        onClose();
      }
    }

    function handleKeyDown(event: KeyboardEvent) {
      if (event.key === "Escape") {
        onClose();
      }
    }

    window.addEventListener("pointerdown", handlePointerDown, true);
    window.addEventListener("keydown", handleKeyDown, true);
    window.addEventListener("resize", onClose, true);

    return () => {
      window.removeEventListener("pointerdown", handlePointerDown, true);
      window.removeEventListener("keydown", handleKeyDown, true);
      window.removeEventListener("resize", onClose, true);
    };
  }, [isOpen, menuRef, anchorRef, onClose]);
}
```

---

# C. Renderizar menús por portal

## C.1 Problema

Los menús:

```text
.page-menu
.insertion-menu
```

quedan debajo de previews porque están dentro de contenedores con `overflow`, `transform`, `position`, `z-index` o stacking context.

## C.2 Solución requerida

Renderizar menús flotantes con portal a `document.body`.

Ejemplo:

```tsx
import { createPortal } from "react-dom";

function FloatingMenuPortal({ children }: { children: React.ReactNode }) {
  if (typeof document === "undefined") return null;

  return createPortal(
    <div className="floating-menu-layer">
      {children}
    </div>,
    document.body
  );
}
```

## C.3 CSS obligatorio

```css
.floating-menu-layer {
  position: fixed;
  inset: 0;
  z-index: 9999;
  pointer-events: none;
}

.page-menu,
.insertion-menu {
  position: fixed;
  z-index: 10000;
  pointer-events: auto;
}
```

## C.4 Validación

Codex debe confirmar que ningún preview puede tapar estos menús aunque tenga:

```css
transform
overflow
position
z-index
```

---

# D. Posicionamiento inteligente del menú

## D.1 Calcular posición desde anchor

Implementar lógica similar:

```ts
type MenuPosition = {
  top: number;
  left: number;
  transformOrigin: string;
};

function getFloatingMenuPosition(
  anchorRect: DOMRect,
  menuWidth: number,
  menuHeight: number
): MenuPosition {
  const margin = 8;
  const viewportWidth = window.innerWidth;
  const viewportHeight = window.innerHeight;

  let top = anchorRect.bottom + margin;
  let left = anchorRect.left;

  if (left + menuWidth > viewportWidth - margin) {
    left = viewportWidth - menuWidth - margin;
  }

  if (left < margin) {
    left = margin;
  }

  if (top + menuHeight > viewportHeight - margin) {
    top = anchorRect.top - menuHeight - margin;
  }

  if (top < margin) {
    top = margin;
  }

  return {
    top,
    left,
    transformOrigin: top < anchorRect.top ? "bottom left" : "top left",
  };
}
```

## D.2 Actualizar en scroll/resize

Si el usuario hace scroll o resize:

```text
opción recomendada: cerrar menú
opción alternativa: recalcular posición
```

Para esta fase se prefiere cerrar.

---

# E. Acciones del menú de página

Cada botón del menú debe:

```text
1. Ejecutar su acción.
2. Cerrar el menú.
3. Actualizar estado visual.
4. Registrar modificación si aplica.
5. No dejar menús flotantes abiertos.
```

Ejemplo:

```tsx
function handlePageMenuAction(action: PageAction, pageId: string) {
  switch (action) {
    case "CUT_PAGE":
      cutPage(pageId);
      break;

    case "COPY_PAGE":
      copyPage(pageId);
      break;

    case "DUPLICATE_PAGE":
      duplicatePage(pageId);
      break;

    case "DELETE_PAGE":
      movePageToTrash(pageId);
      break;

    case "OCR_PAGE":
      startPageOcr(pageId);
      break;

    default:
      executePageAction(action, pageId);
      break;
  }

  closeFloatingMenu();
}
```

## E.1 Acciones mínimas a contemplar

```ts
type PageAction =
  | "CUT_PAGE"
  | "COPY_PAGE"
  | "DUPLICATE_PAGE"
  | "EXTRACT_AS_FILE"
  | "VIEW_METADATA"
  | "DOWNLOAD_PAGE"
  | "REPLACE_PAGE"
  | "INSERT_DOCUMENT"
  | "OCR_PAGE"
  | "ADD_NOTE"
  | "TAG_PAGE"
  | "MARK_IMPORTANT"
  | "SIGN_PAGE"
  | "WATERMARK_PAGE"
  | "NUMBER_PAGE"
  | "TRANSLATE_PAGE"
  | "SPLIT_FROM_HERE"
  | "CONVERT_TO_IMAGE"
  | "EXTRACT_IMAGES"
  | "MOVE_TO_TRASH";
```

---

# F. Acciones del menú de inserción

Cada acción del menú de inserción debe cerrar el menú al ejecutarse.

```tsx
function handleInsertionAction(action: InsertionAction, afterPageId: string) {
  switch (action) {
    case "INSERT_BLANK_PAGE":
      insertBlankPageAfter(afterPageId);
      break;

    case "SPLIT_HERE":
      splitDocumentAfter(afterPageId);
      break;

    case "PASTE_HERE":
      pasteClipboardAfter(afterPageId);
      break;

    case "INSERT_PDF":
      openInsertPdfDialog(afterPageId);
      break;

    case "INSERT_IMAGE":
      openInsertImageDialog(afterPageId);
      break;
  }

  closeFloatingMenu();
}
```

```ts
type InsertionAction =
  | "INSERT_BLANK_PAGE"
  | "SPLIT_HERE"
  | "PASTE_HERE"
  | "INSERT_PDF"
  | "INSERT_IMAGE";
```

---

# G. Rotación correcta de previews

## G.1 Problema a corregir

Actualmente, el sistema intenta adaptar la rotación reduciendo la imagen dentro del mismo espacio.

Eso es incorrecto.

No debe hacer esto:

```text
rotar imagen y hacerla más pequeña dentro del mismo contenedor horizontal
```

Debe hacer esto:

```text
recalcular el tamaño visual del contenedor
rotar el viewport visual
reacomodar el grid
centrar el preview en la fila
```

---

## G.2 Función obligatoria para dimensiones visuales

Crear una función pura y testeable:

```ts
type PageSize = {
  width: number;
  height: number;
};

type VisualPageSize = {
  originalWidth: number;
  originalHeight: number;
  visualWidth: number;
  visualHeight: number;
  rotation: 0 | 90 | 180 | 270;
  isQuarterRotated: boolean;
  visualOrientation: "H" | "V";
  visualAspect: string;
  originalAspect: string;
};

function normalizeRotation(rotation: number): 0 | 90 | 180 | 270 {
  const value = ((rotation % 360) + 360) % 360;

  if (value === 90 || value === 180 || value === 270) {
    return value;
  }

  return 0;
}

function getVisualPageSize(
  page: PageSize,
  rotationInput: number
): VisualPageSize {
  const rotation = normalizeRotation(rotationInput);
  const isQuarterRotated = rotation === 90 || rotation === 270;

  const visualWidth = isQuarterRotated ? page.height : page.width;
  const visualHeight = isQuarterRotated ? page.width : page.height;

  return {
    originalWidth: page.width,
    originalHeight: page.height,
    visualWidth,
    visualHeight,
    rotation,
    isQuarterRotated,
    visualOrientation: visualWidth >= visualHeight ? "H" : "V",
    visualAspect: `${visualWidth} / ${visualHeight}`,
    originalAspect: `${page.width} / ${page.height}`,
  };
}
```

## G.3 Uso en React

```tsx
const visual = getVisualPageSize(
  { width: page.width, height: page.height },
  page.rotation
);

<article
  className={cx("pdf-thumb", {
    "modified-rotated": visual.rotation !== 0,
    "is-landscape": visual.visualOrientation === "H",
    "is-portrait": visual.visualOrientation === "V",
  })}
  style={{
    "--paper-visual-aspect": visual.visualAspect,
    "--paper-original-aspect": visual.originalAspect,
    "--preview-rotation": `${visual.rotation}deg`,
  } as React.CSSProperties}
>
```

## G.4 Metadata visual

La metadata debe usar la orientación visual:

```tsx
<small className="page-metadata">
  {page.sizeLabel} | {visual.visualOrientation}
</small>
```

No debe mostrar horizontal si visualmente quedó vertical.

---

# H. CSS para preview rotado

Codex debe evitar que la imagen se achique incorrectamente.

Base sugerida:

```css
.thumb-select {
  display: grid;
  justify-items: center;
}

.paper-mini {
  position: relative;
  display: grid;
  place-items: center;
  inline-size: var(--thumb-visual-width, 160px);
  aspect-ratio: var(--paper-visual-aspect);
  overflow: visible;
}

.paper-viewport {
  position: relative;
  display: grid;
  place-items: center;
  inline-size: 100%;
  block-size: 100%;
  overflow: visible;
}

.paper-rotator {
  display: grid;
  place-items: center;
  transform: rotate(var(--preview-rotation));
  transform-origin: center;
}

.paper-rotator img {
  display: block;
  inline-size: 100%;
  block-size: auto;
  object-fit: contain;
}
```

Para páginas giradas 90/270:

```css
.pdf-thumb.modified-rotated .paper-rotator {
  inline-size: 100%;
}
```

Codex debe ajustar esto con pruebas visuales. Lo importante es:

```text
el espacio reservado debe cambiar
la imagen no debe simplemente reducirse
el grid debe reacomodarse
```

---

# I. Reacomodo del grid

## I.1 Grid flexible

El grid debe permitir que páginas horizontales ocupen más ancho.

Ejemplo CSS sugerido:

```css
.pdf-pages-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(var(--thumb-min-width), auto));
  gap: var(--page-gap);
  align-items: center;
}
```

Si el grid actual no soporta anchos variables, Codex debe migrarlo o ajustar:

```text
- CSS Grid con auto-fit/auto-fill
- flex-wrap con align-items center
- masonry no recomendado para esta fase
```

## I.2 Regla importante

Cuando una página pasa de vertical a horizontal:

```text
debe ocupar más ancho
las páginas siguientes deben recorrerse
no debe aplastarse la página
no debe encimarse con otra
```

Cuando pasa de horizontal a vertical:

```text
debe ocupar menos ancho
debe liberar espacio
las páginas siguientes pueden subir o acomodarse
```

---

# J. Altura y centrado de fila

Si una página horizontal queda junto a una página vertical:

```css
.pdf-pages-grid {
  align-items: center;
}

.pdf-thumb {
  align-self: center;
}
```

La página más pequeña debe centrarse respecto a la más alta.

---

# K. Smart insertion zone

## K.1 Si se puede cambiar estructura

La mejor solución es que la zona de inserción sea un elemento del grid, no hija del `article`.

Estructura recomendada:

```tsx
<div className="pdf-pages-grid">
  <SmartInsertionZone position="start" />

  {pages.map((page) => (
    <Fragment key={page.id}>
      <PdfThumb page={page} />
      <SmartInsertionZone afterPageId={page.id} />
    </Fragment>
  ))}
</div>
```

## K.2 CSS recomendado

```css
.smart-insertion-zone {
  position: relative;
  display: grid;
  place-items: center;
  inline-size: var(--insertion-zone-width, 22px);
  min-block-size: var(--row-preview-height, 220px);
  z-index: 2;
}

.smart-insertion-zone:hover {
  z-index: 20;
}

.insertion-line {
  inline-size: 2px;
  block-size: 80%;
}
```

## K.3 Si no se puede mover estructura

Si `.smart-insertion-zone` debe seguir dentro de `.pdf-thumb`, entonces:

```text
Codex debe simular visualmente que está entre dos páginas:
- position absolute
- right negativo controlado
- transform translateX(50%)
- z-index superior
- sin afectar layout de la página
```

Pero esta es solución temporal.

---

# L. Menú de inserción por portal

El menú de inserción también debe usar portal.

No debe quedar dentro de `.smart-insertion-zone` si eso hace que quede abajo de previews.

```tsx
{floatingMenu.type === "insertion-menu" && (
  <FloatingMenuPortal>
    <InsertionMenu
      afterPageId={floatingMenu.insertionAfterPageId}
      anchorElement={floatingMenu.anchorElement}
      onAction={handleInsertionAction}
      onClose={closeFloatingMenu}
    />
  </FloatingMenuPortal>
)}
```

---

# M. Sidebar tab

## M.1 Regla

El botón:

```html
<button class="sidebar-tab">
```

debe desaparecer cuando el slider/sidebar esté abierto.

## M.2 Estado sugerido

```ts
const shouldShowSidebarTab = !isSidebarOpen && !isSidebarOpening;
```

## M.3 Render

```tsx
{shouldShowSidebarTab && (
  <button
    className="sidebar-tab"
    type="button"
    aria-label="Abrir navegación"
    aria-expanded={isSidebarOpen}
    onClick={openSidebar}
  >
    <MenuIcon />
  </button>
)}
```

## M.4 Validación

```text
Sidebar cerrado: sidebar-tab visible.
Sidebar abriendo: sidebar-tab oculto.
Sidebar abierto: sidebar-tab oculto.
Sidebar cerrando: sidebar-tab oculto hasta terminar animación.
Sidebar cerrado completamente: sidebar-tab visible.
```

---

# N. Botón Registrarme

## N.1 Problema

El botón:

```html
<button class="topbar-primary">Registrarme</button>
```

perdió color y se ve blanco.

## N.2 Restaurar estilos

Debe tener estilo de acción principal.

CSS sugerido:

```css
.topbar-primary {
  border: 0;
  border-radius: 999px;
  padding: 0.65rem 1rem;
  font-weight: 700;
  color: #ffffff;
  background: var(--primary-color, #2563eb);
  box-shadow: 0 10px 24px rgba(37, 99, 235, 0.24);
  cursor: pointer;
}

.topbar-primary:hover {
  filter: brightness(1.05);
  transform: translateY(-1px);
}

.topbar-primary:focus-visible {
  outline: 3px solid rgba(37, 99, 235, 0.35);
  outline-offset: 2px;
}

.topbar-primary:active {
  transform: translateY(0);
}

.topbar-primary:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}
```

---

# O. Validaciones obligatorias

Codex debe agregar pruebas o, si el proyecto aún no tiene framework de pruebas listo, dejar checklist técnico documentado.

## O.1 Tests unitarios mínimos

Para `getVisualPageSize`:

```ts
describe("getVisualPageSize", () => {
  it("keeps width and height when rotation is 0", () => {
    expect(getVisualPageSize({ width: 1000, height: 600 }, 0)).toMatchObject({
      visualWidth: 1000,
      visualHeight: 600,
      visualOrientation: "H",
    });
  });

  it("swaps width and height when rotation is 90", () => {
    expect(getVisualPageSize({ width: 1000, height: 600 }, 90)).toMatchObject({
      visualWidth: 600,
      visualHeight: 1000,
      visualOrientation: "V",
    });
  });

  it("keeps width and height when rotation is 180", () => {
    expect(getVisualPageSize({ width: 1000, height: 600 }, 180)).toMatchObject({
      visualWidth: 1000,
      visualHeight: 600,
      visualOrientation: "H",
    });
  });

  it("swaps width and height when rotation is 270", () => {
    expect(getVisualPageSize({ width: 1000, height: 600 }, 270)).toMatchObject({
      visualWidth: 600,
      visualHeight: 1000,
      visualOrientation: "V",
    });
  });
});
```

## O.2 Tests de interacción mínimos

Validar:

```text
1. Abrir page-menu.
2. Abrir insertion-menu y verificar que page-menu se cerró.
3. Clic fuera cierra menú.
4. ESC cierra menú.
5. Acción del menú cierra menú.
6. Scroll cierra menú.
7. Drag start cierra menú.
8. Hover muestra page-quick-actions.
9. Mouse leave oculta page-quick-actions.
10. Sidebar abierto oculta sidebar-tab.
11. Sidebar cerrado muestra sidebar-tab.
```

## O.3 Checklist visual obligatorio

Codex debe validar manualmente:

```text
- Menú page-menu siempre encima de previews.
- Menú insertion-menu siempre encima de previews.
- Ningún menú queda cortado.
- Ningún menú permanece abierto al hacer clic fuera.
- Página 90° se ve vertical real.
- Página 270° se ve vertical real.
- Página 180° conserva layout original.
- Metadata cambia de H a V cuando corresponde.
- Página horizontal ocupa más ancho si queda horizontal visual.
- Página vertical ocupa menos ancho si queda vertical visual.
- Grid reacomoda páginas vecinas.
- Smart insertion zone queda centrada.
- Smart insertion zone funciona al inicio.
- Smart insertion zone funciona al final.
- Botón sidebar-tab desaparece con sidebar abierto.
- Botón Registrarme vuelve a verse destacado.
```

---

# P. Reporte obligatorio

Al finalizar, Codex debe documentar:

```text
1. Archivos modificados.
2. Componentes afectados.
3. Funciones nuevas creadas.
4. Estados nuevos creados.
5. Pruebas agregadas.
6. Validaciones manuales realizadas.
7. Problemas pendientes.
8. Decisiones técnicas tomadas.
```

El reporte debe guardarse en:

```text
Docs/agents/EXECUTION_REPORT.md
```
