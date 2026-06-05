Sí, así queda mucho más coherente con la forma en que quieres que funcione DocuCore.

## Estructura correcta

```text
┌──────────────┬──────────────────────────────┬──────────────┐
│ Herramientas │                              │ Configuración│
│ Documento    │          Workspace           │ Herramienta  │
│              │                              │ Activa       │
└──────────────┴──────────────────────────────┴──────────────┘
```

---

# Panel izquierdo = Herramientas del documento

Depende completamente del documento cargado.

### Si es PDF

```text
📄 Información

✂️ Dividir

🔗 Fusionar

🗜️ Comprimir

📑 Reordenar

↻ Rotar

🗑️ Eliminar páginas

📋 Extraer páginas

🔒 Proteger

🔓 Desbloquear

📥 Descargar
```

---

### Si es Word

```text
📄 Información

📑 Reordenar

✂️ Extraer páginas

🔄 Convertir a PDF

📥 Descargar
```

---

### Si es Imagen

```text
🖼️ Información

✂️ Recortar

🔄 Rotar

📄 Convertir a PDF

📥 Descargar
```

---

### Si es ZIP

```text
📦 Contenido

📂 Extraer

➕ Agregar archivos

➖ Eliminar archivos

📥 Descargar
```

---

# Centro = Workspace

Siempre debe ser el elemento principal.

```text
Workspace >= 70% del ancho
```

Idealmente:

```text
Workspace >= 80%
```

---

# Panel derecho = Configuración de la herramienta seleccionada

Por ejemplo:

### Usuario selecciona

```text
✂️ Dividir PDF
```

Entonces el panel derecho muestra:

```text
Dividir PDF

○ Seleccionar páginas

○ Dividir visualmente

○ Cada N páginas

[ Aplicar ]
```

---

### Usuario selecciona

```text
🗜️ Comprimir PDF
```

Panel derecho:

```text
Comprimir PDF

○ Baja

● Media

○ Alta

○ Máxima

[ Comprimir ]
```

---

### Usuario selecciona

```text
↻ Rotar PDF
```

Panel derecho:

```text
Rotar páginas

○ 90°

○ 180°

○ 270°

○ Todas

○ Seleccionadas

[ Aplicar ]
```

---

# Regla importante para DocuCore

El panel derecho debe estar vacío hasta que se seleccione una herramienta.

Por ejemplo:

```text
┌────────────┬──────────────────────────────┬────────────┐
│Herramientas│                              │            │
│Documento   │          Workspace           │ Selecciona│
│            │                              │ una acción │
└────────────┴──────────────────────────────┴────────────┘
```

No debe aparecer ninguna configuración genérica.

---

# Otro detalle que creo que te falta

Las herramientas del panel izquierdo deben cambiar según:

### Tipo de documento

```text
PDF
Word
Excel
Imagen
ZIP
RAR
```

### Cantidad de documentos cargados

Por ejemplo:

#### 1 PDF

```text
✂️ Dividir
🗜️ Comprimir
↻ Rotar
```

#### 2 PDFs

```text
✂️ Dividir
🔗 Fusionar
🗜️ Comprimir
↻ Rotar
```

#### 1 PDF + 1 Word

```text
No mostrar Fusionar PDF
```

porque no aplica.

Esto hará que el panel izquierdo muestre únicamente herramientas válidas para los documentos que el usuario tiene cargados en ese momento.

De esta forma el usuario entiende inmediatamente:

* **Izquierda:** ¿Qué puedo hacer con este documento?
* **Centro:** Trabajo sobre el documento.
* **Derecha:** ¿Cómo configuro la herramienta que elegí?

Y la navegación se vuelve mucho más natural.
