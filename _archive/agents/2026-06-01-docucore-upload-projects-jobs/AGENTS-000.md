Sí, tienes razón: en **Upload** no debe mostrarse como una lista plana de documentos. Debe mostrarse como **trabajos/proyectos documentales**, y dentro de cada proyecto deben vivir los documentos, sus modificaciones y el estado del avance.

Te dejo la instrucción mejorada para Codex:

# Reestructurar Upload: proyectos documentales, jobs y documentos

## Problema actual

En la pantalla `/upload`, la sección “Continuar trabajo anterior” muestra documentos sueltos repetidos.

Eso es incorrecto porque el usuario no trabaja únicamente con documentos aislados. El usuario trabaja sobre un conjunto de archivos, acciones y modificaciones que deben conservarse como un trabajo o proyecto documental.

## Regla principal

La pantalla `/upload` debe mostrar trabajos agrupados como:

```text
Proyecto / Job documental
  ├── Documento 1
  ├── Documento 2
  ├── Documento 3
  └── Estado del trabajo
```

No debe mostrar una lista plana de documentos como si cada archivo fuera un trabajo independiente.

## Relación entre Upload y Jobs

La pestaña `/upload` debe servir para:

```text
- subir nuevos documentos;
- crear un nuevo proyecto/job;
- continuar proyectos recientes;
- ver borradores documentales;
- recuperar trabajos no terminados.
```

La pestaña `/jobs` debe servir para:

```text
- ver todos los jobs;
- filtrar por estado;
- revisar historial;
- ver procesos ejecutados;
- descargar resultados;
- administrar trabajos terminados o en proceso.
```

Por lo tanto:

```text
/upload = entrada rápida y continuación reciente
/jobs = administración completa de trabajos
```

## Modelo esperado

Crear o documentar una estructura lógica similar:

```ts
type DocumentProject = {
  id: string;
  name: string;
  status: "draft" | "in_progress" | "processing" | "completed" | "failed" | "archived";
  createdAt: string;
  updatedAt: string;
  lastOpenedAt?: string;
  documents: ProjectDocument[];
  selectedAction?: string;
  currentStep?: "upload" | "analysis" | "action" | "workspace" | "result";
};

type ProjectDocument = {
  id: string;
  projectId: string;
  name: string;
  originalName: string;
  uploadedAt: string;
  updatedAt: string;
  pageCount?: number;
  sizeMb?: number;
  status: "ready" | "modified" | "processing" | "error";
  modifications?: {
    rotatedPages?: number[];
    deletedPages?: number[];
    reordered?: boolean;
    splitRanges?: string[];
    renamed?: boolean;
  };
};
```

## Pantalla Upload

En la sección “Continuar trabajo anterior”, mostrar tarjetas de proyecto, no documentos sueltos.

Cada tarjeta debe mostrar:

```text
- nombre del proyecto/job;
- fecha de creación;
- última modificación;
- cantidad de documentos;
- cantidad total de páginas;
- acción pendiente o seleccionada;
- estado actual;
- resumen de documentos;
- botón Continuar;
- botón Renombrar proyecto;
- botón Eliminar proyecto;
- botón Duplicar proyecto.
```

Ejemplo visual:

```text
Proyecto: Sentencia condenatoria 332024
Última modificación: 01/jun, 08:41 p.m.
Documentos: 2 archivos · 56 páginas
Estado: Borrador / En edición

Documentos:
- SENTENCIA CONDENATORIA 332024.pdf · 28 páginas · modificado
- ANEXOS SENTENCIA.pdf · 28 páginas · sin cambios

[Continuar] [Renombrar] [Duplicar] [Eliminar]
```

## Acciones por proyecto

Cada proyecto debe permitir:

```text
- abrir / continuar trabajo;
- renombrar proyecto;
- duplicar proyecto;
- eliminar proyecto;
- archivar proyecto;
- ver detalles;
- ver documentos incluidos;
- ver última acción realizada;
- ver estado de procesamiento;
- continuar desde el paso donde se quedó.
```

## Acciones por documento dentro del proyecto

Cada documento debe permitir:

```text
- abrir documento;
- renombrar documento;
- eliminar documento del proyecto;
- duplicar documento;
- reemplazar documento;
- ver páginas;
- ver modificaciones;
- restaurar original;
```

Importante:

```text
Eliminar un documento no debe eliminar el proyecto completo.
Eliminar el proyecto sí elimina o archiva todos los documentos relacionados.
```

## Persistencia de modificaciones

Si el usuario sube dos documentos y modifica solo uno, el sistema debe guardar:

```text
- qué documento fue modificado;
- qué páginas fueron giradas;
- qué páginas fueron eliminadas;
- qué orden fue cambiado;
- qué documento fue renombrado;
- qué acción estaba seleccionada;
- en qué paso se quedó;
- fecha/hora de la última modificación.
```

Al volver al proyecto, debe restaurarse el estado exacto.

## Estados del proyecto

Usar estados claros:

```text
draft:
subido pero sin acción ejecutada

in_progress:
usuario ya seleccionó acción o entró al workspace

processing:
el servidor o cliente está procesando

completed:
resultado generado

failed:
falló la tarea

archived:
oculto del listado principal pero recuperable
```

## Estados del documento

```text
ready:
documento cargado correctamente

modified:
documento tiene cambios pendientes o guardados

processing:
documento en procesamiento

error:
documento con error

removed:
documento eliminado del proyecto
```

## Naming recomendado

Cuando el usuario sube documentos sin crear nombre de proyecto:

```text
Proyecto sin título
Proyecto documental 01
Trabajo de PDF 01
```

O mejor:

```text
Nombre basado en el primer documento:
SENTENCIA CONDENATORIA 332024
```

Si sube varios documentos:

```text
SENTENCIA CONDENATORIA 332024 y 1 archivo más
```

El usuario debe poder renombrarlo.

## Diferencia entre proyecto y job

Documentar esta diferencia:

```text
Proyecto documental:
Agrupación editable de documentos y modificaciones.

Job:
Ejecución concreta de una acción sobre un proyecto.
```

Ejemplo:

```text
Proyecto:
Sentencia condenatoria 332024

Jobs:
- Dividir PDF
- Comprimir PDF
- Convertir a Word
- OCR
```

Un proyecto puede tener varios jobs.

## Upload vs Jobs

En `/upload` mostrar:

```text
- proyectos recientes;
- borradores;
- trabajos no terminados;
- opción de continuar;
- opción de crear nuevo proyecto.
```

En `/jobs` mostrar:

```text
- ejecuciones realizadas;
- procesos en cola;
- trabajos completados;
- fallos;
- resultados descargables;
- historial de jobs por proyecto.
```

## Datos mínimos que debe guardar cada proyecto

```json
{
  "project_id": "uuid",
  "project_name": "Sentencia condenatoria 332024",
  "status": "draft",
  "created_at": "2026-06-01T20:41:00",
  "updated_at": "2026-06-01T20:55:00",
  "last_opened_at": "2026-06-01T20:55:00",
  "current_step": "workspace",
  "selected_action": "split_pdf",
  "documents_count": 2,
  "pages_count": 56,
  "documents": []
}
```

## Datos mínimos por documento

```json
{
  "document_id": "uuid",
  "project_id": "uuid",
  "name": "SENTENCIA CONDENATORIA 332024.pdf",
  "original_name": "SENTENCIA CONDENATORIA 332024.pdf",
  "uploaded_at": "2026-06-01T20:41:00",
  "updated_at": "2026-06-01T20:55:00",
  "page_count": 28,
  "size_mb": 4.8,
  "status": "modified",
  "modifications_summary": {
    "rotated_pages": [2, 4],
    "deleted_pages": [],
    "reordered": true
  }
}
```

## Preguntas adicionales que Codex debe resolver

Antes de implementar, Codex debe revisar y documentar:

```text
1. ¿Actualmente existe entidad Project, Job o solo Document?
2. ¿Dónde se guarda el estado de modificaciones?
3. ¿Upload consume datos reales o mock data?
4. ¿Jobs ya tiene relación con documentos?
5. ¿Un proyecto puede tener varios documentos?
6. ¿Un proyecto puede generar varios jobs?
7. ¿Un documento puede pertenecer a varios proyectos?
8. ¿Eliminar proyecto será hard delete o archive?
9. ¿Eliminar documento debe conservar historial?
10. ¿Duplicar proyecto duplica documentos físicos o solo referencias?
11. ¿El workspace debe abrir por project_id o document_id?
12. ¿La URL correcta debe ser `/workspace/:projectId`?
13. ¿La pantalla `/jobs` debe filtrar por project_id?
14. ¿Qué se muestra si un proyecto tiene documentos eliminados?
15. ¿Qué pasa si un documento falla pero los demás están listos?
```

## Cambios sugeridos en rutas

```text
/upload
Crear o continuar proyectos recientes

/workspace/:projectId
Editar documentos del proyecto

/jobs
Ver historial general de procesos

/jobs/:jobId
Ver detalle de una ejecución

/projects/:projectId
Opcional: detalle administrativo del proyecto
```

## Criterio visual de `/upload`

La sección “Continuar trabajo anterior” debe verse así:

```text
[Borrador documental]

Proyecto: Nombre del proyecto
Estado: Borrador
Última modificación: fecha/hora
Documentos: 2
Páginas: 56
Acción pendiente: Dividir PDF

Documentos incluidos:
- Documento A · 28 páginas · modificado
- Documento B · 28 páginas · listo

[Continuar] [Renombrar] [Duplicar] [Eliminar]
```

## Criterios de aceptación

La tarea se considera correcta cuando:

```text
[ ] `/upload` ya no muestra documentos sueltos repetidos.
[ ] Muestra proyectos/jobs documentales agrupados.
[ ] Cada proyecto muestra sus documentos internos.
[ ] Se puede continuar un proyecto.
[ ] Se puede renombrar proyecto.
[ ] Se puede eliminar o archivar proyecto.
[ ] Se puede renombrar documento dentro del proyecto.
[ ] Se puede eliminar documento sin eliminar proyecto.
[ ] Las modificaciones por documento se conservan.
[ ] El workspace abre el proyecto completo, no solo un PDF aislado.
[ ] `/jobs` queda reservado para ejecuciones/historial/resultados.
```
