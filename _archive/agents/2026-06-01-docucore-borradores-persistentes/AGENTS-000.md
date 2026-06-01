Esto ya no es solo un ajuste visual, sino una definición importante de UX, persistencia y flujo de trabajo de DocuCore. Lo reorganizaría en 3 módulos para que Codex pueda implementarlo correctamente y no termine creando soluciones aisladas.

# DocuCore — Mejoras de UX para zonas de inserción, trabajos pendientes y persistencia del Workspace

# Objetivo

Convertir DocuCore en un entorno de trabajo persistente donde el usuario nunca pierda avances y donde las zonas entre páginas funcionen como puntos inteligentes de inserción, movimiento y organización documental.

---

# MÓDULO 1 — Zonas de inserción entre páginas

## Problema actual

Actualmente la zona:

```html
<button class="section-split-zone">
  ✂ Dividir aquí
</button>
```

provoca que las páginas se vean demasiado separadas.

Visualmente parece un elemento independiente cuando en realidad es únicamente un punto de inserción.

---

# Nuevo concepto

La zona entre páginas no debe verse como un botón.

Debe comportarse como:

```text
Punto de inserción
Punto de división
Punto de pegado
Punto de reordenamiento
```

---

# Diseño visual

Estado normal:

```text
Página 1 | | Página 2
```

La zona debe ser:

```text
Muy delgada
Semitransparente
Discreta
```

No debe romper la continuidad visual.

---

# Dimensiones

Ancho:

```text
4px a 12px
```

Nunca más.

Altura:

```text
Misma altura de la fila donde existen previews.
```

---

# Comportamiento

Debe ocupar:

```text
100% del alto de la fila.
```

No solamente una pequeña cápsula.

---

# Hover

Cuando el usuario pasa el cursor:

Expandir temporalmente.

Ejemplo:

```text
Página 1 | Dividir | Página 2
```

---

# Menú contextual rápido

Hover sobre la zona:

Mostrar:

```text
➕ Nueva página vacía

✂ Dividir aquí

📋 Pegar aquí

📄 Insertar PDF

🖼 Insertar imagen
```

---

# Estado copiar

Cuando exista algo copiado:

```text
clipboard.hasContent = true
```

La zona debe:

```text
Encender icono pegar
```

---

# Estado cortar

Cuando exista algo cortado:

```text
cutBuffer.hasContent = true
```

La zona debe:

```text
Parpadear suavemente
```

Indicando:

```text
Aquí puede pegar.
```

---

# Estado arrastrar

Cuando una página se está moviendo:

```text
dragStart
```

Las zonas deben:

```text
Animarse
Expandirse
Iluminarse
```

---

# Vista

Ejemplo:

```text
Página

▼ Soltar aquí

Página
```

---

# Animación

Mostrar línea azul creciendo:

```text
────────────
```

simulando posición futura.

---

# Reordenamiento

Al arrastrar página:

```text
dragstart
```

Mostrar:

```text
Todas las zonas válidas.
```

---

# Inserción

Al soltar:

```text
drop
```

Resaltar:

```text
Nueva posición
```

durante:

```text
2 segundos
```

---

# Páginas modificadas

Toda página modificada debe mostrar:

```text
Borde especial
```

Ejemplos:

```text
Duplicada
Movida
Rotada
Pegada
Insertada
```

---

# MÓDULO 2 — Sidebar inteligente

## Problema

Actualmente:

```text
Click
Sidebar aparece
```

pero no existe persistencia.

---

# Comportamiento requerido

Botón:

```text
☰
```

---

# Click

Abrir sidebar.

---

# Si no ocurre interacción

Después de:

```text
3 a 5 segundos
```

Cerrar sidebar automáticamente.

---

# Si el usuario interactúa

Mantener abierta.

---

# Si selecciona una opción

Antes de navegar:

```text
Guardar Workspace
```

---

# Guardado automático

Ejecutar:

```text
saveWorkspace()
```

antes de cambiar pantalla.

---

# Toast

Mostrar:

```text
Trabajo guardado automáticamente.
```

Duración:

```text
2 segundos
```

---

# Nombre de trabajos pendientes

No usar:

```text
Trabajo sin nombre
```

---

# Nuevo concepto

```text
Sesión de trabajo
```

o

```text
Borrador documental
```

o

```text
Proyecto temporal
```

Recomendación:

```text
Borrador documental
```

---

# Ejemplo

```text
Borrador documental

Sentencia.pdf

Última modificación:
Hace 5 minutos
```

---

# MÓDULO 3 — Trabajos pendientes

## Objetivo

Evitar pérdida de trabajo.

---

# Ubicación

Pantalla Upload.

---

# Al entrar

Verificar:

```text
localStorage
indexedDB
```

---

# Si existen borradores

Mostrar panel:

```text
Continuar trabajo anterior
```

---

# Información visible

Nombre:

```text
Sentencia.pdf
```

---

# Fecha creación

```text
24/05/2026
```

---

# Última modificación

```text
Hace 5 minutos
```

---

# Estado

```text
Dividir PDF
```

o

```text
OCR
```

o

```text
Generar índice
```

---

# Acciones

```text
Abrir

Duplicar

Renombrar

Eliminar
```

---

# Click

Abrir directamente Workspace.

---

# Persistencia local

Mientras no exista login:

Guardar:

```text
localStorage
```

datos pequeños.

---

# Guardar:

```text
IndexedDB
```

miniaturas
documentos
estado
configuración

````

---

# F5 / Refresh

Problema actual:

```text
Se pierde todo.
````

---

# Solución

Guardar automáticamente:

```text
Cada cambio
```

---

# Eventos

```text
rotate
copy
cut
paste
move
split
delete
duplicate
```

---

# También

```text
beforeunload
visibilitychange
pagehide
```

---

# Recuperación

Si existe sesión:

Mostrar:

```text
Se encontró un trabajo pendiente.

¿Desea continuar?
```

Opciones:

```text
Continuar

Descartar
```

---

# Comportamiento futuro con login

Sin login:

```text
Persistencia local.
```

Con login:

```text
Persistencia local +
Sincronización nube.
```

---

# Información mínima a guardar

```ts
type WorkspaceDraft = {
  id: string;
  tool: string;
  documents: Document[];
  pages: Page[];
  modifications: Modification[];
  createdAt: string;
  updatedAt: string;
  lastOpenedAt: string;
};
```

---

# Criterios de aceptación

La implementación queda terminada cuando:

```text
1. Las zonas entre páginas no separan visualmente los previews.
2. Las zonas ocupan toda la altura de la fila.
3. Existen estados para pegar, cortar y mover.
4. Existe menú contextual sobre la zona.
5. El drag & drop muestra animación de inserción.
6. Toda modificación resalta visualmente la página.
7. La sidebar se cierra automáticamente si no hay interacción.
8. La navegación guarda automáticamente el trabajo.
9. Existe concepto de Borrador documental.
10. Upload muestra trabajos pendientes.
11. F5 no provoca pérdida de trabajo.
12. Existe persistencia local mediante IndexedDB.
13. Existe recuperación automática de sesiones.
14. Está preparada la sincronización futura con cuentas de usuario.
```

Hay otra situación que normalmente no se detecta al principio: cuando el usuario tiene **varios PDFs abiertos en el mismo borrador documental**, debes guardar también el orden de los documentos, las páginas descartadas, las páginas ocultas, las secciones creadas y la posición exacta del scroll para que al regresar vuelva exactamente al mismo punto donde estaba trabajando. Eso suele marcar una gran diferencia en la sensación de continuidad del workspace.
