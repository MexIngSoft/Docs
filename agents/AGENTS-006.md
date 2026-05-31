Claro. Aquí va la **Fase 7: acciones rápidas futuras**, lista para Codex.

# FASE 7 — Acciones rápidas futuras por página

## Objetivo general

Preparar el sistema de acciones rápidas para nuevas herramientas que se podrán agregar después sin romper la estructura actual.

Esta fase no debe sobrecargar la miniatura de página ni mostrar demasiados botones al mismo tiempo.

Las acciones futuras deben vivir principalmente dentro del menú de tres puntos o dentro de paneles especializados.

---

# 1. Acciones futuras contempladas

Las acciones rápidas futuras son:

```text
- Firmar página
- Agregar marca de agua
- Numerar página
- Traducir página
- Dividir desde esta página
- Insertar documento
- Convertir página en imagen
- Extraer imágenes
```

---

# 2. Regla principal

No agregar todas estas acciones como botones visibles sobre la miniatura.

La miniatura debe mantenerse limpia.

Acciones visibles recomendadas:

```text
- Girar izquierda
- Girar derecha
- Más opciones
```

Todas las acciones futuras deben ir dentro de:

```text
Menú de tres puntos
```

o dentro de:

```text
Panel avanzado de herramienta
```

---

# 3. Categorías de acciones futuras

## Firma y seguridad

```text
- Firmar página
- Validar firma
- Proteger página
```

## Edición visual

```text
- Marca de agua
- Numerar página
- Convertir página en imagen
```

## Conversión y extracción

```text
- Extraer imágenes
- Exportar página
- Dividir desde esta página
```

## Idioma e inteligencia

```text
- Traducir página
- Resumir página
- Detectar texto importante
```

## Inserción

```text
- Insertar documento antes
- Insertar documento después
- Insertar página en blanco
```

---

# 4. Estructura técnica recomendada

Todas las acciones deben declararse en una sola configuración.

```ts
type PageActionKey =
  | "cut"
  | "copy"
  | "duplicate"
  | "replace"
  | "insert-after"
  | "metadata"
  | "download"
  | "ocr"
  | "note"
  | "tag"
  | "important"
  | "delete"
  | "sign-page"
  | "watermark-page"
  | "number-page"
  | "translate-page"
  | "split-from-page"
  | "insert-document"
  | "convert-page-image"
  | "extract-images";
```

---

# 5. Configuración de acción

```ts
type PageActionConfig = {
  key: PageActionKey;
  label: string;
  description?: string;
  icon: React.ReactNode;
  group:
    | "edit"
    | "info"
    | "ocr"
    | "organize"
    | "security"
    | "visual"
    | "conversion"
    | "language"
    | "insert"
    | "danger";
  enabled: boolean;
  requiresBackend?: boolean;
  requiresSelection?: boolean;
  requiresConfirmation?: boolean;
  danger?: boolean;
  handler: (params: PageActionParams) => void | Promise<void>;
};
```

---

# 6. Parámetros estándar

Todas las acciones deben recibir la misma estructura base.

```ts
type PageActionParams = {
  documentId: string;
  pageId: string;
  pageNumber: number;
  sourceFileName?: string;
};
```

No usar solamente:

```ts
pageNumber
```

porque en documentos múltiples puede repetirse.

---

# 7. Acciones de firma

## Firmar página

Acción:

```text
Agregar firma visual o digital sobre una página.
```

Debe abrir un panel especializado:

```text
PanelFirmaPagina
```

No debe ejecutarse inmediatamente.

Estado:

```ts
modifiedReason: "signed"
```

---

# 8. Marca de agua

Acción:

```text
Agregar texto o imagen como marca de agua.
```

Debe permitir configurar:

```text
- Texto
- Opacidad
- Posición
- Tamaño
- Rotación
- Aplicar solo a esta página
- Aplicar a todas las páginas
```

Estado:

```ts
modifiedReason: "watermark"
```

---

# 9. Numerar página

Acción:

```text
Agregar número visible a la página.
```

Debe permitir:

```text
- Posición
- Formato
- Tamaño
- Aplicar desde esta página
- Aplicar a todo el documento
```

Estado:

```ts
modifiedReason: "numbered"
```

---

# 10. Traducir página

Acción:

```text
Traducir el texto OCR de la página.
```

Requiere:

```text
- OCR previo
```

Si no existe OCR:

```text
Mostrar mensaje: primero ejecuta OCR en esta página.
```

Estado:

```ts
modifiedReason: "translated"
```

---

# 11. Dividir desde esta página

Acción:

```text
Crear una separación del documento desde la página seleccionada.
```

Ejemplo:

```text
Página 1
Página 2
[ División desde aquí ]
Página 3
Página 4
```

Resultado:

```text
Documento A: páginas 1-2
Documento B: páginas 3-4
```

Estado:

```ts
modifiedReason: "split"
```

---

# 12. Insertar documento

Acción:

```text
Insertar otro archivo dentro del documento actual.
```

Debe permitir:

```text
- Insertar antes de esta página
- Insertar después de esta página
- Insertar al final
```

Debe abrir selector de archivo.

Estado:

```ts
modifiedReason: "inserted-document"
```

---

# 13. Convertir página en imagen

Acción:

```text
Exportar o convertir una página a imagen.
```

Formatos futuros:

```text
PNG
JPG
WEBP
```

Debe abrir opciones de calidad o descarga.

---

# 14. Extraer imágenes

Acción:

```text
Detectar y extraer imágenes internas de la página.
```

Resultado esperado:

```text
Lista de imágenes detectadas
Previsualización
Descarga individual
Descarga ZIP
```

---

# 15. Reglas de visibilidad

No todas las acciones aplican a todos los documentos.

## PDF

```text
Firmar página
Marca de agua
Numerar
Dividir desde aquí
Convertir página en imagen
Extraer imágenes
OCR
```

## Imagen

```text
OCR
Traducir
Convertir a PDF
Mejorar contraste
Recortar
```

## Word

```text
Convertir a PDF
Traducir
Extraer texto
```

---

# 16. Estados visuales nuevos

Ampliar `modifiedReason`:

```ts
type PageModifiedReason =
  | "rotated"
  | "duplicated"
  | "cut"
  | "copied"
  | "pasted"
  | "moved"
  | "deleted"
  | "ocr"
  | "signed"
  | "watermark"
  | "numbered"
  | "translated"
  | "split"
  | "inserted-document";
```

---

# 17. Etiquetas visibles

```ts
function getModifiedLabel(reason?: PageModifiedReason) {
  switch (reason) {
    case "signed":
      return "Firmada";
    case "watermark":
      return "Marca de agua";
    case "numbered":
      return "Numerada";
    case "translated":
      return "Traducida";
    case "split":
      return "Dividida";
    case "inserted-document":
      return "Documento insertado";
    default:
      return "Modificada";
  }
}
```

---

# 18. Criterios de aceptación

La fase 7 queda lista cuando:

```text
1. Existe una configuración centralizada para acciones futuras.
2. Las acciones futuras no saturan la miniatura.
3. Las acciones se agrupan por categoría.
4. Cada acción usa documentId + pageId.
5. Las acciones pueden habilitarse o deshabilitarse según tipo de archivo.
6. Se amplió modifiedReason para futuros cambios.
7. El menú de tres puntos puede mostrar acciones futuras sin romperse.
8. Las acciones que requieren configuración abren panel, no se ejecutan directo.
```

---

# 19. Instrucción final para Codex

Implementar la Fase 7 como preparación para futuras acciones rápidas por página. Crear una configuración centralizada de acciones usando `PageActionConfig`, agregando acciones futuras como firmar página, marca de agua, numerar página, traducir página, dividir desde esta página, insertar documento, convertir página en imagen y extraer imágenes. No mostrar estas acciones como botones permanentes en la miniatura; deben vivir dentro del menú de tres puntos o abrir paneles especializados. Cada acción debe recibir `documentId`, `pageId` y `pageNumber`, y debe poder habilitarse o deshabilitarse según el tipo de archivo. Ampliar `modifiedReason` para soportar estados futuros como signed, watermark, numbered, translated, split e inserted-document.
