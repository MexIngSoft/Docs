Sí, aquí el punto clave es: **no debe resolverlo con `align-items` general**, sino creando **filas lógicas** y calculando el alto máximo por fila. En tu HTML ya aparecen variables como `--thumb-preview-height`, `--thumb-width`, `--paper-visual-aspect` y `--preview-rotation`, pero el problema sigue porque la fila no se normaliza y el rotador recorta el contenido. 

## Corrección obligatoria para previews girados y alto uniforme por fila

Codex debe corregir el grid de previews para que cumpla exactamente esto:

1. Todas las páginas verticales de una misma fila deben tener el mismo alto visual.
2. El alto de la fila debe calcularse con base en la página vertical más alta de esa fila.
3. Si dentro de la fila existe una página horizontal, esa página NO debe estirar ni deformar la fila.
4. La página horizontal debe centrarse verticalmente dentro del alto máximo de la fila.
5. Al girar 90° o 270°, el preview no debe perder contenido por izquierda ni derecha.
6. La imagen rotada debe verse completa dentro del marco `.paper-mini`.
7. Los textos de página, metadata, badge “Girado” y punto verde deben permanecer visibles debajo del preview.

### Implementación requerida

Crear una función después de renderizar o actualizar las páginas:

```ts
function normalizePreviewRows() {
  const grid = document.querySelector(".page-grid");
  if (!grid) return;

  const thumbs = Array.from(grid.querySelectorAll<HTMLElement>(".pdf-thumb"));

  const rows = new Map<number, HTMLElement[]>();

  thumbs.forEach((thumb) => {
    thumb.style.removeProperty("--row-preview-height");

    const top = Math.round(thumb.offsetTop);
    if (!rows.has(top)) rows.set(top, []);
    rows.get(top)!.push(thumb);
  });

  rows.forEach((rowThumbs) => {
    const maxPortraitPreviewHeight = Math.max(
      ...rowThumbs
        .filter((thumb) => thumb.classList.contains("is-portrait"))
        .map((thumb) => {
          const paper = thumb.querySelector<HTMLElement>(".paper-mini");
          return paper ? paper.offsetHeight : 0;
        }),
      0
    );

    rowThumbs.forEach((thumb) => {
      if (maxPortraitPreviewHeight > 0) {
        thumb.style.setProperty("--row-preview-height", `${maxPortraitPreviewHeight}px`);
      }
    });
  });
}
```

Ejecutar esta función en estos eventos:

```ts
useEffect(() => {
  normalizePreviewRows();

  window.addEventListener("resize", normalizePreviewRows);

  return () => {
    window.removeEventListener("resize", normalizePreviewRows);
  };
}, [pages]);
```

También ejecutarla después de:

* girar página izquierda
* girar página derecha
* cargar previews
* reordenar páginas por drag and drop
* insertar página
* eliminar página
* cambiar zoom o tamaño del workspace

### CSS obligatorio

```css
.page-grid {
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start;
  gap: 22px;
}

.pdf-thumb {
  width: var(--thumb-width);
  min-width: var(--thumb-width);
  max-width: var(--thumb-width);
  box-sizing: border-box;
  align-self: flex-start;
}

.thumb-select {
  width: 100%;
  min-height: calc(var(--row-preview-height, var(--thumb-preview-height)) + 92px);

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;

  overflow: visible;
  box-sizing: border-box;
}

.paper-mini {
  width: 100%;
  height: var(--thumb-preview-height);

  display: flex;
  align-items: center;
  justify-content: center;

  overflow: hidden;
  box-sizing: border-box;
}

.pdf-thumb.is-landscape .thumb-select {
  justify-content: center;
}

.pdf-thumb.is-landscape .paper-mini {
  margin-top: auto;
  margin-bottom: auto;
}

.paper-viewport {
  width: 100%;
  height: 100%;
  overflow: hidden;

  display: flex;
  align-items: center;
  justify-content: center;
}

.paper-rotator {
  display: flex;
  align-items: center;
  justify-content: center;

  transform: rotate(var(--preview-rotation));
  transform-origin: center center;
}

.paper-rotator img {
  display: block;
  object-fit: contain;
}
```

### Regla especial para rotación 90° y 270°

Cuando la página tenga `is-quarter-rotated`, no se debe usar el tamaño normal del contenedor para la imagen rotada. El rotador debe intercambiar ancho y alto para evitar recortes laterales:

```css
.pdf-thumb.is-quarter-rotated .paper-rotator {
  width: var(--thumb-preview-height);
  height: var(--thumb-width);
}

.pdf-thumb.is-quarter-rotated .paper-rotator img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}
```

### Validación obligatoria en navegador

Después de girar una página a horizontal, Codex debe validar esto desde consola:

```js
const page = document.querySelector(".pdf-thumb.is-quarter-rotated");
const paper = page.querySelector(".paper-mini");
const img = page.querySelector("img");

const paperBox = paper.getBoundingClientRect();
const imgBox = img.getBoundingClientRect();

console.table({
  previewNoPierdeIzquierda: imgBox.left >= paperBox.left,
  previewNoPierdeDerecha: imgBox.right <= paperBox.right,
  previewNoPierdeArriba: imgBox.top >= paperBox.top,
  previewNoPierdeAbajo: imgBox.bottom <= paperBox.bottom,
  horizontalCentrada: page.classList.contains("is-landscape"),
});
```

Debe dar `true` en todos los puntos.

### Prohibido

No usar `overflow: visible` en `.paper-mini`.
No forzar todas las tarjetas al ancho de la horizontal.
No dejar que la horizontal modifique la altura de las verticales.
No ocultar metadata, número de página, badge o punto verde.
No resolverlo únicamente con CSS global; se requiere normalización por fila.
