Sí, ahora ya se ve mucho mejor. Lo que falta es **espaciado interno, alineación por fila y centrado del bloque de detalles debajo del preview**.

Pásale esto a Codex:

## Ajuste visual final: espaciado, centrado y distribución adaptativa de previews

### Problemas actuales

1. El contenedor de la tarjeta se ve muy pegado al contenido.
2. El borde de color de sección queda demasiado cerca del preview.
3. En páginas horizontales, el bloque de detalles queda visualmente desalineado.
4. Las páginas verticales y horizontales de la misma fila no se ven ordenadas estéticamente.
5. La fila necesita mejor distribución adaptativa.

### Regla principal

Cada `.pdf-thumb` debe tener padding interno uniforme para que el preview, textos, badges y punto de estado respiren visualmente.

Además, el bloque de información de cada página debe centrarse respecto al ancho real de la tarjeta, especialmente cuando la página sea horizontal.

### CSS recomendado

```css
.pdf-thumb {
  padding: 10px 12px 12px;
  box-sizing: border-box;
}

.thumb-select {
  width: 100%;
  display: grid;
  grid-template-rows: auto auto auto auto;
  justify-items: center;
  align-content: start;
  row-gap: 6px;
  box-sizing: border-box;
}

.paper-mini {
  margin-inline: auto;
}

.pdf-thumb.is-landscape .thumb-select {
  justify-items: center;
  text-align: center;
}

.pdf-thumb.is-landscape strong,
.pdf-thumb.is-landscape .page-metadata,
.pdf-thumb.is-landscape .page-modified-badge,
.pdf-thumb.is-landscape .preview-dot {
  justify-self: center;
  text-align: center;
}
```

### Alinear horizontal dentro de la fila

Cuando una página horizontal sea más ancha que las demás, su contenido debe organizarse así:

```text
[ preview horizontal centrado ]
[ Página X centrado       ]
[ Metadata centrada       ]
[ Badge centrado          ]
[ Punto centrado          ]
```

No debe verse cargado a la izquierda ni mezclado con la zona de inserción.

### Mejor distribución de la fila

El contenedor de previews debe distribuir elementos sin amontonarlos:

```css
.page-grid {
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start;
  gap: 26px 28px;
  padding: 16px 18px 24px;
  box-sizing: border-box;
}
```

### Separación de zonas de inserción

Las líneas azules o zonas de inserción no deben quedar pegadas al borde de la tarjeta.

```css
.smart-insertion-zone {
  margin-inline: 6px;
}
```

Si la zona de inserción está dentro de `.pdf-thumb`, entonces debe posicionarse dejando separación visual:

```css
.pdf-thumb .smart-insertion-zone {
  right: -18px;
}
```

### Criterio visual esperado

La tarjeta debe verse así:

```text
borde rojo/naranja
  espacio interno
    preview centrado
    título centrado
    metadata centrada
    badge centrado
    punto centrado
  espacio interno
```

### No hacer

No reducir el tamaño del preview para crear espacio.

No usar padding diferente para cada página.

No permitir que el badge o el punto verde se peguen al borde inferior.

No usar márgenes negativos que vuelvan a empalmar elementos.

### Validación obligatoria

Codex debe verificar:

```text
[ ] El borde de sección ya no queda pegado al preview.
[ ] Página horizontal mantiene preview completo.
[ ] Página horizontal centra título, metadata, badge y punto.
[ ] Página vertical mantiene proporción correcta.
[ ] La fila se ve distribuida con separación uniforme.
[ ] Las zonas de inserción no invaden el contenido.
[ ] No se rompe la rotación ni el cálculo de ancho/alto.
```
