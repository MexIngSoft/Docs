Sí, el problema ya no es solo “rotar”; es que **el área visible del preview no está calculando el tamaño real después de la rotación**. En tu HTML ya aparece `is-quarter-rotated`, `--preview-rotation: 90deg`, `--thumb-width: 297px` y `--thumb-preview-height: 170px`, pero aun así la imagen se corta lateralmente.

## Corrección obligatoria: el preview rotado no debe cortarse

Codex debe corregir el render de miniaturas PDF para que al girar una página a 90°, 180° o 270° el preview siempre se vea completo, sin cortes a la izquierda, derecha, arriba o abajo.

### Problema actual

Cuando una página se gira a horizontal, el contenedor cambia parcialmente, pero la imagen rotada sigue siendo recortada por `.paper-viewport` o `.paper-mini`.

Esto provoca que el documento se vea incompleto en los laterales.

### Regla obligatoria

No se debe rotar directamente la imagen dentro de un contenedor del mismo tamaño original.

Debe existir esta estructura:

```html
<span class="paper-mini">
  <span class="paper-viewport">
    <span class="paper-rotator">
      <img />
    </span>
  </span>
</span>
```

### CSS requerido

Reemplazar la lógica actual de rotación por esta:

```css
.paper-mini {
  width: var(--thumb-width);
  height: var(--thumb-preview-height);
  overflow: hidden;

  display: flex;
  align-items: center;
  justify-content: center;

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
  display: flex;
  align-items: center;
  justify-content: center;

  transform: rotate(var(--preview-rotation));
  transform-origin: center center;
}

.paper-rotator img {
  display: block;
  object-fit: contain;
  max-width: none;
  max-height: none;
}
```

### Regla especial para 90° y 270°

Cuando la página tenga `.is-quarter-rotated`, el rotador debe usar las medidas invertidas del contenedor:

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

### Regla para 0° y 180°

```css
.pdf-thumb:not(.is-quarter-rotated) .paper-rotator {
  width: var(--thumb-width);
  height: var(--thumb-preview-height);
}

.pdf-thumb:not(.is-quarter-rotated) .paper-rotator img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}
```

### Validación obligatoria

Después de girar cualquier página, Codex debe validar que la imagen no se salga ni se corte:

```js
function validateRotatedPreview(pageSelector) {
  const page = document.querySelector(pageSelector);
  const viewport = page.querySelector(".paper-viewport");
  const img = page.querySelector("img");

  const viewportBox = viewport.getBoundingClientRect();
  const imgBox = img.getBoundingClientRect();

  console.table({
    noCortaIzquierda: imgBox.left >= viewportBox.left - 1,
    noCortaDerecha: imgBox.right <= viewportBox.right + 1,
    noCortaArriba: imgBox.top >= viewportBox.top - 1,
    noCortaAbajo: imgBox.bottom <= viewportBox.bottom + 1,
  });
}
```

Todos los valores deben ser `true`.

### Prohibido

No usar `transform: rotate()` directamente sobre `img` sin ajustar el tamaño del rotador.

No usar `overflow: visible` como solución falsa.

No permitir que la imagen quede más grande que `.paper-viewport`.

No recortar la imagen para que “quepa”; debe escalarse completa con `object-fit: contain`.

No perder metadata, número de página, badge “Girado” ni punto verde.
