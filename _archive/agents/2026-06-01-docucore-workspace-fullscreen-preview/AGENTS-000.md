Sí. El problema principal es que `pdf-toolbar` y `canvas-header` están ocupando espacio dentro del área donde deberían verse únicamente las miniaturas. En el código se ve que el preview está dentro de `canvas-main > pdf-stage > page-grid`, pero antes de `page-grid` se renderizan `pdf-toolbar`, `workspace-status-row` y `section-legend`, lo que reduce el área útil del documento. 

# Instrucción para Codex — Workspace limpio con preview a pantalla completa

## Objetivo

Reorganizar el workspace para que el área de previsualización de páginas ocupe prácticamente toda la pantalla.

El usuario debe poder desplazarse por las páginas usando solamente el scroll principal del navegador. No deben existir barras internas, headers grandes ni toolbars dentro del marco de trabajo que estorben el preview.

---

## Problema detectado

Actualmente existen elementos dentro del workspace que ocupan espacio visual:

```html
<div class="pdf-toolbar">
  <div>
    <p class="eyebrow">Vista principal</p>
    <h2>Previsualiza y selecciona paginas</h2>
    <p class="document-load-summary">123/123 listas, 0 cargando, 0 con incidencia</p>
    <p class="document-preview-message">Miniaturas generadas desde el PDF cargado: 123 paginas.</p>
  </div>
</div>
```

Este bloque no debe estar visible dentro del área principal del documento.

También estorba:

```html
<header class="canvas-header">
```

porque muestra información del workspace, resumen del archivo y ocupa espacio vertical.

---

# Regla principal

El preview debe ser el protagonista.

Dentro de `pdf-stage` debe quedar principalmente:

```html
<div class="page-grid">
  ...
</div>
```

La información secundaria debe moverse a botones, paneles flotantes o popovers.

---

# 1. Eliminar `pdf-toolbar` del área visible

## Acción requerida

No renderizar `pdf-toolbar` como bloque fijo arriba de las miniaturas.

Eliminar o convertir en componente colapsable.

Incorrecto:

```text
Toolbar arriba del preview ocupando espacio permanente.
```

Correcto:

```text
Botón inferior: Estado del documento
```

Al dar clic, abrir panel pequeño con:

```text
Vista principal
Miniaturas generadas: 123/123
Cargando: 0
Incidencias: 0
Mensaje del preview
```

---

# 2. Crear botón “Estado” en barra inferior

Agregar a `floating-toolbar` un botón:

```text
Estado
```

Icono sugerido:

```text
Info / Activity / FileCheck
```

Comportamiento:

```text
click Estado → abrir popover de estado
Escape → cerrar popover
click fuera → cerrar popover
```

Contenido del popover:

```text
Estado del documento

123/123 miniaturas listas
0 cargando
0 con incidencia

Miniaturas generadas desde el PDF cargado: 123 páginas.
```

Si hay error:

```text
No se pudo leer el PDF.
Verifica que el archivo no esté protegido o dañado.
```

---

# 3. Reorganizar `canvas-header`

## Problema

`canvas-header` ocupa espacio dentro del workspace.

## Acción requerida

Convertir `canvas-header` en información compacta dentro de un botón de la barra inferior.

Mover estos datos:

```text
Workspace
Dividir PDF
Nombre del archivo
Peso
Páginas
Seleccionadas
```

a un botón:

```text
Documento
```

Al dar clic:

```text
Documento actual
Archivo: e94f2ced-d206-4524-b19d-334edc1e2ecc.pdf
Peso: 1.4 MB
Páginas: 123
Seleccionadas: 8
Herramienta activa: Dividir PDF
```

---

# 4. Mantener el workspace sin marco interno

`canvas-workspace` no debe parecer una tarjeta.

Debe ocupar toda la pantalla disponible.

CSS requerido:

```css
.canvas-workspace {
  width: 100%;
  min-height: 100dvh;
  margin: 0;
  padding: 0;
  border: 0;
  border-radius: 0;
  background: #f8fafc;
  overflow: visible;
  position: relative;
}

.canvas-main {
  width: 100%;
  min-height: 100dvh;
  padding: 72px 16px 96px;
  overflow: visible;
  box-sizing: border-box;
}
```

---

# 5. Un solo scroll

Debe existir un solo scroll principal:

```text
El scroll del navegador.
```

Evitar:

```css
.canvas-main {
  overflow: auto;
}

.pdf-stage {
  overflow: auto;
}

.page-grid {
  overflow: auto;
}
```

Usar:

```css
html,
body {
  overflow-x: hidden;
  overflow-y: auto;
}

.canvas-main,
.pdf-stage,
.page-grid {
  overflow: visible;
}
```

---

# 6. `pdf-stage` debe ser transparente y amplio

El contenedor de preview no debe tener encabezados grandes ni fondo que parezca marco.

CSS recomendado:

```css
.pdf-stage {
  width: 100%;
  max-width: none;
  margin: 0;
  padding: 0;
  background: transparent;
  border: 0;
  box-shadow: none;
}
```

---

# 7. `page-grid` debe ocupar el espacio principal

```css
.page-grid {
  width: 100%;
  max-width: none;
  margin: 0 auto;
  padding: 16px 16px 120px;
  display: grid;
  gap: 18px;
  justify-content: center;
}
```

La parte inferior debe dejar espacio para la barra flotante:

```css
.page-grid {
  padding-bottom: 120px;
}
```

---

# 8. Mover `workspace-status-row`

El bloque:

```html
<div class="workspace-status-row">
  <div class="active-mode">Modo activo: Secciones</div>
</div>
```

no debe ocupar espacio permanente.

Debe moverse al botón:

```text
Herramienta / Modo
```

Popover:

```text
Herramienta activa: Dividir PDF
Modo activo: Secciones
Cambiar modo
```

---

# 9. Mover `section-legend`

La leyenda de secciones no debe ocupar espacio permanente arriba del preview.

Debe moverse a botón:

```text
Secciones
```

Popover:

```text
Documento principal — 123 páginas
Color: azul
Secciones creadas
```

Si el usuario está en modo secciones, puede mostrarse como panel flotante opcional, no como bloque fijo.

---

# 10. Barra inferior final

La barra inferior debe concentrar las funciones sin estorbar.

Botones recomendados:

```text
Herramientas
Documento
Estado
Secciones
Selección
Configuración
Subir más
Resultado
Aplicar
```

Por defecto solo iconos.

El texto aparece con tooltip.

---

# 11. Floating toolbar sin scroll horizontal

```css
.floating-toolbar {
  position: fixed;
  left: 50%;
  bottom: 18px;
  transform: translateX(-50%);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  max-width: calc(100vw - 24px);
  overflow: visible;
  padding: 8px;
  border-radius: 999px;
  z-index: 1200;
}

.floating-toolbar button {
  width: 42px;
  height: 42px;
  min-width: 42px;
  flex: 0 0 auto;
}

.floating-toolbar button span {
  display: none;
}

html,
body {
  overflow-x: hidden;
}
```

---

# 12. Eventos requeridos

```text
click Documento → abrir popover con datos del archivo.
click Estado → abrir popover con carga, errores y miniaturas.
click Secciones → abrir leyenda de secciones.
click Selección → abrir opciones: todas, impares, pares, limpiar selección.
click Herramientas → abrir drawer de herramientas.
click Configuración → abrir configuración.
click Resultado → abrir resultados.
click Aplicar → validar y aplicar cambios.
Escape → cerrar cualquier popover abierto.
click en área vacía → cerrar popovers.
scroll del navegador → no ocultar toolbar.
```

---

# 13. Criterios de aceptación

La corrección queda terminada cuando:

```text
1. `pdf-toolbar` ya no aparece dentro del área de preview.
2. `canvas-header` ya no ocupa espacio grande arriba del preview.
3. `page-grid` es el elemento principal visible.
4. El usuario se desplaza con el scroll del navegador.
5. No hay scroll interno en `canvas-main`, `pdf-stage` ni `page-grid`.
6. No hay scroll horizontal.
7. La información del documento se abre desde botón.
8. El estado del preview se abre desde botón.
9. La leyenda de secciones se abre desde botón.
10. La selección se maneja desde botón inferior.
11. La barra inferior no estorba el contenido.
12. El área de trabajo se siente amplia y limpia.
```

---

# Instrucción final para Codex

Reorganizar el workspace para que el preview de páginas ocupe toda el área principal. Eliminar `pdf-toolbar` como bloque visible dentro de `pdf-stage` y mover su información a un botón “Estado” dentro de `floating-toolbar`. Reducir o eliminar `canvas-header` como bloque permanente y mover los datos del documento a un botón “Documento”. Mover `workspace-status-row`, `section-legend` y controles de selección a botones inferiores con popovers. Garantizar que el único scroll vertical sea el del navegador y que no existan scrolls internos en `canvas-main`, `pdf-stage` ni `page-grid`. La barra inferior debe concentrar acciones sin provocar scroll horizontal y sin invadir el área del documento.
