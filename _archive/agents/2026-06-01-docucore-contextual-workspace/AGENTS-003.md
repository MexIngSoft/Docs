Sí, correcto. Entonces la regla no es “ZIP/RAR no se trabaja”, sino:

**ZIP/RAR sí se trabaja, pero como contenedor comprimido.**
Cuando se extrae o se abre un archivo interno compatible, el Workspace cambia a **modo documento**.

Te dejo la corrección para Codex:

Ajuste importante para Workspace universal:

Los archivos comprimidos ZIP y RAR sí deben poder trabajarse en Workspace, pero bajo un modo especial llamado `archive-mode`.

El Workspace debe tener dos modos principales:

1. `document-mode`
2. `archive-mode`

---

## 1. document-mode

Este modo aplica cuando el usuario trabaja directamente con documentos compatibles:

* PDF
* Word
* imágenes
* Excel
* CSV
* XML

En este modo se muestran herramientas según el tipo de documento:

* PDF:

  * `pdf-split`
  * `pdf-merge`
  * `pdf-compress`
  * `pdf-word`

* Word:

  * `word-pdf`

* Imagen:

  * `image-pdf`
  * `image-clean`

* Excel:

  * `excel-csv`

* CSV:

  * `csv-excel`

* XML:

  * `xml-read`

---

## 2. archive-mode

Este modo aplica cuando el usuario trabaja directamente con un archivo comprimido:

* ZIP
* RAR

En este modo el archivo comprimido no se trata como PDF, Word, imagen, Excel, CSV o XML.

Se trata como contenedor.

Herramientas permitidas en `archive-mode`:

* ver contenido del comprimido;
* listar carpetas y archivos internos;
* descargar un archivo interno;
* extraer todo;
* extraer archivos seleccionados;
* agregar archivos al comprimido;
* eliminar archivos del comprimido, si el procesador lo permite;
* reemplazar archivos internos, si el procesador lo permite;
* crear nuevo comprimido derivado.

Herramientas principales:

* `zip-extract`
* `archive-list`
* `archive-download-entry`
* `archive-add-entry`
* `archive-remove-entry`
* `archive-repack`

Si todavía no existen todas esas herramientas en backend, no simular éxito. Deben quedar como futuras o pendientes documentadas.

---

## 3. Regla de transición entre modos

Si el usuario sube un ZIP o RAR:

* Workspace inicia en `archive-mode`.
* Se muestra el contenido del comprimido.
* El usuario puede descargar elementos internos.
* El usuario puede extraer elementos internos.
* El usuario puede agregar archivos al comprimido, si la herramienta está disponible.
* El usuario puede seleccionar un archivo interno compatible.

Si el usuario abre o extrae un archivo interno compatible:

* PDF
* Word
* imagen
* Excel
* CSV
* XML

Entonces Workspace cambia a `document-mode` para ese archivo.

Ejemplo:

1. Usuario sube `documentos.zip`.
2. Workspace entra en `archive-mode`.
3. Muestra:

   * contrato.pdf
   * foto.png
   * datos.csv
4. Usuario selecciona `contrato.pdf`.
5. Workspace cambia a `document-mode`.
6. Ahora muestra herramientas PDF.

---

## 4. Regla de mezcla de archivos

Si el usuario está trabajando un comprimido en `archive-mode`, puede operar sobre el comprimido como contenedor.

Pero si el usuario agrega al Workspace un PDF, Word, imagen, Excel, CSV o XML externo para trabajarlo directamente, entonces ese archivo debe abrirse en `document-mode`.

No mezclar acciones de comprimido con acciones de documento en el mismo contexto activo.

Regla:

* contexto activo = comprimido → `archive-mode`
* contexto activo = documento → `document-mode`

El Workspace puede tener varios archivos en el proyecto, pero solo un contexto activo a la vez.

---

## 5. RAR

Agregar soporte conceptual para RAR:

```ts
export type WorkspaceFileType =
  | "pdf"
  | "word"
  | "image"
  | "excel"
  | "csv"
  | "xml"
  | "zip"
  | "rar"
  | "unknown";
```

Detectar RAR por extensión:

```ts
if (name.endsWith(".rar")) return "rar";
```

Si el backend todavía no soporta RAR, mostrarlo como:

```ts
status: "future"
```

o:

```ts
status: "disabled"
reason: "RAR todavía no tiene procesador real conectado al Gateway."
```

No simular ejecución.

---

## 6. Agregar tipo de modo Workspace

Crear o ajustar:

`src/lib/workspace/workspace-mode.ts`

```ts
export type WorkspaceMode = "document-mode" | "archive-mode";

export function resolveWorkspaceMode(fileType: WorkspaceFileType): WorkspaceMode {
  if (fileType === "zip" || fileType === "rar") {
    return "archive-mode";
  }

  return "document-mode";
}
```

---

## 7. Reglas de herramientas para comprimidos

Agregar reglas al mapa central:

```ts
{
  toolId: "zip-extract",
  label: "Extraer ZIP",
  compatibleFileTypes: ["zip"],
  status: "enabled",
  requiresGateway: true,
}

{
  toolId: "archive-list",
  label: "Ver contenido",
  compatibleFileTypes: ["zip", "rar"],
  status: "disabled",
  requiresGateway: true,
  reason: "Pendiente confirmar procesador real en Gateway.",
}

{
  toolId: "archive-download-entry",
  label: "Descargar archivo interno",
  compatibleFileTypes: ["zip", "rar"],
  status: "disabled",
  requiresGateway: true,
  reason: "Pendiente confirmar procesador real en Gateway.",
}

{
  toolId: "archive-add-entry",
  label: "Agregar archivo al comprimido",
  compatibleFileTypes: ["zip", "rar"],
  status: "disabled",
  requiresGateway: true,
  reason: "Pendiente confirmar procesador real en Gateway.",
}

{
  toolId: "archive-remove-entry",
  label: "Eliminar archivo interno",
  compatibleFileTypes: ["zip", "rar"],
  status: "disabled",
  requiresGateway: true,
  reason: "Pendiente confirmar procesador real en Gateway.",
}

{
  toolId: "archive-repack",
  label: "Crear comprimido actualizado",
  compatibleFileTypes: ["zip", "rar"],
  status: "disabled",
  requiresGateway: true,
  reason: "Pendiente confirmar procesador real en Gateway.",
}
```

Si Codex encuentra que alguna de estas herramientas ya existe en backend/Gateway, puede marcarla como `enabled`.
Si no existe, debe dejarla deshabilitada o futura y documentar el faltante.

---

## 8. Reglas visuales en Workspace

En `archive-mode`, mostrar:

* nombre del comprimido;
* tipo de comprimido;
* peso;
* lista de archivos internos;
* carpetas internas;
* botón descargar archivo;
* botón extraer seleccionado;
* botón extraer todo;
* botón agregar archivo;
* botón crear comprimido actualizado;
* aviso si RAR no está soportado todavía.

En `document-mode`, mostrar:

* vista previa del documento;
* herramientas compatibles;
* opciones de configuración;
* botón aplicar cambios;
* resultado descargable.

---

## 9. Reglas de seguridad funcional

No permitir:

* aplicar `pdf-split` directamente a un ZIP/RAR;
* aplicar `image-clean` directamente a un ZIP/RAR;
* aplicar `word-pdf` directamente a un ZIP/RAR;
* aplicar `excel-csv` directamente a un ZIP/RAR;
* aplicar `xml-read` directamente a un ZIP/RAR.

Primero debe abrirse o extraerse el archivo interno compatible.

---

## 10. Reporte esperado de Codex

Al finalizar, reportar:

* si existe soporte real ZIP en Gateway;
* si existe soporte real RAR en Gateway;
* qué acciones de comprimido quedaron habilitadas;
* qué acciones de comprimido quedaron deshabilitadas;
* cómo cambia Workspace entre `archive-mode` y `document-mode`;
* archivos modificados;
* documentación actualizada;
* validaciones ejecutadas;
* pendientes técnicos.

La idea queda más completa así: **ZIP/RAR sí son trabajables**, pero no como documentos; se trabajan como **contenedores**. Cuando eliges un archivo interno, ahí sí entras al modo documento.
