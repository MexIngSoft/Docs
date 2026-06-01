Sí: hay que darle a Codex una regla más dura: **queda prohibido corregir la rotación reduciendo la imagen**. El archivo confirma que el problema sigue siendo que al rotar el preview el contenedor no recalcula ancho/alto y la imagen queda fuera de lugar.  Además, `transform` no cambia el layout reservado del elemento; solo modifica su espacio visual, y puede crear stacking context, por eso también se explican los problemas de menús debajo de previews. ([MDN Web Docs][1])

# Instrucción estricta para Codex: corregir definitivamente rotación de previews PDF

## Regla principal obligatoria

Queda prohibido solucionar la rotación reduciendo, escalando o achicando la imagen.

La imagen debe conservar su tamaño proporcional original dentro de la escala normal del preview.

Cuando una página gira, NO debe adaptarse la imagen al contenedor viejo.

Debe adaptarse el contenedor a la nueva orientación visual.

## Problema actual

El sistema hace esto:

```text
1. Mantiene el contenedor con tamaño horizontal.
2. Rota la imagen.
3. Reduce la imagen para que quepa.
4. La imagen queda fuera de lugar o visualmente aplastada.
```

Eso es incorrecto.

## Comportamiento correcto

Debe hacer esto:

```text
1. Detectar rotación.
2. Calcular tamaño visual real.
3. Intercambiar ancho y alto si la rotación es 90° o 270°.
4. Aplicar ese tamaño al contenedor.
5. Rotar la imagen dentro del nuevo contenedor.
6. Reacomodar el grid.
7. Centrar la tarjeta respecto a las páginas vecinas.
```

## Función obligatoria

Crear una función pura:

```ts
type Rotation = 0 | 90 | 180 | 270;

type PageVisualBox = {
  rotation: Rotation;
  originalWidth: number;
  originalHeight: number;
  visualWidth: number;
  visualHeight: number;
  originalAspect: string;
  visualAspect: string;
  visualOrientation: "H" | "V";
  isQuarterRotated: boolean;
};

export function normalizeRotation(value: number): Rotation {
  const rotation = ((value % 360) + 360) % 360;

  if (rotation === 90) return 90;
  if (rotation === 180) return 180;
  if (rotation === 270) return 270;

  return 0;
}

export function getPageVisualBox(
  width: number,
  height: number,
  rotationValue: number
): PageVisualBox {
  const rotation = normalizeRotation(rotationValue);
  const isQuarterRotated = rotation === 90 || rotation === 270;

  const visualWidth = isQuarterRotated ? height : width;
  const visualHeight = isQuarterRotated ? width : height;

  return {
    rotation,
    originalWidth: width,
    originalHeight: height,
    visualWidth,
    visualHeight,
    originalAspect: `${width} / ${height}`,
    visualAspect: `${visualWidth} / ${visualHeight}`,
    visualOrientation: visualWidth >= visualHeight ? "H" : "V",
    isQuarterRotated,
  };
}
```

## Ejemplo obligatorio

Para esta página:

```text
Original:
1000 x 563

Rotación:
270°

Resultado visual correcto:
563 x 1000
```

Por lo tanto:

```text
La metadata debe cambiar de H a V.
El contenedor debe volverse vertical.
La imagen no debe hacerse más pequeña para caber en el contenedor anterior.
```

## Render correcto

Usar variables calculadas desde `getPageVisualBox`.

```tsx
const visualBox = getPageVisualBox(
  page.width,
  page.height,
  page.rotation
);

<article
  className={cx("pdf-thumb", {
    "modified-rotated": visualBox.rotation !== 0,
    "is-portrait": visualBox.visualOrientation === "V",
    "is-landscape": visualBox.visualOrientation === "H",
  })}
  style={
    {
      "--paper-original-aspect": visualBox.originalAspect,
      "--paper-visual-aspect": visualBox.visualAspect,
      "--preview-rotation": `${visualBox.rotation}deg`,
    } as React.CSSProperties
  }
>
  <button className="thumb-select" type="button">
    <span className="paper-mini">
      <span className="paper-viewport">
        <span className="paper-rotator">
          <img src={page.previewUrl} alt={`Miniatura de página ${page.number}`} />
        </span>
      </span>
    </span>

    <strong>Página {page.number}</strong>

    <small className="page-metadata">
      {page.sizeLabel} | {visualBox.visualOrientation}
    </small>

    {visualBox.rotation !== 0 && (
      <span className="page-modified-badge modified-rotated">
        Girado
      </span>
    )}
  </button>
</article>
```

## CSS obligatorio

La clave es que `.paper-mini` reserva el tamaño visual y `.paper-rotator` solo rota el contenido.

```css
.pdf-thumb {
  display: grid;
  align-self: center;
  justify-items: center;
}

.thumb-select {
  display: grid;
  justify-items: center;
  align-content: start;
}

.paper-mini {
  display: grid;
  place-items: center;
  inline-size: var(--thumb-base-width, 170px);
  aspect-ratio: var(--paper-visual-aspect);
  overflow: visible;
}

.paper-viewport {
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
  transform-origin: center center;
}

.paper-rotator img {
  display: block;
  max-inline-size: 100%;
  max-block-size: 100%;
  object-fit: contain;
}
```

## Regla especial para 90° y 270°

Cuando la rotación sea 90° o 270°, el rotador debe usar el aspecto original dentro del contenedor visual ya invertido.

```css
.pdf-thumb.modified-rotated .paper-rotator {
  aspect-ratio: var(--paper-original-aspect);
}
```

Si la imagen se sale, NO reducir la imagen manualmente. Revisar primero:

```text
- si visualAspect está invertido correctamente;
- si paper-mini usa visualAspect;
- si metadata usa visualOrientation;
- si el grid permite ancho/alto variable;
- si algún width fijo está forzando el contenedor anterior.
```

## Prohibiciones

No usar estas soluciones:

```css
transform: rotate(270deg) scale(0.56);
width: 56%;
max-width: 56%;
--paper-original-width: 56.3%;
```

Estas reglas solo esconden el problema y vuelven a romper el layout.

## Grid

El grid debe permitir que una página horizontal ocupe más ancho y una vertical ocupe menos.

```css
.pdf-pages-grid {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: var(--page-gap, 22px);
}

.pdf-thumb {
  flex: 0 0 auto;
}
```

Si se usa CSS Grid rígido con columnas iguales, Codex debe quitar esa rigidez para los previews rotados.

## Validación obligatoria en consola

Después de rotar página 3 a 270°, Codex debe validar:

```ts
console.table({
  originalWidth: 1000,
  originalHeight: 563,
  rotation: 270,
  expectedVisualWidth: 563,
  expectedVisualHeight: 1000,
  expectedOrientation: "V",
});
```

Y en DOM debe cumplirse:

```text
.paper-mini aspect-ratio = 563 / 1000
.page-metadata = Personalizado | V
La imagen no tiene scale()
La imagen no tiene width porcentual reducido artificialmente
El contenedor se ve vertical
El grid recorrió las páginas vecinas
```

## Pruebas unitarias obligatorias

```ts
describe("getPageVisualBox", () => {
  it("keeps horizontal page horizontal at 0 degrees", () => {
    expect(getPageVisualBox(1000, 563, 0)).toMatchObject({
      visualWidth: 1000,
      visualHeight: 563,
      visualOrientation: "H",
    });
  });

  it("turns horizontal page into vertical at 90 degrees", () => {
    expect(getPageVisualBox(1000, 563, 90)).toMatchObject({
      visualWidth: 563,
      visualHeight: 1000,
      visualOrientation: "V",
    });
  });

  it("keeps horizontal page horizontal at 180 degrees", () => {
    expect(getPageVisualBox(1000, 563, 180)).toMatchObject({
      visualWidth: 1000,
      visualHeight: 563,
      visualOrientation: "H",
    });
  });

  it("turns horizontal page into vertical at 270 degrees", () => {
    expect(getPageVisualBox(1000, 563, 270)).toMatchObject({
      visualWidth: 563,
      visualHeight: 1000,
      visualOrientation: "V",
    });
  });
});
```

## Checklist visual obligatorio

La tarea no se considera terminada hasta que se cumpla todo:

```text
[ ] Página 1000 x 563 rotada 270° se ve vertical.
[ ] La imagen no se achica artificialmente.
[ ] No existe scale() para corregir rotación.
[ ] No existe --paper-original-width: 56.3% como parche.
[ ] El contenedor cambia de proporción.
[ ] Metadata cambia de H a V.
[ ] La página queda centrada frente a páginas vecinas.
[ ] El grid recorre las páginas de la derecha.
[ ] No hay empalmes con página anterior o siguiente.
[ ] La barra rápida queda centrada sobre el preview.
[ ] El menú de tres puntos se abre y cierra correctamente.
```

## Menú grande de tres puntos

El menú actual tiene demasiadas acciones. Debe tener altura máxima y scroll interno.

```css
.page-menu.floating-menu-card {
  max-block-size: min(70vh, 520px);
  overflow-y: auto;
  overscroll-behavior: contain;
  z-index: 10000;
}
```

Al presionar los tres puntos:

```text
- Si el menú está cerrado: abrir.
- Si el menú ya está abierto para esa misma página: cerrar.
- Si otro menú está abierto: cerrar el anterior y abrir el nuevo.
```

## Validación del menú

```text
[ ] El menú no queda debajo de previews.
[ ] El menú tiene scroll si no cabe.
[ ] Tres puntos abre menú.
[ ] Tres puntos otra vez cierra menú.
[ ] Clic fuera cierra menú.
[ ] Acción ejecutada cierra menú.
[ ] ESC cierra menú.
```

## Resultado esperado

La corrección no debe verse como una imagen rotada dentro de una tarjeta vieja.

Debe verse como una página que cambió realmente de orientación dentro del layout.

Si la página se rota:

```text
el layout cambia;
la tarjeta cambia;
la metadata cambia;
el grid cambia;
la imagen conserva proporción.
```

[1]: https://developer.mozilla.org/en-US/docs/Web/CSS/transform "transform CSS property - CSS | MDN"
