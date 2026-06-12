Tienes razón. Revisando la maqueta anterior hay varias cosas que quedaron incompletas respecto a las reglas que ya habíamos definido para DocuCore.

Lo que yo le indicaría a Codex sería algo así:

# Correcciones pendientes del Workspace DocuCore

## 1. Eliminación de documentos desde Workspace

Actualmente el Workspace permite visualizar múltiples documentos dentro de un proyecto, pero no existe una acción clara para eliminar un documento del proyecto.

### Requerimiento

Cada documento mostrado en la barra superior de documentos debe tener acceso a:

```txt
Activar documento
Renombrar documento
Descargar documento
Eliminar documento
```

### Diseño sugerido

```txt
┌────────────────────────────────────────────┐
│ PDF 1.pdf      ✕                           │
│ PDF 2.pdf      ✕                           │
│ PDF 3.pdf      ✕                           │
└────────────────────────────────────────────┘
```

o

```txt
PDF 1.pdf ▼

Abrir
Renombrar
Descargar
Eliminar
```

### Regla

Eliminar documento:

* elimina el documento del proyecto
* no elimina el proyecto
* solicita confirmación
* registra evento en logs

---

# 2. Navegación automática al documento

Actualmente la barra superior muestra documentos, pero seleccionar uno no tiene un comportamiento definido.

### Requerimiento

Al hacer clic sobre un documento:

```txt
Documento A
Documento B
Documento C
```

El Workspace debe desplazarse automáticamente al inicio del documento seleccionado.

### Ejemplo

Si:

```txt
Documento A
Páginas 1-28

Documento B
Páginas 29-80

Documento C
Páginas 81-120
```

Al pulsar:

```txt
Documento C
```

Debe hacer:

```txt
scrollIntoView()
```

hacia:

```txt
Aquí inicia Documento C
```

### Objetivo

Evitar que el usuario busque manualmente el inicio del documento.

---

# 3. Barra de acciones rápidas

La maqueta anterior no implementó correctamente el cambio solicitado.

Actualmente la barra rápida sigue apareciendo encima de la hoja.

### Comportamiento prohibido

```txt
┌───────────────┐
│ ↺ ↻ ⋮         │
│               │
│   Preview     │
│               │
└───────────────┘
```

Porque:

* tapa contenido
* tapa selector
* genera conflictos visuales

---

# 4. Nueva posición de barra rápida

La barra rápida debe cambiar completamente de ubicación.

### Opción aprobada

Moverla al borde derecho del preview.

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
┌───────────────┬────┐
│               │ ↺  │
│   Preview     │ ↻  │
│               │ ⋮  │
└───────────────┴────┘
```

### Ventajas

* No tapa contenido.
* No tapa selector.
* Funciona en cualquier zoom.
* Permite agregar acciones futuras.

---

# 5. Selector de página

El selector debe mantenerse independiente.

### Ubicación

```txt
☑
┌───────────────┐
│               │
│   Preview     │
│               │
└───────────────┘
```

Nunca debe compartir espacio con:

* barra rápida
* menú contextual
* indicadores de inserción

### Jerarquía

```txt
Selector      z-index: 40
Barra rápida  z-index: 30
Preview       z-index: 10
```

---

# 6. Estructura final de una tarjeta

```txt
☑

┌──────────────────────┬────┐
│                      │ ↺  │
│                      │ ↻  │
│       PREVIEW        │ ⋮  │
│                      │    │
│                      │    │
└──────────────────────┴────┘

Página 18

LETTER

● Estado
```

---

# 7. Barra superior de documentos

La barra superior debe comportarse como navegador de documentos del proyecto.

Cada pestaña debe tener:

```txt
Nombre
Tipo
Cerrar
Estado
```

Ejemplo:

```txt
┌─────────────────────────────────────────┐
│ contrato.pdf     ✕                      │
│ sentencia.pdf    ✕                      │
│ oficio.pdf       ✕                      │
└─────────────────────────────────────────┘
```

Acciones:

* clic → ir al inicio del documento
* doble clic → renombrar
* menú contextual → más opciones
* cerrar → eliminar documento del proyecto

---

# 8. Regla importante

La barra superior de documentos NO es solamente informativa.

Debe funcionar como:

```txt
Navegador de documentos
Índice visual
Acceso rápido
Control de eliminación
Control de renombrado
Control de selección
```

Porque en proyectos con:

* 10 documentos
* 20 documentos
* 50 documentos

el usuario no puede depender únicamente del scroll para encontrarlos.

Lo más importante de tu observación es esto:

**La pestaña del documento debe servir para navegar al inicio del documento y administrarlo (renombrar, eliminar, descargar), no solo para mostrar el nombre.** Y la barra rápida sí debe abandonar la parte superior de la hoja y pasar al lateral derecho del preview.
