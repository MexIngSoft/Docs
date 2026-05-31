Sí. La solución es crear una **vista previa progresiva**: primero se reserva el espacio de todas las páginas y después se renderizan una por una.

## Proceso para previsualizar documentos en el área de trabajo

### Objetivo

Cuando el usuario suba un documento, el área de trabajo debe mostrar inmediatamente la estructura del documento, aunque las páginas todavía no estén renderizadas.

No se debe esperar a que todo el documento termine de procesarse para mostrar algo en pantalla.

---

## Flujo correcto

```text
Usuario sube documento
        ↓
Se detecta tipo de archivo
        ↓
Se calcula número de páginas
        ↓
Se crean páginas en blanco como placeholders
        ↓
Se muestra el documento en el área de trabajo
        ↓
Se renderiza página por página
        ↓
Cada página en blanco se reemplaza por su vista real
```

---

## Estado inicial del documento

Al cargar el archivo, el sistema debe crear un estado como:

```ts
documentPreview = {
  documentId: "...",
  fileName: "archivo.pdf",
  fileType: "pdf",
  totalPages: 20,
  status: "loading",
  pages: [
    { page: 1, status: "pending", previewUrl: null },
    { page: 2, status: "pending", previewUrl: null },
    { page: 3, status: "pending", previewUrl: null }
  ]
}
```

---

## Vista en el área de trabajo

Primero se deben mostrar páginas en blanco:

```text
┌────────────────────┐
│ Página 1 cargando  │
└────────────────────┘

┌────────────────────┐
│ Página 2 cargando  │
└────────────────────┘

┌────────────────────┐
│ Página 3 cargando  │
└────────────────────┘
```

Después se reemplazan una por una:

```text
Página 1 → renderizada
Página 2 → renderizada
Página 3 → renderizada
```

---

## Proceso recomendado para PDF

### Paso 1: subir archivo

El frontend sube el archivo al backend.

```text
POST /api/documents/upload
```

Respuesta mínima:

```json
{
  "documentId": "doc_123",
  "fileName": "contrato.pdf",
  "fileType": "pdf",
  "status": "uploaded"
}
```

---

### Paso 2: obtener metadata

El backend debe extraer información básica:

```text
GET /api/documents/doc_123/metadata
```

Respuesta:

```json
{
  "documentId": "doc_123",
  "totalPages": 20,
  "fileType": "pdf"
}
```

Con esto el frontend ya puede pintar 20 páginas en blanco.

---

### Paso 3: renderizar páginas

El backend o frontend debe generar las vistas página por página.

```text
GET /api/documents/doc_123/pages/1/preview
GET /api/documents/doc_123/pages/2/preview
GET /api/documents/doc_123/pages/3/preview
```

Cada página puede regresar:

```json
{
  "page": 1,
  "status": "ready",
  "previewUrl": "/media/previews/doc_123/page_1.webp"
}
```

---

## Estados de cada página

Cada página debe tener estado independiente:

```ts
type PageStatus = "pending" | "loading" | "ready" | "error";
```

Ejemplo:

```ts
pages: [
  { page: 1, status: "ready", previewUrl: "/page_1.webp" },
  { page: 2, status: "loading", previewUrl: null },
  { page: 3, status: "pending", previewUrl: null },
  { page: 4, status: "error", previewUrl: null }
]
```

---

## Renderizado progresivo

No renderizar todas las páginas al mismo tiempo.

Usar carga progresiva:

```text
1. Renderizar primero las páginas visibles.
2. Después renderizar las siguientes páginas cercanas.
3. Las páginas lejanas se mantienen en blanco.
```

Ejemplo:

```text
Usuario está viendo página 1
Renderizar páginas 1, 2 y 3

Usuario baja a página 8
Renderizar páginas 7, 8, 9 y 10
```

---

## Recomendación técnica

Para PDF:

* Usar PDF.js en frontend si solo se necesita visualizar.
* Usar backend si se quieren generar imágenes `.webp` o `.png` por página.
* Guardar previews generadas para no procesarlas otra vez.

Formato recomendado para previews:

```text
WEBP
```

Por ser más ligero que PNG o JPG.

---

## Componente recomendado

Crear un componente principal:

```text
DocumentWorkspacePreview
```

Este componente debe encargarse de:

```text
- Recibir el documentId.
- Pedir metadata.
- Crear páginas en blanco.
- Mostrar placeholders.
- Solicitar previews por página.
- Reemplazar página en blanco por imagen renderizada.
- Manejar errores por página.
```

---

## Componentes internos

```text
DocumentWorkspacePreview
 ├── DocumentPagePlaceholder
 ├── DocumentPageRenderer
 ├── DocumentPageError
 └── DocumentPreviewToolbar
```

---

## Regla importante

La previsualización no debe bloquear las herramientas.

Aunque las páginas sigan cargando, el usuario debe poder ver:

```text
- Nombre del archivo.
- Número de páginas.
- Tipo de documento.
- Herramientas disponibles.
- Estado general de carga.
```

---

## Resultado esperado

El usuario sube un PDF de 50 páginas.

En menos de unos segundos debe ver:

```text
50 páginas en blanco cargando
```

Después:

```text
Página 1 lista
Página 2 lista
Página 3 lista
...
```

Así el sistema se siente rápido aunque el procesamiento completo siga en progreso.

---

## Instrucción final para desarrollo

Implementar una previsualización progresiva en el área de trabajo. Al subir un documento, primero obtener metadata y número total de páginas. Con esa información, pintar inmediatamente todas las páginas como placeholders en blanco. Después renderizar las páginas de forma individual y reemplazar cada placeholder por su preview real conforme esté disponible. No bloquear la interfaz mientras se procesa el documento. Cada página debe tener estado independiente: pending, loading, ready o error.
