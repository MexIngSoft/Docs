Sí. La regla debe quedar como **instrucción ejecutable para Codex**, no solo como idea.

Ejecuta esta tarea sin usar agents.

Objetivo:

Convertir el Workspace actual de DocuCore en un Workspace universal y contextual, donde todas las herramientas activas puedan probarse desde Workspace, pero solo aparezcan y se ejecuten según el tipo de archivo compatible.

Antes de tocar código:

1. Lee obligatoriamente:

   * `Docs/03_standards/documentation-first-workflow.md`
   * `Docs/README.md`
   * `Docs/_meta/master-index.md`
   * `Docs/_meta/active-work-index.md`

2. Lee la documentación canónica relacionada con DocuCore:

   * `Docs/02_projects/docucore/README.md`
   * `Docs/02_projects/docucore/tools-catalog.md`
   * `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
   * `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
   * `Docs/02_projects/docucore/feature-visibility-map.md`
   * `Docs/02_projects/docucore/api-contracts.md`

Si no existe documentación específica, escribe:
`No encontrado en la documentacion actual.`

Luego usa patrones existentes del código y documenta la decisión.

---

## 1. Crear mapa central de compatibilidad

No pongas reglas sueltas con muchos `if`.

Crea o ajusta un archivo central, por ejemplo:

`src/config/workspace-tool-compatibility.ts`

Debe definir:

```ts
export type WorkspaceFileType =
  | "pdf"
  | "word"
  | "image"
  | "excel"
  | "csv"
  | "xml"
  | "zip"
  | "unknown";

export type WorkspaceToolStatus =
  | "enabled"
  | "disabled"
  | "blocked"
  | "future";

export interface WorkspaceToolRule {
  toolId: string;
  label: string;
  compatibleFileTypes: WorkspaceFileType[];
  status: WorkspaceToolStatus;
  requiresGateway: boolean;
  requiresExtraction?: boolean;
  reason?: string;
}
```

Crear reglas para herramientas activas:

```ts
export const WORKSPACE_TOOL_RULES: WorkspaceToolRule[] = [
  {
    toolId: "pdf-split",
    label: "Dividir PDF",
    compatibleFileTypes: ["pdf"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "pdf-merge",
    label: "Unir PDF",
    compatibleFileTypes: ["pdf"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "pdf-compress",
    label: "Comprimir PDF",
    compatibleFileTypes: ["pdf"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "pdf-word",
    label: "PDF a Word",
    compatibleFileTypes: ["pdf"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "word-pdf",
    label: "Word a PDF",
    compatibleFileTypes: ["word"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "image-pdf",
    label: "Imagen a PDF",
    compatibleFileTypes: ["image"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "image-clean",
    label: "Limpiar imagen",
    compatibleFileTypes: ["image"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "excel-csv",
    label: "Excel a CSV",
    compatibleFileTypes: ["excel"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "csv-excel",
    label: "CSV a Excel",
    compatibleFileTypes: ["csv"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "xml-read",
    label: "Leer XML",
    compatibleFileTypes: ["xml"],
    status: "enabled",
    requiresGateway: true,
  },
  {
    toolId: "zip-extract",
    label: "Extraer ZIP",
    compatibleFileTypes: ["zip"],
    status: "enabled",
    requiresGateway: true,
    requiresExtraction: true,
  },
];
```

---

## 2. Crear detector de tipo de archivo

Crea o ajusta:

`src/lib/workspace/detect-file-type.ts`

Debe detectar por MIME y extensión.

Ejemplo:

```ts
export function detectWorkspaceFileType(file: File): WorkspaceFileType {
  const name = file.name.toLowerCase();
  const mime = file.type;

  if (mime === "application/pdf" || name.endsWith(".pdf")) return "pdf";

  if (
    mime.includes("word") ||
    name.endsWith(".doc") ||
    name.endsWith(".docx")
  ) {
    return "word";
  }

  if (mime.startsWith("image/")) return "image";

  if (
    name.endsWith(".xls") ||
    name.endsWith(".xlsx") ||
    mime.includes("spreadsheet")
  ) {
    return "excel";
  }

  if (name.endsWith(".csv") || mime === "text/csv") return "csv";

  if (name.endsWith(".xml") || mime.includes("xml")) return "xml";

  if (name.endsWith(".zip") || mime === "application/zip") return "zip";

  return "unknown";
}
```

---

## 3. Crear selector de herramientas compatibles

Crea o ajusta:

`src/lib/workspace/get-compatible-tools.ts`

Debe recibir los archivos cargados y devolver herramientas permitidas.

Reglas:

1. Si hay solo PDF, mostrar herramientas PDF.
2. Si hay Word, mostrar Word a PDF.
3. Si hay imágenes, mostrar imagen a PDF y limpiar imagen.
4. Si hay Excel, mostrar Excel a CSV.
5. Si hay CSV, mostrar CSV a Excel.
6. Si hay XML, mostrar XML Read.
7. Si hay ZIP, mostrar solo extracción/análisis de ZIP.
8. Un ZIP no debe mezclarse como documento editable directo.
9. Si hay archivos de tipos incompatibles entre sí, mostrar mensaje claro y pedir selección de grupo compatible.
10. Las herramientas futuras deben seguir bloqueadas.

Ejemplo base:

```ts
export function getCompatibleWorkspaceTools(
  fileTypes: WorkspaceFileType[]
): WorkspaceToolRule[] {
  const uniqueTypes = Array.from(new Set(fileTypes));

  if (uniqueTypes.includes("zip")) {
    return WORKSPACE_TOOL_RULES.filter((tool) =>
      tool.compatibleFileTypes.includes("zip")
    );
  }

  return WORKSPACE_TOOL_RULES.filter((tool) =>
    tool.compatibleFileTypes.some((type) => uniqueTypes.includes(type))
  );
}
```

---

## 4. Reglas especiales para ZIP

Implementar ZIP como contenedor, no como documento editable.

Reglas obligatorias:

1. El ZIP se puede subir al Workspace.
2. El ZIP no se puede dividir, comprimir como PDF, convertir como Word ni limpiar como imagen.
3. Primero debe ejecutarse `zip-extract`.
4. Después de extraer, el sistema debe clasificar los archivos internos.
5. Si contiene documentos compatibles, esos documentos internos pueden pasar al Workspace.
6. Si no contiene archivos compatibles, mostrar:

`Este ZIP no contiene archivos compatibles para trabajar en Workspace.`

7. Documentar esta decisión.

---

## 5. Ajustar `/upload`

En `/upload`:

1. Permitir subir distintos tipos de archivo.
2. Detectar tipo de archivo antes de entrar a Workspace.
3. Enviar al mismo Workspace universal.
4. No crear rutas separadas por tipo de archivo.
5. No mandar herramientas no compatibles como si fueran ejecutables.

---

## 6. Ajustar `/workspace`

En `/workspace`:

1. Leer archivos cargados.
2. Detectar tipo de archivo.
3. Obtener herramientas compatibles desde el mapa central.
4. Mostrar solo herramientas compatibles.
5. Mostrar bloqueadas solo si ayudan a explicar por qué no están disponibles.
6. No mostrar OCR, IA, índice documental, firma, watermark ni traducción como activas.
7. El botón `Aplicar cambios` debe llamar al Gateway real.
8. Si una herramienta no tiene conexión real al Gateway, debe quedar deshabilitada con mensaje claro.
9. No usar mocks para simular éxito.

---

## 7. Integración con Gateway

Crear una función central para ejecutar herramientas:

`src/lib/workspace/execute-workspace-tool.ts`

Debe recibir:

```ts
interface ExecuteWorkspaceToolInput {
  toolId: string;
  files: File[];
  options?: Record<string, unknown>;
}
```

Debe validar:

1. Que la herramienta exista.
2. Que esté habilitada.
3. Que el tipo de archivo sea compatible.
4. Que no sea futura.
5. Que no esté bloqueada por `feature-gates.ts`.
6. Que tenga conexión real al Gateway.
7. Que devuelva error claro si no se puede ejecutar.

---

## 8. Mantener bloqueadas herramientas futuras

Revisar `feature-gates.ts`.

Deben seguir bloqueadas:

* `ocr-image`
* `ocr-batch`
* `ocr-regions`
* `searchable-pdf`
* `document-index`
* `indexed-pdf-export`
* `document-classification`
* `document-segmentation`
* `api-keys`
* `cloud-drive-import`
* workflows OCR
* extracción estructurada
* `extract-images`
* `sign-pdf`
* watermark
* traducción

No activarlas.

No crear accesos visuales como si ya estuvieran listas.

---

## 9. Documentación obligatoria

Actualizar o crear documentación en:

* `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
* `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
* `Docs/02_projects/docucore/feature-visibility-map.md`

Documentar:

1. Workspace universal.
2. Herramientas contextuales.
3. Reglas por tipo de archivo.
4. Regla especial de ZIP.
5. Herramientas activas.
6. Herramientas bloqueadas.
7. Herramientas futuras.
8. Validaciones realizadas.
9. Faltantes encontrados.

---

## 10. Validaciones obligatorias

Ejecutar:

```bash
npm run lint
npm run build
```

Si existen tests:

```bash
npm run test
```

Si no existen tests, documentar:

`No se encontro comando de pruebas disponible.`

---

## 11. Criterios de aceptación

La tarea queda completa solo si:

1. Workspace acepta varios tipos de archivo.
2. Las herramientas cambian según el archivo.
3. PDF muestra herramientas PDF.
4. Word muestra Word a PDF.
5. Imagen muestra imagen a PDF y limpiar imagen.
6. Excel muestra Excel a CSV.
7. CSV muestra CSV a Excel.
8. XML muestra leer XML.
9. ZIP solo muestra extracción o análisis de contenido.
10. Herramientas futuras siguen bloqueadas.
11. `Aplicar cambios` no simula éxito.
12. Gateway se usa para ejecución real.
13. La documentación queda actualizada.
14. `npm run lint` pasa.
15. `npm run build` pasa.

---

## 12. Reporte final obligatorio

Al terminar, reporta:

* archivos modificados;
* documentación revisada;
* documentación actualizada;
* herramientas activas en Workspace;
* herramientas bloqueadas;
* reglas agregadas;
* validaciones ejecutadas;
* errores encontrados;
* decisiones tomadas;
* pendientes para la siguiente fase.

La clave para que Codex no se pierda es esta: **primero crear el mapa central de compatibilidad, luego hacer que `/upload` y `/workspace` dependan de ese mapa, no de reglas sueltas.**
