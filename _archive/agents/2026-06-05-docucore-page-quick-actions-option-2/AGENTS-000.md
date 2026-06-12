Precisamente ahí está el problema de UX. Si la barra aparece al pasar el mouse sobre la hoja y el selector también vive en la misma zona, ambos compiten por el mismo espacio.

Yo no movería la barra rápida fuera de la tarjeta. Mantendría el comportamiento hover, pero cambiaría la forma en que aparece.

### Opción 1 (la que más recomiendo)

La barra rápida aparece arriba del preview, pero empuja el contenido en lugar de superponerse.

Estado normal:

```txt
┌───────────────┐
│               │
│   Preview     │
│               │
└───────────────┘
```

Hover:

```txt
┌───────────────┐
│ ↺ ↻ ⋮         │
├───────────────┤
│               │
│   Preview     │
│               │
└───────────────┘
```

La hoja baja unos 36px mediante animación.

Ventajas:

* Nada se tapa.
* El selector sigue visible.
* Sigue sintiéndose rápido.
* Muy parecido a Notion y Figma.

---

### Opción 2

Mover el selector fuera de la zona del hover.

Ejemplo:

```txt
 ☑

┌───────────────┐
│ ↺ ↻ ⋮         │
│               │
│   Preview     │
│               │
└───────────────┘
```

El selector queda anclado en la esquina exterior de la tarjeta.

Así la barra puede usar toda la parte superior.

---

### Opción 3 (mi favorita para DocuCore)

La barra rápida aparece flotando en el borde derecho.

Estado normal:

```txt
┌───────────────┐
│               │
│   Preview     │
│               │
└───────────────┘
```

Hover:

```txt
┌───────────────┬───┐
│               │↺  │
│   Preview     │↻  │
│               │⋮  │
└───────────────┴───┘
```

Ventajas:

* Nunca tapa contenido.
* Funciona igual en zoom 10% o 500%.
* Funciona en móvil.
* Permite agregar más acciones después.

---

### Opción 4 (la más profesional)

No mostrar acciones hasta seleccionar la hoja.

```txt
☑ Página seleccionada
```

Entonces aparece una toolbar global arriba:

```txt
Rotar | Eliminar | Duplicar | Extraer | Más
```

Exactamente como Google Drive, Gmail o Windows Explorer.

Cuando seleccionas 10 páginas:

```txt
10 páginas seleccionadas

Rotar
Eliminar
Mover
Extraer
```

Esto elimina completamente el problema de superposición.

---

Para DocuCore, donde vas a manejar documentos de cientos de páginas, elegiría una combinación:

```txt
Hover:
- Solo mostrar selector.

Página seleccionada:
- Mostrar toolbar global.

Click derecho:
- Mostrar menú contextual.
```

Así evitas tener 500 barras rápidas flotando por toda la pantalla y el Workspace se siente mucho más limpio y escalable.
