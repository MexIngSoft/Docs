Confirmo lectura del repositorio `MexIngSoft/Docs` en rama `general`.

La documentación ya tiene una estructura canónica: `00_audit`, `01_core_erp`, `02_projects`, `03_standards`, `04_integrations`, `_meta`, `agents`, `templates` y `pendientes` . También ya existe una regla de lectura mínima para Codex: no leer todo `Docs` sin justificar auditoría documental .

## Problema detectado

Hay demasiados puntos de entrada:

* `README.md`
* `_meta/active-work-index.md`
* `_meta/master-index.md`
* `00_audit/codex-context-map.md`
* `03_standards/operations/context-packs.md`
* `agents/AGENT_GLOBAL_RULES.md`

Eso hace que Codex pierda tiempo y pueda leer documentos en orden distinto. Además, hay una contradicción: `codex-context-map.md` pide leer `README.md`, `.codex-context.yml`, `context-packs`, `document-ownership-map`, `active-work-index` y `master-index` , pero `codex-minimal-reading-standard.md` pide solo `README.md`, `active-work-index`, `codex-context-map` y `context-packs` .

## Solución estructural

Crear un único archivo dominante:

```text
Docs/_meta/codex-entrypoint.md
```

Ese archivo debe ser la única entrada rápida para Codex.

Debe responder en máximo 1 página:

1. Qué tipo de tarea es.
2. Qué Context Pack usar.
3. Qué documentos leer.
4. Qué documentos no leer.
5. Qué documento prevalece si hay contradicción.
6. Qué archivos actualizar al cerrar.
7. Qué validaciones aplicar.

## Nueva estructura rápida recomendada

```text
Docs/
├─ README.md
├─ .codex-context.yml
├─ _meta/
│  ├─ codex-entrypoint.md              # NUEVO: entrada única rápida
│  ├─ active-work-index.md             # se conserva, pero subordinado
│  ├─ master-index.md                  # índice completo, no lectura inicial
│  ├─ document-ownership-map.md
│  └─ contradiction-resolution-log.md   # NUEVO
├─ 00_audit/
│  ├─ development-gap-analysis.md
│  ├─ codebase-inventory.md
│  ├─ duplication-risk-matrix.md
│  └─ documentation-health-report.md
├─ 01_core_erp/
├─ 02_projects/
├─ 03_standards/
├─ 04_integrations/
├─ agents/
└─ templates/
```

## Cómo será más rápida

Antes Codex podía leer varios índices largos. Ahora leería:

1. `README.md`
2. `_meta/codex-entrypoint.md`
3. Solo el Context Pack correspondiente.
4. Solo documentos del proyecto/API afectado.

Esto reduce lectura innecesaria y evita usar `_archive`, agentes viejos o documentos históricos como fuente vigente. La regla de no leer histórico ya existe .

## Cómo reparar contradicciones

Crear:

```text
Docs/_meta/contradiction-resolution-log.md
```

Formato:

```md
| ID | Tema | Documento A | Documento B | Contradicción | Documento que prevalece | Acción |
|---|---|---|---|---|---|---|
```

Regla:

* Si contradice arquitectura: prevalece `03_standards/architecture/*`.
* Si contradice API: prevalece `01_core_erp/apis/00_api_index.md`.
* Si contradice proyecto: prevalece `02_projects/<project>/README.md` + documentos canónicos del proyecto.
* Si contradice ejecución Codex: prevalece `_meta/codex-entrypoint.md`.
* Si contradice Docker: prevalece `03_standards/docker/jobcron-official-docker-architecture.md`.

## Actividades a implementar

1. Crear `Docs/_meta/codex-entrypoint.md`.
2. Actualizar `README.md` para apuntar a ese archivo como entrada principal.
3. Actualizar `codex-minimal-reading-standard.md`.
4. Actualizar `codex-context-map.md`.
5. Actualizar `context-packs.md`.
6. Crear `contradiction-resolution-log.md`.
7. Crear `documentation-health-report.md`.
8. Marcar documentos históricos como `ARCHIVE_REFERENCE`.
9. Detectar documentos duplicados por tema.
10. Unificar nombres de documentos.
11. Crear matriz “documento dueño por tema”.
12. Crear checklist obligatorio para todo documento nuevo.
13. Crear agente de limpieza documental.
14. Crear agente de lectura rápida para Codex.
15. Crear regla: ningún agente puede pedir “leer todo Docs” salvo auditoría P0.

## Agente para Codex

```md
# AGENT-XXX — Optimización documental y entrada rápida Codex

## Estado
PENDIENTE

## Objetivo
Reestructurar la navegación documental para que Codex lea menos, encuentre antes la fuente correcta, evite información duplicada, detecte contradicciones y mantenga estable la documentación antes de producción.

## Lectura obligatoria
Leer primero:

- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/03_standards/codex/codex-minimal-reading-standard.md`
- `Docs/00_audit/codex-context-map.md`
- `Docs/03_standards/operations/context-packs.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/00_audit/11_documentation_structure_optimization.md`

## Actividades

### 1. Crear entrada única Codex

Crear:

`Docs/_meta/codex-entrypoint.md`

Debe incluir:

- Orden único de lectura.
- Tabla de Context Packs.
- Documento que prevalece por dominio.
- Documentos prohibidos como fuente vigente.
- Checklist de cierre.
- Regla de actualización de índices.

### 2. Reparar contradicción de orden de lectura

Comparar:

- `codex-minimal-reading-standard.md`
- `codex-context-map.md`
- `context-packs.md`
- `AGENT_GLOBAL_RULES.md`
- `active-work-index.md`

Actualizar todos para que apunten a:

`Docs/_meta/codex-entrypoint.md`

### 3. Crear bitácora de contradicciones

Crear:

`Docs/_meta/contradiction-resolution-log.md`

Registrar:

- contradicción;
- documentos afectados;
- decisión;
- documento que prevalece;
- acción aplicada;
- fecha;
- estado.

### 4. Crear salud documental

Crear:

`Docs/00_audit/documentation-health-report.md`

Debe listar:

- documentos duplicados;
- documentos mal clasificados;
- documentos obsoletos;
- documentos sin owner;
- documentos sin estado;
- documentos que contradicen estándares;
- documentos que deben moverse;
- documentos que deben fusionarse;
- documentos que deben archivarse.

### 5. Normalizar clasificación

Aplicar reglas:

- Core ERP → `01_core_erp`
- Proyecto/marca → `02_projects/<project>`
- Estándar → `03_standards`
- Integración externa → `04_integrations`
- Auditoría/reporte → `00_audit`
- Índice/metadatos → `_meta`
- Instrucción temporal → `agents`
- Plantilla → `templates`
- Histórico → `_archive`

### 6. Reducir duplicación

Detectar duplicados por:

- título parecido;
- mismo dominio;
- misma API;
- mismo flujo;
- mismo proyecto;
- mismo estándar;
- instrucciones repetidas en agentes.

Acciones permitidas:

- fusionar contenido en documento canónico;
- dejar enlace desde documento secundario;
- marcar como `ARCHIVE_REFERENCE`;
- marcar como `SUPERSEDED_BY`;
- registrar en `contradiction-resolution-log.md`.

No eliminar archivos sin autorización.

### 7. Optimizar Context Packs

Actualizar `context-packs.md` para que cada pack tenga:

- uso;
- documentos mínimos;
- documentos prohibidos;
- validación;
- salida esperada;
- archivo que debe actualizarse.

Agregar nuevos packs:

- `CP-09 - Auditoría documental`
- `CP-10 - Producción / release`
- `CP-11 - Base de datos`
- `CP-12 - Nginx`
- `CP-13 - Refapart MVP`
- `CP-14 - ERP módulos core`

### 8. Crear regla para código nuevo

Todo código nuevo debe documentar:

- acción;
- frontend;
- Gateway;
- API;
- permisos;
- tabla/modelo;
- validación;
- errores;
- documento canónico.

Usar:

`Docs/03_standards/code-actions/code-actions-map-standard.md`

### 9. Actualizar índices

Actualizar:

- `README.md`
- `_meta/active-work-index.md`
- `_meta/master-index.md`
- `_meta/navigation-map.md`
- `_meta/document-relations.md`
- `agents/EXECUTION_REPORT.md`

### 10. Reporte final

Entregar:

- documentos leídos;
- contradicciones encontradas;
- contradicciones reparadas;
- documentos movidos o reclasificados;
- documentos fusionados;
- documentos marcados como obsoletos;
- nuevos índices creados;
- Context Packs actualizados;
- pendientes restantes.

## Criterio de cierre

El agente se cierra solo si:

- existe `codex-entrypoint.md`;
- todos los documentos de lectura rápida apuntan a él;
- existe `contradiction-resolution-log.md`;
- existe `documentation-health-report.md`;
- no hay dos órdenes de lectura contradictorios;
- los Context Packs están actualizados;
- los documentos históricos no aparecen como fuente vigente;
- se actualizó `EXECUTION_REPORT.md`.

## Prohibiciones

- No crear carpetas paralelas como `Docs/core` o `Docs/shared`.
- No mover documentación canónica sin registrar decisión.
- No eliminar agentes.
- No leer todo `Docs` salvo auditoría documental justificada.
- No inventar estado de código.
- No marcar como activo algo que no esté implementado.
```

## Reparaciones concretas que recomiendo

1. Hacer que `README.md` diga: “entrada Codex: `_meta/codex-entrypoint.md`”.
2. Cambiar `codex-context-map.md` para que no tenga un orden distinto.
3. Cambiar `codex-minimal-reading-standard.md` para que no compita con `codex-entrypoint.md`.
4. Mantener `master-index.md` como índice completo, no como lectura inicial.
5. Mantener `active-work-index.md` como estado operativo, no como entrada única.
6. Crear una bitácora formal de contradicciones.
7. Marcar documentos viejos como `ARCHIVE_REFERENCE` o `SUPERSEDED_BY`.

La mejora principal: **Codex dejará de decidir qué índice seguir y tendrá una sola entrada dominante**.
