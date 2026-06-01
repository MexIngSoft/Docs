Sí, ya está mejor, pero ahora el ajuste debe ser: **cuando sea horizontal, la tarjeta completa debe bajar de alto y no reservar el alto de una vertical**. En tu HTML ya aparece `--thumb-preview-height: 170px` y `--thumb-width: 281px` para página horizontal, pero visualmente la tarjeta sigue dejando espacio extra debajo. 

Copia esto para Codex:

````md
# Ajuste final de previews rotadas en DocuCore

## Problemas actuales

1. La página ya gira y se adapta al ancho.
2. Pero el alto del contenedor sigue como si fuera vertical.
3. Al girar, desaparecen o se bajan demasiado los detalles:
   - Página
   - Tamaño / orientación
   - Badge "Girado"
   - punto verde
4. Algunos previews se salen del contenedor o se empalman con páginas vecinas.

## Regla principal

Cuando una página queda horizontal:

- `article.pdf-thumb` debe ser más ancho.
- `article.pdf-thumb` debe ser más bajo.
- `.thumb-select` no debe conservar altura de página vertical.
- `.paper-mini` debe medir exactamente el alto horizontal.
- Los detalles deben quedar inmediatamente debajo del preview.
- No debe quedar espacio vacío grande entre el preview y los detalles.

## CSS obligatorio

Revisar y corregir estas reglas:

```css
.pdf-thumb {
  inline-size: var(--thumb-width);
  min-inline-size: var(--thumb-width);
  max-inline-size: var(--thumb-width);

  block-size: auto;
  min-block-size: auto;
  height: auto;

  overflow: visible;
  box-sizing: border-box;
}

.thumb-select {
  inline-size: 100%;
  block-size: auto;
  min-block-size: unset;
  height: auto;

  display: grid;
  grid-template-rows: auto auto auto auto auto;
  justify-items: center;
  align-content: start;
  gap: 6px;

  overflow: visible;
}

.paper-mini {
  inline-size: 100%;
  block-size: var(--thumb-preview-height);
  height: var(--thumb-preview-height);
  max-block-size: var(--thumb-preview-height);

  aspect-ratio: var(--paper-visual-aspect);
  display: grid;
  place-items: center;

  overflow: hidden;
}

.paper-viewport {
  inline-size: 100%;
  block-size: 100%;
  display: grid;
  place-items: center;
  overflow: hidden;
}

.paper-rotator {
  display: grid;
  place-items: center;
  transform: rotate(var(--preview-rotation));
  transform-origin: center;
}

.paper-rotator img {
  display: block;
  max-inline-size: 100%;
  max-block-size: 100%;
  object-fit: contain;
}
````

## Regla especial para horizontal

```css
.pdf-thumb.is-landscape {
  block-size: auto;
  min-block-size: unset;
  align-self: start;
}

.pdf-thumb.is-landscape .thumb-select {
  block-size: auto;
  min-block-size: unset;
  padding-block-end: 10px;
}

.pdf-thumb.is-landscape .paper-mini {
  block-size: var(--thumb-preview-height);
  height: var(--thumb-preview-height);
}

.pdf-thumb.is-landscape strong,
.pdf-thumb.is-landscape .page-metadata,
.pdf-thumb.is-landscape .page-modified-badge,
.pdf-thumb.is-landscape .preview-dot {
  display: inline-flex;
  visibility: visible;
  opacity: 1;
}
```

## No hacer

No usar:

```css
min-height fijo en .pdf-thumb
height fijo en .thumb-select
padding-bottom grande
align-self: stretch para horizontales
overflow visible en el viewport de imagen
```

Eso causa que la hoja horizontal conserve altura de vertical o se salga.

## Grid

El grid debe permitir distintas alturas por tarjeta sin romper filas:

```css
.page-grid {
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start;
  gap: 22px;
  overflow: visible;
}
```

Si actualmente se usa `align-items: stretch`, cambiarlo a:

```css
align-items: flex-start;
```

## Validación obligatoria

Después de girar página 3:

```js
const page = document.querySelector("#page-3");
const paper = page.querySelector(".paper-mini");
const metadata = page.querySelector(".page-metadata");
const badge = page.querySelector(".page-modified-badge");

console.table({
  articleHeight: page.getBoundingClientRect().height,
  paperHeight: paper.getBoundingClientRect().height,
  paperWidth: paper.getBoundingClientRect().width,
  metadataVisible: getComputedStyle(metadata).display !== "none",
  badgeVisible: getComputedStyle(badge).display !== "none",
});
```

Debe cumplirse:

```text
paperWidth > paperHeight
articleHeight baja al ser horizontal
metadata visible
badge visible
preview no se sale del borde rojo
preview no invade página vecina
no hay espacio vacío grande debajo de la imagen
```

## Criterio visual final

Una página horizontal debe verse como una tarjeta horizontal real:

* más ancha
* más baja
* centrada
* con datos visibles debajo
* sin salirse del borde
* sin conservar el alto de una hoja vertical

```
```
