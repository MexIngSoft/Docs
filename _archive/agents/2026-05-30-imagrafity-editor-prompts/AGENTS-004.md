Correcto. De hecho, eso debe quedar como una **regla obligatoria del flujo de personalización**.

### Regla obligatoria: Todo prompt debe poder visualizarse en el producto

Cuando el usuario termine de editar un prompt, **no debe enviarse directamente a producción ni guardarse sin verlo**.

El flujo debe ser:

```text
Seleccionar producto
        ↓
Editar Prompt
        ↓
Guardar cambios
        ↓
Visualizar resultado
        ↓
Aplicar al producto
        ↓
Agregar al carrito
```

---

# Pantalla del editor

## Columna izquierda

Prompt editable

```text
┌───────────────────────────┐
│ Prompt Diseño Base        │
├───────────────────────────┤
│                           │
│ Texto editable...         │
│                           │
└───────────────────────────┘

[ Guardar ]
[ Visualizar ]
```

---

## Columna central

Vista previa generada

```text
┌───────────────────────┐
│                       │
│      PREVIEW IA       │
│                       │
└───────────────────────┘
```

---

## Columna derecha

Producto seleccionado

Ejemplo:

```text
Producto:
☕ Taza Blanca Premium

Vista Frontal
Vista Trasera
Vista 3D

[ Aplicar Diseño ]
```

---

# Comportamiento obligatorio

### Taza

Si el usuario modifica el prompt:

```text
Crear una taza negra
con dragón azul neón
estilo cyberpunk
```

al presionar:

```text
Visualizar
```

debe verse directamente sobre la taza.

No en una imagen aparte.

Debe verse:

```text
☕
[ Diseño aplicado ]
```

sobre el mockup real.

---

### Playera

Si el usuario modifica:

```text
Playera blanca
con logo estilo graffiti
y colores neón
```

Visualizar:

```text
👕
[ Diseño aplicado ]
```

sobre la playera.

---

### Llavero

Visualizar:

```text
🔑
[ Diseño aplicado ]
```

sobre el llavero.

---

# Regla para los 3 prompts

Cada prompt tiene su propio botón:

```text
Prompt Base
[ Visualizar ]

Prompt Variación
[ Visualizar ]

Prompt Producción
[ Visualizar ]
```

y cada uno genera una vista previa independiente.

---

# Historial de visualizaciones

El sistema debe conservar:

```text
Versión 1
Versión 2
Versión 3
Versión 4
```

para comparar resultados.

Similar a:

```text
Comparar diseños
□ Diseño A
□ Diseño B
□ Diseño C
```

---

# Aplicación final

Cuando el usuario pulse:

```text
Aplicar al producto
```

el diseño seleccionado pasa a:

```text
Producto personalizado
```

y se guarda:

* Prompt utilizado
* Imagen generada
* Configuración
* Colores
* Posición
* Escala
* Fecha

para que producción pueda fabricarlo después.

---

También dejaría documentado algo adicional para Imagrafity:

**Ningún prompt puede existir sin una vista previa asociada.**

Si existe un prompt:

```text
Prompt → Resultado → Vista previa → Producto
```

Si no puede visualizarse sobre el producto, entonces el flujo está incompleto y no debe considerarse terminado. Esto es especialmente importante para tazas, playeras, termos, llaveros, cuadros y cualquier producto personalizable del catálogo de Imagrafity.