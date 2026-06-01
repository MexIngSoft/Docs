He revisado el contenido del archivo y, además de lo que ya identificaste, veo varios eventos, comportamientos y criterios de UX que conviene documentar explícitamente para que Codex no tome decisiones incorrectas durante la implementación. 

## 1. Menús flotantes (`page-menu` e `insertion-menu`)

### Requisitos faltantes

#### Jerarquía visual (z-index)

Los menús contextuales deben renderizarse siempre en una capa superior a:

* previews
* miniaturas
* páginas rotadas
* overlays
* barras laterales
* zonas de inserción
* indicadores de selección

Nunca deben quedar ocultos detrás de ningún elemento.

#### Cierre automático global

El menú debe cerrarse cuando:

* se hace clic fuera del menú
* se abre otro menú
* se selecciona una acción
* se inicia drag & drop
* se cambia de página
* se hace scroll significativo
* se abre un modal
* se abre el panel lateral
* se abre el editor de propiedades
* se presiona ESC

Solo puede existir un menú contextual abierto a la vez.

#### Reposicionamiento inteligente

Si el menú no cabe:

* moverlo arriba
* moverlo a izquierda
* moverlo a derecha
* evitar que salga del viewport

Nunca debe aparecer cortado.

---

## 2. Barra rápida (`page-quick-actions`)

### Estado correcto

Actualmente aparece permanentemente.

Debe:

```text
Estado normal:
oculta

Hover página:
visible

Página seleccionada:
visible

Página activa:
visible

Mover cursor fuera:
oculta nuevamente
```

### Eventos faltantes

Mostrar cuando:

* hover página
* página seleccionada
* página enfocada por teclado

Ocultar cuando:

* mouse sale
* se abre menú contextual
* comienza drag
* se abre slider lateral

---

## 3. Rotación de páginas

Este es probablemente el problema visual más importante.

### Comportamiento incorrecto actual

Actualmente:

```text
La imagen gira
El contenedor conserva tamaño anterior
La imagen se reduce
Se ve aplastada
```

### Comportamiento esperado

Debe girar el componente completo:

```text
paper-mini
paper-viewport
paper-rotator
contenedor visual
```

No solamente la imagen.

---

### Recalcular layout

Cuando una página cambia:

```text
Vertical → Horizontal
Horizontal → Vertical
```

debe recalcularse:

* ancho ocupado
* alto ocupado
* columnas
* distribución de previews
* posición de zonas de inserción

---

### Flujo esperado

```text
Usuario gira página

↓

Actualizar metadata

↓

Actualizar orientación

↓

Recalcular ancho real

↓

Recalcular alto real

↓

Reacomodar grid

↓

Animar transición

↓

Actualizar zonas de inserción
```

---

### Centrado vertical

Cuando una página horizontal queda junto a páginas verticales:

```text
La página horizontal debe centrarse
verticalmente respecto a la fila.
```

Nunca debe quedar pegada arriba.

---

## 4. Reacomodo automático del grid

Falta documentar:

Cuando una página cambie orientación:

```text
Vertical
↓
Horizontal
```

puede ocupar el espacio equivalente a:

```text
1.5 previews
2 previews
```

según el tamaño.

El grid debe:

```text
mover previews vecinos
hacer transición animada
evitar superposición
mantener orden lógico
```

---

## 5. Smart Insertion Zone

### Posición exacta

Actualmente queda desplazada.

Debe:

```text
centrarse exactamente
entre ambas páginas
```

Matemáticamente:

```text
50% del espacio entre previews
```

No:

```text
50% del contenedor padre
```

---

### Casos especiales

Debe verse correctamente:

* inicio del documento
* final del documento
* página vertical
* página horizontal
* página girada
* múltiples columnas

---

### Altura

La altura debe adaptarse al preview más alto de la fila.

Ejemplo:

```text
Página A = 320px

Página B = 450px
```

Zona inserción:

```text
450px
```

---

## 6. Drag & Drop

Faltan reglas importantes.

Cuando una página se arrastra:

### Zona inserción

Debe:

```text
expandirse
resaltar
animarse
```

Indicando:

```text
Aquí se soltará la página
```

---

### Placeholder

Mientras se arrastra:

Debe mostrarse un placeholder.

No debe existir:

```text
saltos
parpadeos
reacomodos bruscos
```

---

## 7. Sidebar

Botón:

```html
.sidebar-tab
```

### Regla faltante

Solo puede existir uno:

```text
Sidebar visible
o
Botón hamburguesa visible
```

Nunca ambos.

---

### Estados

```text
Sidebar cerrado
→ mostrar botón

Sidebar abierto
→ ocultar botón

Sidebar cerrándose
→ esperar animación

Sidebar cerrado
→ mostrar botón
```

---

## 8. Botón Registrarme

### Problema

Perdió estilos.

### Requisitos

Debe conservar:

```text
color primario
hover
focus
active
disabled
loading
```

---

### Prioridad visual

Debe destacar más que:

```text
Iniciar sesión
Menú
Navegación
```

Porque es la acción principal.

---

## 9. Accesibilidad

Falta documentar:

### Teclado

Todos los menús deben soportar:

```text
TAB
SHIFT+TAB
ENTER
SPACE
ESC
FLECHAS
```

---

### Focus

Al cerrar:

```text
retornar foco
al elemento que abrió el menú
```

---

## 10. Rendimiento

Cuando existan:

```text
50 páginas
100 páginas
500 páginas
1000 páginas
```

No debe renderizar:

```text
todos los menús
todas las barras rápidas
todos los overlays
```

Utilizar:

```text
virtualización
lazy render
portal flotante
```

---

## 11. Estados que faltan documentar

Cada página debe poder mostrar:

```text
Normal
Seleccionada
Hover
Arrastrando
Copiada
Cortada
Pegada
Modificada
Rotada
Con OCR
Firmada
Con nota
Con marca de agua
Importante
Con etiquetas
Error
Procesando
Bloqueada
```

---

## 12. Menú contextual de página

También faltan estas acciones que el usuario esperará encontrar:

```text
Mover al inicio
Mover al final

Seleccionar páginas similares

Deshacer cambios de página

Restaurar original

Exportar página

Compartir página

Historial de cambios

Bloquear página

Comparar página original vs modificada

Vista completa

Zoom

Previsualizar impresión
```

Estas reglas harán que la especificación quede mucho más completa y evitarán que Codex implemente soluciones visualmente correctas pero funcionalmente incompletas.
0