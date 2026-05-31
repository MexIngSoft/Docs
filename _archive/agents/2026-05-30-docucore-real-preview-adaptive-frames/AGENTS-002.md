Sí, correcto. Aquí está el complemento para agregar a las instrucciones anteriores:

## Corrección adicional del visualizador de documentos

### Problema detectado

La previsualización ya aparece, pero algunas imágenes o páginas se salen de su entorno visual.

Esto no debe ocurrir.

Cada preview debe permanecer dentro de su marco, centrado y adaptado al tamaño real del documento o imagen.

---

## Regla principal del visualizador

El visualizador no debe usar un tamaño fijo universal para todas las páginas.

Debe adaptarse al tamaño real de cada página o imagen.

El sistema debe reconocer y mostrar tamaños como:

```text
Carta
Oficio
A4
A5
Legal
Horizontal
Vertical
Tamaño personalizado
Imagen personalizada
```

---

## Metadata obligatoria por página o imagen

Cada página previsualizada debe tener metadata propia:

```ts
{
  page: 1,
  previewUrl: "/previews/doc/page_1.webp",
  width: 612,
  height: 792,
  sizeName: "Carta",
  orientation: "portrait",
  status: "ready"
}
```

Para imágenes:

```ts
{
  fileName: "imagen.jpg",
  previewUrl: "/previews/img_001.webp",
  width: 1920,
  height: 1080,
  sizeName: "Imagen personalizada",
  orientation: "landscape",
  status: "ready"
}
```

---

## Mostrar tamaño en el previsualizador

Cada página o imagen debe mostrar su tamaño visible dentro del preview.

Ejemplo:

```text
Página 1 · Carta · 612 × 792 px
```

o:

```text
Imagen · 1920 × 1080 px
```

o:

```text
Página 2 · Oficio · Vertical
```

---

## Contenedor adaptativo

Cada preview debe construir su marco según la proporción real.

No usar siempre el mismo rectángulo.

Ejemplos:

```text
Carta:
┌─────────────┐
│             │
│             │
└─────────────┘

Oficio:
┌─────────────┐
│             │
│             │
│             │
└─────────────┘

Horizontal:
┌───────────────────┐
│                   │
└───────────────────┘
```

---

## Regla contra desbordamiento

La imagen o página nunca debe salirse del contenedor.

Aplicar reglas como:

```css
.preview-page-frame {
  position: relative;
  overflow: hidden;
  background: #ffffff;
  max-width: 100%;
  box-sizing: border-box;
}

.preview-page-frame img,
.preview-page-frame canvas {
  width: 100%;
  height: 100%;
  object-fit: contain;
  display: block;
}
```

---

## Centrado obligatorio

Cada preview debe quedar centrado dentro del workspace.

```css
.preview-page-wrapper {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: flex-start;
}
```

Si el usuario aumenta el zoom, el preview puede crecer, pero debe seguir respetando el scroll del workspace y no romper el layout.

---

## Escalado correcto

El tamaño visual debe calcularse con base en:

```text
ancho real
alto real
zoom actual
ancho disponible del workspace
modo de ajuste
```

Modos necesarios:

```text
- Ajustar al ancho
- Ajustar a página completa
- Zoom manual
- 100%
```

---

## Placeholder adaptativo

Mientras carga, el placeholder también debe respetar la proporción real si ya se conoce.

Ejemplo:

```text
Página 1 · Carta · Cargando...
```

No debe mostrarse un placeholder cuadrado para todos los documentos.

---

## Instrucción final para desarrollo

Corregir el visualizador para que ninguna imagen, página o canvas se salga de su entorno. Cada preview debe adaptarse al tamaño real de la página o imagen usando metadata de ancho, alto, orientación y nombre de tamaño. El visualizador debe mostrar el tamaño detectado en cada página, por ejemplo: Carta, Oficio, A4, A5, Legal, horizontal, vertical o personalizado. También debe mostrar dimensiones como ancho × alto cuando sea posible. El marco de cada preview debe calcularse de forma independiente y mantenerse centrado dentro del workspace, respetando zoom, scroll y límites del contenedor.
