Sí. Te lo mejoro como instrucción clara para Codex:

# Ajuste de zoom y escala del Workspace usando Microsoft Word como referencia

## Objetivo

Ajustar el sistema de zoom, escala y tamaño visual del área de trabajo para que funcione de manera proporcional, similar al comportamiento de Microsoft Word.

---

# Referencia visual

Como se observa en las imágenes de referencia, Microsoft Word permite trabajar con un rango amplio de zoom:

* Mínimo: 10%
* Máximo: 500%

Este comportamiento permite que el usuario pueda:

* Ver muchas páginas pequeñas al mismo tiempo.
* Revisar páginas con mayor detalle.
* Ajustar la escala según el tamaño de pantalla.
* Trabajar cómodamente con documentos largos.

---

# Cambio requerido

Modificar el zoom actual del Workspace para que use el siguiente rango:

```txt
Mínimo: 10%
Predeterminado: 100%
Máximo: 500%
```

---

# Reglas de implementación

## 1. Zoom visual, no zoom de interfaz

El zoom debe afectar únicamente:

* previews de páginas
* hojas visibles
* separación proporcional entre páginas
* tamaño del grid documental

No debe afectar:

* topbar global
* header del Workspace
* barra de herramientas
* panel derecho de configuración
* botones flotantes
* tabs de documentos
* texto general de la interfaz

---

## 2. Escala proporcional

El tamaño de cada preview debe calcularse tomando como base el tamaño normal de la hoja.

Ejemplo:

```txt
100% = tamaño base del preview
50% = mitad del tamaño visual
200% = doble del tamaño visual
500% = cinco veces el tamaño base
```

---

## 3. Rango del slider

Actualizar el slider de zoom:

```html
<input type="range" min="10" max="500" step="10" />
```

Valores recomendados:

```txt
10%
25%
50%
75%
100%
125%
150%
200%
300%
400%
500%
```

---

## 4. Botones de zoom

Agregar controles:

```txt
[-] [slider] [100%] [+] [restablecer]
```

Comportamiento:

* Botón menos: baja el zoom en pasos de 10%.
* Botón más: sube el zoom en pasos de 10%.
* Restablecer: vuelve a 100%.
* El valor actual debe mostrarse siempre.

---

## 5. Ajuste automático del grid

El grid debe reorganizarse automáticamente según el zoom.

A menor zoom:

* caben más páginas por fila
* menor separación visual

A mayor zoom:

* caben menos páginas por fila
* aumenta el área desplazable
* debe aparecer scroll natural

---

## 6. Scroll

Cuando el zoom sea alto, por ejemplo 300% o 500%:

* no comprimir la página
* no deformar el preview
* permitir scroll horizontal y vertical dentro del área del documento
* mantener el panel de herramientas y configuración fijos

---

## 7. Separadores de bloque

Los separadores de bloque deben escalar proporcionalmente con el tamaño promedio de las páginas.

Regla:

```txt
Ancho del separador = 75% del ancho promedio visible de página
Alto del separador = 20% del alto promedio visible de página
```

Límites:

```txt
Alto mínimo: 24px
Alto máximo: 80px
```

---

## 8. Persistencia

Guardar el zoom seleccionado por el usuario en:

```txt
localStorage
```

Clave sugerida:

```txt
docucore.workspace.zoom
```

Al volver al Workspace, restaurar el último zoom usado.

---

## 9. Autoajuste inicial

Cuando se abre un documento por primera vez:

* usar 100% por defecto
* si la pantalla es muy pequeña, permitir un modo “ajustar al ancho”
* no forzar zoom menor si el usuario ya guardó una preferencia

---

## 10. Estados requeridos

El Workspace debe manejar:

```txt
zoomValue
zoomMin = 10
zoomMax = 500
zoomStep = 10
isZoomPopoverVisible
```

---

# CSS sugerido

```css
.workspace-document-area {
  overflow: hidden;
}

.pdf-stage {
  overflow: auto;
}

.page-grid {
  --zoom-scale: 1;
  --base-thumb-width: 170px;
  --base-thumb-height: 220px;
  --thumb-width: calc(var(--base-thumb-width) * var(--zoom-scale));
  --thumb-height: calc(var(--base-thumb-height) * var(--zoom-scale));
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(var(--thumb-width), var(--thumb-width)));
  gap: calc(22px * var(--zoom-scale));
  align-items: start;
}

.pdf-thumb {
  width: var(--thumb-width);
}

.paper-preview {
  height: var(--thumb-height);
}

.document-block-separator {
  width: calc(var(--thumb-width) * 0.75);
  min-height: clamp(24px, calc(var(--thumb-height) * 0.2), 80px);
}
```

---

# Ejemplo React

```tsx
const ZOOM_MIN = 10;
const ZOOM_MAX = 500;
const ZOOM_STEP = 10;

const [zoom, setZoom] = useState(100);

const zoomScale = zoom / 100;

function increaseZoom() {
  setZoom((value) => Math.min(value + ZOOM_STEP, ZOOM_MAX));
}

function decreaseZoom() {
  setZoom((value) => Math.max(value - ZOOM_STEP, ZOOM_MIN));
}

function resetZoom() {
  setZoom(100);
}
```

Aplicar al grid:

```tsx
<div
  className="page-grid"
  style={{ "--zoom-scale": zoom / 100 } as React.CSSProperties}
>
  ...
</div>
```

Slider:

```tsx
<input
  type="range"
  min={10}
  max={500}
  step={10}
  value={zoom}
  onChange={(event) => setZoom(Number(event.target.value))}
/>
```

---

# Criterios de aceptación

La tarea estará completa cuando:

1. El zoom mínimo sea 10%.
2. El zoom máximo sea 500%.
3. El zoom predeterminado sea 100%.
4. El zoom afecte solo las páginas/previews.
5. El zoom no afecte topbar, herramientas ni panel derecho.
6. El grid se reorganice correctamente.
7. A 10% se puedan ver muchas páginas pequeñas.
8. A 500% se vea una página grande con scroll natural.
9. No se deforme la proporción de las hojas.
10. El separador de bloque escale proporcionalmente.
11. El zoom se guarde en localStorage.
12. El comportamiento sea similar al de Word, pero adaptado al Workspace de DocuCore.

Con esto Codex ya tendría una instrucción más precisa: **imitar el rango y la lógica de Word, pero sin escalar toda la interfaz, solo el área documental**.
