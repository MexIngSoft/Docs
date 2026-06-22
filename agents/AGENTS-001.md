# AGENTS-001 — Reparación y Validación de Scripts Docker por Proyecto

## Objetivo

Optimizar los scripts Docker por proyecto para que cada `start`, `stop`, `status` y `healthcheck` active, detenga y valide únicamente los servicios esperados, usando el stack compartido oficial y comprobando URLs reales, puertos, Gateway y Nginx.

## Alcance

Puede tocar:

* `Docs/agents/AGENTS-001.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/operations/scripts/docker/projects/`
* `Docs/03_standards/operations/project-docker-dependency-map.md`
* `Docs/03_standards/operations/local-port-registry.md`
* `Docs/03_standards/docker/jobcron-official-docker-architecture.md`

Debe revisar:

* Scripts globales: `start-all.ps1`, `stop-all.ps1`, `status-all.ps1`, `healthcheck-all.ps1`, `clean-safe.ps1`
* Script común: `Invoke-WorkspaceProjectDocker.ps1`
* Scripts por proyecto: `start-*.ps1` y `stop-*.ps1`

Debe dejar:

* Scripts idempotentes.
* Validación real por URL.
* Matriz documentada de comportamiento por proyecto.
* Reporte actualizado en `Docs/agents/EXECUTION_REPORT.md`.

## Lectura mínima obligatoria

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/operations/standard-request-prompts.md`
* `Docs/03_standards/codex/codex-minimal-reading-standard.md`
* `Docs/03_standards/codex/codex-change-budget-standard.md`
* `Docs/03_standards/codex/codex-documentation-diff-standard.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`
* `Docs/03_standards/operations/project-docker-dependency-map.md`
* `Docs/03_standards/operations/local-port-registry.md`
* `Docs/03_standards/docker/jobcron-official-docker-architecture.md`

## Context Pack

Usar el Context Pack mínimo relacionado con:

* `Agents`
* `Docker`
* `Operations`
* `Frontend runtime`
* `Gateway`

No leer todo `Docs`.

No usar `_archive/` ni `agents/_archive/` como fuente vigente, salvo trazabilidad.

## Arquitectura Docker obligatoria

Trabajar sobre el stack oficial:

* Stack: `comercial_platform`
* Red: `jobcron_network`
* PostgreSQL: `db-postgresql`
* APIs Django: `api-multiproyecto`
* Webs Next.js: `web-frontend-node`
* Proxy: `nginx`

No crear contenedores alternos.

No crear redes por proyecto.

No duplicar PostgreSQL, Gateway, Nginx ni contenedores web.

No usar `docker volume prune`.

## Proyectos a validar

Validar scripts para:

* JobCron — puerto `3000`
* TecnoTelec — puerto `3001`
* LexNova — puerto `3002`
* DocuCore — puerto `3004`
* Fiscora — puerto `3005`
* Imagrafity — puerto `3006`
* LeadHunter — puerto `3007`
* REFAPART — puerto `3008`
* MexIngSof — puerto `3009`

Gateway central:

* `http://127.0.0.1:8025/health/`

## Fuera de alcance

No ejecutar otros agents.

No modificar `main` ni `pro`.

No crear APIs nuevas.

No crear schemas, modelos o migraciones.

No cambiar puertos sin actualizar el registro canónico.

No crear Docker nuevo fuera del estándar.

No modificar proyectos no relacionados.

No cerrar el agent solo porque Docker diga `healthy`.

## Tareas

### 1. Corregir identidad del agent

El archivo es:

`Docs/agents/AGENTS-001.md`

No debe referirse a sí mismo como `AGENTS-004.md`.

Actualizar el título y contenido para que el agente sea AGENTS-001.

### 2. Inventariar scripts reales

Revisar todos los scripts en:

`Docs/03_standards/operations/scripts/docker/projects/`

Documentar qué hace realmente cada uno:

* `start-all.ps1`
* `stop-all.ps1`
* `status-all.ps1`
* `healthcheck-all.ps1`
* `clean-safe.ps1`
* `Invoke-WorkspaceProjectDocker.ps1`
* `start-*.ps1`
* `stop-*.ps1`

### 3. Crear o actualizar matriz de comportamiento

Crear o actualizar:

`Docs/03_standards/operations/project-script-behavior-matrix.md`

Debe incluir:

| Script | Proyecto | Debe levantar | Debe conservar | Debe apagar | Puerto web | URL Web | URL Gateway | Resultado esperado |
| ------ | -------- | ------------- | -------------- | ----------- | ---------: | ------- | ----------- | ------------------ |

Cada proyecto debe tener fila para `start` y `stop`.

### 4. Corregir scripts `start-*`

Cada `start-*.ps1` debe:

1. Levantar baseline oficial si falta.
2. Activar solo el proyecto solicitado.
3. No activar otra web como principal.
4. Validar puerto según `local-port-registry.md`.
5. Validar ruta Nginx si aplica.
6. Validar Gateway central.
7. Probar URL real con `Invoke-WebRequest`.
8. Mostrar:

   * proyecto;
   * puerto;
   * URL web;
   * URL Gateway;
   * contenedores usados;
   * estado HTTP;
   * comando para apagar.

### 5. Corregir scripts `stop-*`

Cada `stop-*.ps1` debe:

1. Apagar solo el proyecto solicitado.
2. No apagar PostgreSQL compartido.
3. No apagar Gateway compartido.
4. No apagar Nginx salvo `stop-all`.
5. No apagar `api-multiproyecto` salvo que corresponda por `stop-all`.
6. Confirmar que la URL del proyecto dejó de responder.
7. Mostrar servicios conservados.

### 6. Corregir `healthcheck-all.ps1`

Debe validar:

* contenedores Docker;
* red Docker;
* puerto esperado;
* URL web por proyecto;
* Gateway central;
* HTTP status;
* errores visibles.

No debe reportar OK si solo Docker está healthy pero la web no abre.

### 7. Crear prueba aleatoria de scripts

Crear:

`Docs/03_standards/operations/scripts/docker/projects/test-random-project-scripts.ps1`

Debe ejecutar secuencias aleatorias como:

1. `start-refapart`
2. `start-jobcron`
3. `stop-refapart`
4. `start-lexnova`
5. `healthcheck-all`
6. `stop-jobcron`
7. `start-tecnotelec`
8. `status-all`

Debe validar:

* que no carguen proyectos equivocados;
* que no se apaguen dependencias compartidas necesarias;
* que cada web responda en su URL;
* que no queden estados inconsistentes;
* que no aparezcan contenedores fuera del estándar.

### 8. Validar webs que no se ven

Para cada proyecto validar:

* URL local documentada.
* Puerto correcto.
* Ruta Nginx.
* Ruta Next.js.
* Bind en `0.0.0.0` si aplica.
* Variables `NEXT_PUBLIC_*`.
* Gateway URL.
* Errores JS/runtime.
* Logs de `web-frontend-node`.
* Logs de `nginx`.

## Validaciones

Ejecutar según disponibilidad del entorno:

* Parser PowerShell para scripts `.ps1`.
* `docker compose -p comercial_platform ps`.
* `docker network inspect jobcron_network`.
* `Invoke-WebRequest` por URL web.
* `Invoke-WebRequest http://127.0.0.1:8025/health/`.
* `healthcheck-all.ps1`.
* `test-random-project-scripts.ps1`.

Si Docker Desktop no está disponible, no marcar como completado: registrar bloqueo exacto.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Debe registrar:

* agent revisado;
* documentos leídos;
* Context Pack usado;
* scripts corregidos;
* matriz creada o actualizada;
* proyectos probados;
* secuencia aleatoria ejecutada;
* URLs que cargan;
* URLs que fallan;
* causa real de cada falla;
* validaciones ejecutadas;
* pendientes reales;
* bloqueos;
* decisiones documentales.

## Criterio de cierre

El agent queda cerrado solo si:

* ya no se identifica como `AGENTS-004`;
* cada `start-*` levanta el proyecto correcto;
* cada `stop-*` apaga solo lo correcto;
* `healthcheck-all` valida URLs reales;
* la prueba aleatoria no deja estados inconsistentes;
* las webs documentadas cargan o queda causa exacta;
* no se crean contenedores fuera del baseline;
* no se crean APIs nuevas;
* `EXECUTION_REPORT.md` queda actualizado.

Si falta información esencial:

Estado = `BLOQUEADO`.

Si el agent ya fue ejecutado y no hay cambios nuevos:

Estado = `CERRADO`.

Si el agent está vacío:

Dejar como `Sin instrucciones`.
