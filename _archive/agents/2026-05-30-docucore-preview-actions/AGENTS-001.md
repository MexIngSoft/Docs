Sí, aquí conviene dejar una instrucción muy clara para evitar duplicar barras y componentes.

## Corrección de barra de herramientas y panel de acciones

Se detectó que se creó incorrectamente una barra adicional tipo:

```html
<aside class="tool-dock" aria-label="Herramientas rapidas">
```

Esta barra **no debe existir como elemento independiente**, porque duplica las herramientas que ya pertenecen al sistema principal de acciones.

### Regla principal

No se debe crear una segunda barra flotante, lateral o independiente con herramientas como:

* Dividir PDF
* Unir PDF
* Comprimir PDF
* PDF a Word
* OCR
* Extraer imágenes
* Firmar PDF
* Generar índice

Estas acciones deben existir en **un solo lugar centralizado**.

---

## Comportamiento correcto

La barra de herramientas principal debe tener un botón llamado, por ejemplo:

```text
Herramientas
```

Al dar clic en ese botón, debe abrirse un **panel de acciones** o **menú desplegable**, no una nueva barra duplicada.

El flujo correcto es:

```text
Usuario da clic en "Herramientas"
        ↓
Se abre el panel de acciones disponibles
        ↓
El usuario selecciona una acción
        ↓
Se configura la acción en el panel correspondiente
        ↓
Se aplica sobre el documento seleccionado
```

---

## Documentación obligatoria de componentes

Antes de modificar o crear componentes, se debe documentar cada elemento de la interfaz para evitar duplicados.

Cada elemento debe indicar:

```text
Nombre del componente:
Ubicación:
Función:
Qué lo activa:
Qué muestra:
Sobre qué documento actúa:
Si reemplaza o depende de otro componente:
```

Ejemplo:

```text
Nombre del componente:
ToolbarPrincipal

Ubicación:
Área superior o principal del workspace.

Función:
Contiene los accesos generales del sistema.

Qué lo activa:
Siempre visible cuando existe un documento cargado.

Qué muestra:
Botón de herramientas, botón de guardar, botón de descargar, botón de configuración.

Sobre qué documento actúa:
Documento actualmente seleccionado.

Si reemplaza o depende de otro componente:
No reemplaza componentes. Activa el PanelAccionesDocumento.
```

---

## Panel correcto de herramientas

El componente correcto debe ser algo como:

```text
PanelAccionesDocumento
```

No debe llamarse ni comportarse como:

```text
tool-dock
barra flotante
barra lateral duplicada
dock independiente
```

Este panel debe aparecer únicamente cuando el usuario dé clic en el botón de herramientas.

---

## Regla contra duplicación

Antes de crear cualquier botón, barra, panel o menú, validar si ya existe una acción equivalente.

Si ya existe:

```text
No crear otro botón.
No crear otra barra.
No crear otro panel.
Conectar la acción al componente existente.
```

---

## Acciones centralizadas

Todas las herramientas deben provenir de una sola fuente de configuración, por ejemplo:

```ts
documentActions = [
  "split_pdf",
  "merge_pdf",
  "compress_pdf",
  "pdf_to_word",
  "ocr",
  "extract_images",
  "sign_pdf",
  "generate_index"
]
```

Esto evita que las mismas acciones aparezcan duplicadas en distintos componentes.

---

## Estado único del documento

Las acciones deben aplicarse únicamente sobre el documento activo o seleccionado.

Debe existir un estado central como:

```ts
activeDocumentId
selectedAction
isActionsPanelOpen
```

No debe existir lógica separada por cada barra.

---

## Qué debe eliminarse

Eliminar el componente:

```html
<aside class="tool-dock" aria-label="Herramientas rapidas">
```

Eliminar también:

```text
tool-dock
tool-dock-pin
tool-dock-item
```

si solo fueron creados para esa barra duplicada.

---

## Qué debe conservarse

Conservar únicamente las acciones, pero moverlas o conectarlas al panel correcto:

```text
PanelAccionesDocumento
```

Las acciones no se pierden; solo se elimina la barra duplicada.

---

## Resultado esperado

La interfaz debe quedar así:

```text
Workspace del documento
 ├── Barra principal
 │    └── Botón "Herramientas"
 │
 ├── Panel de acciones
 │    ├── Dividir PDF
 │    ├── Unir PDF
 │    ├── Comprimir PDF
 │    ├── PDF a Word
 │    ├── OCR
 │    ├── Extraer imágenes
 │    ├── Firmar PDF
 │    └── Generar índice
 │
 └── Vista previa del documento
```

No debe existir una segunda barra lateral con las mismas acciones.

---

## Instrucción final para desarrollo

Refactorizar la interfaz para que las herramientas del documento estén centralizadas en un solo componente. Eliminar la barra `tool-dock`, evitar duplicación de botones y documentar cada componente indicando su ubicación, función, activador, contenido y relación con el documento activo. Todas las acciones deben ejecutarse desde una única fuente de configuración y actuar solamente sobre el documento seleccionado.

Esta versión ya deja claro qué se elimina, qué se conserva y cómo debe funcionar sin duplicar elementos.
9