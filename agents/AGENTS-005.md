Confirmo lectura del repositorio y de los agentes `AGENTS-000` a `AGENTS-030` en rama `general`.

Hallazgos importantes: `AGENTS-000` a `004` tienen contenido útil; `AGENTS-005` a `029` están vacíos; `AGENTS-030` concentra los pendientes activos y explica que los anteriores fueron ejecutados, absorbidos, clasificados o movidos al concentrador   . También confirma que `AGENTS-030` ya define prioridades P0–P5 para Refapart, JobCron, MexIngSof, TecnoTelec, POS y roadmap futuro  .

## Sí es viable

Tu idea sí conviene: crear una carpeta de **instrucciones de entrada** que Codex use para clasificar la tarea y cargar solo el agente especializado necesario.

La mejora sería esta:

```text
Docs/agents/
├─ _index.md
├─ instructions/
│  ├─ inbox.md
│  ├─ classifier.md
│  ├─ keyword-search-rules.md
│  └─ routing-matrix.md
├─ specialized/
│  ├─ auth.md
│  ├─ gateway.md
│  ├─ database.md
│  ├─ frontend.md
│  ├─ backend-api.md
│  ├─ docker.md
│  ├─ nginx.md
│  ├─ refapart.md
│  ├─ jobcron.md
│  ├─ documentation-cleanup.md
│  └─ code-audit.md
├─ active/
│  └─ AGENTS-030.md
└─ archive/
```

## Actividades que propongo

1. Crear `Docs/agents/_index.md` como índice único de agentes.
2. Crear `Docs/agents/instructions/inbox.md` para recibir instrucciones nuevas.
3. Crear `classifier.md` para que Codex clasifique la tarea.
4. Crear `routing-matrix.md` para mapear palabra clave → agente especializado.
5. Crear agentes especializados por dominio.
6. Convertir `AGENTS-030` en concentrador activo, pero ya no como archivo gigante de lectura inicial.
7. Mover o archivar agentes vacíos `005–029`.
8. Crear scripts de búsqueda por palabras clave.
9. Crear un reporte automático de duplicidad documental.
10. Crear una regla: si no existe agente especializado, Codex debe crearlo usando plantilla.

## Por qué mejora

Actualmente Codex puede leer demasiado porque `AGENTS-030` concentra muchas prioridades juntas. El nuevo flujo sería:

```text
inbox.md
→ classifier.md
→ routing-matrix.md
→ specialized/<dominio>.md
→ Context Pack mínimo
→ documentación canónica exacta
→ ejecución
```

Así no lee Auth si la tarea es Nginx, no lee Refapart si la tarea es DB, y no lee roadmap futuro si la tarea es MVP.

## Agente desarrollado

# AGENT-031 — Sistema de instrucciones, clasificación y agentes especializados Codex

## Estado

PENDIENTE

## Objetivo

Reestructurar el sistema de agentes para que Codex analice instrucciones nuevas más rápido, clasifique la tarea por dominio, lea solo el agente especializado necesario y evite leer información duplicada, vacía, histórica o fuera de alcance.

## Contexto confirmado

Los agentes `AGENTS-000` a `AGENTS-004` contienen instrucciones útiles.
Los agentes `AGENTS-005` a `AGENTS-029` están vacíos o sin instrucciones activas.
`AGENTS-030` funciona como concentrador único de pendientes activos, pero ya contiene demasiados dominios mezclados para ser una lectura inicial rápida.

## Nueva estructura requerida

Crear o reorganizar:

```text
Docs/agents/
├─ _index.md
├─ instructions/
│  ├─ inbox.md
│  ├─ classifier.md
│  ├─ routing-matrix.md
│  ├─ keyword-search-rules.md
│  └─ new-agent-template.md
├─ specialized/
│  ├─ auth.md
│  ├─ gateway.md
│  ├─ database.md
│  ├─ frontend.md
│  ├─ backend-api.md
│  ├─ docker.md
│  ├─ nginx.md
│  ├─ refapart.md
│  ├─ jobcron.md
│  ├─ mexingsof.md
│  ├─ tecnotelec.md
│  ├─ documentation-cleanup.md
│  ├─ code-audit.md
│  ├─ payments-billing.md
│  ├─ customer-crm.md
│  └─ erp-modules.md
├─ active/
│  └─ AGENTS-030.md
└─ archive/
```

## Regla estructural

Esta reestructura tiene prioridad sobre reglas anteriores que impedían mover, limpiar o reorganizar agentes, porque su objetivo es optimizar la lectura antes de producción.

No se debe borrar información útil sin antes:

1. clasificarla;
2. moverla al agente especializado correspondiente;
3. registrar origen;
4. actualizar índice;
5. dejar trazabilidad.

## Flujo nuevo de Codex

### Paso 1 — Leer entrada única

Codex debe leer primero:

```text
Docs/agents/_index.md
Docs/agents/instructions/inbox.md
Docs/agents/instructions/classifier.md
Docs/agents/instructions/routing-matrix.md
```

### Paso 2 — Clasificar tarea

La tarea se clasifica por:

* proyecto;
* capa técnica;
* dominio funcional;
* API afectada;
* base de datos;
* frontend;
* Gateway;
* Auth;
* Docker;
* Nginx;
* documentación;
* roadmap;
* producción.

### Paso 3 — Elegir agente especializado

Ejemplos:

| Si la tarea menciona                                 | Leer                                   |
| ---------------------------------------------------- | -------------------------------------- |
| login, roles, permisos, usuarios, Djoser, activación | `specialized/auth.md`                  |
| Gateway, rutas, proxy API, errores Gateway           | `specialized/gateway.md`               |
| tablas, schemas, migraciones, PostgreSQL             | `specialized/database.md`              |
| Next.js, botón, pantalla, formulario, UI             | `specialized/frontend.md`              |
| Docker, compose, red, contenedor                     | `specialized/docker.md`                |
| Nginx, dominio, proxy, upstream, SSL                 | `specialized/nginx.md`                 |
| Refapart, piezas, cotizador, proveedor               | `specialized/refapart.md`              |
| JobCron, ERP, FeatureAvailability                    | `specialized/jobcron.md`               |
| documentación duplicada, agentes, índices            | `specialized/documentation-cleanup.md` |
| auditoría de código, duplicidad técnica              | `specialized/code-audit.md`            |
| clientes, CRM, leads                                 | `specialized/customer-crm.md`          |
| pagos, facturación, billing, payment                 | `specialized/payments-billing.md`      |

### Paso 4 — Si no existe agente especializado

Codex debe crear uno usando:

```text
Docs/agents/instructions/new-agent-template.md
```

Debe incluir:

* objetivo;
* cuándo usarlo;
* cuándo no usarlo;
* documentos mínimos;
* documentos prohibidos;
* palabras clave;
* proyectos afectados;
* APIs afectadas;
* base de datos afectada;
* validaciones;
* salida esperada;
* criterio de cierre.

### Paso 5 — Ejecutar búsqueda contextual

Antes de modificar documentación o código, ejecutar búsqueda por palabras clave relacionadas.

Ejemplo:

```powershell
pwsh Docs/scripts/agents/search-agent-context.ps1 -Keywords "auth,login,djoser,activation,permissions" -Scope Docs
```

Debe generar:

```text
Docs/00_audit/agent-context-search-report.md
```

## Scripts propuestos

### 1. `search-agent-context.ps1`

Objetivo:
Buscar palabras clave en `Docs`, `agents`, `01_core_erp`, `02_projects`, `03_standards` y generar un reporte.

Debe detectar:

* documentos relacionados;
* agentes relacionados;
* documentos duplicados;
* documentos obsoletos;
* documentos contradictorios probables;
* documentos que no deben leerse salvo auditoría.

Salida:

```text
Docs/00_audit/agent-context-search-report.md
```

### 2. `classify-agent-task.ps1`

Objetivo:
Clasificar una instrucción nueva.

Entrada:

```text
Docs/agents/instructions/inbox.md
```

Salida:

```text
Docs/agents/instructions/classification-result.md
```

Debe producir:

* dominio principal;
* dominios secundarios;
* agente especializado recomendado;
* Context Pack recomendado;
* documentos mínimos;
* documentos prohibidos;
* riesgos;
* si requiere crear nuevo agente especializado.

### 3. `detect-agent-duplicates.ps1`

Objetivo:
Detectar instrucciones repetidas o absorbidas.

Debe comparar:

* `AGENTS-000` a `AGENTS-030`;
* `specialized/*.md`;
* `context-packs.md`;
* `active-work-index.md`;
* `codex-context-map.md`.

Salida:

```text
Docs/00_audit/agent-duplication-report.md
```

### 4. `build-agent-index.ps1`

Objetivo:
Generar o actualizar:

```text
Docs/agents/_index.md
```

Debe listar:

* agente;
* estado;
* dominio;
* prioridad;
* archivo especializado;
* documentos que lee;
* si está activo, vacío, archivado o absorbido.

## Actividades detalladas de implementación

### Fase 1 — Inventario de agentes

1. Revisar `AGENTS-000` a `AGENTS-030`.
2. Marcar cada uno como:

   * `ACTIVE`;
   * `ABSORBED`;
   * `EMPTY`;
   * `ARCHIVE_REFERENCE`;
   * `SPECIALIZED_SOURCE`;
   * `ROADMAP_ONLY`.
3. Crear `Docs/agents/_index.md`.
4. Registrar qué agente alimenta a qué especializado.

### Fase 2 — Crear carpeta `instructions`

Crear:

```text
Docs/agents/instructions/inbox.md
Docs/agents/instructions/classifier.md
Docs/agents/instructions/routing-matrix.md
Docs/agents/instructions/keyword-search-rules.md
Docs/agents/instructions/new-agent-template.md
```

### Fase 3 — Crear agentes especializados

Crear agentes iniciales:

```text
Docs/agents/specialized/auth.md
Docs/agents/specialized/gateway.md
Docs/agents/specialized/database.md
Docs/agents/specialized/frontend.md
Docs/agents/specialized/backend-api.md
Docs/agents/specialized/docker.md
Docs/agents/specialized/nginx.md
Docs/agents/specialized/refapart.md
Docs/agents/specialized/jobcron.md
Docs/agents/specialized/documentation-cleanup.md
Docs/agents/specialized/code-audit.md
Docs/agents/specialized/customer-crm.md
Docs/agents/specialized/payments-billing.md
Docs/agents/specialized/erp-modules.md
```

### Fase 4 — Absorber contenido útil

Mover contenido útil así:

* `AGENTS-000` → `specialized/refapart.md`, `specialized/auth.md`, `specialized/gateway.md`.
* `AGENTS-001` → `specialized/auth.md`, `specialized/jobcron.md`.
* `AGENTS-002` → `specialized/erp-modules.md`, `specialized/customer-crm.md`, `specialized/payments-billing.md`.
* `AGENTS-003` → `specialized/code-audit.md`, `specialized/database.md`, `specialized/nginx.md`, `specialized/docker.md`.
* `AGENTS-004` → `specialized/documentation-cleanup.md`.
* `AGENTS-030` → conservar como backlog activo, pero enlazar a agentes especializados.

### Fase 5 — Optimizar `AGENTS-030`

Convertir `AGENTS-030` en índice de backlog, no documento de lectura profunda.

Debe tener:

* prioridad;
* pendiente;
* agente especializado;
* documentos mínimos;
* estado;
* bloqueo;
* criterio de cierre.

No debe repetir instrucciones largas.

### Fase 6 — Crear búsqueda dinámica

Crear scripts:

```text
Docs/scripts/agents/search-agent-context.ps1
Docs/scripts/agents/classify-agent-task.ps1
Docs/scripts/agents/detect-agent-duplicates.ps1
Docs/scripts/agents/build-agent-index.ps1
```

### Fase 7 — Reparar lectura Codex

Actualizar:

```text
Docs/_meta/codex-entrypoint.md
Docs/00_audit/codex-context-map.md
Docs/03_standards/operations/context-packs.md
Docs/03_standards/codex/codex-minimal-reading-standard.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/agents/AGENT_GLOBAL_RULES.md
```

Todos deben apuntar a:

```text
Docs/agents/_index.md
```

cuando la tarea use agentes.

### Fase 8 — Mantener estable a largo plazo

Reglas:

1. Ninguna instrucción nueva se mete directo a `AGENTS-030`.
2. Toda instrucción entra primero a `instructions/inbox.md`.
3. Codex clasifica.
4. Si existe agente especializado, se actualiza.
5. Si no existe, se crea.
6. `AGENTS-030` solo referencia pendientes activos.
7. Cada agente especializado debe tener menos de 300 líneas.
8. Si crece más, se divide por subdominio.
9. Cada agente debe decir qué NO leer.
10. Cada agente debe tener criterio de cierre.

## Criterio de cierre

Este agente se considera completado cuando existan:

* `Docs/agents/_index.md`;
* `Docs/agents/instructions/inbox.md`;
* `Docs/agents/instructions/classifier.md`;
* `Docs/agents/instructions/routing-matrix.md`;
* `Docs/agents/instructions/keyword-search-rules.md`;
* `Docs/agents/instructions/new-agent-template.md`;
* carpeta `Docs/agents/specialized`;
* agentes especializados iniciales;
* scripts de búsqueda;
* reporte de duplicidad de agentes;
* `AGENTS-030` reducido a backlog;
* documentación actualizada para que Codex use el nuevo flujo.

## Reporte final obligatorio

Codex debe reportar:

1. agentes leídos;
2. agentes vacíos;
3. agentes absorbidos;
4. agentes especializados creados;
5. archivos modificados;
6. scripts creados;
7. contradicciones encontradas;
8. duplicidades eliminadas;
9. pendientes restantes;
10. cómo leer menos en futuras tareas.

## Decisión final

Sí conviene tu sistema, pero con una mejora: no haría solo una carpeta llamada `instrucciones`; haría **instrucciones + clasificador + matriz de ruteo + agentes especializados + scripts**. Así Codex no adivina, sino que sigue una ruta clara.

La pieza clave es esta:

```text
Docs/agents/instructions/inbox.md
→ classifier.md
→ routing-matrix.md
→ specialized/<dominio>.md
```

Eso vuelve el proceso más dinámico y evita leer agentes vacíos, duplicados o demasiado generales.
