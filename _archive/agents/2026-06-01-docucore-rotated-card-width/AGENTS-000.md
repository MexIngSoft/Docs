Sí, aquí Codex necesita una instrucción todavía más específica: **el ancho real de la tarjeta debe cambiar cuando la página queda horizontal**, no solo el `aspect-ratio` interno. En el HTML se ve que página 3 ya tiene `--paper-visual-aspect: 1000 / 563`, pero el `article.pdf-thumb` sigue ocupando el ancho default, por eso la imagen queda comprimida dentro de una tarjeta angosta. 

Copia esto para Codex:

# Corrección definitiva: ancho real de contenedores al rotar previews PDF

## Problema actual

La página rotada ya calcula:

```text
--paper-visual-aspect: 1000 / 563
--preview-rotation: 90deg
class="is-landscape is-quarter-rotated"
```

Pero el contenedor principal:

```html
<article class="pdf-thumb ...">
```

sigue usando el ancho default de una página vertical.

Por eso el preview horizontal no gana ancho real en el grid y la imagen queda reducida o mal acomodada.

## Regla obligatoria

Cuando una página queda visualmente horizontal, el `article.pdf-thumb` debe aumentar su ancho real.

Cuando una página queda visualmente vertical, el `article.pdf-thumb` debe usar ancho normal.

No basta con cambiar `aspect-ratio` en `.paper-mini`.

Debe cambiar también:

```text
.pdf-thumb width
.thumb-select width
.paper-mini width
grid/flex item width
```

## Cálculo obligatorio

Crear esta función y usarla para estilos:

```ts
type PageLayoutBox = {
  originalWidth: number;
  originalHeight: number;
  visualWidth: number;
  visualHeight: number;
  visualOrientation: "H" | "V";
  visualAspect: string;
  thumbWidthPx: number;
  thumbHeightPx: number;
};

function getPageLayoutBox(
  width: number,
  height: number,
  rotation: number,
  basePortraitWidth = 170
): PageLayoutBox {
  const normalized = ((rotation % 360) + 360) % 360;
  const quarterRotated = normalized === 90 || normalized === 270;

  const visualWidth = quarterRotated ? height : width;
  const visualHeight = quarterRotated ? width : height;

  const visualOrientation = visualWidth >= visualHeight ? "H" : "V";
  const visualAspect = `${visualWidth} / ${visualHeight}`;

  const thumbWidthPx =
    visualOrientation === "H"
      ? Math.round(basePortraitWidth * (visualWidth / visualHeight))
      : basePortraitWidth;

  const thumbHeightPx =
    visualOrientation === "H"
      ? basePortraitWidth
      : Math.round(basePortraitWidth * (visualHeight / visualWidth));

  return {
    originalWidth: width,
    originalHeight: height,
    visualWidth,
    visualHeight,
    visualOrientation,
    visualAspect,
    thumbWidthPx,
    thumbHeightPx,
  };
}
```

## Ejemplo obligatorio

Para página 3:

```text
Original: 563 x 1000
Rotación: 90°
Visual: 1000 x 563
Orientación visual: H
```

Entonces debe pasar esto:

```text
La tarjeta debe hacerse más ancha.
El preview debe verse horizontal.
La imagen no debe achicarse dentro de un contenedor vertical.
```

## Render obligatorio

Aplicar variables al `article`, no solo al `paper-mini`.

```tsx
const layout = getPageLayoutBox(page.width, page.height, page.rotation);

<article
  className={cx("pdf-thumb", {
    "is-landscape": layout.visualOrientation === "H",
    "is-portrait": layout.visualOrientation === "V",
    "is-quarter-rotated": page.rotation === 90 || page.rotation === 270,
    "modified-rotated": page.rotation !== 0,
  })}
  style={
    {
      "--thumb-width": `${layout.thumbWidthPx}px`,
      "--thumb-preview-height": `${layout.thumbHeightPx}px`,
      "--paper-visual-aspect": layout.visualAspect,
      "--preview-rotation": `${page.rotation}deg`,
    } as React.CSSProperties
  }
>
```

## CSS obligatorio

```css
.page-grid {
  display: flex;
  flex-wrap: wrap;
  align-items: stretch;
  gap: var(--page-gap, 22px);
}

.pdf-thumb {
  flex: 0 0 var(--thumb-width);
  inline-size: var(--thumb-width);
  min-inline-size: var(--thumb-width);
  max-inline-size: var(--thumb-width);
  align-self: stretch;
  display: grid;
}

.thumb-select {
  inline-size: 100%;
  display: grid;
  justify-items: center;
  align-content: start;
}

.paper-mini {
  inline-size: 100%;
  block-size: var(--thumb-preview-height);
  aspect-ratio: var(--paper-visual-aspect);
  display: grid;
  place-items: center;
  overflow: visible;
}

.paper-viewport {
  inline-size: 100%;
  block-size: 100%;
  display: grid;
  place-items: center;
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

## Altura uniforme por fila

Todos los contenedores de una misma fila deben tomar el alto máximo de esa fila para verse alineados.

Regla:

```text
- Páginas verticales: mismo alto visual dentro de la fila.
- Páginas horizontales: pueden ser más anchas y menos altas.
- La tarjeta completa debe mantener alineación con las demás.
- El texto, metadata, badge y punto verde deben quedar alineados abajo.
```

CSS recomendado:

```css
.pdf-thumb {
  align-self: stretch;
}

.thumb-select {
  min-block-size: 100%;
  grid-template-rows:
    auto
    min-content
    min-content
    min-content
    min-content;
}

.pdf-thumb.is-landscape .paper-mini {
  block-size: var(--thumb-preview-height);
}

.pdf-thumb.is-portrait .paper-mini {
  block-size: var(--thumb-preview-height);
}
```

## Regla contra parches incorrectos

Codex NO debe usar:

```css
scale()
width: 56%
--paper-rotator-ratio como forma de achicar imagen
max-width artificial
```

La solución correcta es:

```text
cambiar el ancho real del article.pdf-thumb
cambiar el ancho real de thumb-select
cambiar el ancho real de paper-mini
permitir que el grid recalcule posiciones
```

## Validación DOM obligatoria

Después de rotar página 3 a horizontal:

```js
const page = document.querySelector("#page-3");
const thumb = page.getBoundingClientRect();
const paper = page.querySelector(".paper-mini").getBoundingClientRect();

console.table({
  articleWidth: thumb.width,
  paperWidth: paper.width,
  paperHeight: paper.height,
});
```

Debe cumplirse:

```text
articleWidth > ancho de una página vertical
paperWidth > paperHeight
metadata = Personalizado | H
la imagen no usa scale()
la imagen no usa width porcentual reducido
```

## Criterio visual final

La página 3 rotada debe verse como una hoja horizontal real:

```text
más ancha
menos alta
centrada
sin deformarse
sin salirse
sin empalmarse
con las demás páginas alineadas
```

La tarea no se acepta si solo se rota la imagen pero el `article.pdf-thumb` mantiene el ancho default.
