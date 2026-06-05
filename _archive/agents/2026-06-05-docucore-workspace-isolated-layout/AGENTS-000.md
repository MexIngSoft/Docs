Sí. El problema ya es de **layout aislado del Workspace**: la `topbar` global y el `workspace-status-header` se están encimando dentro del flujo actual. Esta instrucción deja la regla clara para Codex. 

# Corrección de layout aislado del Workspace DocuCore

## Objetivo

Reestructurar el Workspace para que sus cambios visuales, efectos, paneles, toolbars, sliders y configuraciones no afecten directamente otras áreas de DocuCore como Upload, Results, History, Jobs, Landing Pages o navegación general.

---

# 1. Regla de aislamiento del Workspace

Todo cambio visual del Workspace debe estar encapsulado dentro de:

```css
.shell-workspace
```

o dentro de:

```css
.canvas-workspace
```

Queda prohibido modificar estilos globales como:

```css
main
header
aside
button
section
article
.topbar
.sidebar
.app-content
```

si esos estilos afectan otras pantallas.

Toda regla nueva debe usar prefijo:

```css
.workspace-
```

Ejemplos permitidos:

```css
.workspace-root
.workspace-layout
.workspace-top-zone
.workspace-status-header
.workspace-tool-rail
.workspace-config-panel
.workspace-floating-tabs
.workspace-zoom-popover
.workspace-document-area
```

---

# 2. Separación entre topbar global y header del documento

Actualmente existen dos barras:

```html
<header class="topbar">...</header>
```

y

```html
<header class="workspace-status-header">...</header>
```

Estas no deben competir ni encimarse.

## Regla

La `topbar` es global.

La `workspace-status-header` pertenece únicamente al Workspace.

La `workspace-status-header` debe ir debajo de la `topbar`, dentro del contenedor del Workspace.

Estructura obligatoria:

```html
<main class="app-main">
  <header class="topbar">
    Navegación global / login / cuenta / notificaciones
  </header>

  <section class="workspace-root">
    <header class="workspace-status-header">
      Documento activo / páginas / docs / estado
    </header>

    <section class="workspace-body">
      <aside class="workspace-tool-rail"></aside>
      <main class="workspace-document-area"></main>
      <aside class="workspace-config-panel"></aside>
    </section>
  </section>
</main>
```

---

# 3. Alturas fijas y cálculo del área útil

La `topbar` debe tener altura fija:

```css
--topbar-height: 56px;
```

El `workspace-status-header` debe tener altura fija:

```css
--workspace-status-height: 52px;
```

El área real de trabajo debe calcularse así:

```css
.workspace-root {
  height: calc(100vh - var(--topbar-height));
}

.workspace-body {
  height: calc(100vh - var(--topbar-height) - var(--workspace-status-height));
}
```

Esto evita que las barras se encimen.

---

# 4. Header del documento

El header del documento debe ser compacto.

Debe mostrar:

* documento activo
* páginas
* documentos cargados
* estado
* botón de configuración
* botón de subir/agregar documento si aplica

No debe mostrar demasiados datos.

## Versión recomendada

```html
<header class="workspace-status-header">
  <div class="workspace-active-document">
    <span>Documento activo</span>
    <strong>SENTENCIA CONDENATORIA 332024.pdf</strong>
  </div>

  <div class="workspace-status-metrics">
    <span>28 páginas</span>
    <span>2 docs</span>
    <span>Guardado</span>
  </div>

  <button class="workspace-config-toggle">
    Configuración
  </button>
</header>
```

Eliminar o simplificar:

```text
Bloques
Listas
```

si no son necesarios para el usuario final.

---

# 5. Panel derecho de configuración

El cuadro de configuración debe ser una barra lateral derecha fija dentro del Workspace.

No debe flotar encima del documento cuando esté fijado.

Estados:

```text
hidden
floating
pinned
```

## pinned

Cuando está fijado:

* ocupa ancho real
* reduce el área de documento
* no tapa previews
* no se cierra automáticamente

Layout:

```css
.workspace-body {
  display: grid;
  grid-template-columns: 64px minmax(0, 1fr) 340px;
}
```

## hidden

Cuando está oculto:

```css
.workspace-body {
  grid-template-columns: 64px minmax(0, 1fr);
}
```

Debe quedar visible una pestaña/botón para volver a abrirlo.

## floating

Cuando no está fijado:

* aparece sobre el lado derecho
* puede cerrarse al hacer clic fuera
* puede cerrarse después de un tiempo sin uso
* no debe cambiar el grid
* debe tener z-index controlado

---

# 6. Botones laterales tipo pestaña

En el lado derecho del área de documento debe haber dos pestañas verticales.

Una para configuración y otra para zoom.

Deben estar una debajo de la otra.

```text
┌─────────────┐
│ ⚙ Config    │
├─────────────┤
│ 🔍 Zoom      │
└─────────────┘
```

## Regla

La pestaña de herramientas/configuración siempre debe estar visible.

La pestaña de zoom puede abrir el slider.

Si el usuario abre zoom:

* se muestra el control de zoom
* si no se usa, se oculta automáticamente
* no debe esconder permanentemente la pestaña de configuración

---

# 7. Comportamiento del zoom

El slider de zoom debe estar en una cápsula flotante pequeña.

No debe ocupar espacio permanente.

No debe tapar el panel de configuración.

Debe aparecer junto a la pestaña de zoom.

Estados:

```text
zoom-hidden
zoom-visible
```

Reglas:

1. Al hacer clic en pestaña Zoom, aparece el slider.
2. Si pasan unos minutos sin uso, se oculta.
3. Si el usuario usa el slider, permanece visible.
4. Si el usuario hace clic fuera, se puede ocultar.
5. El zoom solo afecta previews, no la interfaz completa.

---

# 8. Separador de bloque

El separador actual es demasiado grande.

Debe calcular su tamaño con base en el promedio visual de las hojas.

Regla visual:

* ancho: 75% del ancho promedio de una hoja
* alto: 20% del alto promedio de una hoja
* centrado dentro del grid
* no ocupar todo el ancho de la fila
* no romper el flujo del grid

CSS sugerido:

```css
.document-block-separator {
  width: calc(var(--avg-thumb-width, 170px) * 0.75);
  min-height: calc(var(--avg-thumb-height, 220px) * 0.20);
  max-height: 72px;
  align-self: center;
  justify-self: center;
}
```

La información interna debe ser mínima:

```text
Inicio de documento
Páginas 1-28
```

Las acciones como:

```text
Unificar
Renombrar
Color
Fijar
```

solo deben aparecer en hover o menú contextual.

---

# 9. Eliminar encimamientos

Aplicar estas reglas:

```css
.workspace-root,
.workspace-body,
.workspace-document-area,
.workspace-config-panel {
  min-width: 0;
  min-height: 0;
  box-sizing: border-box;
}

.workspace-document-area {
  overflow: auto;
}

.workspace-config-panel {
  overflow-y: auto;
  overflow-x: hidden;
}

.workspace-status-header {
  flex-shrink: 0;
  z-index: 20;
}

.topbar {
  flex-shrink: 0;
  z-index: 30;
}
```

---

# 10. Criterios de aceptación

La corrección será válida cuando:

1. La topbar global no se encime con el header del documento.
2. El header del documento quede dentro del Workspace.
3. El panel derecho no tape las páginas cuando esté fijado.
4. El área de trabajo se reduzca o expanda según el panel derecho.
5. El botón de configuración siempre sea visible.
6. El botón de zoom esté debajo del botón de configuración.
7. El zoom aparezca como control flotante y se oculte si no se usa.
8. El separador de bloque sea pequeño y proporcional a las hojas.
9. Las acciones del separador no estén visibles todo el tiempo.
10. Ningún cambio del Workspace afecte Upload, Results, Jobs, History o Landing Pages.
11. No exista scroll horizontal en el panel derecho.
12. Las reglas CSS estén encapsuladas bajo clases `workspace-*`.

La idea central: **topbar global arriba, header del documento debajo, herramientas a la izquierda, documento al centro, configuración a la derecha y pestañas flotantes controladas**.
