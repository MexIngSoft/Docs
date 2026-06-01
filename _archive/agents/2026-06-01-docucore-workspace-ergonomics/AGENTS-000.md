Sí. Te dejo una versión más ordenada y fuerte para Codex, con reglas claras de ergonomía, layout y eventos.

# Instrucciones para Codex — Optimización ergonómica del Workspace DocuCore

## Objetivo general

Optimizar el área de trabajo de DocuCore para que el documento tenga el mayor espacio visual posible.

La prioridad del workspace debe ser:

```text
1. Documento / preview
2. Herramientas necesarias
3. Información contextual
4. Navegación secundaria
```

No deben existir barras, márgenes, scrolls o contenedores visibles que reduzcan innecesariamente el área útil.

---

# 1. Corregir `floating-toolbar`

## Elemento afectado

```html
<nav class="floating-toolbar" aria-label="Accesos rapidos de workspace">
```

## Problema

Actualmente aparece un scrollbar horizontal dentro de la barra de herramientas.

Esto no debe ocurrir.

La barra debe verse compacta, limpia y sin scroll visible.

## Comportamiento requerido

La barra inferior debe:

```text
- No mostrar scrollbar horizontal.
- No aumentar el ancho del viewport.
- No provocar overflow-x en body, html, canvas-workspace ni canvas-main.
- Mostrar solo iconos por defecto.
- Mostrar texto mediante tooltip o al hacer hover.
- Mantenerse siempre visible sin invadir el documento.
```

## CSS recomendado

```css
html,
body {
  overflow-x: hidden;
}

.canvas-workspace,
.canvas-main {
  max-width: 100vw;
  overflow-x: hidden;
}

.floating-toolbar {
  position: fixed;
  left: 50%;
  bottom: 18px;
  transform: translateX(-50%);
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  max-width: calc(100vw - 24px);
  overflow: visible;
  padding: 8px;
  border-radius: 999px;
  background: rgba(15, 23, 42, 0.78);
  backdrop-filter: blur(14px);
  box-shadow: 0 18px 40px rgba(15, 23, 42, 0.25);
  z-index: 1200;
}

.floating-toolbar button {
  width: 42px;
  height: 42px;
  min-width: 42px;
  border-radius: 999px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.floating-toolbar button span {
  display: none;
}
```

## Tooltip por botón

Cada botón debe usar `data-label`.

```css
.floating-toolbar button::after {
  content: attr(data-label);
  position: absolute;
  bottom: calc(100% + 8px);
  white-space: nowrap;
  opacity: 0;
  pointer-events: none;
  background: #111827;
  color: #ffffff;
  padding: 6px 10px;
  border-radius: 999px;
  font-size: 12px;
  transform: translateY(4px);
  transition: opacity 140ms ease, transform 140ms ease;
}

.floating-toolbar button:hover::after,
.floating-toolbar button:focus-visible::after {
  opacity: 1;
  transform: translateY(0);
}
```

---

# 2. Mover acciones superiores a la barra inferior

## Elementos afectados

Actualmente existen acciones en:

```html
<header class="canvas-header">
```

y en:

```html
<div class="pdf-toolbar">
```

Estas ocupan demasiado espacio vertical.

## Regla

Las acciones frecuentes deben moverse a la barra inferior `floating-toolbar`.

## Acciones que deben estar en la barra inferior

```text
- Herramientas
- Configuración
- Subir más
- Resultado
- Aplicar cambios
- Información del documento
- Selección de páginas
```

## Acciones de selección que deben integrarse

Desde:

```html
<div class="page-controls">
  <button>Todas</button>
  <button>Impares</button>
  <button>Pares</button>
  <button>Limpiar seleccion</button>
</div>
```

Mover a:

```text
Botón inferior: Selección
```

Al hacer clic debe abrir un mini panel.

Ejemplo:

```text
Selección
├─ Todas
├─ Impares
├─ Pares
└─ Limpiar selección
```

---

# 3. Reducir `canvas-header`

## Elemento afectado

```html
<header class="canvas-header">
```

## Problema

El header ocupa espacio que debería pertenecer al área de trabajo.

## Comportamiento requerido

El header no debe mostrarse como bloque grande fijo dentro del workspace.

Debe convertirse en información compacta o colapsable.

## Nueva estructura recomendada

En lugar de mostrar:

```text
DocuCore Workspace
Dividir PDF
Nombre del archivo
Tamaño
Páginas
Seleccionadas
Aplicar cambios
```

mostrar una barra compacta flotante o semitransparente:

```text
Dividir PDF · SENTENCIA...pdf · 1 pág · 8 seleccionadas
```

## Regla de nombres largos

El nombre del archivo debe truncarse.

```css
.canvas-summary-file {
  max-width: 240px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
```

Al hacer hover o clic, mostrar nombre completo.

---

# 4. Corregir `canvas-workspace`

## Elemento afectado

```html
<section class="canvas-workspace">
```

## Problema

Existe una barra o marco gris que hace que el área de trabajo se vea reducida.

## Regla principal

`canvas-workspace` debe ocupar toda la ventana disponible.

No debe verse como una tarjeta dentro de otra tarjeta.

## CSS recomendado

```css
.canvas-workspace {
  width: 100%;
  min-height: 100dvh;
  margin: 0;
  padding: 0;
  border: 0;
  border-radius: 0;
  background: #f8fafc;
  overflow: hidden;
  position: relative;
}

.canvas-main {
  width: 100%;
  height: 100dvh;
  padding: 72px 16px 96px;
  overflow: auto;
  box-sizing: border-box;
}
```

## Regla

No usar:

```text
max-width pequeño
margin grande
border visible innecesario
contenedor gris externo
```

El área principal debe sentirse como un editor de documentos, no como una tarjeta encerrada.

---

# 5. Optimizar `pdf-toolbar`

## Elemento afectado

```html
<div class="pdf-toolbar">
```

## Problema

Ocupa demasiado espacio arriba del documento.

## Nueva regla

Convertir `pdf-toolbar` en una barra compacta, o mover sus controles a la barra inferior.

## Información que puede permanecer visible

```text
Vista principal
Estado de carga
Mensaje de error si existe
```

Pero debe mostrarse como una notificación compacta, no como bloque grande.

## Ejemplo recomendado

```text
⚠ No se pudo leer el PDF. Verifica que el archivo no esté protegido o dañado.
```

Debe poder cerrarse.

```text
[x]
```

## Acciones de selección

Mover a botón inferior:

```text
Selección
```

---

# 6. Topbar de inicio de sesión

## Elemento afectado

```html
<header class="topbar">
```

## Decisión

La topbar sí debe existir, porque permite iniciar sesión, registrarse y relacionar trabajos con la cuenta del usuario.

Pero debe ser semitransparente y no ocupar demasiado espacio.

## Comportamiento requerido

```text
- Semitransparente por defecto.
- Más visible al pasar el cursor.
- Compacta.
- No debe empujar el workspace hacia abajo excesivamente.
- Debe mantenerse arriba.
```

## CSS recomendado

```css
.topbar {
  position: fixed;
  top: 10px;
  left: 50%;
  transform: translateX(-50%);
  width: min(920px, calc(100vw - 24px));
  height: 48px;
  padding: 6px 10px;
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.58);
  backdrop-filter: blur(16px);
  border: 1px solid rgba(226, 232, 240, 0.7);
  z-index: 1300;
  transition: background 160ms ease, box-shadow 160ms ease;
}

.topbar:hover,
.topbar:focus-within {
  background: rgba(255, 255, 255, 0.94);
  box-shadow: 0 14px 36px rgba(15, 23, 42, 0.16);
}
```

## Botones importantes

Los botones:

```text
Iniciar sesión
Registrarme
```

deben resaltar al hover para guiar al usuario.

---

# 7. Sidebar colapsable

## Elemento afectado

```html
<aside class="sidebar">
```

## Problema

La sidebar ocupa demasiado espacio y reduce el área útil.

## Comportamiento recomendado

La sidebar debe estar oculta por defecto dentro del workspace.

Solo debe mostrarse una pestaña semitransparente lateral.

Ejemplo:

```text
☰
```

Al dar clic:

```text
Se abre sidebar compacta con iconos.
```

Al pasar el cursor sobre un icono:

```text
Aparece el texto de la opción.
```

## Estados de sidebar

```ts
type SidebarState = "hidden" | "icons" | "expanded";
```

## Comportamiento

```text
hidden:
Solo pestaña lateral.

icons:
Barra visible solo con iconos.

expanded:
Iconos + texto.
```

## CSS recomendado

```css
.sidebar {
  position: fixed;
  left: 12px;
  top: 72px;
  bottom: 96px;
  width: 58px;
  border-radius: 22px;
  background: rgba(15, 23, 42, 0.72);
  backdrop-filter: blur(16px);
  z-index: 1100;
  overflow: hidden;
  transition: width 180ms ease, transform 180ms ease, opacity 180ms ease;
}

.sidebar.is-hidden {
  transform: translateX(calc(-100% - 12px));
  opacity: 0;
  pointer-events: none;
}

.sidebar.is-expanded {
  width: 260px;
}

.sidebar nav a span,
.brand-name {
  opacity: 0;
  width: 0;
  overflow: hidden;
  white-space: nowrap;
}

.sidebar.is-expanded nav a span,
.sidebar.is-expanded .brand-name {
  opacity: 1;
  width: auto;
}
```

## Pestaña lateral

```css
.sidebar-tab {
  position: fixed;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  width: 34px;
  height: 78px;
  border-radius: 0 18px 18px 0;
  background: rgba(15, 23, 42, 0.55);
  backdrop-filter: blur(12px);
  z-index: 1150;
}
```

---

# 8. Eventos necesarios

## Toolbar inferior

Eventos:

```text
click Herramientas → abrir drawer de herramientas
click Configuración → abrir panel de configuración
click Subir más → abrir modal de carga
click Resultado → abrir panel de resultados
click Aplicar cambios → ejecutar validación y confirmar
click Información → abrir resumen del documento
click Selección → abrir menú de selección
```

## Sidebar

Eventos:

```text
click sidebar-tab → abrir sidebar en modo icons
hover sidebar → expandir temporalmente
mouseleave sidebar → regresar a icons
click pin → fijar expanded
Escape → cerrar sidebar si no está fijada
```

## Topbar

Eventos:

```text
hover/focus → aumentar opacidad
click Iniciar sesión → abrir login
click Registrarme → abrir registro
click Notificaciones → abrir panel de notificaciones
```

## Workspace

Eventos:

```text
click en área vacía → cerrar paneles flotantes
Escape → cerrar drawer, menú o sidebar
resize → recalcular espacio disponible
scroll → mantener toolbar visible sin generar overflow
```

---

# 9. Regla contra duplicación

No debe existir:

```text
- Botón Configuración duplicado en toolbar y FAB.
- Botón Información duplicado si ya existe en toolbar.
- Aplicar cambios duplicado en header y toolbar.
```

## Eliminar o integrar

Estos botones flotantes deben integrarse a la barra inferior:

```html
<button class="primary-action-button config-fab">
<button class="info-fab">
```

Si ya existen en `floating-toolbar`, eliminar los FAB duplicados.

---

# 10. Layout final esperado

```text
┌────────────────────────────────────────────┐
│      Topbar semitransparente               │
└────────────────────────────────────────────┘

☰  Sidebar oculta o compacta

┌────────────────────────────────────────────┐
│                                            │
│              Documento / Preview           │
│                                            │
│                                            │
└────────────────────────────────────────────┘

        Herramientas · Config · Subir · Resultado
             Toolbar inferior sin scroll
```

---

# 11. Criterios de aceptación

La optimización queda terminada cuando:

```text
1. No existe scrollbar horizontal en floating-toolbar.
2. No existe overflow-x en la página.
3. canvas-workspace ocupa toda la ventana.
4. No aparece marco gris que reduzca el workspace.
5. canvas-header ya no ocupa espacio excesivo.
6. pdf-toolbar se reduce o se integra a la barra inferior.
7. page-controls se muestran desde un menú de selección.
8. config-fab e info-fab no están duplicados.
9. topbar es semitransparente y se resalta al hover.
10. sidebar queda oculta o compacta por defecto.
11. El preview tiene más espacio visible.
12. El usuario puede acceder a todas las funciones sin saturar la pantalla.
```

---

# Instrucción final para Codex

Optimizar el workspace de DocuCore para maximizar el área útil del documento. Corregir `floating-toolbar` para que nunca genere scrollbar horizontal ni overflow-x. Convertir la barra inferior en el centro principal de acciones rápidas: herramientas, configuración, subir más, resultado, aplicar cambios, información y selección. Reducir o integrar `canvas-header` y `pdf-toolbar` para evitar que ocupen espacio vertical. `canvas-workspace` debe ocupar toda la ventana sin marco gris ni tarjeta interna. La `topbar` debe mantenerse semitransparente, compacta y visible, resaltándose al hover para login y registro. La `sidebar` debe ocultarse por defecto y mostrarse mediante una pestaña lateral semitransparente, con modo de iconos y expansión por hover. Eliminar botones duplicados como `config-fab` e `info-fab` si sus funciones ya existen en la barra inferior. Garantizar que todo el layout sea responsive, accesible, sin scroll horizontal y enfocado en que el documento sea el protagonista.
