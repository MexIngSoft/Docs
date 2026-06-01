Sí. El problema ya no es solo rotación: ahora falta **normalizar la fila** y **centrar la hoja horizontal dentro de su marco**. En tu HTML la página 4 ya trae `is-landscape`, `--thumb-preview-height: 170px`, `--thumb-width: 289px` y rotación `270deg`, pero la imagen rotada queda mal contenida. 

Pásale esto a Codex:

````md
## Corrección final: fila estable + preview horizontal centrado

### Objetivo
Cuando una página se gira a horizontal:
1. La tarjeta horizontal puede ser más ancha.
2. Las tarjetas verticales de la misma fila NO deben cambiar su altura.
3. El preview horizontal debe quedar centrado verticalmente dentro de su tarjeta.
4. La imagen rotada nunca debe salirse de `.paper-mini`.
5. Los datos de página deben seguir visibles debajo.

### Reglas CSS obligatorias

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
  height: auto;
  align-self: flex-start;
  box-sizing: border-box;
}

.thumb-select {
  width: 100%;
  height: auto;
  min-height: unset;

  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;

  gap: 6px;
  overflow: visible;
}

.paper-mini {
  width: 100%;
  height: var(--thumb-preview-height);
  aspect-ratio: var(--paper-visual-aspect);

  display: flex;
  align-items: center;
  justify-content: center;

  overflow: hidden;
  box-sizing: border-box;
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
  width: 100%;
  height: 100%;

  display: flex;
  align-items: center;
  justify-content: center;

  transform: rotate(var(--preview-rotation));
  transform-origin: center center;
}

.paper-rotator img {
  display: block;
  object-fit: contain;
  max-width: 100%;
  max-height: 100%;
}
````

### Regla especial para páginas giradas 90/270

```css
.pdf-thumb.is-quarter-rotated .paper-rotator {
  width: var(--thumb-preview-height);
  height: var(--thumb-width);
}

.pdf-thumb.is-quarter-rotated .paper-rotator img {
  width: auto;
  height: 100%;
  max-width: none;
  max-height: 100%;
  object-fit: contain;
}
```

### Centrado vertical de horizontal

```css
.pdf-thumb.is-landscape .thumb-select {
  justify-content: center;
}

.pdf-thumb.is-landscape .paper-mini {
  margin-top: auto;
  margin-bottom: 6px;
}
```

### No modificar esto

No cambiar altura de las páginas verticales para compensar la horizontal.
No usar `align-items: stretch`.
No usar `min-height` global para todas las tarjetas.
No usar `overflow: visible` en `.paper-mini` ni `.paper-viewport`.

### Validación obligatoria

```js
const page4 = document.querySelector("#page-4");
const paper = page4.querySelector(".paper-mini");
const img = page4.querySelector("img");

const p = paper.getBoundingClientRect();
const i = img.getBoundingClientRect();

console.table({
  paperWidth: p.width,
  paperHeight: p.height,
  imgInsideX: i.left >= p.left && i.right <= p.right,
  imgInsideY: i.top >= p.top && i.bottom <= p.bottom,
  isLandscape: p.width > p.height,
});
```

Debe dar:

* `paperWidth > paperHeight`
* `imgInsideX: true`
* `imgInsideY: true`
* página 4 centrada verticalmente
* páginas 1, 2, 3 y 5 conservan su altura normal

```
```
