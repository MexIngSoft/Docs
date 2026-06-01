Sí, faltaban varias cosas finas. Lo anterior iba bien, pero conviene dejarle a Codex una instrucción más completa, porque el problema no es solo CSS: también afecta estructura, cálculo de proporciones, grid, hover, accesibilidad, drag & drop y estado visual.

# Corrección completa de previews PDF: acciones rápidas, rotación y zonas de inserción

Corregir la vista de miniaturas PDF en DocuCore para que las páginas rotadas, la barra rápida de acciones y las zonas inteligentes de inserción se comporten correctamente.

## 1. Problema principal detectado

Actualmente, cuando una página se rota a 90° o 270°, solo gira la imagen interna del preview, pero el contenedor de la página sigue conservando el tamaño y comportamiento original.

Ejemplo actual:

```text
Página original: 1000 x 588 px
Rotación aplicada: 90°
El preview visual gira, pero .pdf-thumb y .paper-mini siguen comportándose como horizontal.
```

Esto provoca:

```text
- La hoja rotada se ve mal acomodada.
- El preview no se centra correctamente.
- La tarjeta mantiene espacio incorrecto.
- La barra rápida aparece siempre visible.
- La zona de inserción queda cargada hacia un lado.
- La fila no se adapta correctamente a páginas rotadas.
```

## 2. Barra rápida de acciones

El elemento:

```html
<div class="page-quick-actions visible">
```

no debe estar visible de forma permanente.

Debe estar invisible por defecto y mostrarse únicamente cuando el usuario interactúe con la página.

Reglas:

```text
- Oculta por defecto.
- Visible al hacer hover sobre .pdf-thumb.
- Visible cuando .pdf-thumb tenga focus-within.
- Visible si el menú de más opciones está abierto.
- Visible durante interacción táctil si la página está seleccionada o activa.
- No debe usar la clase visible de forma permanente.
```

La clase `visible` debe eliminarse del render inicial salvo que realmente exista un estado activo.

Ejemplo esperado:

```html
<div class="page-quick-actions" aria-label="Acciones rápidas de página 4">
```

CSS sugerido:

```css
.page-quick-actions {
  opacity: 0;
  pointer-events: none;
  transform: translateY(-4px);
  transition:
    opacity 160ms ease,
    transform 160ms ease;
}

.pdf-thumb:hover .page-quick-actions,
.pdf-thumb:focus-within .page-quick-actions,
.pdf-thumb.has-open-menu .page-quick-actions,
.pdf-thumb.is-touch-active .page-quick-actions {
  opacity: 1;
  pointer-events: auto;
  transform: translateY(0);
}
```

## 3. Posición de la barra rápida

La barra rápida debe estar encima del preview, pero sin tapar de forma molesta la página.

Reglas:

```text
- Debe quedar centrada horizontalmente respecto al preview visible.
- No debe salirse de la tarjeta.
- No debe empalmarse con el check verde de selección.
- Si la página está rotada y se vuelve más vertical, la barra debe seguir centrada sobre el área visual de la hoja.
- Debe mantenerse dentro del z-index correcto para no quedar detrás del preview.
```

## 4. Check de selección

El icono de selección:

```html
<svg class="page-check">
```

debe mantenerse en una esquina clara de la tarjeta.

Reglas:

```text
- No debe rotar junto con la hoja.
- No debe quedar encima de la barra rápida.
- Debe conservar su posición fija en la tarjeta.
- Debe seguir visible cuando la página esté seleccionada.
```

## 5. Separar tarjeta, preview y contenido

No se debe tratar todo como si fuera un solo bloque rotado.

Debe distinguirse entre:

```text
.pdf-thumb        = tarjeta completa
.thumb-select     = botón/área clickeable
.paper-mini       = marco visual del papel
.paper-viewport   = espacio reservado del preview
.paper-rotator    = elemento que rota la imagen
img               = imagen renderizada
```

Estructura recomendada:

```html
<article class="pdf-thumb ready selected is-modified modified-rotated">
  <button class="thumb-select" type="button">
    <span class="paper-viewport">
      <span class="paper-rotator">
        <img alt="Miniatura de página 4" />
      </span>
    </span>

    <strong>Página 4</strong>
    <small class="page-metadata">Personalizado | V</small>
    <span class="page-modified-badge modified-rotated">Girado</span>
    <span class="preview-dot ready"></span>
  </button>

  <div class="page-quick-actions">
    ...
  </div>

  <div class="smart-insertion-zone">
    ...
  </div>
</article>
```

## 6. Cálculo correcto de proporción visual

Cuando la rotación sea 90° o 270°, se deben invertir ancho y alto.

Regla:

```ts
const normalizedRotation = ((rotation % 360) + 360) % 360;
const isQuarterRotated =
  normalizedRotation === 90 || normalizedRotation === 270;

const visualWidth = isQuarterRotated ? pageHeight : pageWidth;
const visualHeight = isQuarterRotated ? pageWidth : pageHeight;

const visualAspect = `${visualWidth} / ${visualHeight}`;
```

Ejemplo:

```text
Original:
1000 x 588 px

Rotado 90°:
588 x 1000 px

Rotado 270°:
588 x 1000 px

Rotado 180°:
1000 x 588 px
```

## 7. Orientación mostrada en metadata

Si la página está rotada 90° o 270°, la orientación mostrada debe corresponder a la orientación visual final.

Ejemplo:

```text
1000 x 588 px + 90° = Vertical visual
```

Por lo tanto, no debe seguir mostrando:

```text
Personalizado | H
```

si visualmente ahora es vertical.

Debe mostrar:

```text
Personalizado | V
```

o una etiqueta equivalente.

## 8. Rotación visual del preview

La imagen debe rotarse dentro de un contenedor que ya tenga reservado el espacio correcto.

No basta con:

```css
img {
  transform: rotate(90deg);
}
```

porque eso no cambia el layout.

Debe reservarse primero el tamaño visual y luego rotar la imagen dentro.

CSS base sugerido:

```css
.paper-viewport {
  position: relative;
  display: grid;
  place-items: center;
  width: var(--paper-visual-width);
  aspect-ratio: var(--paper-visual-aspect);
  max-width: 100%;
  margin-inline: auto;
  overflow: visible;
}

.paper-rotator {
  display: grid;
  place-items: center;
  transform: rotate(var(--preview-rotation, 0deg));
  transform-origin: center center;
}

.paper-rotator img {
  display: block;
  max-width: var(--paper-original-width);
  max-height: var(--paper-original-height);
  object-fit: contain;
}
```

Codex debe ajustar la implementación exacta según la estructura real del componente.

## 9. Tamaño reservado para páginas rotadas

Si una página rotada requiere más altura que una hoja normal, la tarjeta debe permitirlo.

Reglas:

```text
- No recortar el preview.
- No deformar la imagen.
- No forzar la página rotada dentro de un marco horizontal.
- Permitir que la miniatura ocupe más altura.
- Centrarla respecto a las demás páginas de la fila.
```

## 10. Comportamiento del grid

El grid de previews debe alinear correctamente páginas normales y rotadas.

Reglas:

```text
- Las páginas de una misma fila deben alinearse al centro vertical.
- Una página rotada puede aumentar la altura de la fila.
- Las páginas vecinas deben quedar centradas respecto a esa fila.
- La página rotada no debe verse pegada arriba ni abajo.
```

CSS sugerido:

```css
.pdf-pages-grid {
  align-items: center;
}

.pdf-thumb {
  align-self: center;
}
```

Si se usa CSS Grid, revisar que `grid-auto-rows` no esté forzando alturas fijas que rompan la rotación.

## 11. Estado modified-rotated

La clase:

```text
modified-rotated
```

debe afectar tanto al preview como a la tarjeta.

No debe servir solo para mostrar el badge “Girado”.

Debe permitir:

```text
- aplicar layout visual rotado;
- ajustar proporciones;
- ajustar metadata;
- recalcular orientación;
- conservar selección;
- conservar drag & drop;
- conservar acciones rápidas.
```

## 12. Drag & drop con páginas rotadas

Una página rotada debe seguir siendo draggable.

Reglas:

```text
- El área arrastrable debe ser toda la tarjeta.
- El drag preview no debe aparecer recortado.
- Al arrastrar una página rotada, debe mantener su tamaño visual correcto.
- Las zonas de inserción deben reaccionar aunque la página rotada tenga mayor altura.
```

## 13. Smart insertion zone

El elemento:

```html
<div class="smart-insertion-zone">
```

está bien conceptualmente, pero debe corregirse su alineación.

Problema actual:

```text
La zona queda cargada hacia un lado y no centrada entre dos previews.
```

Reglas:

```text
- Debe estar centrada exactamente entre dos previews.
- Debe tener la misma distancia respecto a la página izquierda y derecha.
- Debe conservar esa distancia al inicio.
- Debe conservar esa distancia al final.
- No debe depender del ancho interno de la página anterior.
- No debe quedar pegada a un solo .pdf-thumb.
```

## 14. Separación uniforme

Definir variables de separación para evitar ajustes manuales inconsistentes.

Ejemplo:

```css
:root {
  --page-gap: 18px;
  --insertion-zone-width: 18px;
}
```

Resultado esperado:

```text
Página   zona   Página
```

No debe quedar:

```text
Página zona      Página
```

ni:

```text
Página      zona Página
```

## 15. Recomendación estructural para insertion zones

Si actualmente `.smart-insertion-zone` está dentro de cada `.pdf-thumb`, evaluar moverlo a nivel de lista/grid como un elemento independiente entre páginas.

Estructura recomendada:

```html
<div class="pdf-pages-grid">
  <div class="smart-insertion-zone is-start"></div>
  <article class="pdf-thumb"></article>
  <div class="smart-insertion-zone"></div>
  <article class="pdf-thumb"></article>
  <div class="smart-insertion-zone"></div>
  <article class="pdf-thumb"></article>
  <div class="smart-insertion-zone is-end"></div>
</div>
```

Esto permite que la zona de inserción sea realmente un elemento entre dos páginas y no una extensión visual de una sola página.

Si por ahora no se puede mover la estructura, debe simularse el mismo comportamiento mediante CSS sin romper la lógica existente.

## 16. Insertion zone al inicio y al final

Cuando la zona de inserción esté antes de la primera página o después de la última página:

```text
- Debe conservar el mismo ancho.
- Debe conservar la misma distancia visual.
- Debe alinearse con la altura de las páginas.
- Debe poder abrir el mismo menú.
- No debe verse pegada al borde del contenedor.
```

## 17. Menú de inserción

El menú de inserción debe abrirse sin desalinear las páginas.

Reglas:

```text
- El menú debe flotar sobre la zona.
- No debe cambiar el tamaño de la fila al abrirse.
- No debe empujar otras páginas.
- Debe tener z-index superior al preview.
- Debe cerrarse al hacer clic fuera.
```

## 18. Accesibilidad

Mantener accesibilidad:

```text
- aria-label correcto en acciones rápidas.
- aria-expanded actualizado en “Más opciones”.
- role="menu" y role="menuitem" en menú de inserción.
- focus-within debe mostrar acciones rápidas.
- navegación con teclado no debe quedar bloqueada por opacity: 0.
```

Cuando `pointer-events: none` esté activo, los botones ocultos no deben ser accesibles accidentalmente por tabulación si eso causa confusión. Evaluar usar:

```text
tabIndex={isQuickActionsVisible ? 0 : -1}
```

o controlar visibilidad con estado accesible.

## 19. Modo táctil

En móviles o pantallas táctiles no existe hover real.

Reglas:

```text
- Primer toque selecciona o activa la página.
- Al estar activa, se muestran acciones rápidas.
- Segundo toque ejecuta acción si el usuario toca un botón.
- Al tocar fuera, se ocultan acciones rápidas.
```

## 20. Criterios de aceptación visual

La corrección se considera terminada cuando:

```text
- La barra rápida ya no aparece siempre visible.
- La barra rápida aparece al pasar el cursor sobre la página.
- La página rotada 90° se ve como vertical real.
- La tarjeta se adapta al tamaño visual de la página rotada.
- La imagen no se corta ni se deforma.
- El check verde no rota ni se empalma.
- La metadata refleja la orientación visual correcta.
- El badge “Girado” sigue visible.
- La página rotada queda centrada frente a las páginas vecinas.
- La zona de inserción queda centrada entre páginas.
- La zona de inserción conserva distancia uniforme al inicio, medio y final.
- Drag & drop sigue funcionando.
- El menú de inserción no mueve el layout.
```

## 21. Validación obligatoria

Probar mínimo estos casos:

```text
1. Página horizontal sin rotación.
2. Página horizontal rotada 90°.
3. Página horizontal rotada 270°.
4. Página vertical sin rotación.
5. Página vertical rotada 90°.
6. Página seleccionada y rotada.
7. Página modificada y rotada.
8. Página rotada arrastrándose.
9. Zona de inserción entre dos páginas normales.
10. Zona de inserción entre una página normal y una rotada.
11. Zona de inserción al inicio.
12. Zona de inserción al final.
13. Hover con mouse.
14. Focus con teclado.
15. Pantalla táctil.
```

Esta versión ya cubre lo que faltaba: **metadata, check, drag & drop, touch, menú flotante, estructura recomendada y criterios de aceptación**.
