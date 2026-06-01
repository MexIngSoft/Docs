Sí, ahora el ajuste debe ser más fino: **la altura del preview vertical no debe tomarse de la fila completa**, sino del aspecto real de cada página. La fila puede alinear tarjetas, pero no debe inflar artificialmente el área de imagen.

Copia esto para Codex:

## Ajuste de altura exacta para previews verticales

### Problema actual

Después de corregir la rotación, el preview vertical queda con demasiada altura. La imagen se ve con espacio sobrante porque `.paper-mini` o `.thumb-select` están usando una altura de fila demasiado grande.

### Regla obligatoria

El área de imagen `.paper-mini` debe medir exactamente según el aspecto visual de la página.

La variable:

```css
--row-preview-height
```

puede usarse para alinear tarjetas o centrar horizontales, pero NO debe usarse como altura directa de `.paper-mini`.

### Cálculo correcto

```ts
const basePortraitWidth = 170;

const thumbWidth =
  visualOrientation === "H"
    ? Math.round(basePortraitWidth * (visualWidth / visualHeight))
    : basePortraitWidth;

const thumbPreviewHeight =
  visualOrientation === "V"
    ? Math.round(basePortraitWidth * (visualHeight / visualWidth))
    : Math.round(thumbWidth * (visualHeight / visualWidth));
```

Ejemplo:

```text
Página vertical:
639 x 1000

Ancho base:
170px

Alto correcto:
170 * (1000 / 639) = 266px
```

No debe inflarse a 302px solo porque otra página de la fila mide más.

### CSS correcto

```css
.pdf-thumb {
  width: var(--thumb-width);
  min-width: var(--thumb-width);
  max-width: var(--thumb-width);
}

.thumb-select {
  width: 100%;
  min-height: calc(var(--row-preview-height, var(--thumb-preview-height)) + 92px);

  display: flex;
  flex-direction: column;
  align-items: center;
}

.paper-mini {
  width: var(--thumb-width);
  height: var(--thumb-preview-height);
  min-height: var(--thumb-preview-height);
  max-height: var(--thumb-preview-height);

  display: flex;
  align-items: center;
  justify-content: center;

  overflow: hidden;
  box-sizing: border-box;
}
```

### Regla de fila

La fila puede usar:

```css
--row-preview-height
```

para reservar espacio común y alinear textos, pero el preview real debe conservar:

```css
height: var(--thumb-preview-height);
```

### Centrado dentro de la fila

Si una página tiene menos altura que la mayor de la fila:

```css
.paper-mini {
  margin-top: calc(
    (var(--row-preview-height, var(--thumb-preview-height)) - var(--thumb-preview-height)) / 2
  );
}
```

Así el preview se centra, pero no se estira.

### Prohibido

No hacer esto:

```css
.paper-mini {
  height: var(--row-preview-height);
}
```

No hacer esto:

```css
.paper-viewport {
  height: var(--row-preview-height);
}
```

Eso infla el preview vertical y lo hace verse mal.

### Validación obligatoria

Para una página vertical de `639 x 1000` y ancho base `170px`:

```js
const page = document.querySelector("#page-1");
const paper = page.querySelector(".paper-mini");
const box = paper.getBoundingClientRect();

console.table({
  width: box.width,
  height: box.height,
  expectedHeight: Math.round(170 * (1000 / 639)),
});
```

Debe dar aproximadamente:

```text
width: 170
height: 266
expectedHeight: 266
```

### Resultado esperado

Las páginas verticales deben verse proporcionadas al tamaño real de la página:

```text
- sin altura inflada;
- sin espacio sobrante excesivo;
- centradas dentro de la fila;
- con textos alineados;
- sin romper páginas horizontales.
```
