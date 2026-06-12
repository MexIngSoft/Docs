Claro. Te lo dejo mejor redactado y más técnico para Codex, sin perder tu idea principal:

# Corrección de zoom, scroll, separadores e identificación real de tamaño de página en Workspace DocuCore

## Objetivo

Corregir el comportamiento del zoom y la escala de previews en el Workspace, garantizando que el scroll se ajuste correctamente, que los separadores e indicadores de inserción siempre sean visibles, y que cada página se muestre con una proporción basada en su tamaño real dentro del PDF.

---

# 1. Problema actual

Actualmente, al aplicar zoom de mayor a menor:

* El área de scroll no se reajusta correctamente.
* El contenedor conserva dimensiones anteriores aunque el zoom haya disminuido.
* Algunas divs de separación quedan ocultas o fuera del área visible.
* Las etiquetas o zonas de inserción dejan de verse.
* Algunas páginas se ven más grandes que otras sin que exista una justificación visual clara.
* Documentos aparentemente tamaño carta/oficio no se están representando proporcionalmente.

---

# 2. Comportamiento esperado

El Workspace debe recalcular el layout completo cada vez que cambie el zoom.

Al cambiar el zoom debe recalcularse:

* ancho visible de cada preview
* alto visible de cada preview
* espacio entre páginas
* ancho del grid
* alto del grid
* tamaño de separadores
* posición de etiquetas de inserción
* área real de scroll

---

# 3. El scroll debe encogerse y expandirse según el zoom

## Regla

Cuando el usuario disminuye el zoom, el área de scroll debe reducirse proporcionalmente.

Cuando el usuario aumenta el zoom, el área de scroll debe crecer proporcionalmente.

No debe quedar un “scroll fantasma” generado por medidas anteriores.

## Requisitos técnicos

1. No usar alturas fijas heredadas después del cambio de zoom.
2. Evitar valores persistentes incorrectos en `row-preview-height`.
3. Recalcular las variables CSS al cambiar el zoom.
4. Forzar recalculo del grid después del cambio de zoom.
5. Usar `ResizeObserver` si es necesario.
6. Evitar que el contenedor conserve medidas anteriores en caché visual.

---

# 4. Tamaño real de cada página del PDF

Cada página debe analizarse de manera individual.

No asumir que todas las páginas del PDF tienen el mismo tamaño.

Por cada página se debe obtener:

```txt
width
height
aspectRatio
orientation
detectedPaperSize
```

Ejemplo:

```json
{
  "page": 1,
  "width": 612,
  "height": 792,
  "aspectRatio": 0.7727,
  "orientation": "portrait",
  "detectedPaperSize": "LETTER"
}
```

---

# 5. Detectar tamaño de papel

El sistema debe comparar las dimensiones reales de cada página contra tamaños estándar.

Tamaños mínimos a detectar:

```txt
LETTER / Carta
LEGAL / Oficio
A4
CUSTOM
```

Referencias aproximadas en puntos PDF:

```txt
LETTER: 612 x 792
LEGAL: 612 x 1008
A4: 595 x 842
```

Debe permitirse tolerancia porque algunos PDFs no vienen exactos.

Tolerancia recomendada:

```txt
± 12 puntos
```

---

# 6. Escala equitativa de previews

Aunque las páginas tengan tamaños diferentes, el sistema debe mantener una escala visual coherente.

## Regla principal

Todas las páginas deben compartir una misma base de escala.

No debe ocurrir que una página tamaño carta se vea visualmente más grande que una oficio sin razón.

## Fórmula sugerida

Usar un ancho base común:

```txt
basePreviewWidth = 170px
```

Calcular altura según aspecto real:

```txt
previewHeight = basePreviewWidth * (pageHeight / pageWidth)
```

Aplicar zoom:

```txt
previewWidth = basePreviewWidth * zoomScale
previewHeight = basePreviewWidth * aspectRatioInverse * zoomScale
```

Donde:

```txt
zoomScale = zoom / 100
aspectRatioInverse = pageHeight / pageWidth
```

---

# 7. Normalización visual

Para que las páginas se vean proporcionadas:

* Las páginas con mayor altura deben verse más altas.
* Las páginas con menor altura deben verse más bajas.
* Todas deben compartir el mismo ancho base.
* La orientación debe respetarse.
* No deformar la imagen.
* No estirar por CSS una página para igualarla artificialmente.

Ejemplo:

Carta:

```txt
612 x 792
proporción: 1.294
```

Oficio:

```txt
612 x 1008
proporción: 1.647
```

Si ambas usan ancho base de 170px:

Carta:

```txt
170 x 220px
```

Oficio:

```txt
170 x 280px
```

Por eso oficio debe verse más alto que carta, pero no más ancho.

---

# 8. Imagen renderizada vs tamaño real de página

No usar el tamaño real de la imagen renderizada como fuente principal para determinar el tamaño del papel.

La fuente correcta debe ser:

```txt
metadata real de la página PDF
```

La imagen renderizada puede usarse solo como preview, pero el tamaño y proporción deben venir de la página PDF.

---

# 9. Separadores de documento

Las divs de separación deben ser proporcionales al promedio visible de las páginas actuales.

## Fórmula

```txt
separatorWidth = averagePreviewWidth * 0.75
separatorHeight = averagePreviewHeight * 0.20
```

Límites:

```txt
minHeight: 24px
maxHeight: 80px
```

## Reglas

1. El separador siempre debe ocupar una celda del grid.
2. No debe quedar oculto al final del documento.
3. No debe salirse del viewport.
4. No debe depender de medidas antiguas del zoom.
5. Debe recalcularse después de cambiar zoom.
6. Las acciones del separador solo deben aparecer en hover o menú contextual.

---

# 10. Etiquetas y zonas de inserción

Las zonas de inserción deben seguir visibles aunque el zoom cambie.

## Reglas

1. Deben estar posicionadas en relación con la página correspondiente.
2. No deben quedar detrás del preview.
3. No deben quedar fuera del contenedor.
4. Deben tener `z-index` mayor que el preview.
5. Deben recalcular su posición al cambiar zoom.
6. Deben conservar tamaño mínimo clickeable.

CSS sugerido:

```css
.smart-insertion-zone {
  min-width: 12px;
  z-index: 15;
}

.pdf-thumb {
  position: relative;
  overflow: visible;
}

.page-grid {
  overflow: visible;
}
```

---

# 11. Variables CSS recomendadas

Cada página debe recibir variables calculadas:

```css
--page-width-points
--page-height-points
--page-aspect
--page-aspect-inverse
--zoom-scale
--preview-width
--preview-height
```

Ejemplo:

```tsx
<article
  className="pdf-thumb"
  style={{
    "--page-width-points": page.width,
    "--page-height-points": page.height,
    "--page-aspect-inverse": page.height / page.width,
    "--zoom-scale": zoom / 100,
    "--preview-width": `${basePreviewWidth * zoomScale}px`,
    "--preview-height": `${basePreviewWidth * (page.height / page.width) * zoomScale}px`,
  } as React.CSSProperties}
/>
```

---

# 12. CSS sugerido para previews

```css
.pdf-thumb {
  width: var(--preview-width);
  overflow: visible;
}

.paper-mini,
.paper-preview {
  width: var(--preview-width);
  height: var(--preview-height);
  aspect-ratio: var(--page-width-points) / var(--page-height-points);
}

.paper-preview img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}
```

---

# 13. Recalcular layout al cambiar zoom

Al cambiar zoom:

1. Actualizar estado `zoom`.
2. Recalcular dimensiones de previews.
3. Recalcular promedio de previews.
4. Recalcular separadores.
5. Recalcular grid.
6. Resetear medidas de scroll.
7. Forzar repaint si el navegador mantiene medidas anteriores.

Ejemplo:

```tsx
useEffect(() => {
  requestAnimationFrame(() => {
    stageRef.current?.scrollTo({
      left: Math.min(stageRef.current.scrollLeft, stageRef.current.scrollWidth),
      top: Math.min(stageRef.current.scrollTop, stageRef.current.scrollHeight),
    });
  });
}, [zoom]);
```

---

# 14. Criterios de aceptación

La tarea se considera correcta cuando:

1. El scroll se reduce cuando el zoom baja.
2. El scroll aumenta cuando el zoom sube.
3. No queda scroll fantasma.
4. Las divs de separación siempre son visibles.
5. Las etiquetas de inserción siempre son visibles.
6. Cada página usa su tamaño real de PDF.
7. Carta se detecta como Carta.
8. Oficio se detecta como Oficio o Legal.
9. A4 se detecta como A4.
10. Páginas no estándar se detectan como CUSTOM.
11. Carta y Oficio se ven proporcionados correctamente.
12. El tamaño de preview se calcula por metadata, no por imagen renderizada.
13. El zoom no deforma las páginas.
14. El grid se reorganiza correctamente después de cada zoom.
15. No se rompen selección, drag and drop ni acciones rápidas.

La regla más importante para Codex es esta: **el tamaño visual debe salir de las dimensiones reales de cada página PDF, no del tamaño de la imagen renderizada ni de estilos viejos guardados**.
