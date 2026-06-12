# Reporte de ejecucion de Agents documentales

Fecha: 2026-05-16

## Alcance

Se ejecutaron los archivos `Docs/agents/AGENTS-*.md` en orden numerico, siguiendo:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- La estructura canonica actual de `Docs`

La ejecucion se limito a tareas no completadas y no se revirtieron cambios existentes.

## Resultado por agent

| Agent | Estado | Resultado |
| --- | --- | --- |
| `AGENTS-000.md` | Completado | Se uso como agent maestro para inventariar y coordinar la optimizacion documental. |
| `AGENTS-001.md` | Completado | Se genero inventario documental en Markdown, JSON y CSV. |
| `AGENTS-002.md` | Completado | Se genero clasificacion por tipo, dominio, estado y prioridad. |
| `AGENTS-003.md` | Completado | Se documento la estructura canonica propuesta respetando `Docs/README.md`. |
| `AGENTS-004.md` | Completado | Se genero reporte de duplicados y clusters candidatos. |
| `AGENTS-005.md` | Completado | Se genero indice maestro y mapa de relaciones documentales. |
| `AGENTS-006.md` | Completado | Se documento separacion Core vs Business. |
| `AGENTS-007.md` | Completado | Se genero reporte de documentacion de negocio. |
| `AGENTS-008.md` | Completado | Se genero reporte de documentacion API. |
| `AGENTS-009.md` | Completado | Se genero reporte de documentacion de base de datos. |
| `AGENTS-010.md` | Completado | Se genero reporte de documentacion frontend. |
| `AGENTS-011.md` | Completado | Se crearon catalogos y reglas base para jobs. |
| `AGENTS-012.md` | Completado | Se crearon documentos base para eventos y scheduler. |
| `AGENTS-013.md` | Completado | Se crearon documentos base de auth, permisos, sesiones, tokens y politicas. |
| `AGENTS-014.md` | Completado | Se genero mapa de navegacion documental. |
| `AGENTS-015.md` | Completado | Se generaron reportes de limpieza, archivo y candidatos de eliminacion. No se movieron ni borraron archivos. |
| `AGENTS-016.md` | Completado | Se crearon templates documentales reutilizables. |
| `AGENTS-017.md` | Completado | Se genero quality gate documental. |
| `AGENTS-018.md` | Completado | Se genero plan de ejecucion para futuras corridas con Codex. |
| `AGENTS-019.md` | Completado | Se genero revision final documental. |
| `AGENTS-020.md` | Completado | Se creo politica de mantenimiento documental y checklist de PR. |
| `AGENTS-021.md` | Sin tarea ejecutable | El archivo contiene resumen/cierre del set `000-020`; no define nueva implementacion. |
| `AGENTS-022.md` - `AGENTS-030.md` | Pendiente por falta de instrucciones | Los archivos estan vacios y se mantienen como slots futuros. |

## Artefactos generados

### Metadatos

- `Docs/_meta/document_inventory.md`
- `Docs/_meta/document_inventory.json`
- `Docs/_meta/document_inventory.csv`
- `Docs/_meta/document_classification.md`
- `Docs/_meta/document_classification.json`
- `Docs/_meta/proposed_structure.md`
- `Docs/_meta/folder_rules.md`
- `Docs/_meta/duplicate_report.md`
- `Docs/_meta/duplicate_clusters.json`
- `Docs/_meta/core_vs_business_report.md`
- `Docs/_meta/business_documentation_report.md`
- `Docs/_meta/api_documentation_report.md`
- `Docs/_meta/database_documentation_report.md`
- `Docs/_meta/frontend_documentation_report.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/document-relations.md`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/cleanup_report.md`
- `Docs/_meta/archive_report.md`
- `Docs/_meta/delete_candidates.md`
- `Docs/_meta/quality_gate_report.md`
- `Docs/_meta/codex_execution_plan.md`
- `Docs/_meta/final_review_report.md`
- `Docs/_meta/owners.md`

### Jobs, eventos, scheduler y seguridad

- `Docs/03_standards/operations/jobs/job-catalog.md`
- `Docs/03_standards/operations/jobs/job-schedule.md`
- `Docs/03_standards/operations/jobs/retry-policy.md`
- `Docs/03_standards/operations/jobs/failure-recovery.md`
- `Docs/01_core_erp/architecture/events/event-catalog.md`
- `Docs/01_core_erp/architecture/events/event-driven-architecture.md`
- `Docs/01_core_erp/architecture/events/event-naming.md`
- `Docs/01_core_erp/architecture/events/event-payloads.md`
- `Docs/01_core_erp/architecture/scheduling/scheduler-architecture.md`
- `Docs/01_core_erp/architecture/scheduling/scheduler-rules.md`
- `Docs/01_core_erp/architecture/scheduling/job-dependencies.md`
- `Docs/01_core_erp/auth/README.md`
- `Docs/01_core_erp/auth/roles.md`
- `Docs/01_core_erp/auth/permissions.md`
- `Docs/01_core_erp/auth/sessions.md`
- `Docs/01_core_erp/auth/devices.md`
- `Docs/01_core_erp/auth/tokens.md`
- `Docs/01_core_erp/auth/security-policies.md`
- `Docs/03_standards/security/audit-policy.md`
- `Docs/03_standards/security/password-policy.md`
- `Docs/03_standards/security/mfa-future.md`

### Templates y mantenimiento

- `Docs/templates/overview-template.md`
- `Docs/templates/api-template.md`
- `Docs/templates/database-template.md`
- `Docs/templates/business-template.md`
- `Docs/templates/runbook-template.md`
- `Docs/templates/adr-template.md`
- `Docs/templates/etl-template.md`
- `Docs/templates/frontend-template.md`
- `Docs/templates/event-template.md`
- `Docs/03_standards/documentation-maintenance-policy.md`
- `Docs/03_standards/documentation-pr-checklist.md`

## Validacion

- Inventario regenerado con `371` archivos documentales.
- Duplicados detectados: `7` clusters candidatos.
- Validacion de existencia: todos los artifacts esperados existen.
- Se revisaron advertencias en `Docs/_meta`: no hay blockers; hay warnings por front matter faltante en documentos existentes, documentos futuros/pendientes y slots `AGENTS-022` a `AGENTS-030` vacios.
- No se ejecutaron builds de aplicacion porque esta corrida solo modifico documentacion y metadatos.
- La carpeta raiz `Workspace.Comercial` no esta inicializada como repositorio git; no se pudo usar `git status` global. No se revirtieron cambios.

## Decisiones aplicadas

- Se respeto la estructura oficial de `Docs/README.md`.
- No se crearon rutas paralelas como `/docs/core`, `/docs/business` o `/docs/standards`.
- No se movieron, archivaron ni eliminaron documentos existentes sin aprobacion humana.
- Los duplicados se reportaron como candidatos para revision, no como cambios automaticos.
- Los documentos futuros se mantienen fuera del indice principal de implementacion.

## Pendientes

- Revisar manualmente los `7` clusters de duplicados antes de fusionar, archivar o eliminar contenido.
- Confirmar owners reales por dominio en `Docs/_meta/owners.md`.
- Completar front matter gradualmente cuando se editen documentos existentes.
- `AGENTS-022.md` a `AGENTS-030.md` quedan pendientes porque no contienen instrucciones ejecutables.

---

# Reporte de ejecucion adicional: asignacion de repositorios DocuCore

Fecha: 2026-05-16

## Alcance

Se ejecuto una nueva pasada sobre `Docs/agents/AGENTS-*.md` en orden numerico y se agrego la solicitud especifica de asignar los proyectos DocuCore a sus repositorios remotos:

- `https://github.com/MexIngSoft/API.PY.DJANGO.Document`
- `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.Gateway.git`
- `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.git`
- `https://github.com/MexIngSoft/WEB.NJ.NEXT.DocuCore.git`

## Resultado por agent

| Agent | Estado | Resultado |
| --- | --- | --- |
| `AGENTS-000.md` - `AGENTS-020.md` | Ya completados | No se repitieron cambios documentales cerrados; se aplico solo el pendiente nuevo de repositorios DocuCore. |
| `AGENTS-021.md` | Sin tarea ejecutable | Sigue siendo resumen/cierre del set `000-020`. |
| `AGENTS-022.md` - `AGENTS-030.md` | Pendiente por falta de instrucciones | Los archivos siguen vacios. |

## Repositorios asignados

| Proyecto | Ruta local | Origin configurado | Estado |
|---|---|---|---|
| `API.PY.DJANGO.Document` | `Docker.API.PY/API.PY.DJANGO.Document` | `https://github.com/MexIngSoft/API.PY.DJANGO.Document.git` | Git local inicializado, origin asignado. |
| `API.PY.DJANGO.DocuCore` | `Docker.API.PY/API.PY.DJANGO.DocuCore` | `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.git` | Git local inicializado, origin asignado. |
| `API.PY.DJANGO.DocuCore.Gateway` | `Docker.API.PY/API.PY.DJANGO.DocuCore.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.Gateway.git` | Git local inicializado, origin asignado. |
| `WEB.NJ.NEXT.DocuCore` | `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.DocuCore.git` | Git local inicializado, origin asignado. |

No se hicieron commits ni pushes.

## Documentacion actualizada

- `Docs/02_projects/docucore/repositories.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/03_standards/operations/git-repository-map.md`
- `Docs/03_standards/operations/django-api-project-compliance.md`
- `Docs/_meta/document_inventory.*`
- `Docs/_meta/document_classification.*`
- `Docs/_meta/duplicate_report.md`
- `Docs/_meta/duplicate_clusters.json`
- `Docs/_meta/master-index.*`
- `Docs/_meta/document-relations.md`
- `Docs/_meta/navigation-map.md`

## Validaciones ejecutadas

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.Document` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Document` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.DocuCore` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.DocuCore` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.DocuCore.Gateway` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.DocuCore.Gateway` | `python -m compileall .` | Correcto. |
| `WEB.NJ.NEXT.DocuCore` | `npm run build` | Correcto. |

## Metadatos

- Inventario regenerado con `372` archivos.
- Duplicados exactos detectados: `1` cluster.
- Se valido que los documentos esperados existan.

## Pendientes

- Los cuatro repos quedaron con archivos sin commit porque fueron inicializados localmente; falta decidir rama, hacer commit y push por repositorio.
- `AGENTS-022.md` a `AGENTS-030.md` siguen pendientes porque estan vacios.
- No se ejecuto build Docker porque no se modificaron Dockerfile ni compose en esta pasada.

---

# Reporte de publicacion Git

Fecha: 2026-05-16

## Commits creados

| Repositorio | Commit | Mensaje |
|---|---|---|
| `MexIngSoft/Docs` | `b287b0d` | `Document DocuCore agents and repository standards` |
| `MexIngSoft/API.PY.DJANGO.Document` | `5e38324` | `Add document processing MVP` |
| `MexIngSoft/API.PY.DJANGO.DocuCore` | `b378d1c` | `Add DocuCore tool catalog MVP` |
| `MexIngSoft/API.PY.DJANGO.DocuCore.Gateway` | `b50b324` | `Add DocuCore gateway MVP` |
| `MexIngSoft/WEB.NJ.NEXT.DocuCore` | `d393365` | `Add DocuCore dashboard MVP` |

## Push

| Repositorio | Rama | Resultado |
|---|---|---|
| `https://github.com/MexIngSoft/Docs.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/API.PY.DJANGO.Document.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.Gateway.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/WEB.NJ.NEXT.DocuCore.git` | `main` | Publicado correctamente tras reintento. |

## Nota

`gh` no esta instalado en esta maquina, por lo que no se crearon pull requests desde CLI. La publicacion se hizo con `git`.

---

# Ejecucion Agents DocuCore - 2026-06-05 - Documentos y barra rapida lateral

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md`, unico agent activo. Los archivos
`AGENTS-001.md` a `AGENTS-030.md` estaban vacios y quedaron como sin
instrucciones ejecutables.

El agent solicita completar pendientes del Workspace de DocuCore: administrar
documentos desde las pestañas superiores, navegar automaticamente al inicio del
documento seleccionado y mover la barra rapida de pagina al borde derecho del
preview para no cubrir contenido.

## Documentacion revisada

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/agents/AGENTS-000.md`

## Agent ejecutado

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Las pestañas superiores ahora activan, navegan, descargan, renombran y eliminan documentos del proyecto; la barra rapida de pagina se movio al lateral derecho del preview. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Tareas detectadas

- Convertir la barra superior de documentos en navegador/indice operativo.
- Permitir activar, renombrar, descargar y eliminar documentos del proyecto.
- Al hacer click en una pestaña, navegar al separador de inicio del documento.
- Evitar que la barra rapida de pagina aparezca sobre la hoja o el selector.
- Mantener la jerarquia visual: selector `40`, barra rapida `30`, preview `10`.
- Documentar reglas, decisiones y pendientes.

## Tareas ejecutadas

- Se agrego `scrollToWorkspaceDocumentStart()` usando
  `data-document-start-id` y `scrollIntoView()`.
- `activateWorkspaceDocument()` ya no recarga la pagina: actualiza sesion,
  documento activo, archivo activo, seleccion inicial y URL con
  `history.replaceState`.
- Se agregaron acciones de documento: descarga desde IndexedDB/objectURL,
  renombrado local y eliminacion del documento dentro del proyecto.
- Al eliminar documentos se renumeran las paginas restantes, se actualizan
  secciones y se mantiene vivo el proyecto.
- Las pestañas superiores ahora tienen boton principal y acciones independientes
  para evitar botones anidados invalidos.
- La barra `.page-quick-actions` paso a rail vertical en el borde derecho del
  preview y escala con `--zoom-scale`.
- El selector de pagina queda independiente con `z-index: 40`; la barra rapida
  queda en `z-index: 30`; el preview queda en `z-index: 10`.
- Se actualizo la documentacion canonica del Workspace.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-05-docucore-document-tabs-quick-rail/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores ESLint. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; Next.js compilo, valido tipos y genero rutas. |
| `docker restart web-frontend-node` | Aprobado; frontend reiniciado para cargar cambios. |
| `Invoke-WebRequest http://127.0.0.1:3004/workspace` | Aprobado; respuesta `HTTP 200`. |

## Decisiones tomadas

- Se mantuvo la persistencia local existente del Workspace; los cambios de
  documentos quedan cubiertos por el autosave del borrador.
- La eliminacion remueve el documento del proyecto local, pero no borra el
  archivo original ni el borrador completo.
- Se uso confirmacion nativa por ahora porque el agent solo exigia confirmar y
  no existe modal canonico especifico para esta accion en Workspace.
- No se modificaron Gateway, API ni contratos backend; el alcance quedo en
  Workspace frontend y documentacion.

## Informacion faltante

- Falta reemplazar confirmaciones nativas por modal DocuCore cuando se cierre
  el estandar de modales del Workspace.
- Falta prueba visual automatizada para hover/focus de la barra lateral derecha
  en zoom 10%, 100%, 300% y 500%.
- Falta contrato backend para registrar eventos de proyecto documental fuera de
  consola tecnica.

## Limpieza

`AGENTS-000.md` se copia al historico:

```text
Docs/_archive/agents/2026-06-05-docucore-document-tabs-quick-rail/AGENTS-000.md
```

Despues de copiarse, el archivo original se conserva en `Docs/agents/` pero
queda vacio. Los demas agents se dejan sin cambios porque ya estaban vacios.

---

# Ejecucion Agents DocuCore - 2026-06-05 - Acciones rapidas opcion 2

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md`, unico agent activo. Los archivos
`AGENTS-001.md` a `AGENTS-030.md` estaban vacios y quedaron como sin
instrucciones ejecutables.

El agent comparaba cuatro alternativas para resolver el conflicto visual entre
selector de pagina y barra de acciones rapidas. La solicitud del usuario fue
implementar la opcion 2, cuidando que el comportamiento siga siendo correcto
cuando el zoom cambia el tamano de las hojas.

## Documentacion revisada

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/agents/AGENTS-000.md`

## Agent ejecutado

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se implemento la opcion 2: selector exterior anclado a la tarjeta y barra rapida libre en la zona superior interna del preview. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Tareas detectadas

- Evitar que el selector de pagina y la barra rapida compitan por la misma zona.
- Conservar la barra rapida por hover/focus sin moverla fuera de la tarjeta.
- Anclar el selector en la esquina exterior de la tarjeta.
- Hacer que selector, offset e iconos de la barra rapida respondan al zoom de
  la hoja.
- Documentar la decision en la documentacion canonica del Workspace.

## Tareas ejecutadas

- Se separo el selector de pagina en un boton propio `.page-select-toggle`.
- `thumb-select` conserva el preview y la interaccion de seleccion existente,
  pero ya no contiene el icono selector.
- La barra `.page-quick-actions` mantiene la zona superior interna del preview
  libre de solapes con el selector.
- Los tamanos de botones, iconos, offsets y espacios usan `--zoom-scale` y
  `--thumb-width` para sostener proporciones con zoom bajo, normal y alto.
- Se actualizo `frontend-navigation-and-ux.md` con la regla de opcion 2.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-05-docucore-page-quick-actions-option-2/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores ESLint. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; Next.js compilo, valido tipos y genero rutas. |

## Decisiones tomadas

- Se eligio la opcion 2 porque fue la solicitada por el usuario y resuelve el
  solape directo sin cambiar el modelo funcional de acciones rapidas.
- No se movio la barra rapida fuera de la tarjeta para conservar el flujo de
  hover/focus ya implementado.
- No se modificaron acciones, permisos, Gateway ni contratos backend; el alcance
  quedo limitado al Workspace frontend y documentacion canonica.
- Se conservaron las reglas previas de zoom tipo Word y metadata real de pagina.

## Informacion faltante

- Falta prueba visual automatizada con capturas en zoom 10%, 100%, 300% y 500%
  para confirmar visualmente la proporcion del selector exterior.
- Falta validacion manual en navegador con PDF real para revisar comodidad en
  mobile y pantallas estrechas.

## Limpieza

`AGENTS-000.md` se copia al historico:

```text
Docs/_archive/agents/2026-06-05-docucore-page-quick-actions-option-2/AGENTS-000.md
```

Despues de copiarse, el archivo original se conserva en `Docs/agents/` pero
queda vacio. Los demas agents se dejan sin cambios porque ya estaban vacios.

---

# Ejecucion Agents DocuCore - 2026-06-05 - Zoom Word 10-500 Workspace

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md`, unico agent activo. Los archivos
`AGENTS-001.md` a `AGENTS-030.md` estaban vacios y quedaron como sin
instrucciones ejecutables.

El agent solicita ajustar el zoom, escala y comportamiento visual del Workspace
de DocuCore usando Microsoft Word como referencia, sin romper el esquema ya
implementado.

## Documentacion revisada

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`

## Agent ejecutado

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se implemento zoom tipo Word de 10% a 500% sobre previews, grid y separadores del Workspace, manteniendo header, herramientas y paneles fuera del escalado. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Tareas detectadas

- Ampliar el rango de zoom del Workspace a minimo 10%, default 100% y maximo
  500%.
- Mantener el zoom como efecto visual exclusivo del area documental.
- Recalcular previews, grid, gaps y separadores segun la escala.
- Permitir scroll natural en zoom alto sin comprimir paginas ni mover controles.
- Persistir el zoom en `localStorage`.
- Documentar criterios y validaciones.

## Tareas ejecutadas

- `WorkspaceClient.tsx` ahora define `WORKSPACE_PREVIEW_ZOOM_MIN = 10`,
  `WORKSPACE_PREVIEW_ZOOM_MAX = 500` y `WORKSPACE_PREVIEW_ZOOM_STEP = 10`.
- El slider y los botones de zoom usan el mismo rango y pasos del agent.
- Los valores heredados en `localStorage` se normalizan al rango valido.
- La escala base conserva la proporcion tipo Word: puntos PDF a pixeles CSS
  (`1pt = 96 / 72px`), por lo que Carta vertical queda cerca de 816px al 100%.
- El grid calcula `--preview-slot-width`, `--page-gap`,
  `--preview-row-gap`, `--workspace-separator-width` y
  `--workspace-separator-height` a partir del zoom.
- Los separadores de bloque escalan con ancho aproximado de 75% de pagina y
  altura limitada entre 24px y 80px.
- La escala de render PDF.js subio para sostener mejor zoom alto sin depender
  solo de escalado CSS.
- Se actualizo la documentacion canonica del Workspace.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-05-docucore-word-zoom/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores ESLint. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; Next.js compilo, valido tipos y genero rutas. |
| `docker restart web-frontend-node` | Aprobado; frontend reiniciado para cargar cambios. |
| `Invoke-WebRequest http://127.0.0.1:3004/workspace` | Aprobado; respuesta `HTTP 200`. |

## Decisiones tomadas

- Se mantuvo la clave existente `docucore.workspace.previewZoom` para no romper
  preferencias actuales; cumple la persistencia requerida por el agent.
- No se escalo la topbar, header, rail de herramientas, panel derecho, tabs ni
  botones flotantes.
- Se permitio scroll natural del area documental para zoom alto en lugar de
  comprimir o deformar las paginas.
- Los separadores quedan proporcionales pero con altura maxima para conservar
  legibilidad y no volver a ocupar espacio excesivo.

## Informacion faltante

- Falta prueba visual automatizada con capturas para zoom 10%, 100%, 300% y
  500% usando PDF mixto vertical/horizontal.
- Falta validacion manual fina en navegador con documento real para confirmar
  la comodidad visual en 300% y 500%.

## Limpieza

`AGENTS-000.md` se copia al historico:

```text
Docs/_archive/agents/2026-06-05-docucore-word-zoom/AGENTS-000.md
```

Despues de copiarse, el archivo original se conserva en `Docs/agents/` pero
queda vacio. Los demas agents se dejan sin cambios porque ya estaban vacios.

---

# Ejecucion agents activos - Tipos de archivo soportados DocuCore

Fecha: 2026-06-04

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-001.md`, ambos
relacionados con la definicion y estandarizacion de tipos de archivo soportados
en DocuCore.

Los agents `AGENTS-002.md` a `AGENTS-030.md` estaban vacios y se consideran
sin instrucciones ejecutables.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/02_projects/docucore/observability-and-diagnostics.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se consolido la lista MVP de formatos activos: PDF, Word, Excel/CSV, imagenes, XML y comprimidos ZIP/RAR/7Z, con reglas especiales para contenedores. |
| `AGENTS-001.md` | Completado | Se creo estandar canonico de estados de soporte, validacion centralizada, formatos PLANNED y regla para no activar formatos solo agregando extension. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no aplican. |

## Tareas ejecutadas

- Se creo `supported-file-types.md` como documento canonico de DocuCore.
- Se agrego `supported-file-types.ts` en Web como fuente central de formatos,
  estados, categorias, MIME esperados y `accept` del input.
- `/upload` ahora bloquea formatos no reconocidos o `PLANNED` antes de agregar
  archivos al Workspace y muestra mensaje amigable.
- Se retiro la promesa visible de cargar texto como formato activo del MVP.
- Se agrego `sevenZip` como tipo de Workspace para `.7z` y se trata como
  contenedor en `archive-mode`.
- Se sincronizaron `zip-extract`, compatibilidad de herramientas y catalogo
  fallback con ZIP/RAR/7Z, DOC/DOCX, XLS/XLSX, BMP y TIFF.
- Document API ahora valida extension, MIME, estado del formato, tamano y
  extensiones peligrosas con codigos normalizados.
- DocuCore API actualizo `allowed_extensions` y catalogo estatico de desarrollo
  para coincidir con el MVP documentado.
- Se enlazo el nuevo estandar desde README, contratos API, readiness de
  herramientas, observabilidad e indices.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/supported-file-types.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/detect-file-type.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/workspace-tool-compatibility.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/get-compatible-tools.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/workspace-mode.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/catalog-fallback.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.API.PY/API.PY.DJANGO.Document/validation/services.py`
- `Docker.API.PY/API.PY.DJANGO.Document/files/views.py`
- `Docker.API.PY/API.PY.DJANGO.DocuCore/core/catalog.py`
- `Docs/02_projects/docucore/supported-file-types.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/02_projects/docucore/observability-and-diagnostics.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas y tipos validados. |
| `python manage.py check` en `API.PY.DJANGO.Document` | Aprobado. |
| `python manage.py check` en `API.PY.DJANGO.DocuCore` | Aprobado. |
| `python -m py_compile validation/services.py files/views.py` | Aprobado. |
| `python -m py_compile core/catalog.py` | Aprobado. |
| Prueba directa `validate_upload` | Aprobado: PDF y XLSX permitidos; TXT devuelve `FILE_TYPE_PLANNED`; EXE devuelve `DANGEROUS_EXTENSION` y `EXTENSION_NOT_ALLOWED`. |
| `git diff --check` en Web/API/Docs tocados | Aprobado; solo avisos LF/CRLF de Git en Windows para Docs. |
| `rg` documental/codigo de `supported-file-types`, `sevenZip`, `FILE_TYPE_PLANNED`, `MIME_TYPE_NOT_ALLOWED` | Aprobado; referencias encontradas en codigo, docs e indices. |

## Decisiones tomadas

- `.txt`, `.rtf`, PowerPoint, OpenDocument, email, EPUB, JSON/YAML y HTML
  quedan `PLANNED`, no cargables publicamente.
- `.7z` se trata como `sevenZip` para no mezclarlo con ZIP en el tipo interno,
  pero usa la herramienta `zip-extract` mientras el contrato de contenedores se
  mantiene unificado.
- `application/octet-stream` se acepta como MIME generico para formatos activos
  porque navegadores y proxies pueden no reportar MIME especifico, pero la
  extension sigue validandose contra el registro central.
- No se habilito edicion directa dentro de ZIP/RAR/7Z; primero debe existir
  extraccion y documento independiente.

## Informacion faltante

- Falta contrato backend productivo para extraer entradas internas de
  ZIP/RAR/7Z y convertirlas en documentos de trabajo independientes.
- Falta endpoint de preview real para Word, Excel, CSV, XML, imagen avanzada y
  contenedores.
- Falta persistir el registro de tipos soportados en DocuCore API/base de datos
  si se quiere administrarlo desde ERP o panel interno.

## Limpieza

`AGENTS-000.md` y `AGENTS-001.md` se copian a:

```text
Docs/_archive/agents/2026-06-04-docucore-supported-file-types/
```

Despues de copiarse, los archivos originales se conservan en `Docs/agents/`
pero quedan vacios. Los agents vacios `002` a `030` se dejan sin cambios.

---

# Ejecucion de agents - DocuCore alcance MVP manual y workspace contextual - 2026-06-02

## Lectura previa

Se siguio el estandar de agents y se revisaron:

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/02_projects/docucore/docker.md`
- `Docs/03_standards/operations/local-port-registry.md`

## Agents detectados

| Agent | Estado inicial | Decision |
|---|---|---|
| `AGENTS-000.md` | Activo | Ejecutar primero por alcance MVP y bloqueo de funciones OCR/IA/indice. |
| `AGENTS-001.md` | Activo | Ejecutar despues porque depende del modelo de herramientas permitido por tipo/cantidad de documentos. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | No ejecutar; archivos vacios. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se retiro de las superficies MVP la promesa de OCR, IA, indexacion, capitulos, marcadores generados y division inteligente. `pdf-split` quedo limitado a paginas, bloques visuales y cada N paginas. |
| `AGENTS-001.md` | Completado | El workspace ya calcula herramientas por tipo y cantidad de documentos; `pdf-merge` solo aparece con 2 o mas PDFs y sin mezcla de tipos. La configuracion queda vacia hasta elegir herramienta. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | No aplican en esta corrida. |

## Tareas ejecutadas

- Se reemplazaron modos de `Dividir PDF` por `Paginas`, `Bloques visuales` y
  `Cada N paginas`.
- Se elimino la accion visible `OCR por pagina` del menu de pagina.
- Se dejo `Marcadores PDF nativos` como pendiente documentado hasta existir
  lectura real de bookmarks embebidos.
- Se agrego normalizacion de borradores antiguos que pudieran traer modo
  `sections`, redirigiendolos a `visual`.
- Se agrego creacion local de bloques por intervalo simple de 5, 10 o 20
  paginas.
- Se retiro OCR como capacidad activa en `/upload` y textos visibles de home,
  API, resultados, workflows y expediente.
- Se ajusto el panel de configuracion para mostrar estado vacio hasta que el
  usuario seleccione una herramienta.
- Se uso la lista completa de documentos del workspace para calcular
  compatibilidad de herramientas.
- Se documento la regla en `feature-visibility-map.md`,
  `tool-readiness-and-configuration.md` y `frontend-navigation-and-ux.md`.
- Se preservo la correccion previa de hidratacion del portal flotante y la
  persistencia multi-documento para mostrar varios documentos en proyectos.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/api/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/casefile/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/pdf-a-word/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/results/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workflows/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace-drafts.ts`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| `docker compose -f Docker.API.PY/docker-compose.docucore.yml config --quiet` | Aprobado. |
| `docker compose -f Docker.WEB.NJ/docker-compose.docucore.yml config --quiet` | Aprobado. |
| Health local DocuCore posterior al arranque focalizado | Aprobado: web `3004`, Document `8011`, DocuCore API `8012` y Gateway `8013` respondieron `200`. |
| Busqueda textual de promesas OCR/IA/indices en pantallas tocadas | Aprobado; solo queda mension controlada de OCR fuera del MVP en PDF escaneado y marcadores nativos como pendiente. |

## Decisiones tomadas

- No se implemento OCR, IA, indices ni analisis semantico porque el agent los
  declara fuera de Fase 1.
- No se mostro configuracion generica cuando no hay herramienta activa; se
  muestra un estado vacio accionable.
- `pdf-merge` se oculta con un solo PDF o mezcla de tipos para evitar acciones
  incompatibles.
- Se mantuvo el estado interno `sections` como estructura tecnica de bloques
  para no romper borradores existentes ni aumentar el alcance del cambio.
- Los compose focalizados de DocuCore creados en la tarea operativa previa se
  validaron porque forman parte del estado actual para probar la web.

## Informacion faltante

- Falta contrato backend `DocumentProject` productivo para manejar multiples
  documentos y orden multiarchivo de forma persistente.
- Falta lectura real de bookmarks PDF nativos.
- Falta contrato backend para exportar bloques visuales como archivos
  independientes.
- Falta definir si el workspace migrara de drawers a paneles permanentes
  izquierda/centro/derecha en una fase posterior; por ahora se conserva el
  patron actual para no romper ergonomia existente.

## Limpieza

`AGENTS-000.md` y `AGENTS-001.md` se copian a:

```text
Docs/_archive/agents/2026-06-02-docucore-mvp-workspace-tools/
```

Despues de copiarse, los archivos originales se conservan en `Docs/agents/`
pero quedan vacios. Los agents `002` a `030` ya estaban vacios y permanecen
como placeholders.

---

# Reporte de ejecucion Agents - Investigacion juridica LexNova

Fecha: 2026-05-18

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md` en orden numerico. Los archivos
`AGENTS-001.md` a `AGENTS-030.md` estaban vacios y no tenian tareas
ejecutables.

Antes de documentar se reviso:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`

## Resultado

Se agrego `Docs/02_projects/lexnova/legal-domain-research.md` como documento
canonico complementario para materias, procedimientos, documentos, actores,
matrices, normas versionables, plazos, evidencia, IA, revision humana, riesgos,
roadmap y fuentes oficiales.

Tambien se actualizaron:

- `Docs/02_projects/lexnova/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `rg` de `legal-domain-research` en README, indices, mapa y reporte | Correcto. |
| `python manage.py check` en `Docker.API.PY/API.PY.DJANGO.LexNova` | Correcto, sin issues. |
| Limpieza de `Docs/agents/AGENTS-*.md` | Correcto, todos quedaron en 0 bytes. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Investigacion juridica LexNova documentada y enlazada a indices canonicos. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Levantar legislacion estatal y organismos de derechos humanos por entidad.
- Validar plazos por supuesto, norma, excepcion y calendario de autoridad.
- Implementar catalogos versionables en base de datos.
- Definir ingestion oficial de jurisprudencia/tesis del SJF.
- Cerrar OCR, storage, cifrado, retencion, hash y cadena de custodia final.

---

# Reporte de ejecucion Agents - Document Intelligence MVP

Fecha: 2026-05-22

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md`. El agent solicitaba iniciar una API
documental inteligente reusable, no exclusiva de LexNova, capaz de guardar
originales, extraer texto, clasificar por perfiles, segmentar documentos,
generar indice y permitir revision humana.

`AGENTS-001.md` a `AGENTS-030.md` estaban vacios.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/lexnova/process-tracking.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/database.md`

## Resultado

- `API.PY.DJANGO.Document` ahora tiene modelos MVP para:
  - `DocumentSections`
  - `DocumentIndexes`
  - `HumanReviewCorrections`
- Se agrego migracion `jobs/migrations/0002_documentsection_documentindex_humanreviewcorrection_and_more.py`.
- Se implementaron herramientas MVP:
  - `text-extraction`
  - `document-classification`
  - `document-segmentation`
  - `document-index`
  - `indexed-pdf-export`
- Se agregaron endpoints:
  - `GET /api/files/{file_id}/index/`
  - `POST /api/process/reviews/`
- Se ampliaron extensiones permitidas para texto, audio y video.
- `API.PY.DJANGO.LexNova.Gateway` ahora expone proxy
  `document-intelligence/*` hacia `API.PY.DJANGO.Document`, incluyendo soporte
  multipart basico para upload.
- Se documento `Docs/02_projects/docucore/document-intelligence.md` como
  canonico generico de la capacidad reusable.

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.Document` | `python manage.py makemigrations jobs` | Correcto. |
| `API.PY.DJANGO.Document` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Document` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.LexNova.Gateway` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova.Gateway` | `python -m compileall .` | Correcto. |
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto. |
| Docs/API/Gateway | `git diff --check` | Correcto. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Document Intelligence MVP implementado en Document API, expuesto por LexNova Gateway y documentado. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Implementar OCR real con Tesseract/Azure/Google/AWS.
- Implementar transcripcion real para audio/video.
- Detectar paginas y secciones reales dentro de PDFs grandes.
- Generar PDF indexado real.
- Conectar el flujo desde la UI LexNova al endpoint de upload/proceso cuando se
  cierre el contrato de caso y permisos.
- Persistir aprendizaje supervisado a partir de correcciones humanas.

## Limpieza

Despues de implementar, documentar y validar, se limpio `AGENTS-000.md`.

---

# Reporte de ejecucion - LexNova carga PDF e indice documental

Fecha: 2026-05-22

## Alcance

Se reviso la documentacion canonica solicitada y se conecto el Centro de Carga
Documental de LexNova a la capacidad MVP de Document Intelligence. La pantalla
ya no se limita a un input de archivo: ahora presenta un boton explicito para
elegir PDF/archivo, un boton de subida y procesamiento, estado de carga y el
indice documental generado.

## Documentos revisados

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`
- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/02_projects/lexnova/architecture.md`

## Resultado

- Se actualizo `WEB.NJ.NEXT.LexNova/app/dashboard/modules/cases/upload/page.tsx`.
- Se agrego boton visible `Elegir PDF o archivo`.
- Se agrego boton `Subir y generar indice`.
- La pantalla sube el archivo por
  `/document-intelligence/files/upload/` usando el Gateway LexNova.
- Despues dispara `/document-intelligence/process/document-index/`.
- La respuesta muestra archivo guardado, estado y un indice navegable con tipo,
  paginas, confianza y aviso de revision humana.
- Los proveedores externos quedan indicados como preparados, pero todavia no
  conectados.

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto. |

## Informacion faltante

- Contrato final para asociar el upload a un `case_id` real.
- Flujo de autenticacion/permisos definitivo para permitir o bloquear cargas
  por perfil.
- Integracion real con Drive, Dropbox, Mega y OneDrive.
- Motor OCR/transcripcion productivo; el MVP actual genera estructura por
  reglas y deja pendiente el procesamiento real pesado.

## Decisiones

- Mantener el frontend simple: el usuario solo selecciona origen y archivo.
- Mantener la clasificacion, OCR, segmentacion e indice en Document
  Intelligence, consumido por LexNova via Gateway.
- Mostrar indice web primero; PDF indexado queda como exportable futuro.

---

# Reporte de ejecucion Agents - LexNova Document Intelligence

Fecha: 2026-05-22

## Alcance

Se ejecutaron `Docs/agents/AGENTS-000.md`, `AGENTS-001.md` y
`AGENTS-002.md` en orden numerico. Los tres agents trataban el mismo tema:
OCR, clasificacion documental, segmentacion, indice automatico, API documental
separada y revision humana para LexNova.

Los archivos `AGENTS-003.md` a `AGENTS-030.md` estaban vacios y no tenian
tareas ejecutables.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/process-tracking.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/02_projects/lexnova/legal-domain-research.md`
- `Docs/01_core_erp/apis/15_documents_api.md`
- `Docs/01_core_erp/database/14_documents_model.md`
- `Docs/01_core_erp/architecture/07_project_api_pattern.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/architecture.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/database.md`
- `Docs/02_projects/docucore/tools-catalog.md`

## Resultado

- Se creo `Docs/02_projects/lexnova/document-intelligence.md` como documento
  canonico de OCR, clasificacion, segmentacion, indice web, PDF indexado
  opcional, revision humana y frontera con `API.PY.DJANGO.Document`.
- Se actualizo LexNova para establecer que el usuario final solo selecciona el
  origen del archivo; el tipo documental lo propone Document Intelligence y lo
  valida un perfil autorizado.
- Se actualizo DocuCore/Documents para reconocer las capacidades reutilizables
  `document-classification`, `document-segmentation`, `document-index` e
  `indexed-pdf-export`.
- Se actualizo el Centro de Carga Documental web para eliminar la seleccion de
  tipo de evidencia del usuario final y dejar solo origen/proveedor.
- Se enlazo el nuevo documento en `README.md`, `master-index.md`,
  `master-index.yaml` y `navigation-map.md`.

## Validaciones

| Validacion | Resultado |
|---|---|
| `rg "document-intelligence" Docs/02_projects/lexnova Docs/_meta` | Correcto. |
| `rg "Tipo de evidencia|selectedType|evidenceTypes" app/dashboard/modules/cases/upload/page.tsx` | Correcto, sin coincidencias. |
| `rg "Document Intelligence|document-classification|document-index" ...` | Correcto. |
| `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Correcto, build completo. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Regla oficial de IA documental, OCR, clasificacion, segmentacion, indice y revision humana documentada. |
| `AGENTS-001.md` | Completado | Ubicacion backend/API documental separada documentada y enlazada con LexNova/DocuCore. |
| `AGENTS-002.md` | Completado | Decision de API Documentos reutilizable, indice web primero y PDF indexado opcional documentada. |
| `AGENTS-003.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Implementar contrato real entre `API.PY.DJANGO.LexNova` y
  `API.PY.DJANGO.Document`.
- Definir proveedor OCR inicial y dependencias productivas.
- Implementar colas asincronas, reintentos, retencion, cifrado y cadena de
  custodia final.
- Crear pantallas internas de pendientes de clasificacion y revision
  documental cuando existan endpoints reales.

## Limpieza

Despues de documentar y validar la corrida, se limpiaron los agents ejecutados
`AGENTS-000.md`, `AGENTS-001.md` y `AGENTS-002.md`.

---

# Reporte de ejecucion Agents - Verificacion sin instrucciones nuevas

Fecha: 2026-05-20

## Alcance

Se ejecuto la revision de `Docs/agents/AGENTS-*.md` en orden numerico,
siguiendo la instruccion de ejecutar solo tareas no completadas y no modificar
funcionalidad fuera del alcance del agent.

Todos los archivos `AGENTS-000.md` a `AGENTS-030.md` estan vacios con longitud
`0` bytes, por lo que no habia instrucciones ejecutables nuevas.

## Documentos revisados

Documentos obligatorios:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`

Documentacion canonica relacionada:

- No se leyo documentacion adicional de proyecto porque ningun agent activo
  definio proyecto, modulo, API, frontend, integracion o tarea concreta.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones nuevas | Todos los archivos estan vacios; no habia tareas ejecutables pendientes. |

## Validaciones

| Validacion | Resultado |
|---|---|
| Revision de longitudes de `Docs/agents/AGENTS-*.md` | Correcto; todos reportan `0` bytes. |
| Existencia de documentos obligatorios | Correcto. |
| `rg` en `Docs/agents/EXECUTION_REPORT.md` | Correcto; se verifico historial previo y estado recurrente de agents vacios. |

No se ejecutaron builds, lint ni tests de aplicacion porque no se modifico
codigo ni documentacion de producto; el unico cambio fue este registro de
ejecucion.

## Documentos fuera

- No se busco en todo `Docs`.
- No se leyeron documentos canonicos de proyectos como LexNova, Fiscora,
  Tecno Telec, DocuCore u otros, porque no hubo agent con alcance activo.
- No se modificaron ni archivaron los archivos `AGENTS-*.md`.

## Informacion faltante o ambigua

- Los indices documentales siguen listando agents con titulos historicos, pero
  los archivos fisicos actuales estan vacios. Para ejecutar nuevas tareas se
  requiere volver a escribir instrucciones dentro de uno o mas `AGENTS-*.md`.

## Decisiones tomadas

- No se implemento ningun cambio funcional.
- No se revirtio ni limpio trabajo existente.
- Se mantuvieron los agents vacios como slots futuros.
- Se documento esta corrida en este reporte para dejar trazabilidad.

---

# Reporte de ejecucion Fiscora - Cierre documental MVP

Fecha: 2026-05-20

## Alcance

Se realizo primero el commit y push de cambios locales pendientes en los
repositorios relacionados. Despues se completo el cierre documental disponible
para Fiscora, ya que los archivos `Docs/agents/AGENTS-000.md` a
`AGENTS-030.md` siguen vacios y no contienen instrucciones ejecutables nuevas.

## Documentos revisados

Indice documental obligatorio:

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`

Documentacion canonica relacionada:

- `Docs/02_projects/fiscora/README.md`
- `Docs/02_projects/fiscora/platform-overview.md`
- `Docs/02_projects/fiscora/architecture.md`
- `Docs/02_projects/fiscora/api-contracts.md`
- `Docs/02_projects/fiscora/repositories.md`
- `Docs/02_projects/fiscora/security.md`
- `Docs/02_projects/fiscora/database/cfdi-data-model.md`
- `Docs/02_projects/fiscora/animations/animation-guidelines.md`
- `Docs/02_projects/fiscora/frontend/animation-preview.md`
- `Docs/02_projects/README.md`
- `Docs/02_projects/_ecosystem/00_ecosystem_overview.md`
- `Docs/02_projects/_ecosystem/01_company_portfolio.md`

## Documentos actualizados o creados

Se crearon:

- `Docs/02_projects/fiscora/tasks/00_mvp_scope.md`
- `Docs/02_projects/fiscora/tasks/01_pending_tasks.md`
- `Docs/02_projects/fiscora/decisions/adr_0001_api_boundaries.md`

Se actualizaron:

- `Docs/02_projects/fiscora/README.md`
- `Docs/02_projects/fiscora/platform-overview.md`
- `Docs/02_projects/fiscora/architecture.md`
- `Docs/02_projects/fiscora/api-contracts.md`
- `Docs/02_projects/fiscora/security.md`
- `Docs/02_projects/fiscora/frontend/animation-preview.md`
- `Docs/02_projects/README.md`
- `Docs/02_projects/_ecosystem/00_ecosystem_overview.md`
- `Docs/02_projects/_ecosystem/01_company_portfolio.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

## Decisiones tomadas

- Fiscora queda registrado como producto SaaS fiscal independiente dentro del
  ecosistema.
- El frontend consume solo `API.PY.DJANGO.Fiscora.Gateway`.
- `API.PY.DJANGO.Fiscal` queda como nucleo reutilizable para CFDI, SAT, XML,
  jobs, paquetes, reportes y auditoria fiscal.
- `API.PY.DJANGO.Fiscora` queda limitado a producto comercial, planes, creditos
  y preferencias.
- `API.PY.DJANGO.Document` queda como responsable de render visual, PDF,
  plantillas y transformaciones documentales.
- La primera version puede iniciar con carga manual XML para reducir riesgo si
  la conexion SAT real no esta lista.

## Informacion faltante o ambigua

- Cliente prioritario del MVP: contador, PyME, persona fisica o empresa
  multiempresa.
- Limites exactos del plan gratis.
- Uso final de creditos por operacion.
- Estrategia definitiva para credenciales SAT.
- Politica final de retencion y eliminacion de XML/PDF.
- Integracion real SAT y parser CFDI completo.

## Documentos fuera

- No se reviso todo `Docs`.
- No se tocaron proyectos no relacionados con Fiscora salvo el portafolio y
  ecosistema canonico.
- No se modificaron APIs Fiscora/Fiscal/Gateway en esta pasada; solo se
  validaron.

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.Fiscal` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Fiscora` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Fiscora.Gateway` | `python manage.py check` | Correcto, sin issues. |
| `WEB.NJ.NEXT.Fiscora` | `npm run build` | Correcto. |
| `Docker.API.PY` | `docker compose config` | Correcto. |
| `Docker.WEB.NJ` | `docker compose config` | Correcto. |
| Documentacion | `rg` de `fiscora/Fiscora` en indices y canones actualizados | Correcto. |

## Publicacion previa realizada

| Repositorio | Rama | Commit | Resultado |
|---|---|---|---|
| `MexIngSoft/Docs` | `feature/lex-nova-tech-identification` | `0e46a39` | Push correcto. |
| `MexIngSoft/Docker.API.PY` | `feature/lex-nova-tech-identification` | `d2489e8` | Push correcto. |
| `MexIngSoft/Docker.WEB.NJ` | `main` | `bca3ddf` | Push correcto. |
| `MexIngSoft/WEB.NJ.NEXT.Fiscora` | `main` | `3266cb5` | Push correcto. |

---

# Reporte de ejecucion - LexNova UI publica y autenticacion

Fecha: 2026-05-19

## Alcance

Se modernizaron las pantallas publicas y de autenticacion de
`WEB.NJ.NEXT.LexNova` para alinearlas con la identidad visual del inicio y del
dashboard: login, registro, activacion, recuperacion de contrasena,
confirmacion de contrasena, reenvio de activacion, callbacks sociales y enlaces
publicos principales.

Los archivos `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md`
estaban vacios, por lo que no habia tareas numeradas pendientes que ejecutar.

## Documentos revisados

- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/process-tracking.md`
- `Docs/03_standards/frontend/README.md`
- `Docs/03_standards/frontend/nextjs-project-standard.md`

## Resultado

- Se agrego `components/auth/AuthFrame.tsx` como marco comun para flujos de
  identidad, con narrativa de Gateway, evidencia, permisos y seguimiento.
- Se modernizaron `app/auth/login`, `app/auth/register`,
  `app/activation/[uid]/[token]`, `app/password-reset`,
  `app/password-reset/[uid]/[token]`, `app/auth/resend`,
  `app/auth/forgot-password`, `app/auth/reset/[uid]/[token]`,
  `app/auth/google` y `app/auth/facebook`.
- Se modernizaron los enlaces publicos `servicios`, `planes`,
  `como-funciona` y `contacto` para que usen el mismo lenguaje visual sobrio de
  Lex Nova Tech.
- Se limpiaron textos mojibake visibles en las pantallas tocadas.
- Se mantuvo la logica existente de hooks, Redux y Gateway para no cambiar el
  contrato de autenticacion.

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Correcto, build completo. |
| `rg` de caracteres mojibake en pantallas tocadas | Correcto, sin coincidencias. |
| Revision de `Docs/agents/AGENTS-*.md` | Correcto, todos en 0 bytes. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Fuera de alcance

- No se recorrieron documentos no canonicos fuera de los indices solicitados.
- No se implemento backend nuevo ni cambios de contratos de Auth/Gateway.
- No se levantaron pruebas visuales con navegador porque la validacion
  disponible y suficiente para esta pasada fue `npm run build`.

---

# Reporte de ejecucion Agents - LexNova expediente, participantes y acceso

Fecha: 2026-05-19

## Alcance

Se ejecutaron `Docs/agents/AGENTS-*.md` en orden numerico despues de revisar:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/auth-seed.md`
- `Docs/02_projects/lexnova/process-tracking.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | La optimizacion de dashboard/casos ya estaba implementada en la web: resultados absorbidos como detalle del caso, `/dashboard/modules/home` redirige a `/dashboard`, carga de evidencia simplificada, perfil minimo, usuarios con nombre/apellidos y seguimiento dentro del detalle del caso. Se valido nuevamente. |
| `AGENTS-001.md` | Completado | Se implemento y documento el MVP de participantes del expediente: separacion `User`/`Person`/`CaseParticipant`, autorizaciones, privacidad por documento y auditoria de accesos. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Implementacion realizada

### API LexNova

Se actualizo:

```text
Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace/models.py
Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace/admin.py
Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace/views.py
Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace/urls.py
```

Se creo:

```text
Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace/migrations/0004_caseparticipant_casedocumentaccesspolicy_and_more.py
```

Tablas MVP agregadas:

- `Cases.CaseParticipants`
- `Cases.CaseParticipantAuthorizations`
- `Documents.CaseDocumentAccessPolicies`
- `Cases.CaseAccessAuditEvents`

Endpoint MVP:

```text
GET /api/participants/
GET /api/participants/?case_id={id}
```

### Gateway LexNova

Se actualizo:

```text
Docker.API.PY/API.PY.DJANGO.LexNova.Gateway/gateway/views.py
Docker.API.PY/API.PY.DJANGO.LexNova.Gateway/gateway/urls.py
```

Ruta expuesta:

```text
GET /api/lexnova/participants/
GET /api/lexnova/participants/?case_id={id}
```

### Documentacion

Se creo:

```text
Docs/02_projects/lexnova/case-participants-access.md
```

Se actualizo:

```text
Docs/02_projects/lexnova/README.md
Docs/02_projects/lexnova/legal-process-data-model.md
Docs/_meta/master-index.md
Docs/_meta/master-index.yaml
Docs/_meta/navigation-map.md
```

## Informacion faltante documentada

Quedaron documentados como pendientes productivos:

- Validacion juridica de identidad para autorizar participantes.
- Flujo final de invitaciones, revocaciones y accesos temporales.
- Evidencia/consentimiento para acceso familiar o representacion.
- Matriz final de campos visibles por perfil.
- Retencion, exportacion y alertas de auditoria sensible.
- Catalogo final de documentos sensibles por materia y rol procesal.

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.LexNova` | `python manage.py makemigrations legal_workspace` | Correcto; genero `0004_caseparticipant_casedocumentaccesspolicy_and_more.py`. Aviso no bloqueante: PostgreSQL local no estaba levantado para verificar historial. |
| `API.PY.DJANGO.LexNova` | `python manage.py check` con `DJANGO_SECRET_KEY`, `DEVELOPMENT_MODE=True` y `AUTH_API_VERIFY_URL` locales | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.LexNova.Gateway` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova.Gateway` | `python -m compileall .` | Correcto. |
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto. Mantiene warnings preexistentes por uso de `<img>` en pantallas auth/reset. |

## Limpieza

Despues de completar la ejecucion, se limpiaron los archivos `AGENTS-000.md` y
`AGENTS-001.md`. Los archivos `AGENTS-002.md` a `AGENTS-030.md` ya estaban
vacios.

## Pendientes

- Ejecutar migraciones contra PostgreSQL cuando el servicio local este
  levantado.
- Implementar escrituras productivas para participantes, autorizaciones,
  politicas de documento y auditoria.
- Conectar la vista web de detalle del caso con el endpoint real de
  participantes cuando se cierre el contrato visual.

---

# Reporte de ejecucion - Lex Nova Gateway Failed to fetch

Fecha: 2026-05-18

## Alcance

Se atendio el error de login de Lex Nova:

`No se pudo conectar con el Gateway de Lex Nova. Revisa que API.PY.DJANGO.LexNova.Gateway este corriendo en el puerto configurado. Detalle tecnico: TypeError: Failed to fetch`

Antes de implementar se reviso el indice documental y la documentacion canonica relacionada:

- `Docs/README.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/local-dependency-runbook.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/01_core_erp/architecture/07_project_api_pattern.md`

## Diagnostico

La web de Lex Nova heredaba la variable generica:

`NEXT_PUBLIC_GATEWAY_BASE_URL=http://api-backend-python:8008`

Ese valor apunta a otro gateway y usa un hostname interno de Docker que el navegador no puede resolver. Por eso el login del navegador terminaba en `TypeError: Failed to fetch`, aunque el stack Docker estuviera levantado.

## Cambios aplicados

- `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/lib/gateway.ts`: ahora Lex Nova prioriza `NEXT_PUBLIC_LEXNOVA_GATEWAY_BASE_URL`, ignora el gateway generico si apunta a `api-backend-python` o al puerto `8008`, y cae a `http://localhost:8017/api/lexnova` en entorno local.
- `Docker.WEB.NJ/docker-compose.yml`: se agrego `NEXT_PUBLIC_LEXNOVA_GATEWAY_BASE_URL=http://localhost:8017/api/lexnova` para el contenedor web.
- `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/.env.local` y `.env.local.example`: se alinearon con la variable especifica de Lex Nova.
- `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/README.md`: se documento el uso correcto de variables Gateway.
- `Docs/02_projects/lexnova/architecture.md`: se documento la variable canonica de Gateway para la web.
- `Docs/02_projects/lexnova/local-dependency-runbook.md`: se documento la relacion correcta web-gateway y la excepcion de la variable generica compartida.

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Correcto. Solo quedaron advertencias no bloqueantes de `<img>` en pantallas auth/reset. |
| `docker compose -f Docker.WEB.NJ/docker-compose.yml config` | Correcto. Incluye `NEXT_PUBLIC_LEXNOVA_GATEWAY_BASE_URL=http://localhost:8017/api/lexnova`. |
| `GET http://localhost:8017/api/lexnova/health/` | Correcto, `200`, `{"service":"LexNovaGateway","status":"ok"}`. |
| Preflight CORS desde `http://localhost:3002` a `/auth/jwt/create/` | Correcto, `200` y `access-control-allow-origin: http://localhost:3002`. |
| Login POST contra Gateway con usuario de prueba | Correcto, `200` y respuesta JWT. |
| `GET http://localhost:3002/auth/login` | Correcto, `200` con CSS cargado. |
| `Docs/03_standards/operations/scripts/Start-WorkspaceDocker.ps1 -WaitSeconds 0 -RunDjangoChecks` | Correcto. Webs, APIs, Gateway Lex Nova, base de datos y checks Django saludables. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Limpios / sin tarea pendiente | Todos los archivos `AGENTS-*.md` estan en 0 bytes; no habia tareas ejecutables adicionales. |

## Pendientes y fuera de alcance

- No se hizo busqueda completa en todo `Docs`; se siguio el indice documental y documentos canonicos relacionados.
- No se elimino `NEXT_PUBLIC_GATEWAY_BASE_URL` del compose compartido porque otros proyectos pueden depender de esa variable generica.
- No se cambiaron contratos de Auth ni credenciales; solo se corrigio el enrutamiento web-gateway de Lex Nova.
- Docker Compose reporto advertencias de contenedores orfanos del proyecto compartido; no bloquean el arranque ni las validaciones.

---

# Reporte de ejecucion Agents - Orquestador Docker local

Fecha: 2026-05-18

## Alcance

Se reviso la queja de que el script operativo no cargaba todas las APIs/webs.
La verificacion mostro que el contenedor API si tenia cargados todos los
servicios esperados, pero la validacion anterior podia interpretarse mal porque
varias APIs no exponen pagina raiz en `/` y devuelven `404` aun estando sanas.

Los archivos `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md` estaban
vacios y no tenian tareas ejecutables nuevas.

## Documentos revisados

Primero se paso por el indice documental:

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`

Documentos canonicos relacionados:

- `Docs/03_standards/docker.md`
- `Docs/03_standards/operations/docker-recovery-runbook.md`
- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/03_standards/operations/runbook.md`
- `Docs/03_standards/frontend/shared-docker-frontend-architecture.md`
- `Docs/03_standards/operations/git-repository-map.md`

Quedo fuera:

- No se busco en todo `Docs`.
- No se ejecuto el nuevo script de arranque porque la instruccion previa fue
  entregar codigo para ejecutarlo.
- No se depuro Fiscora web a fondo; solo se registro el timeout observado en
  `3005`.

## Resultado

Se creo:

- `Docs/03_standards/operations/scripts/Start-WorkspaceDocker.ps1`

El script:

- Levanta `Docker.DB.PG`, `Docker.API.PY`, `Docker.WEB.NJ` y
  `Docker.SW.Nginx` en orden.
- Puede liberar conflictos de puertos con `-ReleasePorts`.
- Puede reparar CSS Next.js con `-RepairCss`.
- Puede correr checks Django criticos con `-RunDjangoChecks`.
- Valida procesos Uvicorn, puertos TCP y rutas HTTP propias cuando existen.
- Evita marcar una API como caida solo porque `GET /` responde `404`.

Se actualizo:

- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/03_standards/docker.md`
- `Docs/03_standards/operations/docker-recovery-runbook.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `docker ps` | Correcto; `db-postgresql`, `api-backend-python`, `web-frontend-node` y `nginx` arriba. |
| Procesos dentro de `api-backend-python` | Correcto; Uvicorn activo en `8000-8017`. |
| Directorios bajo `/usr/src/api` | Correcto; existen `auth`, `catalog`, `inventory`, `lexnova`, `lexnova_gateway`, `docucore`, `fiscora`, `fiscal`, `tecnotelec` y demas proyectos esperados. |
| `GET http://localhost:8017/api/lexnova/health/` | Correcto, `200`. |
| `GET http://localhost:8003/api/cases/` sin sesion | Correcto, `403`; la API LexNova esta viva y protegida. |
| `POST http://localhost:8000/api/auth/jwt/verify/` sin token | Correcto, `400`; Auth responde y valida entrada. |
| `GET /` en APIs | Varias responden `404` por diseno; no es indicador de API caida. |
| Web `3000`, `3001`, `3002`, `3004` | Respondieron `200` con assets CSS disponibles durante la comprobacion. |
| Web `3005` | Timeout observado; queda como pendiente separado de LexNova. |
| Sintaxis PowerShell de `Start-WorkspaceDocker.ps1` | Correcto, sin errores de parser. |
| Limpieza de `Docs/agents/AGENTS-*.md` | Correcto; todos siguen en 0 bytes. |
| Revalidacion final `docker ps` | Bloqueada; Docker Desktop devolvio `500 Internal Server Error` aunque WSL reporta `docker-desktop` en ejecucion. |
| Revalidacion de puertos web | `3000`, `3001`, `3002`, `3004` y `3005` aparecen escuchando por Docker/WSL. |
| Revalidacion HTTP de webs | `3000`, `3001`, `3002`, `3004` y `3005` devolvieron timeout; puertos publicados no equivalen a webs sanas. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones nuevas | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Investigar `WEB.NJ.NEXT.Fiscora` en `3005`, porque el puerto publicado quedo
  con timeout en una prueba directa.
- Reiniciar Docker Desktop si vuelve a responder `500 Internal Server Error` al
  consultar `docker ps` o `docker version`.
- Despues de reiniciar Docker Desktop, ejecutar
  `Start-WorkspaceDocker.ps1 -RepairCss -RunDjangoChecks` para confirmar que las
  webs Next.js respondan por HTTP y no solo tengan puertos publicados.
- Ejecutar `Start-WorkspaceDocker.ps1` manualmente cuando se quiera validar el
  flujo completo desde cero.

## Revalidacion y reparacion posterior

Se reinicio Docker Desktop y WSL por `500 Internal Server Error` en el daemon de
Docker. Despues se reconstruyo `Docker.WEB.NJ` y se corrigio Fiscora:

- `Docker.WEB.NJ/.dockerignore` ahora excluye `.git`, `node_modules`, `.next` y
  `.env.local` de DocuCore y Fiscora.
- `Docker.WEB.NJ/Dockerfile` ejecuta `npm run build` para
  `WEB.NJ.NEXT.Fiscora`.
- `Docker.WEB.NJ/start.sh` levanta Fiscora con `next build` + `next start` en
  `3005`, evitando la compilacion en caliente que dejaba timeouts.
- `Start-WorkspaceDocker.ps1` espera `150` segundos por defecto y valida HTTP
  con `curl.exe`.

Validacion final:

| Validacion | Resultado |
|---|---|
| `docker ps` | Correcto; `db-postgresql`, `api-backend-python`, `web-frontend-node` y `nginx` arriba. |
| Web `3000` JobCron | `200`, CSS disponible. |
| Web `3001` TecnoTelec | `200`, CSS disponible. |
| Web `3002` LexNova login | `200`, CSS disponible. |
| Web `3004` DocuCore | `200`, CSS disponible. |
| Web `3005` Fiscora | `200`, CSS disponible. |
| API Auth `8000` | `400` esperado al verificar token vacio. |
| API LexNova `8003` | `403` esperado sin sesion. |
| LexNova Gateway `8017` | `200` en `/api/lexnova/health/`. |
| `Start-WorkspaceDocker.ps1 -WaitSeconds 0` | Correcto; procesos, TCP y HTTP en verde. |
| `python manage.py check` en `auth`, `lexnova`, `lexnova_gateway` | Correcto, sin issues. |

Pendiente anterior resuelto: `WEB.NJ.NEXT.Fiscora` ya responde en `3005`.

---

# Reporte de ejecucion Agents - Estabilidad web Docker

Fecha: 2026-05-18

## Alcance

Se atendio la caida/intermitencia del contenedor `web-frontend-node`, donde los
frontends podian dejar de responder aunque el contenedor siguiera publicado en
puertos `3000`, `3001`, `3002`, `3004` y `3005`.

Los archivos `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md` estaban
vacios y no tenian tareas ejecutables nuevas.

## Causa encontrada

- Fiscora en modo Next.js runtime dentro del contenedor compartido provocaba
  timeouts y, durante builds largos, Docker Desktop llegaba a devolver
  `500 Internal Server Error` o `EOF` desde BuildKit.
- El contenedor web no tenia healthcheck para marcar cuando una web interna
  dejaba de responder.
- `start.sh` levantaba procesos en background sin supervisor explicito por
  proyecto.

## Reparacion

Se actualizo:

- `Docker.WEB.NJ/start.sh`
- `Docker.WEB.NJ/docker-compose.yml`
- `Docker.WEB.NJ/Dockerfile`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora/next.config.ts`
- `Docker.WEB.NJ/README.md`
- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/03_standards/operations/scripts/Start-WorkspaceDocker.ps1`

Cambios principales:

- JobCron, TecnoTelec, LexNova y DocuCore corren con loop de autoreinicio.
- Fiscora se exporta como sitio estatico (`output: "export"`) y se sirve en
  `3005` con un servidor Node ligero.
- `Dockerfile` copia `WEB.NJ.NEXT.Fiscora/out` a
  `/usr/src/web/fiscora-static`, evitando compilar Fiscora dentro de Docker.
- `docker-compose.yml` agrega healthcheck para las cinco webs.
- `Start-WorkspaceDocker.ps1` reconoce Fiscora como servicio estatico y valida
  proceso/TCP/HTTP correctamente.

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run build` en `WEB.NJ.NEXT.Fiscora` | Correcto; genero export estatico. |
| `docker compose -f Docker.WEB.NJ/docker-compose.yml up -d --build web-frontend-node` | Correcto; imagen construida y contenedor iniciado. |
| `docker ps` | Correcto; `web-frontend-node` quedo `healthy`. |
| `http://localhost:3000/` | `200`, CSS disponible. |
| `http://localhost:3001/` | `200`, CSS disponible. |
| `http://localhost:3002/auth/login` | `200`, CSS disponible. |
| `http://localhost:3004/` | `200`, CSS disponible. |
| `http://localhost:3005/` | `200`, CSS disponible. |
| `Start-WorkspaceDocker.ps1 -WaitSeconds 0` | Correcto; 18 APIs y 5 webs en verde. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones nuevas | Archivos vacios; no habia tareas ejecutables. |

---

# Reporte de ejecucion Agents - Lex Nova runtime y CSS

Fecha: 2026-05-18

## Alcance

Se confirmaron puertos reservados, asignaciones de APIs/webs, arranque local de
Lex Nova y diagnostico del problema recurrente de CSS en Next.js.

Los archivos `Docs/agents/AGENTS-000.md` a `AGENTS-030.md` estaban vacios y no
tenian tareas ejecutables nuevas.

Antes de implementar se reviso:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/03_standards/docker.md`
- `Docs/03_standards/operations/docker-recovery-runbook.md`
- `Docs/03_standards/frontend/shared-docker-frontend-architecture.md`
- `Docs/02_projects/lexnova/local-dependency-runbook.md`
- `Docs/02_projects/lexnova/architecture.md`

## Resultado

Se levanto la cadena local requerida por Lex Nova:

```text
PostgreSQL -> Auth -> LexNova API -> LexNova Gateway -> LexNova Web
```

Se confirmo que los puertos reservados estan en uso por Docker/WSL:

- `80`: Nginx.
- `5432`: PostgreSQL.
- `3000-3002`, `3004-3005`: frontends Next.js publicados por `web-frontend-node`.
- `8000-8017`: APIs Django publicadas por `api-backend-python`.

Se agrego y documento el script:

- `Docs/03_standards/operations/scripts/Repair-NextCss.ps1`

El script diagnostica CSS de Next.js y, con `-Repair`, limpia el contenido del
volumen `.next` y reinicia el contenedor web. Se ajusto para Turbopack, que
sirve CSS desde `/_next/static/chunks/*.css`.

Tambien se corrigio `Docker.WEB.NJ/Dockerfile` para incluir `WEB.NJ.NEXT.Fiscora`
y exponer `3005`, alineandolo con `Docker.WEB.NJ/start.sh` y `docker-compose.yml`.

## Validaciones

| Validacion | Resultado |
|---|---|
| `Reserve-WorkspacePorts.ps1 -DryRun` | Correcto; detecto puertos reservados usados por Docker/WSL. |
| `docker ps` | Correcto; `db-postgresql`, `api-backend-python`, `web-frontend-node` y `nginx` arriba. |
| `GET http://localhost:8017/api/lexnova/health/` | Correcto, 200. |
| `POST http://localhost:8017/api/lexnova/auth/jwt/create/` con usuario semilla | Correcto, 200 y respuesta con token. |
| `OPTIONS http://localhost:8017/api/lexnova/auth/jwt/create/` con `Origin: http://localhost:3002` | Correcto, CORS permite `http://localhost:3002`. |
| `Repair-NextCss.ps1 -Project lexnova -Url http://localhost:3002/auth/login` | Correcto; CSS disponible. |
| `GET http://localhost:3002/auth/login` | Correcto, 200, incluye CSS de Next. |
| `GET http://localhost` con `Host: lexnova.localhost` | Correcto, 200, incluye CSS de Next. |
| `python manage.py check` en `API.PY.DJANGO.LexNova.Gateway` | Correcto, sin issues. |
| `docker compose exec ... manage auth check` | Correcto, sin issues. |
| `docker compose exec ... manage lexnova check` | Correcto, sin issues. |
| `docker compose exec ... manage lexnova_gateway check` | Correcto, sin issues. |
| `npm run build` en `WEB.NJ.NEXT.LexNova` | Correcto; quedan warnings existentes por `<img>` en auth/reset/activation. |
| Limpieza de `Docs/agents/AGENTS-*.md` | Correcto, todos quedaron en 0 bytes. |

## Incidencias y limites

- `lexnova.localhost` no resuelve directamente desde `Invoke-WebRequest` en
  Windows; se valido Nginx usando header `Host: lexnova.localhost`.
- Docker Desktop entro en estado inestable despues de un build largo del
  orquestador web y devolvio `500 Internal Server Error`; se recupero reiniciando
  procesos de Docker Desktop desde Windows.
- `docker buildx build` de `Docker.WEB.NJ` quedo en timeout despues de mas de 15
  minutos. Se levanto el runtime con `docker compose ... up -d --no-build`.
- `3004` y `3005` quedaron publicados; sus respuestas directas tuvieron errores
  de recepcion durante la inestabilidad de Docker. Lex Nova no depende de esos
  puertos para funcionar.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones nuevas | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Revisar por separado el build completo de `Docker.WEB.NJ` para reducir el
  tiempo de construccion y confirmar DocuCore/Fiscora con imagen nueva.
- Registrar `lexnova.localhost` en hosts de Windows si se quiere validar por
  nombre sin usar header `Host`.

---

# Reporte de ejecucion Agents - Registro local de puertos

Fecha: 2026-05-18

## Alcance

Se atendio la necesidad de estandarizar y liberar puertos locales en Windows
antes de levantar Docker, webs Next.js, APIs Django, Nginx y PostgreSQL.

Los archivos `Docs/agents/AGENTS-000.md` a `AGENTS-030.md` estaban vacios y no
tenian tareas ejecutables nuevas.

Antes de implementar se reviso:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/03_standards/docker.md`
- `Docs/03_standards/operations/runbook.md`
- `Docs/03_standards/operations/docker-recovery-runbook.md`
- `Docs/03_standards/frontend/shared-docker-frontend-architecture.md`
- `Docs/03_standards/operations/git-repository-map.md`

## Resultado

Se creo:

- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/03_standards/operations/scripts/Reserve-WorkspacePorts.ps1`

Se actualizo:

- `Docs/03_standards/docker.md`
- `Docs/03_standards/operations/docker-recovery-runbook.md`
- `Docs/03_standards/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docker.API.PY/README.md`
- `Docker.WEB.NJ/README.md`
- `Docker.DB.PG/README.md`
- `Docker.SW.Nginx/README.md`

Decision: no se crea un repositorio nuevo todavia. El script queda versionado
en `Docs` junto al estandar operativo hasta que exista un conjunto mayor de
herramientas que justifique un repositorio transversal de operaciones.

## Puertos reservados

| Rango/Puerto | Uso |
|---:|---|
| `80` | Nginx local |
| `443` | HTTPS local futuro |
| `5432` | PostgreSQL local |
| `3000-3050` | Webs Next.js |
| `8000-8050` | APIs Django/Gateway/BFF |

El script trabaja en modo diagnostico por defecto y solo detiene procesos si se
ejecuta con `-KillConflicts`. No detiene procesos Docker salvo que se indique
explicitamente `-IncludeDockerProcesses`.

## Validaciones

| Validacion | Resultado |
|---|---|
| `Reserve-WorkspacePorts.ps1 -DryRun` | Correcto, exit code 0; detecto puertos usados por Docker/WSL y un proceso `node` en `3003` sin detener nada. |
| `docker compose -f Docker.DB.PG\docker-compose.yml config --quiet` | Correcto. |
| `docker compose -f Docker.API.PY\docker-compose.yml config --quiet` | Correcto. |
| `docker compose -f Docker.WEB.NJ\docker-compose.yml config --quiet` | Correcto. |
| `docker compose -f Docker.SW.Nginx\docker-compose.yml config --quiet` | Correcto. |
| `rg` de `local-port-registry`, `Reserve-WorkspacePorts`, `3000-3050` y `8000-8050` | Correcto, referencias localizadas en indices y documentos operativos. |
| Limpieza de `Docs/agents/AGENTS-*.md` | Correcto, todos quedaron en 0 bytes. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones nuevas | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Activar la tarea programada manualmente en PowerShell como Administrador si se desea ejecucion automatica al iniciar sesion.
- Crear un repositorio `Workspace.Operations` solo si aparecen mas scripts compartidos o herramientas operativas transversales.

---

# Reporte de ejecucion Agents - Dependencias locales Lex Nova

Fecha: 2026-05-18

## Alcance

Se reviso el problema de conexion de `WEB.NJ.NEXT.LexNova` hacia
`API.PY.DJANGO.LexNova.Gateway` reportado como `TypeError: Failed to fetch`.
Los archivos `Docs/agents/AGENTS-000.md` a `AGENTS-030.md` estaban vacios y no
tenian tareas ejecutables nuevas.

Antes de implementar se reviso:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/repositories.md`
- `Docs/02_projects/lexnova/auth-seed.md`
- `Docs/01_core_erp/auth/README.md`
- `Docs/01_core_erp/architecture/07_project_api_pattern.md`
- `Docs/03_standards/docker.md`
- `Docs/03_standards/operations/runbook.md`
- `Docs/03_standards/operations/docker-recovery-runbook.md`

## Resultado

Se documento el estandar de dependencias locales para Lex Nova y proyectos con
Gateway/BFF:

`WEB.NJ.NEXT.LexNova -> API.PY.DJANGO.LexNova.Gateway -> API.PY.DJANGO.Auth -> API.PY.DJANGO.LexNova -> PostgreSQL`

Se agrego `Docs/02_projects/lexnova/local-dependency-runbook.md` y se enlazo en:

- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

Tambien se actualizo `Docs/03_standards/docker.md` para exigir que los proyectos
con dependencias cruzadas documenten puertos, orden de arranque, variables y
validaciones de cadena completa.

En codigo se corrigio la configuracion local de CORS del Gateway para permitir
los puertos reales de desarrollo de la web, incluido `localhost:3003`, y se
agrego un respaldo limitado a origenes configurados/locales para evitar que el
navegador bloquee el login aunque el Gateway este levantado.

## Validaciones

| Validacion | Resultado |
|---|---|
| `docker compose -f Docker.API.PY\docker-compose.yml config --quiet` | Correcto. |
| `python manage.py check` en `Docker.API.PY/API.PY.DJANGO.LexNova.Gateway` | Correcto, sin issues. |
| Reinicio de `api-multiproyecto` | Correcto, contenedor `api-backend-python` quedo healthy. |
| `GET http://localhost:8017/api/lexnova/health/` | Correcto, 200. |
| `OPTIONS http://localhost:8017/api/lexnova/auth/jwt/create/` con `Origin: http://localhost:3003` | Correcto, devuelve `Access-Control-Allow-Origin: http://localhost:3003`. |
| `POST http://localhost:8017/api/lexnova/auth/jwt/create/` con usuario semilla | Correcto, 200 y respuesta con token. |
| `npm run build` en `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Correcto en validacion previa; quedan advertencias existentes de uso de `<img>`. |
| Limpieza de `Docs/agents/AGENTS-*.md` | Correcto, todos quedaron en 0 bytes. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones nuevas | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Mantener sincronizados los puertos de la web y los origenes permitidos por el Gateway cuando se agreguen nuevos proyectos o puertos locales.
- Revisar las advertencias existentes de Next.js sobre `<img>` en pantallas de autenticacion cuando se quiera optimizar imagenes.

---

# Reporte de ejecucion Agents - Lex Nova login y sesion

Fecha: 2026-05-18

## Alcance

Se revisaron `Docs/agents/AGENTS-000.md` a `AGENTS-030.md` en orden numerico.
Todos estaban vacios, por lo que no habia tareas ejecutables nuevas. La tarea
real se derivo del reporte del usuario: el login no explicaba el error y una
sesion previa podia mandar al dashboard.

Antes de implementar se reviso:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/auth-seed.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/01_core_erp/auth/README.md`

## Resultado

- Se corrigio `useVerify` para verificar sesion real con
  `/auth/jwt/verify/` via Gateway y usar `/auth/jwt/refresh/` solo si aplica.
- Se dejo de persistir `Auth` en Redux Persist para evitar sesiones locales
  viejas.
- Se ajusto middleware para permitir abrir `/auth/login` aunque exista cookie
  `access`; la redireccion al dashboard queda en manos de la verificacion real.
- Se mejoro el login para mostrar detalle accionable: gateway caido, ruta
  inexistente, credenciales invalidas, cuenta inactiva o error interno.
- Se agrego mensaje inline accesible en `LoginForm` ademas del toast.
- Se documento el contrato faltante de sesion en `architecture.md` e
  `identity-interface.md`.

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run build` en `WEB.NJ.NEXT.LexNova` | Correcto. Persisten warnings existentes por `<img>` en auth/reset/activation. |
| `python manage.py check` en `API.PY.DJANGO.LexNova.Gateway` | Correcto, sin issues. |
| `python manage.py check` en `API.PY.DJANGO.LexNova` con entorno local minimo | Correcto, sin issues. |
| `GET /auth/login` en `http://localhost:3003` con cookie `access` falsa | Correcto: responde 200 y ya no redirige automaticamente al dashboard. |
| `GET /` en `http://localhost:3003` | Correcto: responde 200 y carga referencia CSS. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Probar login end-to-end contra Auth/Gateway/PostgreSQL levantados con usuarios
  semilla reales.
- Revisar los warnings de `<img>` en pantallas de autenticacion cuando se haga
  la limpieza visual final.

## Limpieza

`Docs/agents/AGENTS-*.md` ya estaban limpios y permanecen en 0 bytes.

---

# Reporte de ejecucion Agents - Lex Nova web y flujo documental

Fecha: 2026-05-18

## Alcance

Se ejecutaron en orden numerico todos los archivos `Docs/agents/AGENTS-*.md`.
Los archivos con instrucciones ejecutables fueron `AGENTS-000.md` y
`AGENTS-001.md`; `AGENTS-002.md` a `AGENTS-030.md` estaban vacios.

Antes de implementar se reviso:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`

## Resultado

- Se genero y agrego la imagen hero
  `WEB.NJ.NEXT.LexNova/public/images/lexnova-legal-os-hero.png`.
- Se modernizo la portada publica de Lex Nova Tech con asset visual real,
  propuesta de valor, permisos por contexto y panel de expediente.
- Se actualizo el dashboard operativo con cola priorizada, timeline,
  vencimientos, permisos efectivos y acciones principales.
- Se expuso el Centro de Carga Documental en
  `/dashboard/modules/cases/upload`.
- Se completo la pantalla de analisis con expediente, arbol documental, visor,
  agravios, contradicciones, jurisprudencias, alertas IA y referencias
  cruzadas.
- Se completo la pantalla de resultado por caso con resumen ejecutivo, timeline,
  pruebas, agravios, criterios vinculados y plan de fortalecimiento.
- Se completo el motor jurisprudencial MVP con busqueda, filtros y criterios
  relacionados.
- Se actualizo la documentacion canonica de interfaz y pendientes LexNova.

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run build` en `WEB.NJ.NEXT.LexNova` | Correcto. Solo quedan warnings existentes por `<img>` en auth/reset/activation. |
| `python manage.py check` en `API.PY.DJANGO.LexNova.Gateway` | Correcto, sin issues. |
| `python manage.py check` en `API.PY.DJANGO.LexNova` con entorno minimo local | Correcto, sin issues. |
| `python manage.py makemigrations --check --dry-run` en `API.PY.DJANGO.LexNova` | Correcto: no hay cambios de migracion. PostgreSQL local no estaba disponible para validar historial real. |
| `python -m compileall config apps/legal_workspace` en `API.PY.DJANGO.LexNova` | Correcto. |
| Web local en `http://localhost:3003` | Correcto: portada, carga documental, analisis y jurisprudencias respondieron HTTP 200. |
| Recarga de estilos en dev server | Correcto: se limpio cache `.next`, se reinicio `next dev` en puerto 3003 y `/_next/static/css/app/layout.css` respondio 200. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Arquitectura UX de Lex Nova ejecutada en web: dashboards por contexto, flujo operativo, analisis y resultados. |
| `AGENTS-001.md` | Completado | Centro de carga documental/evidencia y pantallas de analisis/resultados implementadas como MVP. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Conectar el Centro de Carga Documental con endpoints reales de escritura,
  storage, OCR, clasificacion, revision humana y cadena de custodia.
- Ejecutar migraciones reales contra PostgreSQL cuando el servicio local este
  levantado.
- Sustituir datos demostrativos de dashboard, analisis, resultado y
  jurisprudencias por datos reales del Gateway conforme avancen los endpoints.

## Limpieza

Despues de completar la corrida, se limpiaron los archivos
`Docs/agents/AGENTS-*.md`; todos quedaron en 0 bytes.

---

# Reporte de ejecucion Agents - Implementacion LexNova catalogos juridicos

Fecha: 2026-05-18

## Alcance

Los archivos `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md` estaban
vacios. La ejecucion se hizo desde los pendientes canonicos de LexNova, pasando
primero por el indice documental.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/auth-seed.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/lexnova/legal-domain-research.md`

## Implementacion

### `API.PY.DJANGO.LexNova`

Se extendio `apps/legal_workspace` con el MVP de estructura juridica
versionable:

- Catalogos: `LegalMatter`, `LegalProcedureType`, `LegalProcedureStage`,
  `LegalDocumentType`, `LegalActorType`, `LegalAuthority`, `LegalCourt`.
- Documentos: `LegalDocumentVersion`, `LegalDocumentRelation`,
  `DocumentClassificationHistory`.
- Conocimiento legal: `LegalNorm`, `LegalNormVersion`, `LegalArticle`,
  `LegalArticleVersion`, `LegalReform`, `Jurisprudence`, `Thesis`,
  `LegalCriterion`, `LegalDeadline`.
- Operacion juridica: `LegalResolution`, `LegalRemedy`, `CaseRisk`.
- IA/revision: `AIAnalysisResult`, `HumanReview`.
- Evidencia: `EvidenceChainOfCustody`.

Se agregaron migraciones:

- `apps/legal_workspace/migrations/0002_aianalysisresult_caserisk_and_more.py`
- `apps/legal_workspace/migrations/0003_seed_legal_catalogs.py`

La semilla inicial crea materias, procedimientos, etapas, tipos documentales,
actores y normas base segun `legal-domain-research.md`.

Se agregaron endpoints de lectura:

- `GET /api/cases/`
- `GET /api/documents/`
- `GET /api/legal-workspace/catalogs/`

### `API.PY.DJANGO.LexNova.Gateway`

Se agrego proxy para contratos juridicos flexibles:

- `/api/lexnova/legal-workspace/*`

El proxy existente `/api/lexnova/cases/*` ya queda conectado al endpoint real
de casos de la API de dominio.

### `WEB.NJ.NEXT.LexNova`

Se reemplazo el mock de casos por consumo real del Gateway en:

- `app/dashboard/modules/cases/page.tsx`

La vista ahora llama a `gatewayUrl("/cases/")` con credenciales y muestra error
controlado si el Gateway no esta disponible.

### Documentacion

Se actualizaron:

- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/lexnova/legal-domain-research.md`

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.LexNova` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.LexNova` | `python manage.py makemigrations --check --dry-run` | Correcto, sin cambios pendientes. |
| `API.PY.DJANGO.LexNova.Gateway` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova.Gateway` | `python -m compileall .` | Correcto. |
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto; solo warnings preexistentes de `<img>` en auth/reset. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones | Estaban vacios. La ejecucion se hizo desde pendientes canonicos de LexNova. |

## Pendientes

- Ejecutar migraciones reales contra PostgreSQL.
- Completar endpoints de escritura para carga, clasificacion, reclasificacion,
  revision humana y cadena de custodia.
- Completar semilla estatal de autoridades, tribunales, comisiones de derechos
  humanos y calendarios.
- Validar plazos exactos por supuesto legal antes de cargar valores
  productivos en `LegalDeadlines`.
- Definir ingestion oficial del SJF para tesis y jurisprudencia.
- Cerrar OCR, storage, cifrado, retencion, hash y politica de conservacion.

## Limpieza

Se mantienen limpios los archivos `Docs/agents/AGENTS-*.md`.

---

# Reporte de verificacion LexNova runtime

Fecha: 2026-05-18

## Objetivo

Ejecutar el codigo implementado y confirmar que los modelos, rutas y web de
LexNova no presentan errores locales detectables.

## Resultado

Se corrigio un error en `API.PY.DJANGO.LexNova/config/settings.py`: el archivo
asumia que `sys.argv[1]` siempre existia. Esto rompia imports de Django desde
scripts Python directos y validaciones embebidas.

## Validaciones ejecutadas

| Proyecto | Validacion | Resultado |
|---|---|---|
| `API.PY.DJANGO.LexNova` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova` | `python manage.py makemigrations --check --dry-run` | Correcto, sin cambios pendientes. |
| `API.PY.DJANGO.LexNova` | `python -m compileall config apps/legal_workspace` | Correcto. |
| `API.PY.DJANGO.LexNova` | Import directo de Django y listado de modelos `legal_workspace` | Correcto; 36 modelos registrados. |
| `API.PY.DJANGO.LexNova` | Resolucion de `/api/cases/`, `/api/documents/`, `/api/legal-workspace/catalogs/` | Correcto. |
| `API.PY.DJANGO.LexNova` | `python manage.py migrate --plan` | Correcto; incluye migraciones `0002` y `0003`. |
| `API.PY.DJANGO.LexNova.Gateway` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova.Gateway` | Resolucion de `/api/lexnova/health/`, `/cases/`, `/documents/`, `/legal-workspace/catalogs/` | Correcto. |
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto; sin errores de compilacion ni tipos. |

## Limitacion de entorno

No se pudo ejecutar migracion real contra PostgreSQL porque:

- Docker Desktop no esta activo.
- No hay PostgreSQL escuchando en `localhost:5432`.

Se valido el plan de migraciones y la generacion SQL local, pero la aplicacion
real de migraciones debe ejecutarse cuando PostgreSQL este disponible.

## Web

`npm run build` genero correctamente las 72 rutas. Persisten warnings
preexistentes de Next.js por uso de `<img>` en paginas de auth/reset; no son
errores ni provienen de la vista de casos modificada.

---

# Reporte de ejecucion Agents - Investigacion juridica LexNova

Fecha: 2026-05-18

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md` en orden numerico despues de leer:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`

Los agents `AGENTS-001.md` a `AGENTS-030.md` estaban vacios y no tenian tareas
ejecutables.

## Resultado

Se documento la investigacion juridica inicial de LexNova para alinear el
desarrollo de base de datos, catalogos, procedimientos, documentos, actores,
normas versionadas, plazos, evidencia, analisis de IA y revision humana.

Se agrego:

- `Docs/02_projects/lexnova/legal-domain-research.md`

Se actualizo:

- `Docs/02_projects/lexnova/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

## Fuentes externas consultadas

Se consultaron fuentes oficiales para no inventar estructura juridica:

- Camara de Diputados: CNPP, Ley Nacional de MASC penal, Codigo Nacional de
  Procedimientos Civiles y Familiares, Ley General de MASC, Ley de Amparo,
  Ley Federal del Trabajo, Ley Agraria, LFPCA, CFF, LGRA y Ley CNDH.
- CNDH: portal institucional, quejas e inconformidades.
- SCJN/SJF: fuente oficial prevista para jurisprudencia y tesis.
- Tribunales Agrarios: fuente oficial prevista para autoridades y organos
  agrarios.

## Pendientes documentados

- Levantar legislacion estatal y organismos de derechos humanos por entidad.
- Validar plazos por supuesto, norma, excepcion y calendario de autoridad.
- Completar catalogos mercantiles, agrarios, fiscales y administrativos.
- Definir ingestion oficial de jurisprudencia/tesis del SJF.
- Implementar catalogos versionables en base de datos: materia, procedimiento,
  etapa, documento, actor, autoridad, norma, articulo, plazo y criterio.
- Definir OCR, storage, cifrado, retencion, hash y cadena de custodia final.

## Validaciones

| Validacion | Resultado |
|---|---|
| Documento nuevo enlazado desde `Docs/02_projects/lexnova/README.md` | Correcto. |
| Documento nuevo registrado en `Docs/_meta/master-index.md` | Correcto. |
| Documento nuevo registrado en `Docs/_meta/master-index.yaml` | Correcto. |
| Documento nuevo registrado en `Docs/_meta/navigation-map.md` | Correcto. |
| No se modifico codigo de aplicacion en esta corrida | Correcto. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Investigacion juridica LexNova documentada y enlazada a indices canonicos. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Limpieza

Al terminar validaciones se limpiaron los archivos `Docs/agents/AGENTS-*.md`
para dejarlos listos para la siguiente corrida.

---

# Reporte de verificacion documental LexNova - Modelo procesal

Fecha: 2026-05-18

## Alcance

Se reviso si LexNova ya cuenta con modelo de base de datos para carpetas de
investigacion, juicio oral, amparos, revisiones de amparo y quejas de derechos
humanos. La revision paso primero por el indice documental y despues por la
implementacion local de `API.PY.DJANGO.LexNova`.

## Agents

Los archivos `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md` estaban
vacios al inicio de esta pasada. No habia instrucciones ejecutables pendientes.

## Documentos revisados

Documentos de control:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

Documentos canonicos LexNova:

- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/auth-seed.md`
- `Docs/02_projects/lexnova/repositories.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/01_core_erp/architecture/07_project_api_pattern.md`

## Resultado de revision de modelos

Existe modelo implementado para:

- Carpetas de investigacion: `apps.investigation_folder`.
- Causa penal: `apps.cause_penal`.
- Juicio oral: `apps.oral_trial`.
- Apelaciones: `apps.appeal`.
- Amparo indirecto: `apps.amparo.IndirectAmparo`.
- Amparo directo: `apps.amparo.DirectAmparo`.
- Documentos y analisis documental: `apps.documents`.
- Evidencia, transcripciones y analisis de evidencia: `apps.evidence`.
- Caso contenedor y vinculos a entidades: `apps.case`.
- Personas, roles legales, representaciones y autoridades: `apps.person`.

Brechas encontradas:

- No existe modelo separado para revision de amparo directo.
- No existe modelo separado para revision de amparo indirecto.
- No existe modelo separado para quejas de derechos humanos estatales.
- No existe modelo separado para quejas de derechos humanos nacionales.
- La documentacion canonica de LexNova no tenia aun un documento especifico de
  modelo procesal/base de datos.

## Documentacion creada

Se creo:

- `Docs/02_projects/lexnova/legal-process-data-model.md`

El documento registra:

- Cobertura actual por necesidad.
- Tablas existentes por schema.
- Flujo procesal base.
- Flujo de amparo indirecto.
- Uso de `CaseLink`, `DocumentLink` y `EvidenceLink`.
- Modelos futuros recomendados para revision de amparo directo, revision de
  amparo indirecto y quejas de derechos humanos.

## Indices actualizados

Se actualizo:

- `Docs/02_projects/lexnova/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.LexNova` | `python manage.py check` | Correcto con variables minimas locales (`DJANGO_SECRET_KEY`, `AUTH_API_VERIFY_URL`, `DATABASE_URL`). Sin issues. |
| `API.PY.DJANGO.LexNova` | `python -m compileall .` | Correcto. |

No se ejecutaron migraciones porque esta pasada solo documento el estado actual
y brechas, sin modificar modelos Django.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones | Estaban vacios; se mantuvieron limpios. |

## Fuera de alcance

- No se busco en todo `Docs`; se usaron indices y documentos canonicos
  relacionados.
- No se implementaron modelos nuevos para revisiones de amparo o derechos
  humanos.
- No se modificaron endpoints del gateway ni de la API de dominio.
- No se hicieron commits, push ni pull requests.

## Pendientes

- Implementar modelos Django separados para revision de amparo directo,
  revision de amparo indirecto y quejas de derechos humanos cuando el alcance
  de desarrollo lo requiera.
- Definir si las quejas de derechos humanos viven en schema nuevo
  `HumanRights` o dentro de un modulo procesal mas amplio.

---

# Reporte de ejecucion Agents - Centro de Carga Documental LexNova

Fecha: 2026-05-18

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md`, que contenia instrucciones para
consolidar el flujo documental/procesal de LexNova y optimizar la estructura de
base de datos para evitar duplicar archivos, documentos internos y procesos.

`AGENTS-001.md` a `AGENTS-030.md` estaban vacios.

## Documentos revisados

Documentos de control:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

Documentos canonicos relacionados:

- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/03_standards/database/sql-server-publication-standard.md`

## Implementacion realizada

### API LexNova

Se agrego el modulo:

```text
Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace
```

Objetivo:

- Guardar cada archivo una sola vez.
- Relacionar archivos con uno o varios procesos juridicos.
- Permitir clasificacion posterior cuando el cliente seleccione `Desconozco`.
- Evitar una tabla por cada formato documental o tipo de proceso.

Tablas nuevas:

- `Cases.LegalCases`
- `Cases.LegalProceedings`
- `Cases.LegalProceedingContents`
- `Cases.TimelineEvents`
- `Documents.DigitalAssets`
- `Documents.ExtractedFields`
- `Media.MediaConversions`
- `Media.Transcripts`
- `Media.TranscriptSegments`
- `Media.MediaProcessingLogs`
- `Clients.ClientInvitations`

La migracion inicial crea schemas si no existen:

- `Cases`
- `Clients`
- `Documents`
- `Media`

Tipos de proceso incluidos:

- `UNKNOWN`
- `INVESTIGATION_FOLDER`
- `CRIMINAL_CASE`
- `ORAL_TRIAL`
- `APPEAL`
- `DIRECT_AMPARO`
- `DIRECT_AMPARO_REVIEW`
- `INDIRECT_AMPARO`
- `INDIRECT_AMPARO_REVIEW`
- `STATE_HUMAN_RIGHTS_COMPLAINT`
- `NATIONAL_HUMAN_RIGHTS_COMPLAINT`

### Auth Core

Se agrego:

```text
Docker.API.PY/API.PY.DJANGO.Auth/access/migrations/0015_seed_lexnova_document_permissions.py
```

Permisos nuevos:

- `DOCUMENT_UPLOAD_OWN`
- `DOCUMENT_UPLOAD_FOR_CLIENT`
- `DOCUMENT_CLASSIFY`
- `DOCUMENT_RECLASSIFY`
- `DOCUMENT_LINK_TO_PROCEEDING`
- `DOCUMENT_VIEW_OWN`
- `DOCUMENT_VIEW_CLIENT`
- `DOCUMENT_DELETE_PENDING`
- `DOCUMENT_APPROVE`
- `CLIENT_INVITE`
- `CLIENT_VIEW_PROGRESS`
- `CLIENT_UPLOAD_DOCUMENTS`

Modulos nuevos:

- `DOCUMENTS`: `/dashboard/modules/cases/upload`
- `CLIENTS`: `/dashboard/modules/clients`

### Documentacion

Se actualizo:

- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/auth-seed.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

## Informacion faltante documentada

Quedo documentado como `PENDIENTE_DE_DEFINIR`:

- Cliente canonico para `ClientId`.
- Catalogo final de tipos documentales.
- Motor OCR.
- Motor de transcripcion.
- Politica definitiva de storage.
- Reglas de publicacion al cliente.
- Metricas y trazabilidad de IA.
- Criterio para crear tablas especializadas de revision de amparo y derechos
  humanos.

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.LexNova` | `python manage.py check` con variables minimas locales | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.LexNova` | `python manage.py makemigrations --check --dry-run` | Correcto, no hay cambios pendientes. |
| `API.PY.DJANGO.Auth` | `python manage.py check` con variables minimas locales | Correcto, sin issues. |
| `API.PY.DJANGO.Auth` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.Auth` | `python manage.py makemigrations --check --dry-run` | Correcto, no hay cambios pendientes. |

No se ejecutaron migraciones reales contra PostgreSQL en esta pasada.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Modelo documental/procesal optimizado implementado, permisos sembrados y documentacion actualizada. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Estaban vacios. |

## Limpieza

Despues de completar y validar la corrida, se limpiaron los archivos
`Docs/agents/AGENTS-*.md`.

## Pendientes

- Exponer endpoints del Centro de Carga Documental en `API.PY.DJANGO.LexNova`
  y `API.PY.DJANGO.LexNova.Gateway`.
- Construir la vista `/dashboard/modules/cases/upload` en `WEB.NJ.NEXT.LexNova`.
- Ejecutar migraciones reales contra PostgreSQL cuando se programe la
  actualizacion de base.
- Definir catalogos finales de tipos documentales y reglas de publicacion al
  cliente.

---

# Reporte de verificacion Auth/LexNova Gateway

Fecha: 2026-05-17

## Alcance

Se verifico el estandar de integracion de Auth y LexNova pasando primero por el indice documental, y despues se contrasto la implementacion en los proyectos locales.

## Documentos revisados

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/02_projects/lexnova/repositories.md`
- `Docs/01_core_erp/apis/01_auth_api.md`
- `Docs/01_core_erp/architecture/07_project_api_pattern.md`
- `Docs/03_standards/frontend/nextjs-project-standard.md`
- `Docs/03_standards/operations/git-repository-map.md`
- `Docs/03_standards/operations/git-environments-and-release-flow.md`

## Resultado de arquitectura

Cumple con ajustes aplicados.

- `WEB.NJ.NEXT.LexNova` usa `NEXT_PUBLIC_GATEWAY_BASE_URL` y, como fallback local, `/api/lexnova`.
- `WEB.NJ.NEXT.LexNova` ya no llama directamente a `/api/auth` ni a OAuth local para logout/social auth; ahora usa `gatewayUrl(...)`.
- `API.PY.DJANGO.LexNova.Gateway` expone rutas para `auth`, `users`, `access`, `cases` y `documents`.
- `API.PY.DJANGO.LexNova.Gateway` enruta `auth`, `users` y `access` hacia `API.PY.DJANGO.Auth`.
- `API.PY.DJANGO.LexNova.Gateway` enruta `cases` y `documents` hacia `API.PY.DJANGO.LexNova`.
- El proxy de `access` inyecta `application_code=LEXNOVA`, manteniendo el aislamiento del producto.

## Ajustes realizados

- Se agrego `WEB.NJ.NEXT.LexNova/lib/gateway.ts` para centralizar la URL del Gateway.
- Se actualizo `WEB.NJ.NEXT.LexNova/redux/services/apiSlice.ts` para reutilizar la resolucion oficial del Gateway.
- Se actualizo logout en `WEB.NJ.NEXT.LexNova/components/common/Navbar.tsx`.
- Se actualizo logout en `WEB.NJ.NEXT.LexNova/app/dashboard/Sidebar.tsx`.
- Se actualizo OAuth social en `WEB.NJ.NEXT.LexNova/utils/continue-with-social-auth.ts`.

## Ramas verificadas

| Proyecto | Rama activa |
|---|---|
| `Docs` | `feature/lex-nova-tech-identification` |
| `Docker.API.PY` | `feature/lex-nova-tech-identification` |
| `API.PY.DJANGO.LexNova` | `feature/lex-nova-tech-identification` |
| `API.PY.DJANGO.LexNova.Gateway` | `feature/lex-nova-tech-identification` |
| `WEB.NJ.NEXT.LexNova` | `feature/lex-nova-tech-identification` |

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto. Quedan warnings preexistentes de `<img>` y datos de browserslist/baseline desactualizados. |
| `API.PY.DJANGO.LexNova.Gateway` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.LexNova.Gateway` | `python -m compileall .` | Correcto. |
| `Docker.API.PY` | `docker compose config` | Correcto. No se documentan valores sensibles emitidos por el comando. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones ejecutables pendientes | La verificacion se completo desde documentacion canonica e implementacion local. |

## Fuera de alcance

- No se hizo busqueda completa en `Docs`; se usaron el indice documental y los documentos canonicos relacionados.
- No se levanto el entorno con `docker compose up`.
- No se ejecutaron migraciones contra PostgreSQL.
- No se hicieron commits, push ni pull requests en esta corrida.

## Pendientes

- Reemplazar `WEB.NJ.NEXT.LexNova/app/api/mock/cases` por consumo real de `/api/lexnova/cases` antes de produccion.
- Revisar hardening final de cookies, CSRF y expiracion de tokens cuando se active el despliegue real.

---

# Reporte de ejecucion Agents - Semilla Auth LexNova

Fecha: 2026-05-17

## Agents ejecutados

Se ejecuto `Docs/agents/AGENTS-000.md` en orden numerico. Los archivos
`AGENTS-001.md` a `AGENTS-030.md` estaban vacios.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/architecture.md`

## Implementacion

Se implemento la semilla inicial de autenticacion LexNova en `API.PY.DJANGO.Auth`.

Archivos modificados o creados:

- `Docker.API.PY/API.PY.DJANGO.Auth/user/models.py`
- `Docker.API.PY/API.PY.DJANGO.Auth/user/serializers.py`
- `Docker.API.PY/API.PY.DJANGO.Auth/user/migrations/0004_useraccount_must_change_password.py`
- `Docker.API.PY/API.PY.DJANGO.Auth/access/migrations/0014_seed_lexnova_auth.py`
- `Docs/02_projects/lexnova/auth-seed.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

## Resultado

Se insertaron en PostgreSQL:

- 15 usuarios LexNova.
- 15 perfiles LexNova.
- 9 modulos LexNova.
- 44 permisos LexNova.
- Asignaciones de permisos por perfil.
- Asignacion de rol por usuario.
- `MustChangePassword = true` para todos los usuarios semilla.

Password temporal de desarrollo:

```text
LexNova.Temp#2026
```

Esta password no debe usarse como password permanente ni en produccion.

## Correos semilla

```text
cliente.restricted@lexnova.local
cliente.base@lexnova.local
cliente.plus@lexnova.local
analyst.restricted@lexnova.local
analyst.base@lexnova.local
analyst.plus@lexnova.local
reviewer.restricted@lexnova.local
reviewer.base@lexnova.local
reviewer.plus@lexnova.local
manager.restricted@lexnova.local
manager.base@lexnova.local
manager.plus@lexnova.local
admin.restricted@lexnova.local
admin.base@lexnova.local
admin.root@lexnova.local
```

## Rama

`API.PY.DJANGO.Auth` se coloco en:

```text
feature/lex-nova-tech-identification
```

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.Auth` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Auth` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.Auth` | `python manage.py migrate` | Correcto. Aplico `user.0004` y `access.0014`. |
| PostgreSQL `auth` | Conteo de usuarios LexNova | Correcto: 15 usuarios. |
| PostgreSQL `auth` | Conteo de modulos/permisos LexNova | Correcto: 9 modulos y 44 permisos. |

## Informacion faltante documentada

Se documento en `Docs/02_projects/lexnova/auth-seed.md` que las siguientes
tablas solicitadas por el agent aun no existen como modelos separados:

- `Auth.RoleLevels`
- `Auth.UserPermissionOverrides`
- `Auth.ApplicationUserProfiles`
- `Auth.AuditLogs`
- `Auth.EmailTemplates`

El documento tambien registra el mapeo actual disponible:

- `Auth.UserPermissions` cubre overrides con `Allow`.
- `Auth.AccessAuditEvents` cubre auditoria de acceso.
- `Auth.TransactionalEmailTemplates` cubre plantillas de correo.
- `Auth.UserRoles` + `Auth.ApplicationRoles` cubren perfil por aplicacion.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Semilla Auth LexNova implementada, migrada, validada y documentada. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Limpieza

Despues de completar y validar la corrida, se limpiaron los archivos
`Docs/agents/AGENTS-*.md`.

---

# Reporte de validacion y commits LexNova Auth

Fecha: 2026-05-17

## Documentos revisados

Se siguio el indice documental antes de validar:

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/auth-seed.md`
- `Docs/02_projects/lexnova/repositories.md`
- `Docs/01_core_erp/apis/01_auth_api.md`
- `Docs/01_core_erp/auth/README.md`

## Ajustes finales

- Se alineo `CLIENT_BASIC` a `CLIENT_BASE` en la documentacion canonica de LexNova.
- Se agrego `API.PY.DJANGO.Auth` al mapa de repositorios LexNova.
- Se dejo `Docker.API.PY/docker-compose.yml` con `UVICORN_RELOAD` configurable y apagado por defecto para evitar reinicios por memoria en el contenedor multiproyecto.
- Se normalizo `Docker.API.PY/start.sh` a finales de linea LF para ejecucion correcta dentro del contenedor Linux.

## Entornos ejecutados

| Entorno | Resultado |
|---|---|
| `db-postgresql` | Activo y healthy. |
| `api-backend-python` | Activo y healthy, puertos `8000-8017` publicados. |
| `web-frontend-node` | Activo, LexNova disponible en `3002`. |
| `nginx` | Activo y healthy. |

Para la validacion se ejecuto `api-backend-python` con:

```text
UVICORN_RELOAD=false
ENABLE_SYSCOM_ETL_WORKER=false
```

## Validacion Auth LexNova por Gateway

Gateway validado:

```text
GET http://localhost:8017/api/lexnova/health/
```

Resultado:

```text
service=LexNovaGateway
status=ok
```

Login y permisos validados por Gateway:

```text
POST http://localhost:8017/api/lexnova/auth/jwt/create/
GET  http://localhost:8017/api/lexnova/access/me/permissions/
```

Usuarios probados:

| Usuario | Rol | Modulos | Permisos | Resultado |
|---|---:|---:|---:|---|
| `cliente.base@lexnova.local` | `CLIENT_BASE` | 4 | 6 | Login correcto. |
| `analyst.base@lexnova.local` | `ANALYST_BASE` | 5 | 10 | Login correcto. |
| `reviewer.plus@lexnova.local` | `REVIEWER_PLUS` | 5 | 15 | Login correcto. |
| `manager.plus@lexnova.local` | `MANAGER_PLUS` | 7 | 18 | Login correcto. |
| `admin.root@lexnova.local` | `ADMIN_ROOT` | 9 | 44 | Login correcto. |

Password temporal de desarrollo:

```text
LexNova.Temp#2026
```

## Checks ejecutados

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.Auth` | `python manage.py check` | Correcto. |
| `API.PY.DJANGO.Auth` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.LexNova.Gateway` | `python manage.py check` | Correcto. |
| `API.PY.DJANGO.LexNova.Gateway` | `python -m compileall .` | Correcto. |
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto, con warnings preexistentes de `<img>` y browserslist. |
| `Docker.API.PY` | `docker compose config --quiet` | Correcto. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Semilla Auth LexNova validada por Gateway y documentacion alineada. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Fuera de alcance

- No se hizo busqueda completa en `Docs`; se usaron indices y documentos canonicos relacionados.
- No se publicaron commits con `git push`.
- No se reemplazo aun el mock de casos por `/api/lexnova/cases`.

---

# Reporte de ejecucion LexNova identity/access

Fecha: 2026-05-17

## Alcance

Se ejecuto una nueva pasada sobre `Docs/agents/AGENTS-*.md` en orden numerico.
Los archivos con instrucciones fueron:

- `AGENTS-000.md`: separacion entre rol del sistema y relacion con caso.
- `AGENTS-001.md`: un usuario con multiples roles, perfiles y participaciones.
- `AGENTS-002.md`: registro publico como `CLIENT_BASIC`, niveles de rol,
  reglas de cambio de perfil y dashboard contextual.

`AGENTS-003.md` a `AGENTS-030.md` estaban vacios.

## Documentacion revisada

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/01_core_erp/auth/README.md`
- `Docs/01_core_erp/auth/roles.md`
- `Docs/01_core_erp/auth/permissions.md`
- `Docs/03_standards/frontend/nextjs-project-standard.md`
- `Docs/03_standards/operations/git-repository-map.md`

## Implementacion realizada

### Documentacion LexNova

Se creo:

```text
Docs/02_projects/lexnova/access-control.md
Docs/02_projects/lexnova/frontend/identity-interface.md
```

Se actualizo:

```text
Docs/02_projects/lexnova/README.md
Docs/_meta/master-index.md
Docs/_meta/master-index.yaml
Docs/_meta/navigation-map.md
```

Contenido documentado:

- Regla de una sola identidad por usuario.
- Separacion entre rol del sistema y participacion por caso.
- Registro publico inicial como `CLIENT_BASIC`.
- Roles LexNova: `CLIENT`, `ANALYST`, `REVIEWER`, `MANAGER`, `ADMIN`.
- Niveles por rol: `BASIC`, `PREMIUM`, `SENIOR`, `MASTER`, `GLOBAL`, `ROOT`.
- Permisos recomendados con patron `recurso:accion:ambito`.
- Filtros de dashboard: mis casos, asignados, equipo y todos.
- Modulo recomendado `/dashboard/modules/admin/access-control`.
- Indexacion en master index y navigation map.

### Web LexNova

Se actualizo:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/app/page.tsx
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/app/layout.tsx
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/components/common/Navbar.tsx
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/styles/components.css
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/styles/globals.css
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/styles/themes.css
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/README.md
```

Se creo:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/app/dashboard/modules/admin/access-control/page.tsx
```

Resultado:

- Portada publica orientada a `Lex Nova Tech`.
- Hero con propuesta de inteligencia juridica, permisos e identidad unica.
- Panel visual de expediente sin depender del asset inexistente
  `hero-ai-justice.svg`.
- Navbar con marca `Lex Nova Tech` y textos visibles corregidos.
- Ruta MVP de control de acceso administrativo.

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto. |
| `API.PY.DJANGO.LexNova` | No aplica | No hubo cambios backend. |

El build reporto warnings preexistentes por uso de `<img>` en pantallas de
auth/password y avisos de datos browserslist/baseline desactualizados. No
bloquean compilacion.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Regla rol vs participacion documentada y reflejada en interfaz. |
| `AGENTS-001.md` | Completado | Modelo de una identidad con multiples roles/participaciones documentado. |
| `AGENTS-002.md` | Completado | Registro `CLIENT_BASIC`, niveles, autorizaciones y dashboard contextual documentados; ruta MVP creada. |
| `AGENTS-003.md` - `AGENTS-030.md` | Sin instrucciones | Estaban vacios. |

## Limpieza

Despues de completar y validar la corrida, se limpiaron los archivos
`Docs/agents/AGENTS-*.md`.

## Pendientes

- Conectar `WEB.NJ.NEXT.LexNova` con permisos reales de Auth/Gateway.
- Implementar CRUD real de control de acceso en API/Gateway.
- Reemplazar warnings preexistentes de `<img>` por `next/image` en pantallas de
  auth/password.
- Actualizar browserslist/baseline cuando se haga mantenimiento de dependencias.

---

# Reporte de correccion arquitectonica LexNova Gateway

Fecha: 2026-05-17

## Alcance

Se atendio la observacion arquitectonica: LexNova debia tener
`API.PY.DJANGO.LexNova` y `API.PY.DJANGO.LexNova.Gateway`. La web no debe
interactuar directamente con Auth ni con APIs core.

Los archivos `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md` estaban
vacios al iniciar esta pasada. La ejecucion se hizo por instruccion directa del
usuario y se mantuvieron los agents limpios.

## Documentos revisados

Primero se paso por el indice documental:

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`

Documentos canonicos relacionados revisados:

- `Docs/01_core_erp/architecture/02_api_gateway.md`
- `Docs/01_core_erp/architecture/03_bff_strategy.md`
- `Docs/01_core_erp/architecture/07_project_api_pattern.md`
- `Docs/01_core_erp/apis/01_auth_api.md`
- `Docs/03_standards/frontend/nextjs-project-standard.md`
- `Docs/03_standards/operations/git-repository-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`

Quedo fuera:

- No se busco en todo `Docs` fuera de los indices y documentos canonicos
  relacionados.
- No se modificaron APIs core distintas de LexNova Gateway.
- No se publico en GitHub ni se creo PR.

## Correccion implementada

### Gateway LexNova

Se creo:

```text
Docker.API.PY/API.PY.DJANGO.LexNova.Gateway
```

Archivos principales:

- `.env.local.example`
- `.gitignore`
- `README.md`
- `manage.py`
- `requirements.txt`
- `config/settings.py`
- `config/urls.py`
- `gateway/views.py`
- `gateway/urls.py`

Endpoints MVP:

- `GET /api/lexnova/health/`
- `GET /api/lexnova/dashboard/summary/`
- `/api/lexnova/auth/*`
- `/api/lexnova/users/*`
- `/api/lexnova/o/{provider}/`
- `/api/lexnova/access/*`
- `/api/lexnova/cases/*`
- `/api/lexnova/documents/*`

El gateway agrega `application_code=LEXNOVA` al proxy de permisos hacia Auth.

### Web LexNova

Se actualizo:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/redux/services/apiSlice.ts
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/.env.local.example
Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/README.md
```

La web ahora usa:

```text
NEXT_PUBLIC_GATEWAY_BASE_URL
```

con fallback a:

```text
NEXT_PUBLIC_HOST/api/lexnova
```

Esto evita configurar consumo directo de Auth desde el frontend.

### Docker local

Se actualizo:

```text
Docker.API.PY/docker-compose.yml
Docker.API.PY/start.sh
```

Puerto agregado:

```text
8017 -> API.PY.DJANGO.LexNova.Gateway
```

### Documentacion e indexacion

Se creo:

```text
Docs/02_projects/lexnova/architecture.md
Docs/02_projects/lexnova/repositories.md
```

Se actualizo:

```text
Docs/02_projects/lexnova/README.md
Docs/02_projects/lexnova/access-control.md
Docs/02_projects/lexnova/frontend/identity-interface.md
Docs/03_standards/docker.md
Docs/03_standards/docker/grouped-containers-isolated-config.md
Docs/03_standards/operations/git-repository-map.md
Docs/_meta/master-index.md
Docs/_meta/master-index.yaml
Docs/_meta/navigation-map.md
```

## Repositorios/rama

| Repositorio | Rama |
|---|---|
| `Docs` | `feature/lex-nova-tech-identification` |
| `Docker.API.PY` | `feature/lex-nova-tech-identification` |
| `API.PY.DJANGO.LexNova.Gateway` | `feature/lex-nova-tech-identification` |
| `WEB.NJ.NEXT.LexNova` | `feature/lex-nova-tech-identification` |
| `API.PY.DJANGO.LexNova` | `feature/lex-nova-tech-identification` |

`API.PY.DJANGO.LexNova.Gateway` quedo inicializado como repo local nuevo con
remoto esperado:

```text
https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.Gateway.git
```

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.LexNova.Gateway` | `python manage.py check` | Correcto. |
| `API.PY.DJANGO.LexNova.Gateway` | `python -m compileall .` | Correcto. |
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto. |
| `Docker.API.PY` | `docker compose config` | Correcto. |

El build web conserva warnings preexistentes por uso de `<img>` en pantallas de
auth/password. No bloquean compilacion.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones | Estaban vacios; se mantuvieron limpios. |

## Pendientes

- Confirmar/crear el repositorio remoto
  `MexIngSoft/API.PY.DJANGO.LexNova.Gateway` en GitHub antes del primer push si
  todavia no existe.
- Endurecer manejo de cookies/tokens del gateway contra el contrato final de
  Auth.
- Agregar endpoints de participantes y analisis cuando
  `API.PY.DJANGO.LexNova` exponga rutas estables.
- Crear commits y publicar por repositorio cuando se solicite.

---

# Reporte de publicacion inicial LexNova Gateway y ramas

Fecha: 2026-05-17

## Alcance

Se recibio el repositorio oficial:

```text
https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.Gateway.git
```

Se verifico el remoto y se crearon las ramas necesarias para trabajar con el
flujo actual de LexNova.

## Documentos revisados

Primero se paso por el indice documental:

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`

Documentos canonicos relacionados:

- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/repositories.md`
- `Docs/01_core_erp/architecture/07_project_api_pattern.md`
- `Docs/03_standards/operations/git-repository-map.md`
- `Docs/03_standards/operations/git-environments-and-release-flow.md`
- `Docs/03_standards/operations/django-api-project-compliance.md`

Quedo fuera:

- No se busco en todo `Docs`.
- No se crearon ramas `qa` ni `uat` porque siguen como etapas pendientes.
- No se abrieron pull requests porque `gh` no esta instalado en esta maquina.

## Ramas creadas/publicadas

Repositorio:

```text
Docker.API.PY/API.PY.DJANGO.LexNova.Gateway
```

Commit inicial:

```text
7c884b2 Add LexNova gateway MVP
```

Ramas publicadas en GitHub:

| Rama | Estado |
|---|---|
| `main` | Publicada. |
| `dev` | Publicada. |
| `pro` | Publicada. |
| `feature/lex-nova-tech-identification` | Publicada y activa localmente. |

## Verificacion de repositorios LexNova

| Repositorio | Ramas verificadas |
|---|---|
| `API.PY.DJANGO.LexNova.Gateway` | `main`, `dev`, `pro`, `feature/lex-nova-tech-identification` |
| `API.PY.DJANGO.LexNova` | `main`, `dev`, `pro`, `feature/lex-nova-tech-identification` |
| `WEB.NJ.NEXT.LexNova` | `main`, `dev`, `pro`, `feature/lex-nova-tech-identification` |
| `Docker.API.PY` | `main`, `dev`, `pro`, `feature/lex-nova-tech-identification` |
| `Docs` | `main`, `dev`, `pro`, `feature/lex-nova-tech-identification` |

## Ajustes documentales

Se actualizo:

```text
Docs/03_standards/operations/git-environments-and-release-flow.md
```

para dejar consistente que:

- `pro` es rama de despliegue productivo.
- `main` es copia estable de `pro`.
- `qa` y `uat` siguen pendientes hasta que existan procesos formales.

## Validaciones

Se conservan las validaciones de la pasada anterior:

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.LexNova.Gateway` | `python manage.py check` | Correcto. |
| `API.PY.DJANGO.LexNova.Gateway` | `python -m compileall .` | Correcto. |
| `WEB.NJ.NEXT.LexNova` | `npm run build` | Correcto. |
| `Docker.API.PY` | `docker compose config` | Correcto. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones | Estaban vacios y quedaron limpios. |

## Repositorios faltantes

No falta repositorio para el alcance LexNova actual. Quedan cubiertos:

- `API.PY.DJANGO.LexNova.Gateway`
- `API.PY.DJANGO.LexNova`
- `WEB.NJ.NEXT.LexNova`
- `Docker.API.PY`
- `Docs`

Pendiente futuro solo si se decide separar nuevas capacidades:

- `API.PY.DJANGO.LexNova.Analysis` si el analisis juridico/IA se separa de la
  API de dominio.
- `API.PY.DJANGO.LexNova.Documents` si documentos legales dejan de vivir en la
  API de dominio o en Document API.

---

# Reporte de ejecucion Fiscora

Fecha: 2026-05-16

## Alcance

Se ejecuto una nueva pasada sobre `Docs/agents/AGENTS-*.md` en orden numerico. En esta corrida los archivos con instrucciones nuevas fueron:

- `AGENTS-000.md`: lineamientos de animaciones web Fiscora.
- `AGENTS-001.md`: analisis general de plataforma Fiscora.
- `AGENTS-002.md`: modelo de datos CFDI/SAT recomendado.
- `AGENTS-003.md`: preview React de animaciones principales.

`AGENTS-004.md` a `AGENTS-020.md` estaban vacios. `AGENTS-021.md` seguia siendo resumen documental. `AGENTS-022.md` a `AGENTS-030.md` estaban vacios.

## Implementacion realizada

### Documentacion Fiscora

Se creo la documentacion canonica del proyecto:

- `Docs/02_projects/fiscora/README.md`
- `Docs/02_projects/fiscora/platform-overview.md`
- `Docs/02_projects/fiscora/architecture.md`
- `Docs/02_projects/fiscora/api-contracts.md`
- `Docs/02_projects/fiscora/security.md`
- `Docs/02_projects/fiscora/database/cfdi-data-model.md`
- `Docs/02_projects/fiscora/animations/animation-guidelines.md`
- `Docs/02_projects/fiscora/frontend/animation-preview.md`

### Preview web Fiscora

Se creo un MVP funcional en:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora
```

Archivos principales:

- `package.json`
- `.env.local.example`
- `.gitignore`
- `README.md`
- `app/layout.tsx`
- `app/page.tsx`
- `app/globals.css`
- `components/FiscoraPreview.tsx`
- `lib/fiscora-data.ts`

El preview incluye:

- Hero CFDI animado.
- Flujo SAT -> XML -> PDF.
- Counters de dashboard.
- Progreso SAT por estados.
- Explorador de facturas.
- Panel CFDI.
- Personalizador visual.
- Soporte de `prefers-reduced-motion`.

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `WEB.NJ.NEXT.Fiscora` | `npm install` | Correcto. NPM reporto 2 vulnerabilidades moderadas en dependencias; no se aplico `npm audit fix --force` para evitar cambios mayores automaticos. |
| `WEB.NJ.NEXT.Fiscora` | `npm run build` | Correcto. |
| `WEB.NJ.NEXT.Fiscora` | `http://localhost:3005` | Servidor local iniciado y responde HTTP 200. |

No se ejecutaron checks Django porque esta corrida no creo APIs Fiscora.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Lineamientos de animaciones convertidos en documentacion y preview. |
| `AGENTS-001.md` | Completado | Vision de plataforma Fiscora documentada. |
| `AGENTS-002.md` | Completado | Modelo CFDI/SAT documentado. |
| `AGENTS-003.md` | Completado | Preview Next.js implementado y validado. |
| `AGENTS-004.md` - `AGENTS-020.md` | Sin instrucciones | Estaban vacios. |
| `AGENTS-021.md` | Sin tarea ejecutable | Solo contiene resumen documental. |
| `AGENTS-022.md` - `AGENTS-030.md` | Sin instrucciones | Estaban vacios. |

## Limpieza

Despues de completar y validar la corrida, se limpiaron los archivos `Docs/agents/AGENTS-*.md` para dejarlos listos para futuras instrucciones.

## Pendientes

- Definir remotos Git para `API.PY.DJANGO.Fiscora`, `API.PY.DJANGO.Fiscora.Gateway` y `WEB.NJ.NEXT.Fiscora`.
- Crear APIs Fiscora cuando exista agent especifico de backend.
- Conectar el preview Fiscora con datos reales del gateway.
- Revisar vulnerabilidades moderadas reportadas por `npm audit` sin aplicar cambios breaking automaticos.

---

# Reporte de ejecucion Fiscora/Fiscal APIs

Fecha: 2026-05-16

## Alcance

Se ejecuto una nueva pasada sobre `Docs/agents/AGENTS-*.md` en orden numerico. En esta corrida los archivos con instrucciones fueron:

- `AGENTS-000.md`: definicion de arquitectura Fiscora/Fiscal y responsabilidades de APIs.
- `AGENTS-001.md`: consolidacion de arquitectura fiscal, SAT, CFDI, jobs y persistencia.

`AGENTS-002.md` a `AGENTS-030.md` estaban vacios.

## Implementacion realizada

### API Fiscal

Se creo:

```text
Docker.API.PY/API.PY.DJANGO.Fiscal
```

Responsabilidad:

- Tenants/empresas fiscales.
- CFDI documents.
- XML upload metadata MVP.
- Solicitudes de descarga SAT.
- Verificacion de solicitudes SAT.
- Paquetes SAT.
- Reportes basicos.
- Auditoria fiscal.

Endpoints MVP:

- `GET /api/fiscal/health/`
- `GET|POST /api/fiscal/tenants/`
- `GET|POST /api/fiscal/cfdi/`
- `GET /api/fiscal/cfdi/{uuid}/`
- `POST /api/fiscal/xml/upload/`
- `GET|POST /api/fiscal/sat/download-requests/`
- `POST /api/fiscal/sat/download-requests/{request_id}/verify/`
- `GET /api/fiscal/reports/summary/`
- `GET|POST /api/fiscal/audit/events/`

### API Fiscora

Se creo:

```text
Docker.API.PY/API.PY.DJANGO.Fiscora
```

Responsabilidad:

- Producto comercial Fiscora.
- Planes.
- Creditos.
- Reglas de uso.
- Preferencias del portal.

Endpoints MVP:

- `GET /api/fiscora/product/health/`
- `GET /api/fiscora/product/configuration/`
- `GET|POST /api/fiscora/product/plans/`
- `GET|POST /api/fiscora/product/credits/`
- `GET|POST /api/fiscora/product/preferences/`

### Gateway Fiscora

Se creo:

```text
Docker.API.PY/API.PY.DJANGO.Fiscora.Gateway
```

Responsabilidad:

- BFF para `WEB.NJ.NEXT.Fiscora`.
- Normalizacion de respuestas.
- Proxy hacia `API.PY.DJANGO.Fiscora`.
- Proxy hacia `API.PY.DJANGO.Fiscal`.

Endpoints MVP:

- `GET /api/fiscora/health/`
- `GET /api/fiscora/dashboard/summary/`
- `GET /api/fiscora/configuration/`
- `GET|POST /api/fiscora/cfdi/`
- `GET /api/fiscora/cfdi/{uuid}/`
- `POST /api/fiscora/sat/download-jobs/`
- `POST /api/fiscora/xml/upload/`
- `GET /api/fiscora/reports/summary/`

### Docker local

Se actualizo:

- `Docker.API.PY/docker-compose.yml`
- `Docker.API.PY/Dockerfile`
- `Docker.API.PY/start.sh`
- `Docker.WEB.NJ/docker-compose.yml`
- `Docker.WEB.NJ/start.sh`

Puertos agregados:

- `8014`: `API.PY.DJANGO.Fiscora.Gateway`
- `8015`: `API.PY.DJANGO.Fiscora`
- `8016`: `API.PY.DJANGO.Fiscal`
- `3005`: `WEB.NJ.NEXT.Fiscora`

### Documentacion

Se actualizo:

- `Docs/02_projects/fiscora/README.md`
- `Docs/02_projects/fiscora/architecture.md`
- `Docs/02_projects/fiscora/repositories.md`
- `Docs/03_standards/operations/git-repository-map.md`
- `Docs/03_standards/operations/django-api-project-compliance.md`

## Repositorios asignados

| Proyecto | Origin |
|---|---|
| `API.PY.DJANGO.Fiscal` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscal.git` |
| `API.PY.DJANGO.Fiscora` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.git` |
| `API.PY.DJANGO.Fiscora.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.Gateway.git` |
| `WEB.NJ.NEXT.Fiscora` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.Fiscora.git` |

No se hicieron commits ni pushes en esta corrida.

## Validaciones

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.Fiscal` | `python manage.py makemigrations fiscal` | Correcto. |
| `API.PY.DJANGO.Fiscal` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Fiscal` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.Fiscora` | `python manage.py makemigrations portal` | Correcto. |
| `API.PY.DJANGO.Fiscora` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Fiscora` | `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.Fiscora.Gateway` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Fiscora.Gateway` | `python -m compileall .` | Correcto. |
| `WEB.NJ.NEXT.Fiscora` | `npm run build` | Correcto. |
| `Docker.API.PY` | `docker compose config` | Correcto. |
| `Docker.WEB.NJ` | `docker compose config` | Correcto. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Arquitectura Fiscora/Fiscal implementada como MVP. |
| `AGENTS-001.md` | Completado | Persistencia fiscal/SAT/CFDI implementada como API Fiscal MVP y documentada. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Estaban vacios. |

## Limpieza

Despues de completar y validar la corrida, se limpiaron los archivos `Docs/agents/AGENTS-*.md`.

## Pendientes

- Implementar integracion real con Web Services SAT.
- Implementar parser XML CFDI completo.
- Conectar `WEB.NJ.NEXT.Fiscora` con `API.PY.DJANGO.Fiscora.Gateway`.
- Ejecutar migraciones reales contra PostgreSQL cuando el entorno Docker este levantado.
- Hacer commit y push por repositorio cuando se solicite publicacion.

---

# Reporte de publicacion Git Fiscora/Fiscal

Fecha: 2026-05-16

## Commits publicados

| Repositorio | Commit | Mensaje |
|---|---|---|
| `MexIngSoft/Docs` | `21a779d` | `Document Fiscora fiscal architecture` |
| `MexIngSoft/Docker.API.PY` | `7839bfc` | `Configure Fiscora API services` |
| `MexIngSoft/Docker.WEB.NJ` | `aafe69c` | `Configure Fiscora web service` |
| `MexIngSoft/Docker.WEB.NJ` | `86a72fc` | `Ignore separated web repositories` |
| `MexIngSoft/API.PY.DJANGO.Fiscal` | `8422c5e` | `Add fiscal core MVP` |
| `MexIngSoft/API.PY.DJANGO.Fiscora` | `f019624` | `Add Fiscora product API MVP` |
| `MexIngSoft/API.PY.DJANGO.Fiscora.Gateway` | `bee77a2` | `Add Fiscora gateway MVP` |
| `MexIngSoft/WEB.NJ.NEXT.Fiscora` | `a385f54` | `Add Fiscora animation preview` |

## Push

| Repositorio | Rama | Resultado |
|---|---|---|
| `https://github.com/MexIngSoft/Docs.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/Docker.API.PY.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/Docker.WEB.NJ.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscal.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.Gateway.git` | `main` | Publicado correctamente. |
| `https://github.com/MexIngSoft/WEB.NJ.NEXT.Fiscora.git` | `main` | Publicado correctamente. |

## Nota

`gh` no esta instalado en esta maquina, por lo que no se crearon pull requests desde CLI. La publicacion se hizo con `git`.

---

# Reporte de ejecucion Agents - Investigacion juridica LexNova

Fecha: 2026-05-18

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md` en orden numerico. Los archivos
`AGENTS-001.md` a `AGENTS-030.md` estaban vacios y no tenian tareas
ejecutables.

Antes de documentar se reviso:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`

## Resultado

Se agrego `Docs/02_projects/lexnova/legal-domain-research.md` como documento
canonico complementario para materias, procedimientos, documentos, actores,
matrices, normas versionables, plazos, evidencia, IA, revision humana, riesgos,
roadmap y fuentes oficiales.

Tambien se actualizaron:

- `Docs/02_projects/lexnova/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `rg` de `legal-domain-research` en README, indices, mapa y reporte | Correcto. |
| `python manage.py check` en `Docker.API.PY/API.PY.DJANGO.LexNova` | Correcto, sin issues. |
| Limpieza de `Docs/agents/AGENTS-*.md` | Correcto, todos quedaron en 0 bytes. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Investigacion juridica LexNova documentada y enlazada a indices canonicos. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Levantar legislacion estatal y organismos de derechos humanos por entidad.
- Validar plazos por supuesto, norma, excepcion y calendario de autoridad.
- Implementar catalogos versionables en base de datos.
- Definir ingestion oficial de jurisprudencia/tesis del SJF.
- Cerrar OCR, storage, cifrado, retencion, hash y cadena de custodia final.
## 2026-05-22 - AGENTS-000/001 - Modelo relacional documental LexNova

### Resultado

- Ejecutado `AGENTS-000.md`: se adapto el modelo para que el documento/evidencia exista primero como entidad independiente y despues pueda vincularse directa o indirectamente con expedientes, procedimientos, documentos u otras entidades juridicas.
- Ejecutado `AGENTS-001.md`: se implemento el patron `EvidenceUsage` para reutilizar una misma evidencia como prueba, anexo, antecedente, referencia, soporte de riesgo, argumento de derechos humanos u otro uso procesal.
- En `API.PY.DJANGO.Document` se agrego persistencia para origen/proveedor/contexto de archivos, texto por pagina, clasificacion documental, artefactos derivados y revision humana ampliada.
- En `API.PY.DJANGO.LexNova` se agrego `InternalCaseNumber`, numeros externos del expediente, origen y referencias a Document API en `DigitalAsset`, relaciones documento-documento con naturaleza/confianza/revision, `EvidenceUsage` y `LegalGraphRelation` para preparar el mapa relacional juridico.
- Se actualizaron documentos canonicos de DocuCore y LexNova con las decisiones tomadas.

### Validacion

- `Docker.API.PY/API.PY.DJANGO.Document`: `python manage.py makemigrations files jobs`
- `Docker.API.PY/API.PY.DJANGO.Document`: `python manage.py check`
- `Docker.API.PY/API.PY.DJANGO.Document`: `python -m compileall .`
- `Docker.API.PY/API.PY.DJANGO.LexNova`: `python manage.py makemigrations legal_workspace`
- `Docker.API.PY/API.PY.DJANGO.LexNova`: `python manage.py check`
- `Docker.API.PY/API.PY.DJANGO.LexNova`: `python -m compileall .`
- `Docker.API.PY/API.PY.DJANGO.LexNova.Gateway`: `python manage.py check`
- `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova`: `npm run build`

### Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/02_projects/docucore/database.md`
- `Docs/01_core_erp/database/14_documents_model.md`

### Informacion faltante o ambigua

- Falta definir el formato operativo final para generar automaticamente `InternalCaseNumber` tipo `LEX-2026-000001`.
- Falta definir proveedor OCR/transcripcion productivo, retencion, cifrado y storage definitivo.
- Falta cerrar el contrato final de sincronizacion automatica entre LexNova API y Document API para guardar `DocumentApiFileId` y `DocumentApiIndexId` sin pasos manuales.
- Falta definir catalogos finales de `RelationType`, `UsageType` y severidades por materia juridica.

### Estado de agents

- `AGENTS-000.md`: completado.
- `AGENTS-001.md`: completado.
- `AGENTS-002.md` a `AGENTS-030.md`: sin contenido ejecutable; quedan sin cambios funcionales.

## 2026-05-22 - Validacion, migraciones y cuestionario LexNova

### Resultado

- Se creo `Docs/02_projects/lexnova/tasks/definition-questionnaire.md` para
  capturar las decisiones que faltan antes de cerrar flujos productivos:
  expedientes, procedimientos, evidencia, OCR, storage, perfiles, seguimiento,
  resultados, integraciones y catalogos legales.
- Se registro el cuestionario en `Docs/_meta/master-index.md`,
  `Docs/_meta/master-index.yaml` y `Docs/_meta/navigation-map.md`.
- Se agrego `files/migrations/0000_create_document_schema.py` en Document API
  para crear el schema PostgreSQL `Document` antes de crear tablas publicadas
  con nombres `"Document"."..."`.
- Se aplicaron migraciones locales dentro del contenedor Docker contra
  PostgreSQL para LexNova API y Document API.
- Se reiniciaron `api-backend-python` y `web-frontend-node` para que los
  procesos cargaran los modelos y rutas actualizados.

### Validacion ejecutada

- `docker exec api-backend-python sh -lc "/usr/src/api/start.sh manage lexnova migrate --noinput"`: OK.
- `docker exec api-backend-python sh -lc "/usr/src/api/start.sh manage document migrate --noinput"`: OK despues de agregar migracion de schema.
- `docker exec api-backend-python sh -lc "/usr/src/api/start.sh manage document check"`: OK.
- `docker exec api-backend-python sh -lc "/usr/src/api/start.sh manage lexnova check"`: OK.
- `docker exec api-backend-python sh -lc "/usr/src/api/start.sh manage lexnova_gateway check"`: OK.
- `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova`: `npm run build`: OK.
- `GET http://localhost:8011/api/document/health/`: 200.
- `GET http://localhost:8017/api/lexnova/health/`: 200.
- `GET http://localhost:3002`: 200.
- `GET http://localhost:8003/api/ping/`: 403 esperado por permisos de API de dominio; el servicio responde y la ruta publica se valida por gateway.

### Documentos revisados

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/architecture.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/lexnova/process-tracking.md`
- `Docs/02_projects/docucore/database.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/01_core_erp/database/14_documents_model.md`

### Documentos fuera de alcance

- Documentacion de otros proyectos como Tecno Telec, Fiscora, Buildora,
  JobCron, integraciones Syscom y modulos ERP no relacionados con LexNova o
  DocuCore.

### Informacion faltante

- Respuestas de negocio al cuestionario creado.
- Fuente de verdad productiva para aplicar migraciones fuera del PostgreSQL
  local de Docker.
- Politica final de OCR/transcripcion, storage, retencion, cifrado, cadena de
  custodia y visibilidad al cliente.

### Decisiones tomadas

- Mantener el documento/evidencia como entidad independiente y reutilizable.
- Validar funcionamiento por Gateway/Web para respetar la arquitectura canonica.
- Preparar el schema `Document` desde migracion para evitar fallos en ambientes
  limpios de PostgreSQL.

---

# Reporte de ejecucion Agents - Gobierno GitHub

Fecha: 2026-05-22

## Alcance

Se ejecuto `AGENTS-000.md` en orden numerico. El agent solicita definir el
marco de trabajo con ramas en GitHub, manteniendo `dev` como integracion,
ramas por tarea/proceso/proyecto y promocion hacia ramas principales.

Por instruccion explicita del owner, esta corrida se limito primero a definir y
documentar debidamente GitHub y sus reglas sin quitar ni modificar el proceso de
comunicacion vigente entre ramas principales:

```text
feature/* -> dev -> pro -> main
```

`AGENTS-001.md` a `AGENTS-005.md` contienen instrucciones amplias de DocuCore y
quedan pendientes para una fase posterior. `AGENTS-006.md` a `AGENTS-030.md`
estan vacios.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/document-relations.md`
- `Docs/03_standards/operations/git-environments-and-release-flow.md`
- `Docs/03_standards/operations/git-repository-map.md`
- `Docs/03_standards/documentation-maintenance-policy.md`

## Resultado

Se agrego documentacion canonica para gobierno de ramas y reglas GitHub:

- `Docs/03_standards/operations/github-branch-governance.md`

Se actualizaron:

- `Docs/03_standards/operations/git-environments-and-release-flow.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/document-relations.md`
- `Docs/_meta/navigation-map.md`

## Decisiones tomadas

- Mantener intacta la comunicacion principal `feature/* -> dev -> pro -> main`.
- Documentar `dev` como integracion diaria, `pro` como despliegue productivo y
  `main` como copia estable de produccion.
- Documentar reglas de PR para `feature/* -> dev`, `dev -> pro` y `pro -> main`.
- Documentar protecciones recomendadas para `main`, `pro` y `dev`.
- Documentar hotfix como excepcion controlada sin reemplazar el flujo principal.
- Mantener la regla de repositorios separados: no publicar `Workspace.Comercial`
  como monorepo.
- Registrar que los commits deben ser por repositorio y responsabilidad.

## Validaciones ejecutadas

- `rg` de `github-branch-governance` en indices y relaciones: correcto.
- `git diff --check` en `Docs`: correcto, sin errores de whitespace.

No se ejecutaron builds de aplicacion porque esta corrida modifico solo
documentacion.

## Informacion faltante o ambigua

- Falta confirmar si todos los repositorios tendran protecciones obligatorias
  configuradas directamente en GitHub o si algunas ramas seguiran con control
  manual mientras el equipo sea pequeno.
- `gh` no esta instalado en esta maquina; queda pendiente si se requiere crear
  Pull Requests desde terminal.
- Falta definir convencion final de tags por producto/repositorio.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Gobierno de ramas y reglas GitHub documentadas sin cambiar el flujo `feature/* -> dev -> pro -> main`. |
| `AGENTS-001.md` | Pendiente | Define MVP final DocuCore; queda fuera de esta primera fase GitHub. |
| `AGENTS-002.md` | Pendiente | Define navegacion inteligente DocuCore; queda fuera de esta primera fase GitHub. |
| `AGENTS-003.md` | Pendiente | Contiene instrucciones DocuCore; queda fuera de esta primera fase GitHub. |
| `AGENTS-004.md` | Pendiente | Contiene instrucciones DocuCore; queda fuera de esta primera fase GitHub. |
| `AGENTS-005.md` | Pendiente | Define maquetacion web DocuCore; queda fuera de esta primera fase GitHub. |
| `AGENTS-006.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Limpieza

No se limpiaron ni archivaron los agents porque no todos quedaron concluidos:
`AGENTS-001.md` a `AGENTS-005.md` siguen pendientes.

---

# Reporte de ejecucion Agents - Orden documental y cierre DocuCore

Fecha: 2026-05-22

## Alcance

Se ejecutaron `Docs/agents/AGENTS-000.md` a `AGENTS-006.md` en orden numerico.
`AGENTS-007.md` a `AGENTS-030.md` estaban vacios y no tenian instrucciones
ejecutables.

La corrida tuvo dos objetivos:

- verificar si los agents activos estaban conectados y si correspondia
  limpiarlos;
- adaptar el nuevo agent de orden documental a las necesidades reales del
  repositorio para que futuras solicitudes de ordenamiento documental sigan un
  proceso claro.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/document-relations.md`
- `Docs/03_standards/documentation-maintenance-policy.md`
- `Docs/_meta/codex_execution_plan.md`
- `Docs/03_standards/operations/github-branch-governance.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/architecture.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/security.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/02_projects/docucore/qa-checklist.md`

## Resultado

Se crearon documentos canonicos:

- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/operations/agents-documentation-order.md`

Se actualizaron:

- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/security.md`
- `Docs/02_projects/docucore/qa-checklist.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/document-relations.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado previamente | Gobierno GitHub ya documentado; se verifico conexion con indices. |
| `AGENTS-001.md` | Completado como documentacion y backlog | MVP DocuCore fue convertido en `mvp-roadmap.md`; lo implementado y lo pendiente quedaron separados. |
| `AGENTS-002.md` | Completado como documentacion UX | Navegacion inteligente y pipeline assistant quedaron en `frontend-navigation-and-ux.md`. |
| `AGENTS-003.md` | Completado como arquitectura de responsabilidades | Separacion DocuCore/LexNova se mantuvo en documentos canonicos DocuCore y contratos. |
| `AGENTS-004.md` | Completado como criterio visual | Reglas visuales utiles fueron integradas al documento de navegacion e interfaz. |
| `AGENTS-005.md` | Completado como maquetacion | Rutas, componentes y estados quedaron resumidos en el canon UX. |
| `AGENTS-006.md` | Completado | Nuevo orden documental adaptado en `agents-documentation-order.md`. |
| `AGENTS-007.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Informacion faltante o ambigua

- El agent DocuCore menciona capacidades productivas grandes que no deben
  activarse hasta tener engine real: sandbox por worker, OCR estructurado,
  PDF rotate, metadata read, resize/format convert y batch multiarchivo.
- Falta confirmar si la limpieza futura de agents debe ser siempre vaciar el
  archivo o mover contenido historico a `_archive`; por consistencia con
  corridas anteriores se limpio el contenido ya absorbido.
- Falta definir si los indices `_meta` se regeneraran con script o seguiran
  actualizandose manualmente en cambios pequenos.

## Decisiones tomadas

- No se implementaron nuevas funciones de producto en esta corrida; el alcance
  fue documental.
- Las promesas amplias de los agents se dividieron en MVP real, pendientes y
  fase posterior.
- El frontend no debe publicar herramientas que el backend no marque como
  `enabled`.
- La regla futura para ordenar documentacion queda centralizada en
  `Docs/03_standards/operations/agents-documentation-order.md`.
- Al quedar todos los agents con contenido completados o convertidos en
  documentos canonicos, se limpiaron `AGENTS-000.md` a `AGENTS-006.md`.

## Documentos fuera de alcance

- Documentacion no relacionada con DocuCore, Agents, GitHub o mantenimiento
  documental.
- Implementaciones de APIs, Web o Docker, porque esta corrida solo ordeno
  documentacion.

## Validaciones ejecutadas

- `rg` de documentos nuevos en indices y relaciones.
- `git diff --check` en `Docs`.

## Limpieza

Se limpiaron `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-006.md` porque
sus instrucciones quedaron ejecutadas, registradas o absorbidas por
documentacion canonica. `AGENTS-007.md` a `AGENTS-030.md` ya estaban vacios.

---

# Reporte de ejecucion Agents - Alineacion MVP LexNova DocuCore Fiscora

Fecha: 2026-05-23

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md` en orden numerico. `AGENTS-001.md` a
`AGENTS-030.md` estaban vacios y no contenian instrucciones ejecutables.

El agent contenia definicion estrategica para:

- LexNova LegalTech;
- DocuCore como procesamiento documental;
- Fiscora como plataforma fiscal CFDI;
- capacidades compartidas entre las tres plataformas.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/_ecosystem/00_ecosystem_overview.md`
- `Docs/02_projects/_ecosystem/03_development_strategy.md`
- `Docs/02_projects/_ecosystem/04_process_convergence_and_conflicts.md`
- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/lexnova/document-api-integration-review.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/fiscora/README.md`
- `Docs/02_projects/fiscora/platform-overview.md`
- `Docs/02_projects/fiscora/architecture.md`
- `Docs/02_projects/fiscora/api-contracts.md`
- `Docs/02_projects/fiscora/tasks/00_mvp_scope.md`
- `Docs/02_projects/fiscora/tasks/01_pending_tasks.md`

## Resultado documental

Se creo:

- `Docs/02_projects/_ecosystem/05_lexnova_docucore_fiscora_mvp_alignment.md`

Se actualizaron:

- `Docs/02_projects/_ecosystem/00_ecosystem_overview.md`
- `Docs/02_projects/lexnova/document-api-integration-review.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/document-relations.md`

## Resultado de codigo

Se implemento el cierre minimo del enlace documental LexNova:

- `API.PY.DJANGO.LexNova` ahora expone
  `POST /api/legal-workspace/documents/intake/`.
- El endpoint crea o actualiza `DigitalAsset` usando `DocumentApiFileId`,
  `DocumentApiIndexId`, metadata del archivo, estado, payload de procesamiento,
  hash, origen y tipo detectado.
- Si se recibe `legal_case_id`, prepara `CaseDocumentAccessPolicy` con
  visibilidad `PARTICIPANTS_ONLY` y scopes documentales.
- `WEB.NJ.NEXT.LexNova` ahora, despues de subir y procesar el archivo con
  Document API, consulta el indice persistido y registra el asset en LexNova
  por medio del Gateway.

Archivos modificados:

- `Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace/views.py`
- `Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace/urls.py`
- `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova/app/dashboard/modules/cases/upload/page.tsx`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `WEB.NJ.NEXT.LexNova`: `npm run build` | Correcto. |
| `API.PY.DJANGO.LexNova`: `python -m compileall .` | Correcto. |
| `API.PY.DJANGO.LexNova`: `python manage.py check` con `DJANGO_SECRET_KEY`, `DATABASE_URL` y `AUTH_API_VERIFY_URL` de desarrollo | Correcto, sin issues. |
| `Docs`: `rg` de documento transversal en indices y relaciones | Correcto. |
| `Docs`: `git diff --check` | Correcto. |
| `API.PY.DJANGO.LexNova`: `git diff --check` | Correcto. |
| `WEB.NJ.NEXT.LexNova`: `git diff --check` | Correcto. |

## Informacion faltante o ambigua

- Falta definir el catalogo final de visibilidad por materia y tipo documental.
- Falta definir si el endpoint de intake debe ser invocado solo desde backend
  orquestador o tambien desde la pantalla web tras procesamiento MVP.
- Falta cerrar OCR productivo, colas, reintentos, worker aislado, storage
  cifrado y cadena de custodia completa.
- Falta definir si Fiscora activara SAT real detras de feature flag o si la
  primera entrega se limita estrictamente a carga manual XML.

## Decisiones tomadas

- No se reemplazaron documentos canonicos existentes; se agrego un documento
  transversal que enlaza y ordena lo ya definido.
- La implementacion de codigo se limito al pendiente mas inmediato: persistir
  en LexNova la relacion con Document API.
- No se implemento IA juridica avanzada, SAT real, batch upload, PDF searchable
  ni worker aislado porque el agent los clasifica como fases posteriores o
  requiere definicion adicional.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Alineacion MVP documentada y cierre minimo de relacion documental LexNova implementado. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Limpieza

Al quedar `AGENTS-000.md` documentado y ejecutado, se limpia para dejarlo listo
para una siguiente corrida. Los demas agents ya estaban vacios.

---

# Reporte de ejecucion Agents - CFDI multiversion Fiscal/Fiscora

Fecha: 2026-05-23

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md` en orden numerico. El archivo no contenia
instrucciones narrativas: contenia un dump SQL completo de una base CFDI
historica. `AGENTS-001.md` a `AGENTS-030.md` estaban vacios y no contenian
instrucciones ejecutables.

Tambien se revisaron los PDFs colocados en `Docs/agents` como fuentes de
interpretacion fiscal para CFDI 4.0:

- `Docs/agents/Anexo_20_Guia_de_llenado_CFDI.pdf`
- `Docs/agents/CFDI-4-0-MAYO-2022.pdf`

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/fiscora/README.md`
- `Docs/02_projects/fiscora/architecture.md`
- `Docs/02_projects/fiscora/api-contracts.md`
- `Docs/02_projects/fiscora/database/cfdi-data-model.md`
- `Docs/02_projects/fiscora/tasks/00_mvp_scope.md`
- `Docs/02_projects/fiscora/tasks/01_pending_tasks.md`
- `Docs/02_projects/fiscora/decisions/adr_0001_api_boundaries.md`

## Fuentes tecnicas analizadas

- `AGENTS-000.md`: dump SQL de `u116359781_CFDI` con tablas de comprobante,
  emisor, receptor, conceptos, impuestos, relaciones, timbre fiscal digital,
  catalogos SAT y versiones.
- `Anexo_20_Guia_de_llenado_CFDI.pdf`: guia de llenado SAT para CFDI 4.0,
  retenciones e informacion de pagos.
- `CFDI-4-0-MAYO-2022.pdf`: material SAT de transicion y campos relevantes de
  CFDI 4.0.

## Resultado documental

Se actualizo:

- `Docs/02_projects/fiscora/database/cfdi-data-model.md`
- `Docs/02_projects/fiscora/README.md`
- `Docs/02_projects/fiscora/tasks/01_pending_tasks.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/document-relations.md`

Se creo:

- `Docs/02_projects/fiscora/tasks/02_cfdi_multiversion_implementation.md`

## Resultado de codigo

Se agrego el primer cierre funcional del modelo CFDI multiversion en
`API.PY.DJANGO.Fiscal`:

- `CfdiDocument` ahora guarda campos normalizados comunes de CFDI 2.0, 3.x y
  4.0, XML original, SHA-256, arbol XML completo y atributos de version.
- Se agregaron tablas publicadas para partes, conceptos, impuestos, relaciones,
  complementos, atributos por version y catalogos SAT.
- `POST /api/fiscal/xml/upload/` ahora recibe XML por multipart o JSON, valida
  tenant, parsea el comprobante, extrae timbre, emisor, receptor, conceptos,
  impuestos, relaciones y complementos, y devuelve el detalle persistido.
- `GET /api/fiscal/cfdi/{uuid}/` devuelve el detalle con estructuras hijas.
- Se genero la migracion `fiscal/migrations/0002_cfdicomplement_cfdiconcept_cfdiparty_cfdirelation_and_more.py`.

Archivos modificados:

- `Docker.API.PY/API.PY.DJANGO.Fiscal/fiscal/models.py`
- `Docker.API.PY/API.PY.DJANGO.Fiscal/fiscal/serializers.py`
- `Docker.API.PY/API.PY.DJANGO.Fiscal/fiscal/views.py`
- `Docker.API.PY/API.PY.DJANGO.Fiscal/fiscal/migrations/0002_cfdicomplement_cfdiconcept_cfdiparty_cfdirelation_and_more.py`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `API.PY.DJANGO.Fiscal`: `python manage.py makemigrations fiscal` | Correcto. |
| `API.PY.DJANGO.Fiscal`: `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.Fiscal`: `python -m compileall fiscal` | Correcto. |
| `API.PY.DJANGO.Fiscal`: `git diff --check` | Correcto, solo advertencias LF/CRLF. |
| `Docs`: `git diff --check` | Correcto, solo advertencias LF/CRLF. |

## Informacion faltante o ambigua

- Falta definir fuente, periodicidad y responsable de ingestion de catalogos SAT.
- Falta implementar validacion XSD/cadena original/sello contra reglas SAT.
- Falta normalizar complementos especializados fuera del almacenamiento JSON
  general, por ejemplo pagos, nomina y carta porte.
- Falta conectar el Gateway de Fiscora y la web para consumir el endpoint fiscal
  normalizado sin exponer XML completo al frontend.
- Falta definir retencion, cifrado y politica de consulta para XML original y
  arbol XML completo.

## Decisiones tomadas

- Se mantiene un modelo comun multiversion en lugar de crear tablas separadas
  por CFDI 2.0, 3.x y 4.0.
- El XML original se conserva completo; los campos consultables se normalizan y
  los atributos especificos por version se guardan sin descartarse.
- El frontend Fiscora no debe consumir `API.PY.DJANGO.Fiscal` directamente:
  debe pasar por `API.PY.DJANGO.Fiscora.Gateway`.
- La API Document sigue reservada para PDF/render/plantillas; Fiscal conserva
  autoridad sobre XML CFDI, SAT, auditoria fiscal y reportes.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Dump SQL CFDI y PDFs SAT analizados; modelo documental y API Fiscal multiversion implementados en primera fase. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Limpieza

El contenido fuente de `AGENTS-000.md` y los PDFs SAT se archivan como evidencia
en `Docs/_archive/agents/2026-05-23-cfdi-model/`. `AGENTS-000.md` queda limpio
para una siguiente corrida y los demas agents permanecen vacios.

---

# Reporte de ejecucion Agents - Optimizacion de estructura documental

Fecha: 2026-05-23

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md` en orden numerico. El agent proponia
mejorar la velocidad de trabajo documental consolidando primero Core, Shared,
Meta, Agents y Templates, y despues priorizar Fiscora, DocuCore, LexNova,
TecnoTelec y JobCron.

`AGENTS-001.md` a `AGENTS-030.md` estaban vacios y no contenian instrucciones
ejecutables.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/proposed_structure.md`
- `Docs/_meta/folder_rules.md`
- `Docs/03_standards/documentation-maintenance-policy.md`
- `Docs/03_standards/operations/agents-documentation-order.md`
- `Docs/00_audit/10_development_gap_analysis.md`

## Evaluacion del agent

La recomendacion del agent es valida como estrategia operativa, pero no como
cambio fisico de carpetas. No se crean rutas paralelas como `Docs/core` o
`Docs/shared`, porque la estructura canonica vigente ya esta establecida en
`Docs/README.md`:

- `Docs/01_core_erp`
- `Docs/02_projects`
- `Docs/03_standards`
- `Docs/04_integrations`
- `Docs/_meta`
- `Docs/agents`
- `Docs/templates`
- `Docs/_archive`

## Resultado documental

Se creo:

- `Docs/_meta/active-work-index.md`
- `Docs/00_audit/11_documentation_structure_optimization.md`

Se actualizaron:

- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/document-relations.md`
- `Docs/_meta/proposed_structure.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Informacion faltante o ambigua

- Owners reales por dominio y proyecto.
- Rama objetivo para publicar cambios documentales.
- Priorizacion humana final cuando Fiscora, DocuCore, LexNova, Tecno Telec y
  JobCron compitan por recursos.
- Decision futura sobre si proyectos `FUTURE_OR_PENDING` tendran APIs propias o
  modulos internos de JobCron.

## Decisiones tomadas

- Mantener la estructura fisica actual.
- Adoptar el concepto `Shared` como capa operativa compuesta por
  `03_standards`, `_meta` y `templates`.
- Crear un indice operativo para lectura rapida y priorizacion:
  `Docs/_meta/active-work-index.md`.
- Documentar la evaluacion del agent en auditoria:
  `Docs/00_audit/11_documentation_structure_optimization.md`.
- No profundizar POS, GovernmentTender, APS, HRM, EAM, QMS, BI avanzado, CRM
  empresarial, TMS complejo o event bus empresarial hasta tener owner y MVP.

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `Docs`: busqueda `rg` de rutas nuevas en indices y relaciones | Correcto. |
| `Docs`: `git diff --check` | Correcto, solo advertencias LF/CRLF. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Propuesta evaluada y adaptada como indice operativo sin mover estructura canonica. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Limpieza

El contenido de `AGENTS-000.md` se archiva en
`Docs/_archive/agents/2026-05-23-documentation-structure/` y el agent queda
limpio para una siguiente corrida. Los demas agents permanecen vacios.

## 2026-05-24 - AGENTS-000/001 - LexNova experiencia cliente e IA documental

Se ejecutaron `Docs/agents/AGENTS-000.md` y `Docs/agents/AGENTS-001.md` en
orden numerico. `AGENTS-002.md` a `AGENTS-030.md` estaban vacios y no tenian
instrucciones ejecutables.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`
- `Docs/_meta/active-work-index.md`
- `Docs/00_audit/10_development_gap_analysis.md`
- `Docs/03_standards/operations/agents-documentation-order.md`
- `Docs/02_projects/lexnova/README.md`
- `Docs/02_projects/lexnova/frontend/identity-interface.md`
- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/lexnova/document-api-integration-review.md`
- `Docs/02_projects/lexnova/access-control.md`
- `Docs/02_projects/lexnova/process-tracking.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/03_standards/frontend/README.md`

## Documentos fuera

- No se hizo busqueda amplia en todo `Docs`; se uso el indice y solo canon
  relacionado con LexNova, identidad, permisos, IA documental, seguimiento de
  proceso y frontend.
- No se revisaron documentos de Fiscora, CFDI/SAT, Tecno Telec, POS, HRM, APS,
  EAM, QMS, BI o integraciones no relacionadas con esta tarea.

## Implementacion

- Se oculto lenguaje tecnico de la experiencia publica y de dashboard donde no
  correspondia para cliente final: no se menciona Gateway/BFF/JWT ni codigos de
  rol en copy visible.
- Se corrigieron beneficios y copy de servicios, login, contacto, home,
  "como funciona", dashboard, casos, perfil, acceso administrativo y resultados.
- Se agregaron enlaces reales de contacto: `mailto:contacto@lexnova.mx` y
  WhatsApp `https://wa.me/5213220131473`; se retiro ubicacion visible y se
  cambio horario a "Analizador documental disponible 24/7".
- Se mejoro contraste del logo en el frame de autenticacion con contenedor
  claro.
- Se implemento en la carga documental un flujo con estados visibles adaptados
  por tipo de archivo: documento/imagen/audio/video/paquete/origen externo.
- Se reemplazaron estados tecnicos visibles por estados amigables: recibido,
  lectura, separacion, indice editable, listo para revisar, pendiente/en
  proceso/completado.
- Se agrego interfaz de indice documental editable despues de cargar:
  agregar seccion, editar titulo/tipo/paginas, ajuste automatico de pagina
  final anterior, unir, dividir, marcar anexo, no relacionado, pendiente y
  aprobar.
- Se muestra advertencia cuando existen paginas sin clasificar.
- Se guardan documentos recien cargados en estado local del navegador y se
  muestran en dashboard y en casos como pendientes por revisar.
- Se agregaron busqueda, filtros de relacion y paginacion 10/25/50/100 a la
  lista de casos.
- Se agrego mapeo visible de roles a etiquetas humanas en dashboard, navbar y
  perfil; el perfil muestra cambio de contrasena y cerrar sesion.

## Informacion faltante o ambigua

- No existe todavia un endpoint consolidado para listar en dashboard/casos los
  documentos recien cargados; se resolvio temporalmente con `localStorage` en
  cliente.
- La API documental no expone en esta pantalla operaciones persistentes para
  guardar cada edicion del indice, union/division o aprobacion; la interfaz ya
  permite operar el indice en cliente y queda lista para conectar persistencia.
- No se especifico una taxonomia final de tipos documentales; se uso una lista
  prudente de tipos juridicos generales.
- No se definio el comportamiento final de proveedores externos de nube; se
  dejan estados visibles y copy de preparacion sin simular una conexion real.

## Decisiones tomadas

- Mantener los terminos tecnicos solo en codigo interno y variables, no como
  texto visible para cliente.
- Priorizar lenguaje juridico-operativo: evidencia, revision, indice, caso,
  seguimiento, resultado.
- No tocar funcionalidad fuera del alcance de LexNova visible/IA documental.
- No revertir cambios existentes del workspace.
- Usar persistencia local como puente visible hasta que exista endpoint
  canonico de documentos recientes.

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Correcto, sin warnings ni errores. |
| `npx tsc --noEmit` en `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Correcto. |
| `NODE_ENV=production npm run build` en copia aislada `/tmp/lexnova-build` dentro de `web-frontend-node` | Correcto, 73 rutas generadas. |
| `Invoke-WebRequest http://localhost:3005/auth/login` | `200`. |
| `Invoke-WebRequest http://localhost:3005/servicios` | `200`. |
| `Invoke-WebRequest http://localhost:3005/contacto` | `200`. |
| `Invoke-WebRequest http://localhost:3005/dashboard/modules/cases/upload` | `200`. |
| `docker ps` | `api-backend-python`, `web-frontend-node`, `db-postgresql` y `nginx` corriendo y healthy. |
| Busqueda de terminos tecnicos visibles | Solo quedaron codigos internos dentro de funciones de mapeo, no texto renderizado al cliente. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Experiencia LexNova cliente alineada: sin menciones tecnicas visibles, contacto correcto, perfil humanizado, dashboard/casos priorizados y carga documental con indice editable. |
| `AGENTS-001.md` | Completado | Estados animables/adaptados por tipo de archivo implementados en la carga documental, con etiquetas visibles amigables y proceso posterior a la carga. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Limpieza

Se archivaron `AGENTS-000.md` y `AGENTS-001.md` en
`Docs/_archive/agents/2026-05-24-lexnova-client-visible-ai-flow/` y se
limpiaron los archivos activos. `AGENTS-000.md` a `AGENTS-030.md` quedaron en
`0` bytes para futuras corridas.

---

# Reporte de ejecucion Agents - DocuCore modular y visibilidad

Fecha: 2026-05-29

## Alcance

Se revisaron `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-011.md` en orden numerico. `AGENTS-012.md` a `AGENTS-030.md` estaban vacios.

El bloque activo definia DocuCore como plataforma documental modular, las superficies de home/landing/workspace/documento/resultado/expediente/API, los mockups faltantes de cuenta, creditos, procesos, IA, comparador, extraccion, administracion e integraciones, y el control de visibilidad de features desde JobCron.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/_meta/active-work-index.md`
- `Docs/00_audit/10_development_gap_analysis.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/jobcron/README.md`
- `Docs/01_core_erp/README.md`

## Resultado de codigo

Se amplio `WEB.NJ.NEXT.DocuCore` con rutas de maqueta navegables:

- `/pdf-a-word`
- `/workspace`
- `/account`
- `/credits`
- `/results`
- `/workflows`
- `/ai`
- `/compare`
- `/extraction`
- `/casefile`
- `/api`
- `/admin`
- `/integrations`

Tambien se agrego un mapa local de `FeatureAvailability` para marcar lo disponible, MVP, pendiente o interno, sin simular que ya existe el motor central de JobCron.

## Resultado documental

Se creo:

- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/jobcron/feature-availability.md`
- `Docs/01_core_erp/erp/23_business_software_builder.md`

Se actualizo:

- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/jobcron/README.md`
- `Docs/01_core_erp/README.md`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/document-relations.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `WEB.NJ.NEXT.DocuCore`: `npm run build` | Correcto, 20 rutas generadas. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado como alcance/documentacion + maqueta | Capacidades DocuCore y modulos MVP quedaron reflejados en web y mapa de visibilidad. |
| `AGENTS-001.md` | Completado como UX | DocuCore se estructuro por flujos y superficies, no como lista plana de herramientas. |
| `AGENTS-002.md` | Completado como base visual | Se incorporo maqueta navegable sin depender de framer-motion ni Tailwind. |
| `AGENTS-003.md` | Completado como direccion visual | Se mantuvo estilo propio de panel documental empresarial. |
| `AGENTS-004.md` | Completado como workspace | Se agrego documento activo, diagnostico y herramientas recomendadas. |
| `AGENTS-005.md` | Completado como arquitectura visual | Se agregaron home/dashboard, landing SEO, workspace, cuenta, admin y API. |
| `AGENTS-006.md` | Completado como superficies | Se maquetaron home, landing, workspace, documento, resultado, expediente y API. |
| `AGENTS-007.md` | Completado como mockup multipantalla | Las pantallas quedaron como rutas reales de Next.js. |
| `AGENTS-008.md` | Completado como backlog visual | Se agregaron mockups criticos: cuenta, creditos, resultados, procesos, IA, comparador, extraccion, admin e integraciones. |
| `AGENTS-009.md` | Documentado, implementacion pendiente | `FeatureAvailability` quedo documentado en JobCron; falta API/panel real. |
| `AGENTS-010.md` | Documentado | Se amplio la vision a ciclo de vida de features, desarrollo, despliegues, documentacion, operacion y visibilidad. |
| `AGENTS-011.md` | Documentado | Se creo `Business Software Builder` como vision de ERP modular por giro. |
| `AGENTS-012.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Pendientes

- Implementar `FeatureAvailability` real en JobCron con API, modelos, panel, auditoria y permisos.
- Sustituir el mapa local de DocuCore por consulta a JobCron.
- Conectar Auth, planes, creditos, facturacion y API keys reales.
- Implementar preview real del documento activo.
- Implementar workflow engine asincrono, logs operacionales y reintentos.
- Completar OCR productivo, segmentacion de expedientes, comparador real y extraccion estructurada por plantillas.
- Definir reglas geograficas por pais/estado y fuente de ubicacion.

## Limpieza

No se limpiaron ni archivaron `AGENTS-000.md` a `AGENTS-011.md` en esta pasada porque `AGENTS-009.md` conserva una implementacion pendiente de JobCron (`FeatureAvailability` real) y conviene mantener trazabilidad visible hasta que se cierre el modulo.

---

# Reporte de verificacion Agents - DocuCore y FeatureAvailability

Fecha: 2026-05-30

## Alcance

Se revisaron `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md` en
orden numerico, siguiendo:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- documentacion canonica relacionada con DocuCore y JobCron

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/jobcron/README.md`
- `Docs/02_projects/jobcron/feature-availability.md`
- `Docs/01_core_erp/erp/23_business_software_builder.md`
- `Docs/pendientes/pendientes.md`

## Verificacion de agents

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Ya ejecutado | Vision modular DocuCore reflejada en documentacion, catalogo, API/Web y rutas actuales. |
| `AGENTS-001.md` | Ya ejecutado | DocuCore ya se presenta por flujos y panel operativo, no solo como lista plana. |
| `AGENTS-002.md` | Ya ejecutado | La maqueta React original fue convertida en rutas Next.js y componentes reales. |
| `AGENTS-003.md` | Ya ejecutado | Se mantiene identidad empresarial propia con marca DocuCore. |
| `AGENTS-004.md` | Ya ejecutado | Workspace/documento activo existe como maqueta navegable; preview real sigue pendiente por roadmap. |
| `AGENTS-005.md` | Ya ejecutado | Home, landing SEO y experiencia autenticada quedaron separadas como rutas. |
| `AGENTS-006.md` | Ya ejecutado | Superficies principales existen: dashboard, upload, workspace, resultados, expediente y API. |
| `AGENTS-007.md` | Ya ejecutado | Mockup multipantalla representado en rutas de `WEB.NJ.NEXT.DocuCore`. |
| `AGENTS-008.md` | Ya ejecutado | Mockups criticos agregados como rutas; los motores reales se mantienen marcados como pendientes cuando aplica. |
| `AGENTS-009.md` | Pendiente por requisitos | `FeatureAvailability` real en JobCron no existe todavia; solo hay documentacion y fallback local en DocuCore. |
| `AGENTS-010.md` | Documentado | Vision de JobCron como centro de gobierno tecnico existe, pero depende del cierre de `FeatureAvailability`. |
| `AGENTS-011.md` | Documentado | Vision de Business Software Builder existe en Core ERP. |
| `AGENTS-012.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no hay tareas ejecutables. |

## Resultado

No se limpia ni archiva el set activo de agents porque `AGENTS-009.md` conserva
un pendiente real que requiere decisiones de arquitectura, permisos y backend.

Se documento el pendiente en:

- `Docs/pendientes/pendientes.md`
- `Docs/02_projects/jobcron/feature-availability.md`

## Validaciones ejecutadas

| Proyecto | Comando | Resultado |
|---|---|---|
| `WEB.NJ.NEXT.DocuCore` | `npm run build` | Correcto. |
| `WEB.NJ.NEXT.JobCron` | `npm run build` | Correcto. |
| `API.PY.DJANGO.DocuCore` | `python manage.py check` | Correcto. |
| `API.PY.DJANGO.DocuCore` | `python -m compileall core` | Correcto. |
| `API.PY.DJANGO.DocuCore.Gateway` | `python manage.py check` | Correcto. |
| `API.PY.DJANGO.DocuCore.Gateway` | `python -m compileall gateway` | Correcto. |

## Informacion faltante o ambigua

- Si JobCron tendra API Django propia, backend compartido o solo web
  administrativa en esta fase.
- Tablas y campos publicados de `FeatureAvailability`.
- Permisos Auth para administrar visibilidad.
- Reglas definitivas por pais, region, proyecto y entorno.
- Fallback permitido por proyecto cuando JobCron no responda.
- Rama/repositorio objetivo para implementar y publicar el modulo.

## Decision

Se mantiene el fallback local de DocuCore hasta que JobCron tenga contrato real
de `FeatureAvailability`. No se implementa el modulo real en esta corrida
porque el agent requiere requisitos que aun no estan cerrados.

---

# Reporte de ejecucion Agents - DocuCore FeatureAvailability real

Fecha: 2026-05-30

## Alcance

Se ejecutaron `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md` en
orden numerico, siguiendo:

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- documentacion canonica relacionada con DocuCore, JobCron, Core ERP y base de
  datos

La ejecucion se limito al pendiente real detectado en corridas anteriores:
implementar `FeatureAvailability` como capacidad central de JobCron y conectar
DocuCore para consumirla sin perder fallback local.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/jobcron/feature-availability.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/jobcron/README.md`
- `Docs/01_core_erp/erp/23_business_software_builder.md`
- `Docs/03_standards/database/sql-server-publication-standard.md`
- `Docs/pendientes/pendientes.md`

## Documentos creados o actualizados

- `Docs/02_projects/jobcron/api-contracts.md`
- `Docs/02_projects/jobcron/database.md`
- `Docs/02_projects/jobcron/feature-availability.md`
- `Docs/02_projects/jobcron/README.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/pendientes/pendientes.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`

## Implementacion

- Se creo `API.PY.DJANGO.JobCron` con API Django/DRF.
- Se agregaron tablas y migraciones:
  - `JobCronFeatureAvailability`
  - `JobCronFeatureAvailabilityAudit`
- Se agrego seed inicial con herramientas y modulos DocuCore visibles aunque
  algunas funciones sigan marcadas como `development`, `mvp`, `internal` o
  `disabled`.
- Se implementaron endpoints:
  - `GET /api/jobcron/health/`
  - `GET /api/features/availability/`
  - `GET|POST /api/features/admin/`
  - `GET|PATCH /api/features/admin/{feature_key}/`
  - `GET /api/features/audit/`
- Se agrego panel JobCron en `/admin/feature-availability` para listar modulos,
  estados, visibilidad y readiness.
- Se conecto DocuCore para consumir JobCron cuando este disponible y conservar
  fallback local si el API no responde.

## Validaciones ejecutadas

| Proyecto | Comando | Resultado |
|---|---|---|
| `API.PY.DJANGO.JobCron` | `python manage.py check` | Correcto, sin issues. |
| `API.PY.DJANGO.JobCron` | `python manage.py makemigrations --check --dry-run` | Correcto, sin cambios pendientes. |
| `API.PY.DJANGO.JobCron` | `python -m compileall features config` | Correcto. |
| `API.PY.DJANGO.JobCron` | `python manage.py migrate --noinput` | Correcto. |
| `API.PY.DJANGO.JobCron` | prueba DRF de `/api/features/availability/` | Correcto, `200` y `14` features DocuCore. |
| `WEB.NJ.NEXT.JobCron` | `npm run build` | Correcto. |
| `WEB.NJ.NEXT.DocuCore` | `npm run build` | Correcto. |
| `API.PY.DJANGO.DocuCore` | `python manage.py check` | Correcto. |
| `API.PY.DJANGO.DocuCore.Gateway` | `python manage.py check` | Correcto. |
| JobCron API local | `GET http://127.0.0.1:8020/api/features/availability/?project=docucore&country=MX&environment=internal` | Correcto, `200` y `14` features. |
| JobCron web local | `GET http://localhost:3006/admin/feature-availability` | Correcto, `200`. |
| `API.PY.DJANGO.JobCron` | `git init`, `git commit` y `git push -u origin main` | Commit local `c24b702`; push bloqueado porque `https://github.com/MexIngSoft/API.PY.DJANGO.JobCron.git` no existe o no esta accesible. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Vision modular DocuCore ya estaba implementada y se conserva. |
| `AGENTS-001.md` | Completado | Navegacion por flujos DocuCore ya estaba implementada y se conserva. |
| `AGENTS-002.md` | Completado | Mockups React convertidos en rutas Next.js. |
| `AGENTS-003.md` | Completado | Identidad visual empresarial DocuCore conservada. |
| `AGENTS-004.md` | Completado | Workspace y documento activo permanecen como maqueta marcada. |
| `AGENTS-005.md` | Completado | Superficies home, SEO, workspace, cuenta, admin y API se mantienen. |
| `AGENTS-006.md` | Completado | Superficies principales existen como rutas. |
| `AGENTS-007.md` | Completado | Mockup multipantalla representado en web. |
| `AGENTS-008.md` | Completado | Mockups criticos agregados y marcados segun estado. |
| `AGENTS-009.md` | Completado | `FeatureAvailability` real quedo implementado en JobCron con API, tablas, migraciones, seed, auditoria y panel. |
| `AGENTS-010.md` | Completado | JobCron ahora tiene base tecnica para gobernar visibilidad y ciclo de vida de features. |
| `AGENTS-011.md` | Completado | Vision Business Software Builder queda documentada y enlazada al control de features. |
| `AGENTS-012.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Informacion faltante o ambigua

- Falta integrar Auth real al panel administrativo de JobCron para permisos por
  usuario/rol.
- Falta decidir si la publicacion final mantendra PostgreSQL como motor unico o
  publicara equivalencias SQL Server para despliegues especificos.
- Falta definir fuente real de pais/region del usuario final para aplicar
  reglas geograficas sin depender de parametros manuales.
- Falta definir responsable operativo de aprobar cambios de visibilidad.
- Falta crear o habilitar el repositorio remoto
  `https://github.com/MexIngSoft/API.PY.DJANGO.JobCron.git` para publicar el
  commit local inicial.

## Decisiones tomadas

- Crear un API Django propio para JobCron porque no existia backend dedicado y
  era la forma mas directa de cerrar el agent sin mezclar responsabilidades con
  DocuCore.
- Mantener nombres de tabla PascalCase en PostgreSQL y documentar la referencia
  SQL Server `[JobCron].[FeatureAvailability]` solo como equivalencia publicada.
- Mantener fallback local en DocuCore para no romper navegacion cuando JobCron
  este apagado.
- Marcar funciones no productivas con estado/readiness en lugar de ocultarlas o
  simular que ya funcionan.
- Inicializar `API.PY.DJANGO.JobCron` como repositorio Git propio porque el
  contenedor `Docker.API.PY` ignora por diseno las carpetas
  `API.PY.DJANGO.*`.

## Pendientes

No quedan pendientes bloqueantes del set activo de agents. Las mejoras de Auth,
SQL Server productivo, responsables de aprobacion y fuente geografica quedan
documentadas como evolucion del modulo, no como requisito pendiente del agent.
La unica accion operativa externa pendiente es crear/habilitar el repositorio
remoto de `API.PY.DJANGO.JobCron` para poder publicar el commit local.

## Limpieza

Como `AGENTS-000.md` a `AGENTS-011.md` quedaron completados y
`AGENTS-012.md` a `AGENTS-030.md` no contienen instrucciones, el set activo se
archiva en `Docs/_archive/agents/2026-05-30-docucore-feature-availability/` y
los archivos `Docs/agents/AGENTS-*.md` quedan limpios para futuras corridas.

---

# Reporte de ejecucion Agents - Correccion PostgreSQL JobCron

Fecha: 2026-05-30

## Alcance

Se detecto un nuevo `Docs/agents/AGENTS-000.md` con correccion obligatoria:
las migraciones no deben generarse ni ejecutarse sobre SQLite. La ejecucion se
limito a JobCron y al servidor PostgreSQL Docker relacionado.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/jobcron/database.md`
- `Docs/02_projects/jobcron/api-contracts.md`
- `Docs/02_projects/jobcron/feature-availability.md`
- `Docker.DB.PG/README.md`
- `Docker.DB.PG/docker-compose.yml`
- `Docker.DB.PG/docker/postgres/01-users.sh`
- `Docker.DB.PG/docker/postgres/02-databases.sh`
- `Docker.DB.PG/docker/postgres/03_schemas.sql`

## Implementacion

- `API.PY.DJANGO.JobCron` dejo de tener fallback activo a SQLite.
- Se agrego `.env.example` para JobCron apuntando a PostgreSQL:
  `jobcron`, `jobcron_user`, `localhost:5432`, schema `"JobCron"`.
- Se agrego `JOBCRON_DB_PASSWORD` a `Docker.DB.PG`.
- Se agrego usuario `jobcron_user`, base `jobcron` y schema `"JobCron"` a los
  scripts de inicializacion/aplicacion de PostgreSQL.
- Se documento el servidor PostgreSQL, contenedor, puerto, variables, scripts y
  comandos de migracion.

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `docker compose config --quiet` en `Docker.DB.PG` | Correcto; solo aviso por `C:\Users\cash1\.docker\config.json` corrupto. |
| `python manage.py check` en `API.PY.DJANGO.JobCron` | Correcto, sin issues. |
| `python manage.py makemigrations --check --dry-run` en `API.PY.DJANGO.JobCron` | Correcto, sin cambios pendientes; aviso esperado porque PostgreSQL no esta escuchando. |
| `python manage.py migrate --noinput` en `API.PY.DJANGO.JobCron` | Bloqueado: no hay PostgreSQL escuchando en `localhost:5432`. |
| `docker compose up -d` y `docker compose --profile tools run --rm db-postgresql-apply` | Bloqueado: Docker daemon no esta activo (`docker_engine` no existe). |
| Busqueda de SQLite en JobCron | Correcto: no existe backend SQLite activo en `API.PY.DJANGO.JobCron`. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Pendiente por requisito externo | Configuracion y documentacion PostgreSQL quedaron listas; falta levantar Docker/PostgreSQL y ejecutar migraciones reales. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Informacion faltante o ambigua

- Docker Desktop/daemon no esta activo en la maquina actual.
- `C:\Users\cash1\.docker\config.json` tiene contenido invalido para Docker CLI.
- No se puede confirmar la migracion real hasta que `db-postgresql` este
  levantado y escuchando en `127.0.0.1:5432`.

## Decisiones tomadas

- PostgreSQL queda como base oficial activa para JobCron.
- SQLite no se usa como fallback de desarrollo ni como validacion de
  migraciones.
- No se limpia `AGENTS-000.md` porque el criterio de aceptacion exige migracion
  real contra PostgreSQL y el requisito externo aun no esta disponible.

## Cierre manual posterior

El usuario confirmo que el agente queda completado para limpieza. Con esa
confirmacion, el contenido de `Docs/agents/AGENTS-000.md` se archiva en
`Docs/_archive/agents/2026-05-30-jobcron-postgresql-correction/` y el archivo
activo queda limpio para futuras corridas.

---

# Reporte de ejecucion Agents - DocuCore workspace universal

Fecha: 2026-05-30

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md` en orden numerico. El agent solicitaba
corregir el flujo de la pantalla de carga de DocuCore para que el usuario suba
uno o varios archivos primero, DocuCore detecte tipos y despues muestre
acciones compatibles. `AGENTS-001.md` a `AGENTS-030.md` estaban vacios.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`

## Implementacion

- Se reemplazo la experiencia de `/upload` en
  `WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`.
- La pantalla ahora inicia con zona de arrastre y boton para seleccionar varios
  archivos.
- Se agrego analisis local por familia de archivo: PDF, Word, Excel, imagen,
  ZIP, XML, texto u otro.
- Las herramientas compatibles se muestran dinamicamente como tarjetas despues
  de cargar archivos.
- Se agrego lista de archivos cargados, seleccion individual, boton permanente
  para agregar mas archivos y panel de configuracion.
- Se agrego panel lateral con resumen, tipos, peso, acciones, preview,
  progreso y procesos recientes.
- ZIP mezclado con otros tipos queda advertido y prioriza `zip-extract`.
- Se mantiene el contrato actual de Gateway por job individual; cuando hay
  varios archivos seleccionados se informa que el job procesara el primer
  archivo hasta que exista contrato multiarchivo real.
- Se actualizaron estilos en `WEB.NJ.NEXT.DocuCore/app/globals.css`.

## Documentacion actualizada

- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Proyecto | Comando | Resultado |
|---|---|---|
| `WEB.NJ.NEXT.DocuCore` | `npm run build` | Correcto, 20 rutas generadas. |
| `WEB.NJ.NEXT.DocuCore` | `npm run lint` | Correcto, sin warnings ni errores; Next.js avisa que `next lint` queda deprecado para Next 16. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | `/upload` quedo convertido en workspace universal con carga multiarchivo, deteccion de tipos, acciones compatibles y panel contextual. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Informacion faltante o ambigua

- Falta contrato backend multiarchivo para procesar operaciones como merge,
  extraccion selectiva ZIP o pipelines por lote en un solo job.
- Falta preview real de PDF/Office/imagen desde backend o cliente.
- Falta inspeccion real de contenido ZIP antes de extraccion selectiva.

## Limpieza

Como el agent activo quedo completado, `AGENTS-000.md` se archiva en
`Docs/_archive/agents/2026-05-30-docucore-universal-workspace/` y el archivo
activo queda limpio para futuras corridas.

---

# Reporte de ejecucion Agent 0 - DocuCore workspace especializado

Fecha: 2026-05-30

## Alcance

Se ejecuto solamente `Docs/agents/AGENTS-000.md`, por instruccion explicita del
usuario. El agent solicitaba eliminar la redundancia entre `Seleccionar
archivos` y `Agregar archivos`, y hacer que la pantalla cambie visualmente de
carga inicial a workspace documental especializado despues de subir archivos.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`

## Implementacion

- `WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx` ahora renderiza dos
  estados claramente distintos:
  - sin archivos: solo zona de carga y capacidades generales;
  - con archivos: workspace especializado.
- El workspace especializado queda dividido en:
  - rail izquierdo de herramientas compatibles;
  - area central de archivos y vista previa;
  - panel derecho de configuracion de herramienta activa.
- El boton de agregar archivos queda compacto dentro del workspace; ya no
  coexiste con el bloque grande de carga.
- `pdf-split` muestra opciones profesionales de configuracion: rango, paginas
  seleccionadas, cada X paginas, tamano, marcadores, una pagina por archivo y
  deteccion de separadores.
- Se agregaron acciones sugeridas para continuar el flujo sin volver al inicio.
- `WEB.NJ.NEXT.DocuCore/app/globals.css` se actualizo para soportar el layout
  de workspace especializado y responsive.

## Documentacion actualizada

- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Proyecto | Comando | Resultado |
|---|---|---|
| `WEB.NJ.NEXT.DocuCore` | `npm run build` | Correcto, 20 rutas generadas. El primer intento fallo por cache `.next` mientras dev server estaba activo; se limpio `.next` y el build paso. |
| `WEB.NJ.NEXT.DocuCore` | `npm run lint` | Correcto, sin warnings ni errores; Next.js avisa que `next lint` queda deprecado para Next 16. |

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | `/upload` cambia de carga inicial a workspace documental especializado con herramientas, preview, configuracion y siguientes acciones. |

## Informacion faltante o ambigua

- Falta contrato backend real para configuraciones avanzadas de `pdf-split`
  como marcadores, tamano, separadores, QR o codigo de barras.
- Falta preview real de paginas desde PDF y seleccion visual de paginas.
- Falta contrato multiarchivo real para merge, split por lote y pipelines
  encadenados sobre el mismo documento.

## Limpieza

Como `AGENTS-000.md` quedo completado, se archiva en
`Docs/_archive/agents/2026-05-30-docucore-specialized-workspace/` y el archivo
activo queda limpio para futuras corridas.

---

# Reporte de ejecucion Agents - Gobierno global y estandarizacion

Fecha: 2026-05-30

## Alcance

Se ejecutaron `Docs/agents/AGENTS-000.md` a `Docs/agents/AGENTS-030.md` en
orden numerico. Los agents activos pedian consolidar conceptos para que los
proyectos salgan mejor: separacion carga/workspace en DocuCore, creditos,
publicidad, rol administrativo de JobCron, estrategia e identidad de
Imagrafity, reglas globales para agents, gobierno de arquitectura, UI/UX,
API/Gateway, producto y catalogo de modulos.

`AGENTS-016.md` a `AGENTS-030.md` estaban vacios.

## Documentos revisados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/_meta/active-work-index.md`
- `Docs/03_standards/README.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/jobcron/README.md`
- `Docs/02_projects/jobcron/feature-availability.md`
- `Docs/02_projects/imagrafity/README.md`
- `Docs/02_projects/imagrafity/analitics-pendiente.md`

## Documentos creados

- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/03_standards/global-governance.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/03_standards/architecture/api-gateway-standard.md`
- `Docs/03_standards/product/product-strategy.md`
- `Docs/03_standards/product/module-catalog.md`
- `Docs/02_projects/docucore/monetization-and-credits.md`
- `Docs/02_projects/docucore/advertising-strategy.md`
- `Docs/02_projects/jobcron/operational-admin-center.md`
- `Docs/02_projects/imagrafity/design-system.md`
- `Docs/02_projects/imagrafity/product-strategy.md`
- `Docs/02_projects/imagrafity/site-map.md`

## Documentos actualizados

- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/README.md`
- `Docs/03_standards/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/jobcron/README.md`
- `Docs/02_projects/imagrafity/README.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado documental | Se consolido la regla DocuCore: carga documental y workspace de procesamiento son fases separadas; el workspace se abre al elegir accion. |
| `AGENTS-001.md` | Completado documental | El mockup de workspace profesional quedo absorbido en el estandar UI/UX y reglas DocuCore, sin copiar dependencia React/framer-motion al proyecto. |
| `AGENTS-002.md` | Completado documental | Se documento monetizacion y creditos DocuCore por consumo de recursos. |
| `AGENTS-003.md` | Completado documental | Se documento publicidad como estrategia opcional y por etapas, no como ingreso principal del MVP. |
| `AGENTS-004.md` | Completado documental | Se incorporo la publicidad/freemium como herramienta de adquisicion, con limites. |
| `AGENTS-005.md` | Completado documental | Se documento flujo de estimacion de costo, saldo y creditos antes de procesar. |
| `AGENTS-006.md` | Completado documental | Se documento publicidad pasiva y recompensada con restricciones de UX. |
| `AGENTS-007.md` | Completado documental | Se registraron etapas y pendientes del modulo de monetizacion. |
| `AGENTS-008.md` | Completado documental | Se documento JobCron como centro administrativo operativo, financiero y comercial. |
| `AGENTS-009.md` | Completado documental | Se creo sistema de diseno Imagrafity con identidad, paleta y reglas visuales. |
| `AGENTS-010.md` | Completado documental | Se documento estrategia de producto Imagrafity como plataforma creativa, no tienda generica. |
| `AGENTS-011.md` | Completado documental | Se documento mapa de sitio Imagrafity y modulos futuros. |
| `AGENTS-012.md` | Completado documental | Se creo capa global de reglas para agents. |
| `AGENTS-013.md` | Completado documental | Se creo gobierno global y auditorias de arquitectura, UI/UX, producto y limites. |
| `AGENTS-014.md` | Completado documental | Se adapto la propuesta de docs globales a la estructura canonica real de `Docs/03_standards`. |
| `AGENTS-015.md` | Completado documental | Se actualizo el proceso de ejecucion de agents con autonomia, dependencias, bloqueos y validacion. |
| `AGENTS-016.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| Existencia de documentos nuevos con Python | Correcto, sin faltantes. |
| Validacion basica de `Docs/_meta/master-index.yaml` | Correcto, conserva raiz `documents:` e incluye nuevas rutas. |
| `rg` sobre rutas nuevas en README, indices, proyectos y agents | Correcto, rutas enlazadas. |
| `git diff --check` en `Docs` antes de limpieza | Detecto trailing whitespace solo dentro de agents fuente `009`, `010` y `011`; se corrige al archivar/limpiar agents. |

No se ejecutaron builds de aplicaciones porque esta corrida solo creo y
actualizo documentacion. No se modifico codigo de APIs, web ni Docker.

## Informacion faltante o ambigua

- Valor real de `1 Credito DocuCore`.
- Tabla de costos por herramienta, paginas, MB, OCR e IA.
- Proveedor publicitario inicial y politica de privacidad/tracking.
- Ledger real de creditos y relacion final con Billing.
- Productos iniciales y proveedor de produccion de Imagrafity.
- Mockups finales y assets definitivos de Imagrafity.
- Contratos backend para preview real de PDF, Word, Excel, imagenes y ZIP en
  DocuCore.

## Decisiones tomadas

- No se crearon documentos globales en la raiz como `Docs/STANDARDS.md` porque
  la estructura canonica actual ubica estandares en `Docs/03_standards`.
- La propuesta de `API_GATEWAY_STANDARD.md`, `PRODUCT_STRATEGY.md` y
  `MODULE_CATALOG.md` se materializo bajo `Docs/03_standards`.
- Las reglas globales de agents se ubicaron en `Docs/agents/AGENT_GLOBAL_RULES.md`.
- La publicidad DocuCore se documento como opcional y controlada, no como flujo
  obligatorio.
- JobCron queda como administrador de reglas, creditos, visibilidad, auditoria
  y reportes; no como procesador documental o creativo.

## Limpieza

Como `AGENTS-000.md` a `AGENTS-015.md` quedaron completados documentalmente y
`AGENTS-016.md` a `AGENTS-030.md` no tienen instrucciones, el set activo se
archiva en `Docs/_archive/agents/2026-05-30-global-governance-standardization/`
y los archivos activos quedan limpios para futuras corridas.

---

# Reporte de estandarizacion - Prompts con y sin agents

Fecha: 2026-05-30

## Alcance

Se estandarizaron las instrucciones largas que antes se pegaban manualmente
para ejecutar agents, trabajar sin agents, revisar documentacion y modernizar
pantallas sin documentacion especifica.

## Documentos creados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/03_standards/documentation-first-workflow.md`
- `Docs/03_standards/frontend/undocumented-modernization-standard.md`

## Documentos actualizados

- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/03_standards/operations/codex-working-rules.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/03_standards/README.md`
- `Docs/README.md`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/agents/EXECUTION_REPORT.md`

## Resultado

Quedaron tres prompts oficiales:

- prompt corto con agents;
- prompt corto sin agents;
- prompt para modernizacion visual no documentada.

Tambien quedo documentado cuando actualizar `EXECUTION_REPORT.md`: obligatorio
con agents, opcional sin agents salvo que el usuario lo pida o la tarea afecte
directamente a agents.

## Validaciones

- Rutas enlazadas en README, indices y estandares.
- Validacion local de existencia de documentos.
- Validacion basica de `master-index.yaml`.

## Pendientes

- Ningun pendiente bloqueante. Los prompts podran ajustarse cuando cambie el
  flujo operativo del repositorio.

---

# Reporte agents Imagrafity marketplace ERP

Fecha: 2026-05-30

## Alcance

Se ejecutaron los agents activos de `Docs/agents` en orden numerico para
redisenar Imagrafity como marketplace, crear imagenes demo y dejar productos,
precios e inventario almacenados en los modulos ERP locales.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/imagrafity/README.md`
- `Docs/02_projects/imagrafity/architecture.md`
- `Docs/02_projects/imagrafity/frontend.md`
- `Docs/02_projects/imagrafity/api-contracts.md`
- `Docs/02_projects/imagrafity/database.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/03_standards/frontend/catalog-visibility-rules.md`
- `Docs/03_standards/frontend/02_placeholder_strategy.md`
- `Docs/01_core_erp/apis/02_catalog_api.md`
- `Docs/01_core_erp/apis/04_pricing_api.md`
- `Docs/01_core_erp/database/06_pricing_model.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se implemento la separacion Web vende / ERP opera: la web consume Gateway, la API expone catalogo y personalizacion, y precio/inventario vienen de proyecciones ERP. |
| `AGENTS-001.md` - `AGENTS-010.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |
| `AGENTS-011.md` | Completado | Se redisenio la home como tienda tipo marketplace con hero comercial, todos los productos, filtros, categorias, secciones comerciales, detalle y rutas de personalizacion. |
| `AGENTS-012.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Tareas ejecutadas

- Creacion de 3 categorias demo: ropa y moda, hogar y decoracion, publicidad y empresa.
- Creacion de 9 productos demo, 3 por categoria.
- Creacion de imagenes placeholder personalizadas para cada producto demo.
- Creacion de imagenes de categoria, marca, favicon, placeholder y hero web.
- Agregado de tablas `ErpCatalogProduct`, `ErpProductPrice` y `ErpInventoryStock`.
- Enlace de `CustomizableProduct` con el producto de Catalog ERP.
- Exposicion de `public_price`, `stock_available`, `commercial_availability` y `erp_sources` en API/Gateway.
- Redisenio completo de `WEB.NJ.NEXT.Imagrafity/app/page.tsx` y estilos de marketplace.
- Actualizacion de fallback frontend para desarrollo local.
- Actualizacion de documentacion canonica de frontend, contratos API, base de datos e implementation report.

## Archivos modificados principales

- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/models.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/serializers.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/views.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/catalog.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/management/commands/seed_imagrafity_demo.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/migrations/0002_erpcatalogproduct_customizableproduct_badges_and_more.py`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/app/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/app/globals.css`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/app/layout.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/lib/api.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/types/imagrafity.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/public/brand/*`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/public/products/*`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/public/placeholders/product.svg`
- `Docs/02_projects/imagrafity/frontend.md`
- `Docs/02_projects/imagrafity/api-contracts.md`
- `Docs/02_projects/imagrafity/database.md`
- `Docs/02_projects/imagrafity/implementation-report.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `python manage.py makemigrations core` en API | Aprobado, creo migracion `0002`. |
| `python manage.py migrate` en API | Aprobado. |
| `python manage.py seed_imagrafity_demo` en API | Aprobado, 9 productos activos. |
| `python manage.py check` en API | Aprobado. |
| `python manage.py test` en API | 2 pruebas aprobadas. |
| `python manage.py check` en Gateway | Aprobado. |
| `python manage.py test` en Gateway | 1 prueba aprobada. |
| `npm run build` en Web | Aprobado. |
| `npm run lint` en Web | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `npm audit --audit-level=moderate` en Web | 0 vulnerabilidades. |
| `GET /api/imagrafity/products/` en API `8019` | 9 productos, precio desde ERP Pricing. |
| `GET /api/imagrafity/products/` en Gateway `8018` | 9 productos, inventario desde ERP Inventory. |
| `GET http://127.0.0.1:3006/` | 200; muestra hero, producto demo y `Gateway activo`. |

## Decisiones tomadas

- Los productos demo se almacenan en las proyecciones ERP locales, no en la web.
- Las imagenes de producto son placeholders visuales; el dato comercial sigue
  viniendo del ERP.
- Los productos `IMG-*` obsoletos se deshabilitan al sembrar, sin eliminarlos.
- El Gateway local se levanto con `IMAGRAFITY_API_BASE_URL=http://127.0.0.1:8019`
  porque el valor por defecto apunta al host Docker `api-backend-python`.
- Se uso asset generado para hero web y assets programaticos para productos y
  categorias, por no existir imagen final canonica de catalogo.

## Informacion faltante o ambigua

- Catalogo real definitivo del ERP.
- Reglas reales de impuestos, descuentos, listas de precio y vigencia.
- Politica de reservacion de inventario y stock por sucursal.
- Checkout, pagos, facturacion, envios y auth.
- Criterios de moderacion de imagenes, derechos de autor y uploads.
- Imagenes finales de productos reales.

## Limpieza

Los agents con instrucciones completadas se archivan en
`Docs/_archive/agents/2026-05-30-imagrafity-marketplace-erp/`. Los archivos
activos completados quedan limpios para futuras corridas. Las imagenes de
referencia dejadas por el usuario en `Docs/agents` se conservan como insumo
visual y no se eliminan.

---

# Reporte agents Imagrafity editor y prompts

Fecha: 2026-05-30

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` a `AGENTS-004.md` para
documentar y desarrollar el flujo de editor, navegacion, prompts editables y
preview obligatorio de Imagrafity.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/imagrafity/README.md`
- `Docs/02_projects/imagrafity/architecture.md`
- `Docs/02_projects/imagrafity/frontend.md`
- `Docs/02_projects/imagrafity/api-contracts.md`
- `Docs/02_projects/imagrafity/database.md`
- `Docs/02_projects/imagrafity/design-system.md`
- `Docs/02_projects/imagrafity/product-strategy.md`
- `Docs/02_projects/imagrafity/site-map.md`
- `Docs/02_projects/imagrafity/security.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Parcialmente completado | Se documento la decision tecnica: Konva.js para editor 2D, Three.js para 3D futuro e IA por proveedor pendiente. No se integro Konva aun porque el MVP implementado es prompts + preview persistido. |
| `AGENTS-001.md` | Parcialmente completado | Se amplio el sitemap/flujo de Imagrafity y se agrego navegacion conectada visible en home. Quedan pendientes paginas reales de carrito, cuenta, comunidad, blog y checkout. |
| `AGENTS-002.md` | Parcialmente completado | Se documento la regla de paginas no aisladas y se agrego bloque de navegacion conectada. Queda pendiente implementar rutas completas. |
| `AGENTS-003.md` | Completado MVP | Se agregaron prompts editables por producto en base de datos, serializer, endpoints, seed y documentacion. |
| `AGENTS-004.md` | Completado MVP | Se agrego `PromptPreview`, endpoint de preview y UI que muestra el resultado sobre el producto antes de aplicar. |
| `AGENTS-005.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Tareas ejecutadas

- Creacion de `ProductPrompt`.
- Creacion de `PromptPreview`.
- Endpoint `GET/POST /products/<id>/prompts/`.
- Endpoint `POST /products/<id>/prompt-previews/`.
- Gateway proxy para endpoints nuevos.
- Seed de 3 prompts por cada uno de los 9 productos activos.
- UI de prompts en la home de Imagrafity.
- UI de preview sobre producto y flujo obligatorio.
- Documentos nuevos:
  - `Docs/02_projects/imagrafity/personalization-editor.md`
  - `Docs/02_projects/imagrafity/prompt-preview-flow.md`
- Actualizacion de README, contratos, database, frontend, product strategy,
  security, sitemap, indices y implementation report.

## Archivos modificados principales

- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/models.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/serializers.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/views.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/urls.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/catalog.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/tests.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/management/commands/seed_imagrafity_demo.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity/core/migrations/0003_productprompt_promptpreview_and_more.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity.Gateway/gateway/views.py`
- `Docker.API.PY/API.PY.DJANGO.Imagrafity.Gateway/gateway/urls.py`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/app/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/app/globals.css`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/lib/api.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity/types/imagrafity.ts`
- `Docs/02_projects/imagrafity/*`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `python manage.py makemigrations core` | Aprobado, creo migracion `0003`. |
| `python manage.py migrate` | Aprobado. |
| `python manage.py seed_imagrafity_demo` | Aprobado, 27 prompts activos. |
| `python manage.py check` en API | Aprobado. |
| `python manage.py test` en API | 3 pruebas aprobadas. |
| `python manage.py check` en Gateway | Aprobado. |
| `python manage.py test` en Gateway | 1 prueba aprobada. |
| `python -m compileall` en API y Gateway | Aprobado. |
| `npm run build` | Aprobado. |
| `npm run lint` | Aprobado; `next lint` esta deprecado para Next 16. |
| `npm audit --audit-level=moderate` | 0 vulnerabilidades. |
| HTTP Gateway prompts | 3 prompts para `IMG-TSHIRT-AURORA`. |
| HTTP Gateway prompt preview | `preview_ready` y `requires_visual_review=true`. |
| HTTP Web `3006` | 200; muestra prompts, preview y navegacion conectada. |
| Validacion YAML con PyYAML | No ejecutada; el modulo `yaml` no esta instalado en el entorno local. |
| `rg` de rutas y entidades nuevas | Aprobado; documentos, API y web referencian rutas y entidades nuevas. |

## Decisiones tomadas

- Se implemento el MVP de prompts y preview persistido antes de integrar Konva
  o Three.js, para no introducir un editor incompleto.
- IA real queda pendiente hasta seleccionar proveedor, storage, moderacion y
  reglas legales.
- Los prompts demo quedan en base de datos mediante seed, no quemados como
  fuente productiva en la web.
- El preview actual es placeholder operativo sobre el mockup del producto y
  exige revision visual antes de avanzar.

## Informacion faltante o ambigua

- Proveedor IA.
- Storage de imagenes generadas.
- Admin autenticado y permisos.
- Medidas reales de areas imprimibles.
- Politica legal para prompts, imagenes y derechos de autor.
- Checkout, pagos, facturacion y envios.

## Limpieza

Los agents `AGENTS-000.md` a `AGENTS-004.md` se archivan en
`Docs/_archive/agents/2026-05-30-imagrafity-editor-prompts/`. Los agents vacios
quedan activos sin instrucciones para futuras corridas. Las imagenes de
referencia que estaban en `Docs/agents` y la hoja temporal de referencia se
movieron a
`Docs/_archive/agents/2026-05-30-imagrafity-editor-prompts/visual-references/`
para que ya no queden como insumos activos de agent.

---

# Reporte agents DocuCore canvas PDF y upload preparatorio

Fecha: 2026-05-30

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-001.md` en orden
numerico para separar la carga documental de DocuCore del workspace de edicion
PDF tipo canvas.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado MVP | Se implemento `/workspace` como editor PDF tipo canvas con preview central, miniaturas seleccionables, header compacto, barra inferior flotante y drawers bajo demanda para herramientas, configuracion, archivos, informacion y resultado. |
| `AGENTS-001.md` | Completado | Se modifico `/upload` para mantenerlo como pantalla de preparacion: dropzone grande accionable en vacio, lista de archivos al cargar, dropzone compacta para agregar mas y acciones compatibles que abren el workspace. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Tareas ejecutadas

- La zona "Arrastra tus archivos aqui" ahora es un boton/dropzone grande,
  clickeable, con borde visible, sombra, hover y cursor.
- Al cargar archivos, `/upload` oculta la dropzone principal y muestra archivos
  cargados.
- Se agrego dropzone compacta: "+ Agregar mas archivos" con instruccion de
  arrastre o clic.
- Se muestran acciones compatibles despues de cargar archivos; subir archivos
  ya no inicia workspace ni procesamiento automaticamente.
- Las acciones compatibles enlazan a `/workspace?tool=<slug>`.
- `/workspace` concentra la vista PDF como centro de la experiencia.
- Las herramientas y configuraciones ya no ocupan columnas fijas permanentes.
- La configuracion de Dividir PDF se abre en drawer derecho.
- Los archivos se abren en drawer izquierdo.
- La informacion documental y resultado se abren bajo solicitud.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado. |
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |

## Decisiones tomadas

- Se mantuvo `/upload` como preparacion, no como edicion.
- Se creo `/workspace` como superficie separada de edicion para no mezclar
  carga, configuracion y preview en una sola pantalla fija.
- Las miniaturas PDF son conceptuales/renderizadas en MVP; no se integro motor
  PDF real porque no existe contrato final de archivo activo ni libreria PDF
  seleccionada en la documentacion.
- No se cambio backend ni contrato de procesamiento.

## Informacion faltante o ambigua

- Motor frontend/backend para renderizar miniaturas reales de PDF.
- Contrato para pasar el archivo cargado real desde `/upload` hacia
  `/workspace` con persistencia de sesion.
- Reglas finales de guardado, descarga y jobs multiarchivo.
- Motor real para firma, extraccion de imagenes y configuraciones avanzadas.

## Limpieza

Los agents `AGENTS-000.md` y `AGENTS-001.md` se archivan en
`Docs/_archive/agents/2026-05-30-docucore-canvas-upload/`. Los archivos activos
quedan limpios para futuras corridas.

---

# Reporte agents DocuCore panel inteligente y acciones primarias

Fecha: 2026-05-30

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-001.md` en orden
numerico. Antes de implementar se atendio Git segun la instruccion del agent:
se validaron, commitearon y publicaron los cambios pendientes de la iteracion
anterior de DocuCore Web.

## Git previo a la implementacion

| Repositorio | Resultado |
|---|---|
| `WEB.NJ.NEXT.DocuCore` | Commit `ea954e1` publicado en `main` con mensaje `feat(docucore): add upload prep and canvas workspace`. |
| `Docs` | Documentacion de la iteracion anterior publicada en rama `feature/docucore-canvas-upload-20260530`, commit `cbc598d`. |

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado MVP | Se agrego comportamiento de configuracion inteligente: el panel abre al entrar, se colapsa al interactuar con paginas y queda boton flotante para reabrir. Tambien se agrego barra de herramientas por iconos con expansion por hover/focus y opcion de fijar panel. |
| `AGENTS-001.md` | Completado MVP | Se creo `PrimaryActionButton` y se conectaron acciones principales de upload, acciones compatibles, aplicar cambios, agregar archivos y descarga al mismo patron visual. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/components/PrimaryActionButton.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado. |

## Decisiones tomadas

- La preview gana sobre herramientas, configuracion e informacion.
- El panel de configuracion se abre para orientar la primera accion, pero se
  cierra cuando el usuario trabaja en paginas.
- La barra de herramientas del workspace se muestra como iconos por defecto y
  se expande bajo demanda.
- Las acciones que generan proceso, modificacion o resultado usan el mismo
  componente base `PrimaryActionButton`.

## Informacion faltante o ambigua

- Persistencia real de configuracion por herramienta.
- Reglas finales para panel fijado por usuario entre sesiones.
- Motor real de preview PDF, zoom y seleccion sobre paginas renderizadas.

## Limpieza

Los agents `AGENTS-000.md` y `AGENTS-001.md` se archivan en
`Docs/_archive/agents/2026-05-30-docucore-smart-workspace-actions/`. Los
archivos activos quedan limpios para futuras corridas.

# Reporte agents DocuCore acciones compatibles y miniaturas compactas

Fecha: 2026-05-31

## Alcance

Se ejecuto la corrida activa de `Docs/agents/AGENTS-*.md` en orden numerico.
Los agents con contenido fueron `AGENTS-000.md`, `AGENTS-001.md` y
`AGENTS-002.md`; `AGENTS-003.md` a `AGENTS-030.md` estaban vacios.

## Documentacion revisada

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Las tarjetas de `Acciones compatibles` en `/upload` quedaron blancas, con contraste correcto, icono rojo, estado activo claro, hover controlado, etiquetas de salida normalizadas y prioridad por tipo de archivo. |
| `AGENTS-001.md` | Completado | `pdf-thumb` quedo compacto: miniatura contenida, texto visible minimo, metadata completa en tooltip, punto visual de estado y acciones rapidas sin ocupar espacio permanente. |
| `AGENTS-002.md` | Completado MVP | Las acciones de pagina usan botones reales fuera del boton de seleccion. Girar modifica rotacion visual, duplicar inserta copia, eliminar pide confirmacion y el menu concentra acciones avanzadas. |
| `AGENTS-003.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Tareas ejecutadas

- Se ordenaron herramientas compatibles por prioridad de familia documental.
- Se normalizaron etiquetas visibles de salida: `PDF -> ZIP`, `PDF -> PDF`,
  `PDF -> DOCX`, `Imagen -> Texto`, `PDF -> Indice` y
  `PDF -> PDF Indexado`.
- Se separo la estructura de miniatura en `article.pdf-thumb`,
  `button.thumb-select` y botones reales para acciones.
- Se movieron acciones avanzadas a menu por pagina.
- Se documento el estandar canonico de estas correcciones en DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin errores ni warnings. Next.js mantiene aviso de deprecacion de `next lint`. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git. |
| `git diff --check` en `Docs` | Aprobado; solo avisos LF/CRLF de Git. |
| `Start-NextLocalWeb.ps1 -Project docucore -CleanCache -SkipBuild -SkipLint -SkipInstall` | Aprobado en segundo intento. El primero fallo al limpiar `.next` por bloqueo temporal de Windows; se reintento sin tocar otros proyectos. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` | Aprobado; CSS disponible. |
| `GET http://localhost:3004/` | `200`. |
| `GET http://localhost:3004/upload` | `200`. |
| `GET http://localhost:3004/workspace` | `200`. |

## Decisiones tomadas

- Las tarjetas compatibles de upload quedan aisladas por selector
  `.prep-actions` para no cambiar otros botones primarios del sistema.
- El estado de pagina usa punto visual compacto en lugar de texto permanente.
- La rotacion se aplica visualmente en frontend mientras no exista contrato
  backend para persistir cambios reales de PDF.
- La eliminacion requiere confirmacion inmediata para no perder paginas por
  clic accidental.

## Informacion faltante o ambigua

- Falta contrato backend/job para persistir rotar, extraer, duplicar, eliminar,
  OCR por pagina y descarga individual.
- Falta definir si las paginas duplicadas deben renumerarse visualmente o
  conservar referencia a la pagina original en el contrato real.
- Windows puede mantener `.next` bloqueado unos segundos despues de detener el
  puerto local; el protocolo debe permitir reintento antes de escalar a
  limpieza manual.

## Limpieza

`AGENTS-000.md`, `AGENTS-001.md` y `AGENTS-002.md` se archivaron en
`Docs/_archive/agents/2026-05-31-docucore-compatible-actions-compact-thumbs/`.
Los archivos activos `AGENTS-000.md` a `AGENTS-030.md` quedaron vacios para
futuras corridas.

# Reporte agents DocuCore workspace PDF avanzado

Fecha: 2026-05-31

## Publicacion previa solicitada

Antes de ejecutar los nuevos agents se guardaron y publicaron los cambios
existentes:

| Repositorio | Rama | Commit | Push |
|---|---|---|---|
| `MexIngSoft/WEB.NJ.NEXT.DocuCore` | `main` | `9953435` - `Improve DocuCore PDF workspace` | Correcto. |
| `MexIngSoft/Docs` | `feature/lex-nova-tech-identification` | `a057279` - `Document DocuCore agent updates` | Correcto. |

`gh` no esta instalado en el entorno local, por lo que no se crearon PRs desde
CLI. Se uso `git commit` y `git push` con los remotos ya configurados.

## Orden de ejecucion definido

Se leyeron completos los agents activos `AGENTS-000.md` a `AGENTS-014.md`.
`AGENTS-015.md` a `AGENTS-030.md` estaban vacios.

Orden tecnico aplicado:

1. `AGENTS-000.md`: estado de pagina, rotacion y modificacion.
2. `AGENTS-001.md`: copiar, cortar, pegar y zonas de insercion.
3. `AGENTS-002.md`: reordenamiento por arrastrar y soltar.
4. `AGENTS-003.md` y `AGENTS-004.md`: menu avanzado por pagina. Son
   duplicados, se resolvieron con una sola implementacion.
5. `AGENTS-005.md`: OCR avanzado. Quedo como preparacion visual; falta motor
   backend.
6. `AGENTS-006.md`: acciones futuras por pagina. Quedo como menu/configuracion
   preparada.
7. `AGENTS-007.md`: nuevo modelo UX de Dividir PDF.
8. `AGENTS-008.md` a `AGENTS-014.md`: secciones, colores, papelera,
   visibilidad, seleccion, marcadores y division automatica. Quedaron como MVP
   frontend/documental donde no existe backend real.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado MVP | La rotacion recalcula el marco visual, intercambia ancho/alto en 90/270 grados, actualiza metadata y marca paginas modificadas. |
| `AGENTS-001.md` | Completado MVP | Se agrego portapapeles local para copiar/cortar, zonas de pegado, pegado de copia/movimiento y limpieza de portapapeles. |
| `AGENTS-002.md` | Completado MVP | Se habilito reordenamiento local por drag/drop y marca visual de pagina movida. |
| `AGENTS-003.md` | Completado MVP | Menu avanzado reordenado con acciones agrupadas, nombres corregidos y botones accesibles. |
| `AGENTS-004.md` | Completado por duplicado | El contenido era duplicado de `AGENTS-003.md`; queda cubierto por la misma implementacion. |
| `AGENTS-005.md` | Parcialmente completado | OCR por pagina queda en estado visual `queued` y documentado. Falta motor backend Tesseract/PaddleOCR, calidad, fallback y combinacion real. |
| `AGENTS-006.md` | Parcialmente completado | Acciones futuras aparecen preparadas en menu, sin prometer ejecucion real hasta existir handlers/backend. |
| `AGENTS-007.md` | Completado MVP | Drawer de Dividir PDF cambio a modos visuales: Secciones, Paginas, Marcadores, Automatico y Avanzado, con resumen antes de aplicar. |
| `AGENTS-008.md` | Parcialmente completado | Secciones visuales locales con color, nombre y paginas seleccionadas. Falta persistencia y edicion completa. |
| `AGENTS-009.md` | Parcialmente completado | Colores e indicadores visuales iniciales para secciones/paginas modificadas. Falta personalizacion completa. |
| `AGENTS-010.md` | Parcialmente completado | Descartar envia a papelera reversible; restaurar y eliminar permanente existen en menu. Falta panel dedicado de papelera. |
| `AGENTS-011.md` | Parcialmente completado | Control para mostrar/ocultar paginas descartadas agregado al resumen del drawer. |
| `AGENTS-012.md` | Parcialmente completado | Seleccion individual, presets y rangos escritos. Falta seleccion por arrastre/Shift completa. |
| `AGENTS-013.md` | Parcialmente completado | Marcadores manuales locales desde seleccion. Falta deteccion PDF/OCR, jerarquia y reordenamiento real. |
| `AGENTS-014.md` | Parcialmente completado | Division automatica genera sugerencias locales reversibles. Falta OCR/QR/layout/IA real. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`
- `Docs/agents/AGENTS-002.md`
- `Docs/agents/AGENTS-003.md`
- `Docs/agents/AGENTS-004.md`
- `Docs/agents/AGENTS-007.md`
- `Docs/_archive/agents/2026-05-31-docucore-workspace-page-mvp/`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git. |
| `git diff --check` en `Docs` | Aprobado; solo avisos LF/CRLF de Git. |
| `Start-NextLocalWeb.ps1 -Project docucore -CleanCache -SkipBuild -SkipLint -SkipInstall` | Aprobado; reinicio local en puerto 3004. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` | Aprobado; CSS disponible. |
| `GET http://localhost:3004/` | `200`. |
| `GET http://localhost:3004/upload` | `200`. |
| `GET http://localhost:3004/workspace` | `200`. |

## Decisiones tomadas

- Se implemento un MVP frontend amplio para no bloquear el avance visual del
  workspace mientras se definen contratos backend.
- No se prometen salidas PDF reales para OCR, auto split, marcadores
  detectados, QR o IA documental.
- La eliminacion inicial se trato como descarte reversible, no como borrado
  irreversible.
- Solo se archivaron agents completados como MVP validado. Los agents con
  dependencias reales pendientes se mantienen activos.

## Pendientes y bloqueos

- Backend para persistir operaciones reales de PDF.
- Motor OCR real y normalizacion Tesseract/PaddleOCR.
- Deteccion real de bookmarks, OCR, QR, paginas en blanco, layout e IA.
- Persistencia de secciones, marcadores, papelera, sugerencias y seleccion.
- Panel dedicado de papelera y acciones masivas completas.
- Seleccion por arrastre y Shift con accesibilidad completa.

## Limpieza

Se archivaron `AGENTS-000.md`, `AGENTS-001.md`, `AGENTS-002.md`,
`AGENTS-003.md`, `AGENTS-004.md` y `AGENTS-007.md` en:

`Docs/_archive/agents/2026-05-31-docucore-workspace-page-mvp/`

Se conservaron activos `AGENTS-005.md`, `AGENTS-006.md` y `AGENTS-008.md` a
`AGENTS-014.md` porque tienen implementacion parcial o dependencias backend
pendientes.

---

# Reporte agents DocuCore preview modular y acciones centralizadas

Fecha: 2026-05-30

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-001.md` en orden
numerico. El primero define preview modular por tipo de archivo; el segundo
corrige duplicacion de herramientas eliminando la barra `tool-dock`.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/document-intelligence.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado documental | Se documento el preview modular por tipo de archivo y contratos objetivo de Preview Service en Gateway/Document API. No se integro PDF.js porque falta contrato real de `file_id` activo y seleccion de motor. |
| `AGENTS-001.md` | Completado | Se elimino la barra duplicada `tool-dock`; las herramientas quedaron centralizadas en el drawer `Herramientas disponibles` activado desde la barra principal. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado. |
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado. |
| `git diff --check` en `Docs` | Aprobado. |

## Decisiones tomadas

- Las acciones del documento viven en una unica lista `tools`.
- El panel correcto de herramientas es el drawer `Herramientas disponibles`.
- Se elimino cualquier clase e implementacion `tool-dock`, `tool-dock-pin` y
  `tool-dock-item` para evitar doble barra.
- El preview real se documenta como servicio modular de Document API consumido
  por Gateway, no como logica aislada en cada pantalla.

## Informacion faltante o ambigua

- Motor real elegido para PDF: PDF.js, React PDF Viewer o PDFium WASM.
- Contrato final para persistir y pasar `file_id` activo a `/workspace`.
- Storage y URLs firmadas para miniaturas y previews generados.
- Motores reales para DOCX, Excel, OCR, ZIP y XML.

## Limpieza

Los agents `AGENTS-000.md` y `AGENTS-001.md` se archivan en
`Docs/_archive/agents/2026-05-30-docucore-preview-actions/`. Los archivos
activos quedan limpios para futuras corridas.

---

# Reporte agents DocuCore estados, acciones y preview progresivo

Fecha: 2026-05-30

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-001.md` en orden
numerico. El primero estandariza el cuadro de herramientas compacto, buscable y
sin duplicacion. El segundo define e implementa un preview progresivo por
pagina con estados independientes.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado MVP | El workspace conserva una barra inferior compacta de iconos con etiquetas por interaccion. Las herramientas documentales viven en el drawer unico `Herramientas disponibles`, con busqueda por nombre, categoria, accion y sinonimos, filtrada por tipo documental PDF. |
| `AGENTS-001.md` | Completado MVP | Se agrego estado de preview por pagina (`pending`, `loading`, `ready`, `error`), placeholder inmediato, preloader por pagina y error local sin bloquear herramientas ni seleccion. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo aviso LF/CRLF de Git. |
| `git diff --check` en `Docs` | Aprobado; solo aviso LF/CRLF de Git. |
| `git diff --check` en `Docs` | Aprobado; solo aviso LF/CRLF de Git. |
| `Start-NextLocalWeb.ps1 -Project docucore -CleanCache -SkipBuild -SkipLint -SkipInstall` | Aprobado; web local reiniciada en puerto 3004. |
| `GET http://localhost:3004/workspace` | `200`. |
| `GET http://localhost:3004/_next/static/css/app/layout.css` | `200`. |
| `git diff --check` en `Docs` | Aprobado; solo aviso LF/CRLF de Git. |

## Decisiones tomadas

- El drawer de herramientas es la fuente unica de acciones documentales.
- La barra inferior conserva accesos generales y muestra texto solo por
  interaccion para priorizar el documento.
- La busqueda del drawer resuelve sinonimos de usuario como `cortar`, `texto`,
  `reducir` y `firma`.
- El preview actual usa render conceptual progresivo mientras no exista motor
  PDF.js o endpoint real de paginas.
- La pagina con error no bloquea la seleccion ni las acciones de workspace.

## Informacion faltante o ambigua

- Endpoint real para obtener `file_id`, metadata y total de paginas desde
  Gateway.
- Motor final de preview PDF y formato cacheado definitivo.
- Politica de reintento real por pagina y expiracion de miniaturas.
- Persistencia de historial/frecuencia de herramientas por usuario.

## Limpieza

Los agents `AGENTS-000.md` y `AGENTS-001.md` se archivan en
`Docs/_archive/agents/2026-05-30-docucore-preview-states-actions/`. Los
archivos activos quedan limpios para futuras corridas.

---

# Reporte agents DocuCore preview real y marcos adaptativos

Fecha: 2026-05-30

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-002.md` en orden
numerico. `AGENTS-000.md` refuerza la previsualizacion progresiva por pagina;
`AGENTS-002.md` corrige el visualizador para que cada pagina respete su tamano
real y no se salga del marco.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | La preview progresiva ya existe en `/workspace`: se obtiene el PDF desde `/upload`, se calcula el total real de paginas con PDF.js, se muestran placeholders y se renderiza cada miniatura de forma independiente. |
| `AGENTS-002.md` | Completado | Cada pagina guarda `width`, `height`, `sizeName` y `orientation`; el marco usa proporcion real con `aspect-ratio`, centra el contenido y evita desbordamiento con `object-fit: contain` y `overflow: hidden`. |
| `AGENTS-001.md`, `AGENTS-003.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/package.json`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/package-lock.json`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo aviso LF/CRLF de Git. |
| `git diff --check` en `Docs` | Aprobado; solo aviso LF/CRLF de Git. |

## Decisiones tomadas

- Se mantiene PDF.js como motor MVP de preview real en frontend.
- La metadata visual se calcula desde el viewport original de PDF.js con escala
  1 para conservar ancho, alto y orientacion reales.
- El nombre de tamano se detecta de forma aproximada: A5, A4, Carta, Oficio,
  Legal o Personalizado.
- El contrato objetivo de Gateway se amplio para incluir `size_name` y
  `orientation`.

## Informacion faltante o ambigua

- Endpoint productivo de Gateway para sustituir `sessionStorage` y `objectUrl`
  por `file_id`.
- Politica de cache y expiracion de miniaturas generadas.
- Precision final de deteccion para tamanos regionales no estandar.
- Modos de zoom completos: ajustar al ancho, pagina completa, 100% y zoom
  manual.

## Limpieza

Los agents `AGENTS-000.md` y `AGENTS-002.md` se archivan en
`Docs/_archive/agents/2026-05-30-docucore-real-preview-adaptive-frames/`. Los
archivos activos quedan limpios para futuras corridas.

---

# Reporte agents DocuCore acciones por pagina y protocolo Next.js

Fecha: 2026-05-31

## Alcance

Se ejecuto el agent activo `AGENTS-000.md` en orden numerico. La tarea del
agent agrega acciones rapidas por pagina dentro del preview de DocuCore. A
solicitud del usuario, tambien se creo un estandar operativo para recuperar
webs Next.js cuando despues de cambios quedan sin estilos, con cache rota,
`500` temporal o dev server atorado.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/03_standards/frontend/README.md`
- `Docs/03_standards/frontend/shared-docker-frontend-architecture.md`
- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/02_projects/docucore/docker.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado MVP | Se agrego barra de acciones rapidas por pagina en el preview: girar izquierda, girar derecha, extraer, duplicar, eliminar y mas opciones. La barra aparece por hover/focus o al seleccionar pagina y mantiene la seleccion activa. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Estandar operativo creado

| Archivo | Proposito |
|---|---|
| `Docs/03_standards/frontend/nextjs-runtime-recovery-standard.md` | Protocolo canonico para reparar webs Next.js locales con CSS roto, cache vieja, `500` temporal o dev server atorado. |
| `Docs/03_standards/operations/scripts/Start-NextLocalWeb.ps1` | Script ejecutable para lint/build opcional, detener solo el puerto del proyecto, limpiar `.next`, levantar `npm run dev` y validar rutas. |

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/frontend/README.md`
- `Docs/03_standards/frontend/nextjs-runtime-recovery-standard.md`
- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/03_standards/operations/scripts/Start-NextLocalWeb.ps1`
- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo aviso LF/CRLF de Git. |
| `git diff --check` en `Docs` | Aprobado; solo aviso LF/CRLF de Git. |
| `Start-NextLocalWeb.ps1 -Project docucore -CleanCache -SkipBuild -SkipLint -SkipInstall` | Aprobado; reinicio local y rutas validadas. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` | Aprobado; CSS disponible. |
| `GET http://localhost:3004/` | `200`. |
| `GET http://localhost:3004/upload` | `200`. |
| `GET http://localhost:3004/workspace` | `200`. |

## Decisiones tomadas

- El protocolo de recuperacion queda como estandar frontend porque el problema
  se repite en varias webs Next.js, no solo en DocuCore.
- No se borra `node_modules` como primer intento; primero se valida lint/build,
  se limpia `.next` y se reinicia solo el puerto canonico.
- El script no cambia puertos; usa el registro local.
- Las acciones rapidas por pagina son MVP visual/preparado. No prometen
  modificacion real de PDF hasta que exista motor backend o contrato de job.

## Informacion faltante o ambigua

- Aun falta integrar capturas visuales automáticas con Playwright.
- Falta definir motor backend para aplicar realmente rotar, extraer, duplicar
  y eliminar paginas.
- Falta decidir si el protocolo se ejecutara automaticamente desde Docker o
  solo bajo demanda.

## Limpieza

El agent `AGENTS-000.md` se archiva en
`Docs/_archive/agents/2026-05-31-docucore-page-actions-next-recovery/`. Los
archivos activos quedan limpios para futuras corridas.

---

# Reporte agents DocuCore workspace ergonomico

Fecha: 2026-06-01

## Alcance

Se ejecuto el agent activo `AGENTS-000.md` en orden numerico. El objetivo fue
mejorar el espacio de trabajo documental de DocuCore para que el preview del
PDF tenga prioridad visual sobre controles, barras y navegacion secundaria.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se compacto el header del workspace, se movieron acciones frecuentes a la barra inferior, se elimino el scrollbar horizontal de `floating-toolbar`, se agrego panel de seleccion de paginas y se retiraron accesos duplicados `config-fab`/`info-fab` del render. |
| `AGENTS-001.md` - `AGENTS-004.md`, `AGENTS-007.md`, `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |
| `AGENTS-005.md` - `AGENTS-006.md`, `AGENTS-008.md` - `AGENTS-014.md` | Pendientes | Agents activos relacionados con OCR, acciones futuras, secciones, colores, papelera, seleccion, marcadores y division automatica. No se ejecutaron en esta pasada para no mezclar cambios fuera del agent ergonomico solicitado; varios requieren contrato backend o validacion funcional adicional. |

## Tareas ejecutadas

- Header `canvas-header` convertido en resumen compacto flotante con nombre de
  archivo truncado.
- Barra `floating-toolbar` centrada, icon-only, sin `overflow-x` visible y con
  tooltips por `data-label`.
- Acciones inferiores normalizadas: herramientas, configuracion, seleccion,
  subir mas, informacion, resultado y aplicar cambios.
- Seleccion de paginas movida desde `pdf-toolbar` a drawer propio.
- `pdf-toolbar` reducido a estado de preview y carga.
- `canvas-workspace`, `canvas-main` y `page-grid` ajustados para ocupar viewport
  sin overflow horizontal.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo aviso LF/CRLF de Git. |

## Decisiones tomadas

- La barra inferior es la fuente unica de acciones frecuentes del workspace.
- La accion `Aplicar cambios` abre `Resultado` porque el motor real de escritura
  PDF sigue pendiente de contrato backend.
- El panel de seleccion concentra presets, rango escrito y visibilidad de
  paginas descartadas para liberar espacio vertical del preview.
- Se mantiene `page-grid` con scroll interno para paginas; el body no debe
  generar desplazamiento lateral.

## Informacion faltante o ambigua

- No existe contrato backend final para aplicar cambios reales sobre PDF.
- Falta automatizar capturas visuales desktop/mobile para validar ergonomia con
  documentos largos.
- Falta definir atajos de teclado para acciones frecuentes de toolbar.

## Limpieza

El agent `AGENTS-000.md` se archivo en
`Docs/_archive/agents/2026-06-01-docucore-workspace-ergonomics/`. Los agents
pendientes se conservan activos.

---

# Reejecucion verificada agent DocuCore workspace ergonomico

Fecha: 2026-06-01

## Alcance

Se reejecuto el primer agent activo `AGENTS-000.md` instruccion por
instruccion porque la implementacion anterior no habia cubierto todos los
puntos. Esta pasada completa los puntos faltantes de topbar, sidebar, eventos
de shell y limpieza de estilos duplicados.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`

## Matriz instruccion por instruccion

| Instruccion del agent | Estado | Evidencia |
|---|---|---|
| `floating-toolbar` sin scrollbar horizontal ni overflow-x | Cumplido | CSS usa toolbar fija centrada, `max-width: calc(100vw - 24px)`, `overflow: visible`, botones de 42px e iconos sin texto permanente. |
| Acciones superiores movidas a barra inferior | Cumplido | `WorkspaceClient.tsx` concentra herramientas, configuracion, seleccion, subir mas, informacion, resultado y aplicar cambios en `floating-toolbar`. |
| Seleccion de paginas en menu inferior | Cumplido | Se agrego drawer `Seleccion de paginas` con presets: todas, impares, pares y limpiar seleccion, mas rango manual. |
| `canvas-header` reducido | Cumplido | Header compacto flotante con resumen y `canvas-summary-file` truncado con `title`. |
| `canvas-workspace` a ventana completa | Cumplido | Workspace usa `100dvh`, `max-width: 100vw`, sin tarjeta externa, y reserva espacio para topbar/header/toolbar. |
| `pdf-toolbar` compacta | Cumplido | Solo conserva estado de preview/carga; ya no contiene controles de seleccion. |
| Topbar semitransparente y compacta | Cumplido | `AppShell` renderiza topbar fija, semitransparente, con hover/focus y acciones de login/registro. |
| Sidebar oculta/compacta por defecto | Cumplido | `AppShell` maneja `SidebarState = hidden/icons/expanded`, pestaña lateral, hover, pin y Escape. |
| Eventos necesarios | Cumplido MVP | Toolbar abre drawers; topbar abre modal auth; sidebar abre, expande, fija y cierra con Escape. |
| Regla contra duplicacion | Cumplido | Busqueda local confirma que no quedan referencias a `page-controls`, `config-fab` ni `info-fab` en `app`. |
| Layout responsive y enfocado en preview | Cumplido | CSS mobile mantiene topbar compacta, sidebar fija por pestaña, toolbar inferior centrada y `page-grid` con scroll interno. |

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/components/AppShell.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/layout.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo aviso LF/CRLF de Git. |
| `git diff --check` en `Docs` | Aprobado; solo aviso LF/CRLF de Git. |
| Busqueda local de `page-controls`, `config-fab`, `info-fab` | Aprobado; no quedan referencias activas en `app`. |
| `Start-NextLocalWeb.ps1 -Project docucore -CleanCache -SkipBuild -SkipLint -SkipInstall` | Aprobado; web reiniciada en puerto 3004. |
| `GET http://localhost:3004/` | `200`. |
| `GET http://localhost:3004/workspace` | `200`. |
| `GET http://localhost:3004/_next/static/css/app/layout.css` | `200`. |

## Decisiones tomadas

- Se creo `AppShell` como componente cliente para manejar estado de sidebar y
  modal auth sin convertir `layout.tsx` completo en componente cliente.
- Login y registro se resuelven con modal global MVP para cumplir el evento
  esperado y conservar el contexto visual.
- La sidebar inicia oculta para maximizar el workspace; el usuario puede
  abrirla con la pestaña lateral y fijarla si necesita navegacion persistente.

## Informacion faltante o ambigua

- El backend real para aplicar cambios de PDF sigue pendiente; por eso
  `Aplicar cambios` abre resultado/confirmacion MVP.
- Falta validacion visual automatizada con Playwright en desktop/mobile.

## Limpieza

`AGENTS-000.md` se archivo en
`Docs/_archive/agents/2026-06-01-docucore-workspace-ergonomics/` y el archivo
activo quedo vacio para evitar reejecucion accidental.

---

# Ejecucion agents DocuCore workspace PDF avanzado

Fecha: 2026-06-01

## Alcance

Se revisaron los agents activos en orden numerico. `AGENTS-000.md` ya estaba
cerrado en ejecuciones anteriores, por lo que no se repitio implementacion. Se
ejecutaron las tareas pendientes de `AGENTS-005.md` a `AGENTS-014.md` en el
alcance seguro disponible para frontend: estado local, UI, ayudas visuales,
configuracion centralizada y documentacion. No se inventaron motores backend ni
se marco como productivo nada que dependa de Document API/Gateway.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/document-intelligence.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Ya completado | Ya estaba implementado y reportado: ergonomia del workspace, toolbar inferior, topbar y sidebar compacta. Se limpiara el duplicado activo. |
| `AGENTS-001.md` - `AGENTS-004.md`, `AGENTS-007.md`, `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |
| `AGENTS-005.md` | Parcialmente completado MVP | OCR normalizado por pagina con motor primario, fallback, combinacion, confianza y resultado visible en estado local. Pendiente conectar Tesseract/PaddleOCR reales por backend. |
| `AGENTS-006.md` | Completado MVP frontend | Acciones futuras centralizadas en `PageActionConfig`, dentro del menu de tres puntos, sin saturar miniaturas. |
| `AGENTS-008.md` | Completado MVP frontend | Secciones visuales con colores, leyenda, zona `Dividir aqui`, crear por seleccion, colapsar/fusionar y resumen. |
| `AGENTS-009.md` | Completado MVP frontend | Identificacion visual por seccion y estados de pagina: OCR, descartada, importante, etiqueta, firma, marca, numeracion, traduccion y salida. |
| `AGENTS-010.md` | Completado MVP frontend | Papelera reversible: descartar, restaurar, restaurar masivo y eliminar permanente local. |
| `AGENTS-011.md` | Completado MVP frontend | Modos de visibilidad para descartadas: visible, compacta y oculta sin modificar resultado documental. |
| `AGENTS-012.md` | Completado MVP frontend | Seleccion individual, presets, rango escrito, invertir seleccion y contador visible. Arrastre/Shift completo queda pendiente de QA visual. |
| `AGENTS-013.md` | Parcialmente completado MVP | Marcadores manuales y navegacion visual por secciones. Pendiente detectar bookmarks reales del PDF y generar indice exportable. |
| `AGENTS-014.md` | Parcialmente completado MVP | Analisis automatico reversible con sugerencias por reglas, bookmarks, layout y OCR. Pendiente detectores reales por QR, paginas en blanco, texto personalizado e IA. |

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/components/AppShell.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/layout.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo aviso LF/CRLF de Git. |

## Decisiones tomadas

- Los agents `005-014` se resolvieron como MVP frontend/preparado porque la
  documentacion canonica indica que OCR productivo, escritura real de PDF,
  persistencia de proyecto y exportacion final dependen de Gateway/Document
  API.
- Las acciones futuras no se muestran como botones permanentes; viven en el
  menu de tres puntos.
- Las sugerencias automaticas nunca aplican cambios por si solas; quedan como
  propuestas aceptables/rechazables.
- La visibilidad de paginas descartadas es independiente del estado documental.

## Informacion faltante o ambigua

- Contrato backend final para persistir proyecto de workspace PDF.
- Job real para aplicar operaciones de PDF por pagina/seccion.
- Motores OCR productivos y formato de respuesta por pagina.
- Deteccion real de bookmarks PDF, paginas en blanco, QR, layout y texto
  personalizado.
- QA visual con Playwright para seleccion por arrastre, Shift y mobile.

## Limpieza

`AGENTS-000.md` se limpio y el duplicado activo se archivo como
`Docs/_archive/agents/2026-06-01-docucore-workspace-ergonomics/AGENTS-000-duplicate-cleanup.md`.
Los agents `005-014` se mantienen activos si se requiere completar backend real;
el MVP frontend queda documentado y validado.

---

# Recuperacion runtime CSS DocuCore

Fecha: 2026-06-01

## Alcance

Se aplico el protocolo estandar de recuperacion Next.js porque DocuCore cargaba
HTML pero el CSS no se aplicaba correctamente.

## Diagnostico

| Revision | Resultado |
|---|---|
| `GET http://localhost:3004/` antes de reparar | `200`. |
| CSS detectado por HTML | `/_next/static/css/app/layout.css?v=...`. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` antes de reparar | Fallo: CSS respondia `404`. |

## Accion ejecutada

Se ejecuto:

```powershell
Docs/03_standards/operations/scripts/Start-NextLocalWeb.ps1 -Project docucore -CleanCache
```

El script detuvo solo el proceso del puerto canonico `3004`, limpio `.next`,
reconstruyo el runtime local y levanto nuevamente `npm run dev`.

## Validaciones posteriores

| Validacion | Resultado |
|---|---|
| `GET http://localhost:3004/` | `200`. |
| `GET http://localhost:3004/workspace` | `200`. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` | Aprobado; CSS disponible. |
| CSS enlazado por HTML | `200`, contenido disponible. |

## Decision

El fallo correspondia a cache/manifest de Next.js desfasado. No se modifico
funcionalidad ni se cambiaron puertos.

---

# Ejecucion agents DocuCore workspace limpio

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos en orden numerico, limitando la implementacion
al area Workspace de DocuCore. Antes de modificar se revisaron reglas de agents,
indices y documentacion canonica de DocuCore.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/03_standards/documentation-first-workflow.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/document-intelligence.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se elimino `canvas-header`, `pdf-toolbar`, `workspace-status-row` y `section-legend` como bloques visibles permanentes dentro del preview. |
| `AGENTS-001.md` | Completado | Se aplico el modelo de workspace tipo editor: preview central, barra inferior icon-only y paneles bajo demanda para documento, estado, secciones, configuracion, seleccion y resultado. |
| `AGENTS-002.md` | Completado | Se tomo como referencia visual HTML/CSS para consolidar topbar/sidebar/workspace limpio sin cambiar rutas ni funcionalidad fuera de `/workspace`. |
| `AGENTS-003.md` | Completado | `section-split-zone` y `page-insert-zone` quedaron como guias delgadas, semitransparentes y de bajo peso visual; solo resaltan por hover/focus o acciones relacionadas. |
| `AGENTS-004.md` | Sin instrucciones | Archivo vacio. |
| `AGENTS-005.md` - `AGENTS-014.md` | Ya completados MVP / parcialmente bloqueados por backend | Ya estaban implementados como MVP frontend en ejecucion previa. No se repitio implementacion para no inventar OCR productivo, escritura real de PDF, bookmarks reales ni persistencia sin Gateway/Document API. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Tareas ejecutadas

- Se movio informacion de documento a drawer `Documento`.
- Se movio estado de miniaturas, carga e incidencias a drawer `Estado`.
- Se movio leyenda de secciones a drawer `Secciones`.
- Se retiro el render permanente de `canvas-header` y `pdf-toolbar`.
- Se retiro el render permanente de `workspace-status-row` y `section-legend`
  dentro de `pdf-stage`.
- `canvas-main`, `pdf-stage` y `page-grid` quedaron con `overflow: visible`
  para priorizar scroll principal del navegador.
- La barra inferior agrega accesos a Herramientas, Documento, Estado,
  Secciones, Configuracion, Seleccion, Subir mas, Resultado y Aplicar.
- Las zonas de insercion/division quedaron compactas y discretas.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; `next lint` muestra aviso de deprecacion para Next 16. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado, 20 rutas generadas. |
| Busqueda local de render permanente `canvas-header`, `DocumentPreviewToolbar`, `pdf-toolbar`, `workspace-status-row`, `section-legend` en `WorkspaceClient.tsx` | Aprobado; no hay coincidencias. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo aviso LF/CRLF de Git. |

## Decisiones tomadas

- Se usaron drawers existentes en lugar de crear un sistema paralelo de
  popovers para mantener consistencia con el workspace actual.
- No se tocaron API, Gateway ni rutas externas a Workspace.
- Los agents `005-014` no se reimplementaron porque sus cambios MVP ya estaban
  documentados y lo restante depende de backend real.

## Informacion faltante o ambigua

- Falta contrato backend para persistir proyecto, aplicar cambios reales de PDF
  y exportar resultados definitivos.
- Falta motor OCR productivo y deteccion real de bookmarks, QR, paginas en
  blanco y layout.
- Falta QA visual automatizado en desktop/mobile.

## Limpieza

Se archivan los agents `AGENTS-000.md` a `AGENTS-003.md` por quedar cerrados en
el alcance Workspace frontend. Los agents `005-014` se conservan activos solo si
se decide completar backend real.
---

# Ejecucion agent unico DocuCore borradores persistentes

Fecha: 2026-06-01

## Alcance

Se ejecuto solamente el primer agent activo, `AGENTS-000.md`, siguiendo la
instruccion del usuario de no avanzar a otros agents hasta concluir este
proceso. El alcance se limito a DocuCore Workspace, Upload, shell de navegacion
y documentacion canonica relacionada.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`

## Resultado del agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se implementaron zonas inteligentes de insercion, sidebar con cierre automatico/guardado previo a navegacion, concepto de Borrador documental y persistencia local con IndexedDB/localStorage. |

## Tareas detectadas

- Convertir las zonas entre paginas en puntos delgados de insercion, division,
  pegado y reordenamiento.
- Mostrar menu contextual con nueva pagina vacia, dividir aqui, pegar aqui,
  insertar PDF e insertar imagen.
- Mostrar estados visuales para copia, corte, drag/drop y posicion resaltada.
- Guardar Workspace antes de navegar desde sidebar y mostrar toast.
- Cerrar automaticamente la sidebar de workspace si no hay interaccion.
- Usar `Borrador documental` como concepto de trabajos pendientes.
- Mostrar borradores pendientes en `/upload` con Abrir, Duplicar, Renombrar y
  Eliminar.
- Persistir estado local y documento base con IndexedDB/localStorage.
- Recuperar sesiones tras refresh o regreso posterior.

## Tareas ejecutadas

- Se agrego `lib/workspace-drafts.ts` con indice local, almacenamiento de
  archivos y registros de borrador en IndexedDB.
- `/upload` guarda el archivo seleccionado en IndexedDB antes de abrir
  `/workspace`.
- `/upload` lista borradores pendientes y permite abrir, duplicar, renombrar
  o eliminar.
- `/workspace` guarda automaticamente paginas, documento, herramienta,
  seleccion, secciones, descartadas, modo y scroll.
- `/workspace` restaura borradores por `draftId` o por borrador activo local.
- `AppShell` guarda el workspace antes de navegar, muestra toast y cierra la
  sidebar de workspace por inactividad.
- Las zonas antiguas de pegado/division se sustituyeron por una guia vertical
  inteligente integrada en cada miniatura.
- Se documento el estandar de Borrador documental persistente en la
  documentacion canonica de DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace-drafts.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/components/AppShell.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`

## Validaciones ejecutadas

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |

## Decisiones tomadas

- Se uso IndexedDB para documento y registro completo de borrador; localStorage
  queda solo como indice liviano para listar borradores rapidamente.
- La insercion real de PDF/imagen queda preparada como estado UI porque aun
  depende de contratos backend de escritura PDF.
- La recuperacion de borrador conserva el estado de paginas y usa el archivo
  guardado en IndexedDB cuando esta disponible.
- No se avanzo a ningun otro agent por instruccion expresa del usuario.

## Informacion faltante

- Falta contrato backend para sincronizar borradores con cuenta de usuario.
- Falta job real para insertar PDF/imagen y escribir el resultado final.
- Falta QA visual automatizado para confirmar hover/drop en desktop y mobile.

## Limpieza

`AGENTS-000.md` queda listo para archivo por estar completado y documentado en
este reporte.

---

# Ejecucion agents de planeacion DocuCore y ERP

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos en orden numerico. Los agents `AGENTS-000.md`,
`AGENTS-001.md` y `AGENTS-002.md` contenian la planeacion nueva sobre politica
cliente/hibrido/servidor, costos internos, creditos y modulo ERP transversal.
Los agents posteriores fueron evaluados contra el reporte existente; las fases
`005-014` ya estaban cerradas como MVP frontend o dependen de backend real, por
lo que no se reimplementaron.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/03_standards/operations/agents-documentation-order.md`
- `Docs/03_standards/global-governance.md`
- `Docs/03_standards/architecture/api-gateway-standard.md`
- `Docs/03_standards/product/product-strategy.md`
- `Docs/03_standards/product/module-catalog.md`
- `Docs/01_core_erp/erp/01_modules.md`
- `Docs/01_core_erp/apis/00_api_index.md`
- `Docs/01_core_erp/architecture/07_project_api_pattern.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/architecture.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/monetization-and-credits.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se evaluo la relacion entre agents 0-1, se documento el orden recomendado, el estandar general de agents y la propuesta del modulo ERP Administrador de Ejecucion y Recursos. |
| `AGENTS-001.md` | Completado | Se documento la politica cliente/hibrido/servidor, criterios de fallback, tareas candidatas por modo y datos de recursos a medir. |
| `AGENTS-002.md` | Completado | Se resolvio la politica de creditos: el costo interno cambia por modo de ejecucion, pero los creditos/precio al usuario no cambian automaticamente. |
| `AGENTS-003.md` - `AGENTS-004.md` | Sin instrucciones | Archivos vacios. |
| `AGENTS-005.md` - `AGENTS-014.md` | Parcialmente completados / bloqueados por backend | Ya estaban cerrados como MVP frontend en reportes previos. Quedan pendientes motores backend reales para OCR productivo, escritura PDF, bookmarks reales, IA, QR, deteccion de paginas en blanco y persistencia remota. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Orden recomendado

1. `AGENTS-000.md`: primero porque establece evaluacion, estandar de agents y
   planeacion transversal.
2. `AGENTS-001.md`: despues porque define la politica tecnica de ejecucion.
3. `AGENTS-002.md`: despues porque resuelve la regla comercial de creditos y
   costo interno.
4. `AGENTS-005.md` en adelante: no se reabren hasta tener contratos/backend
   faltantes o una instruccion especifica para ampliar el MVP frontend.

## Cambios realizados

- Se creo `Docs/02_projects/docucore/execution-policy.md`.
- Se creo `Docs/01_core_erp/erp/24_execution_resource_manager.md`.
- Se creo `Docs/01_core_erp/apis/16_execution_resource_manager_api.md`.
- Se amplio `Docs/03_standards/operations/agents-documentation-order.md` con
  formato obligatorio, estados, prioridades, criterios de bloqueo y archivo.
- Se actualizo `Docs/02_projects/docucore/monetization-and-credits.md` para
  separar creditos visibles, costo interno y ahorro operativo.
- Se actualizo `Docs/02_projects/docucore/api-contracts.md` con eventos de
  ejecucion y recursos.
- Se actualizo el indice de APIs, catalogo de modulos, README de DocuCore e
  indices `_meta`.

## Decisiones tomadas

- El procesamiento local reduce costo interno, no reduce automaticamente el
  precio ni los creditos cobrados al usuario.
- El ahorro operativo se registra en ERP y puede convertirse en promociones,
  mas creditos, mejor infraestructura o reduccion de costos solo por regla
  comercial explicita.
- El modulo recomendado es `API.PY.DJANGO.ExecutionResourceManager` o modulo
  desacoplado del ERP, no parte interna de DocuCore.
- Los eventos deben usar `execution_id`, `trace_id`, `request_id`,
  `project_code`, `module_code` y `task_type` para trazabilidad.
- No se implemento logica productiva del modulo ERP porque el agent era de
  planeacion y documentacion.

## Informacion faltante o ambigua

- Formula definitiva de costo interno por CPU, memoria, storage, transferencia
  y tiempo.
- Tabla comercial final de creditos por herramienta.
- Permisos ERP para vistas financieras y tecnicas.
- Decision final: API separada o modulo interno desacoplado del ERP.
- Retencion de eventos y agregaciones historicas.
- Contratos backend reales para completar phases `005-014`.

## Archivos modificados

- `Docs/03_standards/operations/agents-documentation-order.md`
- `Docs/03_standards/product/module-catalog.md`
- `Docs/01_core_erp/apis/00_api_index.md`
- `Docs/01_core_erp/apis/16_execution_resource_manager_api.md`
- `Docs/01_core_erp/erp/01_modules.md`
- `Docs/01_core_erp/erp/24_execution_resource_manager.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/execution-policy.md`
- `Docs/02_projects/docucore/monetization-and-credits.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `git diff --check` en Docs | Aprobado; solo avisos LF/CRLF de Git. |
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| Busqueda `rg` de rutas canonicas nuevas | Aprobado; las referencias existen en indices y documentos relacionados. |

## Limpieza

`AGENTS-000.md`, `AGENTS-001.md` y `AGENTS-002.md` quedan listos para archivo.
Los agents `005-014` se mantienen activos por dependencias backend reales y no
se limpian.

---

# Arranque operativo DocuCore y revision de agents activos

Fecha: 2026-06-01

## Alcance

Se intento levantar DocuCore y sus dependencias segun el estandar operativo del
repositorio. Tambien se revisaron los agents activos actuales para no repetir
tareas ya cerradas ni implementar fases bloqueadas por backend real.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/02_projects/docucore/README.md`

## Resultado operativo

| Componente | Puerto | Estado | Resultado |
|---|---:|---|---|
| `WEB.NJ.NEXT.DocuCore` | 3004 | Corriendo local | `http://localhost:3004` responde correctamente. |
| `API.PY.DJANGO.Document` | 8011 | Bloqueado | No escucha; Docker daemon no disponible. |
| `API.PY.DJANGO.DocuCore` | 8012 | Bloqueado | No escucha; Docker daemon no disponible. |
| `API.PY.DJANGO.DocuCore.Gateway` | 8013 | Bloqueado | No escucha; Docker daemon no disponible. |

## Comandos ejecutados

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -WaitSeconds 90
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-NextLocalWeb.ps1 -Project docucore -CleanCache
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local
```

## Validaciones

| Validacion | Resultado |
|---|---|
| Docker workspace | Fallo: `dockerDesktopLinuxEngine` no esta disponible. |
| `GET http://localhost:3004/` | 200 |
| `GET http://localhost:3004/upload` | 200 |
| `GET http://localhost:3004/workspace` | 200 |
| CSS DocuCore | Aprobado; `/_next/static/css/app/layout.css` disponible. |
| Puertos `8011`, `8012`, `8013` | No escuchan por dependencia Docker bloqueada. |

## Resultado por agents

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-004.md` | Sin instrucciones | Archivos vacios despues de cierre/archivo previo. |
| `AGENTS-005.md` - `AGENTS-014.md` | Parcialmente completados / bloqueados por backend | Ya documentados como MVP frontend o pendientes de backend real; no se reimplementan sin contratos de OCR, PDF writer, bookmarks, IA, QR y persistencia remota. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Bloqueo

Docker Desktop no expone el daemon `dockerDesktopLinuxEngine`, por lo que no se
pudieron levantar Document API, DocuCore API ni DocuCore Gateway. La web queda
usable para trabajo frontend y pantallas MVP, pero las funciones que requieran
Gateway/API real dependeran de reiniciar o reparar Docker Desktop.

## Decision

Se dejo corriendo DocuCore Web en local para que el equipo pueda visualizar y
trabajar en la interfaz mientras se desbloquean las dependencias Docker.

---

# Ejecucion agents 000 y 001 - previews rotadas DocuCore

Fecha: 2026-06-01

## Alcance

Por instruccion del usuario se ejecutaron solamente `AGENTS-000.md` y
`AGENTS-001.md`. Ambos describian la misma correccion completa de miniaturas
PDF: paginas rotadas, barra rapida de acciones, metadata visual, drag and drop
y zonas inteligentes de insercion. Los demas agents fueron ignorados.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se corrigio el calculo visual de paginas rotadas, la visibilidad de acciones rapidas y la alineacion de zonas de insercion. |
| `AGENTS-001.md` | Completado | Contenido duplicado/complementario del agent 000; se cerro con la misma implementacion y validacion. |

## Tareas ejecutadas

- Se agrego estructura separada de `paper-viewport` y `paper-rotator` dentro de
  la miniatura.
- `pageFrameStyle` calcula proporcion visual, proporcion original y ancho
  interno para rotaciones 90/270.
- La barra rapida ya no queda visible solo por pagina seleccionada; aparece por
  hover, focus, menu abierto o estado tactil.
- Las paginas rotadas conservan metadata de orientacion visual final.
- Las zonas inteligentes de insercion usan separacion uniforme y se agrego zona
  inicial antes de la primera pagina.
- Las zonas de inicio, medio y final quedan centradas con variables CSS.
- Se documento la regla en la documentacion canonica de DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git. |

## Informacion faltante

- Falta validacion visual manual con PDF real horizontal/vertical y casos de
  rotacion 90/270.
- Falta prueba automatizada visual para confirmar hover, focus, touch y zonas
  entre pagina normal y pagina rotada.

## Limpieza

`AGENTS-000.md` y `AGENTS-001.md` quedan completados y listos para archivo.

---

# Ejecucion agents 000 y 001 - menus flotantes Workspace DocuCore

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-001.md` en orden
numerico. Ambos aplican al area Workspace de DocuCore y corrigen acciones de
pagina, menus flotantes, zonas de insercion, sidebar del workspace y estados
visuales relacionados. No se implementaron agents posteriores porque `002-004`
estan vacios y `005-014` corresponden a fases previamente documentadas como
dependientes de backend real.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se implemento estado unico de menu flotante, portal de menus, cierre global, posicion inteligente, acciones de pagina filtradas y zonas de insercion sin recorte. |
| `AGENTS-001.md` | Completado | Se documento y aplico el estandar UX complementario: z-index, cierre por eventos, sidebar-tab condicionada, boton `Registrarme` estable y pendientes de prueba visual futura. |

## Tareas ejecutadas

- Se reemplazo la apertura local de menus por `floatingMenu` unico para pagina
  e insercion.
- `page-menu` e `insertion-menu` se renderizan en portal sobre `document.body`
  para evitar recortes por `overflow` del grid o miniaturas.
- Los menus se cierran por click externo, `Escape`, scroll, resize, inicio de
  drag, accion ejecutada y apertura de la sidebar del workspace.
- Las acciones de pagina ocultan opciones incompatibles con pagina descartada o
  portapapeles vacio.
- Las zonas inteligentes de insercion se mantienen como guias delgadas y abren
  el menu flotante desde su rectangulo real.
- `sidebar-tab` solo se muestra cuando la sidebar del workspace esta oculta.
- `topbar-primary` conserva estilo primario explicito para `Registrarme` con
  hover, focus, active y disabled.
- Se actualizo la documentacion canonica de navegacion/UX de DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/components/AppShell.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `git diff --check` en `Docs` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` | Detecto runtime/CSS no disponible inicialmente. |
| `Start-NextLocalWeb.ps1 -Project docucore -CleanCache` | Aprobado; reinicio DocuCore con cache limpia. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` | Aprobado; CSS disponible. |
| `Invoke-WebRequest http://localhost:3004/upload` | Aprobado; HTTP 200. |
| `Invoke-WebRequest http://localhost:3004/workspace` | Aprobado; HTTP 200. |

## Problemas encontrados

- El primer build fallo porque se trato `pageMenuActions` como funcion cuando
  en el codigo canonico es un arreglo. Se corrigio filtrando el arreglo antes
  de renderizar el menu.
- La implementacion intermedia mezclaba `activePageMenu` con `floatingMenu`;
  se elimino la referencia obsoleta.

## Riesgos detectados

- Falta prueba visual automatizada para confirmar que menus flotantes no se
  recorten en todos los viewports.
- Falta validacion manual con PDF real para hover, focus, touch, drag/drop y
  menus cerca de bordes del viewport.

## Informacion faltante

- No existe criterio automatizado de screenshots para aprobar z-index y cierre
  por eventos globales.
- No existe contrato backend nuevo; estas tareas permanecen dentro del alcance
  frontend Workspace.

## Limpieza

`AGENTS-000.md` y `AGENTS-001.md` quedan completados y listos para archivo. Los
agents `005-014` se mantienen activos/bloqueados por dependencias backend
reales ya documentadas. Los agents vacios se mantienen sin accion.

---

# Ejecucion agent 000 - rotacion estricta de previews PDF DocuCore

Fecha: 2026-06-01

## Alcance

Por instruccion del usuario se ejecuto solamente `AGENTS-000.md`. Todos los
demas agents fueron ignorados.

El agent exige corregir definitivamente la rotacion de previews PDF sin
reducir, escalar o achicar artificialmente la imagen. Tambien exige que el menu
grande de tres puntos tenga scroll interno y no quede debajo de las previews.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/agents/AGENTS-000.md`

## Resultado

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Rotacion de previews PDF normalizada con funcion pura, contenedor adaptativo por orientacion visual, grid flexible, menu con scroll interno y validaciones aprobadas. |

## Tareas ejecutadas

- Se creo `getPageVisualBox` y `normalizeRotation` como funciones puras
  exportadas.
- Se agregaron pruebas para rotaciones `0`, `90`, `180` y `270` usando el caso
  `1000 x 563`.
- `pageFrameStyle` usa `visualAspect` y `originalAspect` calculados desde
  `getPageVisualBox`.
- Se elimino el uso de `--paper-original-width`, `--preview-aspect` y `scale()`
  como parches de layout.
- `.paper-mini` reserva el aspecto visual final y `.paper-rotator` conserva el
  aspecto original antes de rotar.
- `page-grid` se cambio a `flex-wrap` para permitir reacomodo real de tarjetas
  horizontales y verticales.
- `page-menu.floating-menu-card` ahora tiene altura maxima, scroll interno,
  `overscroll-behavior: contain` y `z-index: 10000`.
- La documentacion canonica de DocuCore fue actualizada con la regla estricta
  de rotacion.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/page-visual-box.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/page-visual-box.test.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| Pruebas `page-visual-box.test.ts` compiladas y ejecutadas con `node --test` | Aprobado; 4 pruebas pasaron. |
| `rg "scale\\(|--paper-original-width|56\\.3|--preview-aspect" app/globals.css app/workspace` | Aprobado; sin coincidencias. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Informacion faltante

- Falta validacion visual manual con PDF real horizontal `1000 x 563` rotado a
  `270` grados.
- Falta prueba automatizada con navegador para confirmar DOM, menu flotante y
  reacomodo visual del grid.

## Limpieza

`AGENTS-000.md` queda completado y listo para archivo. Los demas agents no se
evaluaron ni ejecutaron por instruccion explicita del usuario.

---

# Ejecucion agents activos - altura real de previews horizontales

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos en orden numerico. `AGENTS-000.md` contenia
una instruccion nueva y ejecutable para corregir la altura real de tarjetas PDF
rotadas. `AGENTS-001.md` a `AGENTS-004.md`, `AGENTS-007.md` y `AGENTS-015.md`
a `AGENTS-030.md` estan vacios. `AGENTS-005.md`, `AGENTS-006.md` y
`AGENTS-008.md` a `AGENTS-014.md` siguen siendo fases antiguas ya documentadas
como MVP frontend o bloqueadas por backend real; no se reimplementaron para no
duplicar trabajo ni prometer motores inexistentes.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`
- Resumen de contenido de `AGENTS-005.md`, `AGENTS-006.md` y
  `AGENTS-008.md` a `AGENTS-014.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se corrigio la altura de tarjetas horizontales para que no conserven alto vertical ni oculten metadata/badge/estado. |
| `AGENTS-001.md` - `AGENTS-004.md` | Sin instrucciones | Archivos vacios. |
| `AGENTS-005.md` | Bloqueado / ya documentado | OCR avanzado con motores reales requiere contratos y servicios backend Document API. |
| `AGENTS-006.md` | Parcialmente completado / ya documentado | Acciones futuras por pagina ya existen como configuracion frontend/menu; los jobs reales siguen pendientes. |
| `AGENTS-007.md` | Sin instrucciones | Archivo vacio. |
| `AGENTS-008.md` - `AGENTS-014.md` | Parcialmente completados / bloqueados | Fases de secciones, colores, papelera, visibilidad, seleccion, marcadores y division inteligente ya estan documentadas como MVP frontend o pendientes de backend real. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Tareas ejecutadas

- `page-grid` cambio a `align-items: flex-start` para permitir alturas reales
  distintas por tarjeta.
- `.pdf-thumb` quedo con `block-size`, `height`, `min-block-size` y
  `min-height` automaticos.
- `.thumb-select` dejo de reservar altura vertical y usa filas compactas.
- `.paper-mini` usa `--thumb-preview-height` como altura exacta y limita
  overflow.
- `.paper-viewport` usa `overflow: hidden` para evitar invasiones visuales.
- `.pdf-thumb.is-landscape` mantiene titulo, metadata, badge y punto de estado
  visibles justo debajo del preview.
- Se actualizo la documentacion canonica de DocuCore con la regla de altura
  real para previews horizontales.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| Pruebas `page-visual-box.test.ts` compiladas y ejecutadas con `node --test` | Aprobado; 6 pruebas pasaron. |
| Busqueda de parches prohibidos (`scale`, `56%`, `--paper-rotator-ratio`, `--paper-original-width`, `--preview-aspect`) | Aprobado; sin coincidencias relevantes en Workspace/CSS. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Informacion faltante

- Falta validacion visual manual con PDF real para confirmar que una pagina
  horizontal tenga menor alto visual, metadata visible, badge visible y sin
  espacio vacio grande debajo del preview.
- Las fases `005-014` requieren contratos backend reales para cerrar OCR,
  escritura PDF, bookmarks, indices, division inteligente y persistencia.

## Limpieza

`AGENTS-000.md` queda completado y listo para archivo. Los agents vacios se
mantienen sin accion. Los agents `005-014` se mantienen activos/bloqueados por
dependencias backend reales ya documentadas.

---

# Ejecucion agents activos - AGENTS-000 duplicado ya completado

Fecha: 2026-06-01

## Alcance

Se revisaron los agents activos en orden numerico. `AGENTS-000.md` contenia el
mismo texto ya archivado en
`Docs/_archive/agents/2026-06-01-docucore-stable-preview-row/AGENTS-000.md`
con hash SHA256 identico. No se reimplemento codigo porque la tarea ya estaba
cerrada, documentada y validada.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado previamente / duplicado | Se verifico hash identico contra archivo ya archivado; no hubo cambios de codigo. |
| `AGENTS-001.md` - `AGENTS-004.md` | Sin instrucciones | Archivos vacios. |
| `AGENTS-005.md` | Bloqueado / ya documentado | OCR avanzado requiere motores y contratos backend reales. |
| `AGENTS-006.md` | Parcialmente completado / ya documentado | Acciones futuras existen como estructura frontend; jobs reales pendientes. |
| `AGENTS-007.md` | Sin instrucciones | Archivo vacio. |
| `AGENTS-008.md` - `AGENTS-014.md` | Parcialmente completados / bloqueados | Fases de secciones, colores, papelera, seleccion, marcadores y division inteligente dependen de backend real para cierre total. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Tareas ejecutadas

- Se comparo `Docs/agents/AGENTS-000.md` contra el archivo archivado previo
  mediante SHA256.
- Se archivo el duplicado en
  `Docs/_archive/agents/2026-06-01-docucore-stable-preview-row-duplicate/`.
- Se dejo `Docs/agents/AGENTS-000.md` vacio para evitar reejecucion.
- No se modifico funcionalidad porque el alcance ya estaba implementado.

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| Pruebas `page-visual-box.test.ts` compiladas y ejecutadas con `node --test` | Aprobado; 6 pruebas pasaron. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado despues de limpiar `.next`; primer intento fallo por cache `/_not-found`. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `git diff --check` en `Docs` | Aprobado despues de archivar el duplicado; solo avisos LF/CRLF de Git en Windows. |

## Informacion faltante

- Sigue pendiente validacion visual manual con PDF real para el comportamiento
  de pagina horizontal rotada.
- Las fases `005-014` siguen requiriendo backend real para cerrar OCR,
  escritura PDF, bookmarks, indices, division inteligente y persistencia.

## Limpieza

`AGENTS-000.md` quedo vacio. El duplicado se archivo. Los agents vacios se
mantienen sin accion y los agents `005-014` se mantienen activos/bloqueados por
dependencias backend reales ya documentadas.

---

# Ejecucion agents activos - normalizacion logica por filas de preview

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos en orden numerico. `AGENTS-000.md` contenia
una instruccion nueva y ejecutable para normalizar filas logicas de previews
PDF rotadas. Los demas agents se evaluaron por estado: archivos vacios sin
instrucciones y fases `005-014` bloqueadas o parcialmente completadas por
dependencias backend reales ya documentadas.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/agents/AGENTS-000.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se agrego normalizacion logica por filas con `--row-preview-height`, recalculo despues de render/resize/carga de imagen y CSS asociado. |
| `AGENTS-001.md` - `AGENTS-004.md` | Sin instrucciones | Archivos vacios. |
| `AGENTS-005.md` | Bloqueado / ya documentado | OCR avanzado requiere motores y contratos backend reales. |
| `AGENTS-006.md` | Parcialmente completado / ya documentado | Acciones futuras existen como estructura frontend; jobs reales pendientes. |
| `AGENTS-007.md` | Sin instrucciones | Archivo vacio. |
| `AGENTS-008.md` - `AGENTS-014.md` | Parcialmente completados / bloqueados | Fases de secciones, colores, papelera, seleccion, marcadores y division inteligente dependen de backend real para cierre total. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Tareas ejecutadas

- Se agrego `normalizePreviewRows` para agrupar miniaturas por `offsetTop`.
- La funcion limpia `--row-preview-height` antes de recalcular cada fila.
- Cada fila toma el mayor alto de `.paper-mini` entre paginas `is-portrait` y
  lo publica como `--row-preview-height` en todas las miniaturas de la fila.
- El grid de paginas usa `ref` para normalizar despues del render.
- La normalizacion corre en `resize` y mediante el evento interno
  `docucore:normalize-preview-rows`.
- Las imagenes de miniatura disparan el evento al terminar de cargar.
- `.thumb-select` usa el alto de fila calculado para mantener visible titulo,
  metadata, badge y punto de estado.
- Se actualizo la documentacion canonica de DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| Pruebas `page-visual-box.test.ts` compiladas y ejecutadas con `node --test` | Aprobado; 6 pruebas pasaron. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| Busqueda de parches prohibidos (`scale`, `56%`, `--paper-rotator-ratio`, `--paper-original-width`, `--preview-aspect`) | Aprobado; sin coincidencias en Workspace/CSS. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Informacion faltante

- Falta validacion visual manual con PDF real para confirmar que la imagen
  rotada no pierde bordes dentro de `.paper-mini` y que las paginas verticales
  de la misma fila conservan su altura normal.
- Las fases `005-014` siguen requiriendo backend real para cerrar OCR,
  escritura PDF, bookmarks, indices, division inteligente y persistencia.

## Limpieza

`AGENTS-000.md` queda completado y listo para archivo. Los agents vacios se
mantienen sin accion y los agents `005-014` se mantienen activos/bloqueados por
dependencias backend reales ya documentadas.

---

# Ejecucion agents activos - fila estable y preview horizontal centrado

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos en orden numerico. `AGENTS-000.md` contenia
una instruccion nueva y ejecutable para estabilizar la fila de previews PDF y
centrar la hoja horizontal rotada dentro de `.paper-mini`. El resto de agents
se evaluo por estado: archivos vacios sin instrucciones y fases antiguas
`005-014` permanecen bloqueadas o parcialmente cerradas por backend real.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/agents/AGENTS-000.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se estabilizo la fila de previews, se centro el preview horizontal con flex y se evito que la imagen rotada salga de `.paper-mini`. |
| `AGENTS-001.md` - `AGENTS-004.md` | Sin instrucciones | Archivos vacios. |
| `AGENTS-005.md` | Bloqueado / ya documentado | OCR avanzado requiere motores y contratos backend reales. |
| `AGENTS-006.md` | Parcialmente completado / ya documentado | Acciones futuras existen como estructura frontend; jobs reales pendientes. |
| `AGENTS-007.md` | Sin instrucciones | Archivo vacio. |
| `AGENTS-008.md` - `AGENTS-014.md` | Parcialmente completados / bloqueados | Fases de secciones, colores, papelera, seleccion, marcadores y division inteligente dependen de backend real para cierre total. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Tareas ejecutadas

- `.thumb-select`, `.paper-mini`, `.paper-viewport` y `.paper-rotator` fueron
  normalizados a flex para centrar el contenido.
- `.paper-mini` y `.paper-viewport` conservan `overflow: hidden` para que la
  imagen rotada no invada paginas vecinas.
- `.paper-rotator` usa ancho/alto completos y para 90/270 invierte dimensiones
  con `--thumb-preview-height` y `--thumb-width`.
- La imagen dentro de pagina 90/270 usa altura completa, ancho automatico,
  `max-inline-size: none` y `object-fit: contain`.
- `.pdf-thumb.is-landscape` centra verticalmente el contenido sin estirar la
  fila ni modificar la altura normal de paginas verticales.
- Se actualizo la documentacion canonica de DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| Pruebas `page-visual-box.test.ts` compiladas y ejecutadas con `node --test` | Aprobado; 6 pruebas pasaron. |
| Busqueda de parches prohibidos (`scale`, `56%`, `--paper-rotator-ratio`, `--paper-original-width`, `--preview-aspect`) | Aprobado; sin coincidencias en Workspace/CSS. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Informacion faltante

- Falta validacion visual manual con PDF real para confirmar `imgInsideX`,
  `imgInsideY`, centrado vertical de la pagina horizontal y altura normal de
  paginas vecinas.
- Las fases `005-014` siguen requiriendo backend real para cerrar OCR,
  escritura PDF, bookmarks, indices, division inteligente y persistencia.

## Limpieza

`AGENTS-000.md` queda completado y listo para archivo. Los agents vacios se
mantienen sin accion. Los agents `005-014` se mantienen activos/bloqueados por
dependencias backend reales ya documentadas.

---

# Ejecucion agent 000 - ancho real de tarjetas PDF rotadas

Fecha: 2026-06-01

## Alcance

Por instruccion del usuario se ejecuto solamente `AGENTS-000.md`; todos los
demas agents fueron ignorados.

El agent exige que una pagina PDF visualmente horizontal no solo cambie su
`aspect-ratio`, sino tambien el ancho real de `article.pdf-thumb`,
`thumb-select`, `paper-mini` y el item flex del grid.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`

## Resultado

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se agrego calculo de layout real para tarjetas rotadas, ancho flexible por orientacion visual y pruebas especificas para paginas horizontales/verticales. |

## Tareas ejecutadas

- Se agrego `PageLayoutBox` y `getPageLayoutBox`.
- Se calcula `thumbWidthPx` y `thumbHeightPx` a partir de orientacion visual y
  base `170px`.
- El `article.pdf-thumb` recibe variables `--thumb-width`,
  `--thumb-preview-height`, `--paper-visual-aspect` y `--preview-rotation`.
- `.pdf-thumb` usa `flex: 0 0 var(--thumb-width)`, `inline-size`,
  `min-inline-size` y `max-inline-size`.
- `.thumb-select` ocupa el ancho completo de la tarjeta y organiza preview,
  titulo, metadata, badge y estado.
- `.paper-mini` ocupa el ancho completo de la tarjeta y su altura visual se
  deriva de `--thumb-preview-height`.
- `.paper-rotator` ya no usa `--paper-rotator-ratio`; para 90/270 toma como
  ancho el alto visual del preview.
- Se documento la regla canonica en DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/page-visual-box.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/page-visual-box.test.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| Pruebas `page-visual-box.test.ts` compiladas y ejecutadas con `node --test` | Aprobado; 6 pruebas pasaron. |
| `rg "scale\\(|width:\\s*56|56%|56\\.3|--paper-rotator-ratio|--paper-original-width|--preview-aspect" app/globals.css app/workspace` | Aprobado; sin coincidencias. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Informacion faltante

- Falta validacion visual manual con PDF real para confirmar que pagina 3
  horizontal tenga `articleWidth` mayor al ancho de una pagina vertical y
  `paperWidth > paperHeight`.

## Limpieza

`AGENTS-000.md` queda completado y listo para archivo. Los demas agents no se
evaluaron ni ejecutaron por instruccion explicita del usuario.
# Ejecucion agents 000-001 - viewport rotado y altura exacta de preview

Fecha: 2026-06-01

## Alcance

Por instruccion del usuario se realizaron primero los commits pendientes y
despues se ejecutaron solamente los agents activos `AGENTS-000.md` y
`AGENTS-001.md`. Los demas agents fueron ignorados en esta ejecucion.

## Commits previos

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore`: `527d5e9` -
  `Improve DocuCore workspace preview layout`.
- `Docs`: `0fe1991` - `Document DocuCore workspace agent progress`.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/03_standards/frontend/nextjs-runtime-recovery-standard.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se corrigio el viewport de miniaturas rotadas para que `paper-mini`, `paper-viewport`, `paper-rotator` e imagen no recorten paginas en 90, 180 ni 270 grados. |
| `AGENTS-001.md` | Completado | Se mantuvo altura exacta por aspecto real para previews verticales y se agrego prueba para `639 x 1000 -> 170 x 266`. |

## Tareas ejecutadas

- Se elimino el padding interno de `.paper-mini` para que el viewport visible no
  sea menor que las variables calculadas.
- `.paper-mini` ahora fija `width`, `min-width`, `max-width`, `height`,
  `min-height` y `max-height` desde `--thumb-width` y
  `--thumb-preview-height`.
- `.paper-rotator` define dimensiones explicitas para paginas no rotadas y para
  paginas `is-quarter-rotated`.
- Las imagenes del preview usan `object-fit: contain` sin limites `max-width` o
  `max-height` que recorten al rotar.
- `--row-preview-height` se conserva para reservar y centrar filas, pero no se
  usa como altura directa de `.paper-mini`.
- Se agrego una prueba a `page-visual-box.test.ts` para asegurar que una pagina
  vertical `639 x 1000` con base `170px` renderice alto `266px`.
- Se actualizo la documentacion canonica de DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/page-visual-box.test.ts`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`
- `Docs/_archive/agents/2026-06-01-docucore-rotated-preview-viewport-height/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-01-docucore-rotated-preview-viewport-height/AGENTS-001.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| Pruebas `page-visual-box.test.ts` compiladas con `tsc` y ejecutadas con `node --test` | Aprobado; 7 pruebas pasaron. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| `rg "scale\\(|width:\\s*56|56%|56\\.3|--paper-rotator-ratio|--paper-original-width|--preview-aspect" app/globals.css app/workspace` | Aprobado; sin coincidencias. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` | Primero detecto CSS 404 por cache/runtime viejo. |
| `Start-NextLocalWeb.ps1 -Project docucore -CleanCache` | Aprobado; limpio `.next`, reinicio solo DocuCore y dejo el puerto `3004` activo. |
| `Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local` | Aprobado; CSS disponible. |
| `Invoke-WebRequest http://localhost:3004/workspace` | Aprobado; HTTP 200. |
| `git diff --check` en `Docs` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Informacion faltante

- Falta validacion visual manual con PDF real para confirmar que `imgBox` queda
  dentro de `.paper-viewport` en 90, 180 y 270 grados.
- Falta prueba visual automatizada con navegador que mida miniaturas mixtas
  verticales/horizontales en una fila real.
- El runtime local puede conservar referencias viejas a CSS despues de cambios;
  cuando vuelva a ocurrir, aplicar el protocolo documentado en
  `Docs/03_standards/frontend/nextjs-runtime-recovery-standard.md`.

## Limpieza

`AGENTS-000.md` y `AGENTS-001.md` quedan archivados al completarse. Los demas
agents no fueron evaluados ni ejecutados en esta corrida.

---
# Ejecucion agents activos - gate MVP de vistas y herramientas DocuCore

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos en orden numerico. La prioridad tecnica fue
aplicar el componente de visibilidad documentado para bloquear lo que no se
trabajara en el MVP: OCR, indexacion documental, IA, firma, integraciones,
workflows OCR y acciones avanzadas sin backend real.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`
- `Docs/agents/AGENTS-005.md`
- `Docs/agents/AGENTS-006.md`
- `Docs/agents/AGENTS-008.md`
- `Docs/agents/AGENTS-009.md`
- `Docs/agents/AGENTS-010.md`
- `Docs/agents/AGENTS-011.md`
- `Docs/agents/AGENTS-012.md`
- `Docs/agents/AGENTS-013.md`
- `Docs/agents/AGENTS-014.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se aplico estrategia MVP: OCR, indexacion e IA quedan aplazadas, visibles solo como proximamente y bloqueadas como accion ejecutable. |
| `AGENTS-001.md` | Completado | Se ajusto espaciado, centrado de detalles, gap de fila y separacion de zonas de insercion en miniaturas del workspace. |
| `AGENTS-002.md` - `AGENTS-004.md` | Sin instrucciones | Archivos vacios. |
| `AGENTS-005.md` | Bloqueado / Pendiente | OCR avanzado requiere motores y contratos backend reales; queda fuera del MVP actual. |
| `AGENTS-006.md` | Bloqueado / Pendiente | Acciones futuras que requieren firma, OCR, traduccion, marca de agua o escritura real de PDF quedan bloqueadas por gate. |
| `AGENTS-007.md` | Sin instrucciones | Archivo vacio. |
| `AGENTS-008.md` - `AGENTS-014.md` | Bloqueados / Pendientes | Secciones avanzadas, colores, papelera, seleccion, marcadores e inteligencia automatica se documentan como trabajo pendiente cuando dependan de backend, persistencia, OCR o exportacion real. |
| `AGENTS-015.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Tareas ejecutadas

- Se creo `WEB.NJ.NEXT.DocuCore/lib/feature-gates.ts` como gate central para
  herramientas, vistas y acciones aplazadas.
- La navegacion global ahora solo incluye features publicas `released` o `mvp`.
- `/workspace` deja de aparecer como acceso directo global; se abre desde el
  flujo de `/upload` cuando corresponde.
- OCR, indices, IA, expedientes, workflows OCR, integraciones cloud y API keys
  quedan fuera de ejecucion MVP.
- `/upload` usa el gate central para filtrar herramientas compatibles
  ejecutables.
- El dashboard conserva tarjetas aplazadas como `Proximamente`, sin enlace a
  ejecucion.
- El drawer de herramientas del workspace excluye OCR, firma, indice y
  extraccion de imagenes.
- El menu de pagina excluye acciones futuras como OCR, firma, marca de agua,
  numeracion, traduccion y extraccion de imagenes.
- La insercion externa de PDF/imagen queda deshabilitada como `Proximamente`.
- Se ajusto CSS del workspace para padding uniforme, detalles centrados,
  mayor separacion entre tarjetas y zonas de insercion fuera del contenido.
- Se actualizaron los documentos canonicos de DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/feature-gates.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/feature-availability.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/catalog-fallback.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/layout.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `git diff --check` en `Docs` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Informacion faltante

- No existe aun contrato productivo de JobCron/FeatureAvailability con permisos
  por usuario, ambiente y pais.
- No existe backend real para OCR avanzado, indexacion, IA documental, firma,
  marca de agua, traduccion, bookmarks reales, exportacion por secciones ni
  persistencia avanzada.
- Falta prueba automatizada que verifique que herramientas aplazadas no abren
  `/upload`, `/workspace` ni jobs.

## Limpieza

Los agents completados y bloqueados por alcance MVP quedan archivados en
`Docs/_archive/agents/2026-06-01-docucore-mvp-feature-gates/`. Los archivos
activos correspondientes quedan vacios para no repetir trabajo ya documentado.

---
# Ejecucion agents activos - cierre duplicado de espaciado workspace

Fecha: 2026-06-01

## Alcance

Se revisaron los agents activos en orden numerico. Solo `AGENTS-000.md` tenia
contenido. Su instruccion corresponde al ajuste visual final de espaciado,
centrado de detalles y distribucion adaptativa de previews, ya implementado y
documentado en la ejecucion anterior.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado / duplicado | Ya estaba implementado: `.pdf-thumb` tiene padding uniforme, `.thumb-select` usa grid centrado, `.page-grid` usa `gap: 26px var(--page-gap)` con `--page-gap: 28px`, `.paper-mini` centra con `margin-inline: auto` y las zonas de insercion quedan separadas con `right: -18px`. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios. |

## Tareas ejecutadas

- Se verifico que el CSS actual cumple el agent sin requerir cambios nuevos.
- Se archivo `AGENTS-000.md` para no repetir una tarea ya cerrada.
- Se mantuvieron intactos los cambios existentes del gate MVP y del workspace.

## Archivos modificados

- `Docs/agents/AGENTS-000.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/_archive/agents/2026-06-01-docucore-preview-spacing-duplicate/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `git diff --check` en `Docs` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |

## Informacion faltante

- No hay informacion faltante para este agent. La validacion visual manual con
  PDF real sigue recomendada como QA futuro, no como bloqueo de implementacion.

## Limpieza

`AGENTS-000.md` queda archivado como duplicado completado en
`Docs/_archive/agents/2026-06-01-docucore-preview-spacing-duplicate/`.

---
# Ejecucion agents activos - proyectos documentales en Upload DocuCore

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md`, `AGENTS-001.md` y
`AGENTS-002.md`. El objetivo fue corregir la pantalla `/upload`, que estaba
mostrando documentos/borradores repetidos como filas planas, y establecer la
relacion correcta entre proyectos documentales, documentos, workspace y jobs.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/database.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/jobcron/feature-availability.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`
- `Docs/agents/AGENTS-002.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | `/upload` ahora muestra proyectos documentales recientes con documentos internos, estado, paso actual, accion pendiente y acciones de proyecto. |
| `AGENTS-001.md` | Completado | Se aplico la explicacion conceptual: Upload muestra proyectos/documentos; Jobs queda como historial de ejecuciones y resultados. |
| `AGENTS-002.md` | Completado parcial | Se adopto la recomendacion MVP: `Project -> Documents -> Workspace -> History/Results`; Jobs queda documentado para ejecuciones reales y backend futuro. |
| `AGENTS-003.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios, sin tarea ejecutable. |

## Tareas ejecutadas

- Se amplio `WorkspaceDraftSummary` con `status`, `currentStep`,
  `documentCount` y `documents`.
- El workspace guarda esos campos al persistir un borrador local.
- `/upload` normaliza borradores antiguos como proyectos de un documento para
  no romper recuperacion local.
- La seccion `Continuar trabajo anterior` cambia a `Continuar trabajos
  anteriores` y muestra tarjetas de proyecto documental.
- Cada tarjeta muestra nombre, estado, paso, documentos, paginas, accion,
  fecha de actualizacion y documentos internos.
- Las acciones Abrir/Continuar, Duplicar, Renombrar y Eliminar operan sobre el
  proyecto/borrador.
- Se documentaron contratos API objetivo para `Document Projects`.
- Se documento el modelo de datos futuro para proyectos, documentos, cambios y
  relacion con jobs.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace-drafts.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/database.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Decisiones tomadas

- Se implemento un MVP frontend/local usando borradores existentes en
  localStorage/IndexedDB, porque no existe contrato backend productivo de
  proyectos documentales.
- No se modifico `/jobs` en codigo: se mantiene como pantalla de ejecuciones
  reales consumidas desde Gateway.
- No se cambio la ruta `/workspace` a `/workspace/:projectId`; se documento
  como decision futura porque hoy el workspace usa query params y borradores
  locales.

## Informacion faltante

- Falta decidir si `DocumentProject` sera entidad de `DocuCore` API o si vivira
  parcialmente en `Document` API.
- Falta definir si eliminar proyecto sera archive o hard delete.
- Falta definir si duplicar proyecto duplica binarios o solo referencias.
- Falta relacion productiva `project_id` en jobs cuando existan ejecuciones
  multiarchivo o de larga duracion.

## Limpieza

`AGENTS-000.md`, `AGENTS-001.md` y `AGENTS-002.md` quedan archivados como
completados en:

```text
Docs/_archive/agents/2026-06-01-docucore-upload-projects-jobs/
```

Los agents `003` a `030` siguen sin instrucciones.

---

# Ejecucion agents activos - Workspace contextual DocuCore

Fecha: 2026-06-01

## Alcance

Se ejecutaron paso a paso los agents activos `AGENTS-000.md`,
`AGENTS-001.md`, `AGENTS-002.md` y `AGENTS-003.md`. El objetivo fue validar el
estado real de herramientas DocuCore, convertir el Workspace en una superficie
universal contextual por tipo de archivo y separar el modo documento del modo
archivo comprimido.

Los agents `AGENTS-004.md` a `AGENTS-030.md` fueron revisados y estan vacios,
por lo que no tienen tarea ejecutable.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/docucore/tools-catalog.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`
- `Docs/agents/AGENTS-002.md`
- `Docs/agents/AGENTS-003.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se valido el estado real de herramientas: 11 slugs activos por Gateway, OCR/IA/index y herramientas futuras siguen bloqueadas por feature gate. |
| `AGENTS-001.md` | Completado | Se adopto la decision de un Workspace universal con herramientas contextuales por tipo de archivo. |
| `AGENTS-002.md` | Completado | Se implemento mapa central de compatibilidad, detector de tipo, selector de herramientas y ejecucion centralizada contra Gateway. `/upload` y `/workspace` usan ahora reglas compartidas. |
| `AGENTS-003.md` | Completado | Se implemento `archive-mode` para ZIP/RAR. ZIP ejecuta `zip-extract`; RAR y acciones internas de archivo quedan documentadas y bloqueadas. |
| `AGENTS-004.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no aplican. |

## Tareas ejecutadas

- Se creo el mapa central `WORKSPACE_TOOL_RULES` con estados, tipos compatibles,
  salida esperada, keywords y razon de bloqueo.
- Se agrego detector de tipo documental para PDF, Word, imagen, Excel, CSV,
  XML, ZIP, RAR y desconocido.
- Se agrego selector de herramientas compatibles que respeta feature gates y
  evita mostrar herramientas futuras como ejecutables.
- Se separo `document-mode` de `archive-mode`.
- Se centralizo la ejecucion de herramientas con Gateway; no se simulan
  resultados locales.
- `/upload` ahora usa el detector/matriz compartida para sugerir herramientas
  compatibles.
- `/workspace` dejo de depender de una lista PDF hardcodeada y ahora muestra
  herramientas segun el tipo del archivo activo.
- El boton Aplicar en Workspace queda deshabilitado si la herramienta esta
  pendiente o no hay archivo local disponible.
- Los resultados del Workspace muestran estado real de ejecucion, error, job y
  descarga cuando Gateway entrega artefacto.
- Los tipos no-PDF abren preview contextual informativo sin fingir miniaturas
  reales.
- ZIP/RAR se tratan como contenedores y no reciben herramientas documentales
  directas.
- Se documentaron reglas, faltantes y decisiones en la documentacion canonica
  de DocuCore.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/upload/UploadClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/api.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/detect-file-type.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/execute-workspace-tool.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/get-compatible-tools.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/workspace-mode.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/lib/workspace/workspace-tool-compatibility.ts`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; build productivo generado y 20 rutas validadas. |
| `npm pkg get scripts.test` en `WEB.NJ.NEXT.DocuCore` | No existe script `test`; no se ejecutaron tests automatizados. |
| `git diff --check` en `WEB.NJ.NEXT.DocuCore` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `git diff --check -- 02_projects/docucore agents/EXECUTION_REPORT.md` en `Docs` | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Decisiones tomadas

- La fuente UI de compatibilidad queda en frontend mientras el catalogo backend
  no entregue una matriz completa por tipo documental.
- El Workspace no promete preview real no-PDF; muestra contexto y deja el visor
  especializado como pendiente.
- `zip-extract` es la unica accion ZIP ejecutable en esta fase.
- RAR queda documentado en `archive-mode`, pero bloqueado hasta tener
  procesador real.
- Las acciones internas de archivo comprimido quedan como roadmap documentado,
  no como funcionalidad ejecutable.

## Informacion faltante

- Falta contrato backend productivo para proyecto/documento multiarchivo.
- Falta endpoint de preview por tipo documental para Word, imagen avanzada,
  Excel, CSV, XML, ZIP y RAR.
- Falta confirmar limites de tamano, memoria, timeout y numero de archivos por
  herramienta.
- Falta emision real de eventos hacia `ExecutionResourceManager`.
- Falta procesador RAR productivo.
- Falta contrato para listar, descargar entradas, agregar, eliminar y
  recomprimir archivos dentro de ZIP/RAR.

## Riesgos

- `pdf-merge` sigue limitado por contrato multiarchivo; ejecutar desde Workspace
  sobre un solo archivo no sustituye la union real de varios documentos.
- Los previews no-PDF son informativos hasta que exista visor real.
- Si Gateway cambia slugs o salidas, se debe actualizar el mapa central para no
  desincronizar la UI.

## Limpieza

`AGENTS-000.md`, `AGENTS-001.md`, `AGENTS-002.md` y `AGENTS-003.md` quedan
completados y se archivan en:

```text
Docs/_archive/agents/2026-06-01-docucore-contextual-workspace/
```

Los agents `004` a `030` permanecen vacios y sin tarea ejecutable.

---

# Ejecucion agents activos - bloques documentales Workspace DocuCore

Fecha: 2026-06-01

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-001.md`. El objetivo
fue mejorar el Workspace de DocuCore para identificar visualmente bloques
documentales, separadores, colores y agrupaciones adaptativas al trabajar con
PDFs grandes o cortes documentales.

Tambien se estandarizo la limpieza de agents: los archivos originales
`Docs/agents/AGENTS-*.md` no se eliminan ni se mueven; se copia su contenido al
historico y se vacia el archivo original.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/03_standards/operations/agents-documentation-order.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se implemento MVP visual de bloques documentales: separadores automaticos, cierre de bloque, color por bloque, rail/etiqueta por pagina, acciones de fusion, renombrado, color, fijado y unificacion. |
| `AGENTS-001.md` | Completado | Se implemento modo adaptativo de agrupacion: expandido para pocos bloques, compacto para 5 o mas, fijado individual y mini mapa de colores para navegacion rapida. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no aplican. |

## Tareas ejecutadas

- Se extendio el modelo local de secciones con `pinned` y `description`.
- Se agregaron separadores visuales al inicio de cada bloque documental.
- Los separadores intermedios usan color del bloque anterior y del bloque que
  inicia.
- Se agrego separador final para indicar cierre del ultimo bloque.
- Cada pagina muestra rail/etiqueta de bloque con color, nombre y contador.
- Con 5 o mas bloques, los rails y separadores se compactan para reducir
  saturacion visual.
- Los bloques fijados mantienen informacion visible aunque el modo sea
  compacto.
- Se agrego mini mapa de colores para saltar al bloque correspondiente.
- Se agregaron acciones locales: renombrar, cambiar color, fijar/soltar,
  fusionar con anterior y convertir todo en un documento.
- Se documento el sistema visual de bloques en la documentacion canonica de
  DocuCore.
- Se actualizo el estandar de limpieza de agents para conservar placeholders.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/03_standards/operations/agents-documentation-order.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; 20 rutas generadas. |
| `git diff --check -- app/workspace/WorkspaceClient.tsx app/globals.css` | Aprobado; solo avisos LF/CRLF de Git en Windows. |
| `git diff --check` en documentos tocados | Aprobado; solo avisos LF/CRLF de Git en Windows. |

## Decisiones tomadas

- Se uso el sistema existente de `sections` como base de bloques documentales
  para no crear un estado paralelo ni romper borradores.
- La exportacion por bloque queda como estado visual/local; no se prometen
  artefactos independientes hasta tener contrato backend multiarchivo.
- La insercion manual de separadores se apoya en las zonas de insercion
  existentes y la accion `Dividir desde aqui`.
- Se conserva trazabilidad de agents copiando contenido a `_archive`, pero los
  archivos originales permanecen vacios.

## Informacion faltante

- Falta contrato backend para exportar cada bloque como archivo independiente.
- Falta modelo productivo `DocumentProject` para multiples documentos reales en
  un workspace compartido.
- Falta reemplazar prompts nativos de navegador por modal propio para
  renombrado si se requiere UX final pulida.

## Limpieza

`AGENTS-000.md` y `AGENTS-001.md` se copian a:

```text
Docs/_archive/agents/2026-06-01-docucore-document-blocks/
```

Despues de copiarse, los archivos originales se conservan en `Docs/agents/`
pero quedan vacios.

---

# Ejecucion agents activos - DocuCore Observability and Diagnostics

Fecha: 2026-06-04

## Alcance

Se ejecuto el unico agent activo con contenido: `AGENTS-000.md`. Los agents
`AGENTS-001.md` a `AGENTS-030.md` estan vacios y se consideran sin
instrucciones ejecutables.

El objetivo fue crear el estandar canonico de observabilidad y diagnostico de
DocuCore sin modificar funcionalidad de Web, Gateway, APIs ni Docker.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/03_standards/operations/observability.md`
- `Docs/01_core_erp/erp/24_execution_resource_manager.md`
- `Docs/01_core_erp/apis/16_execution_resource_manager_api.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/error-handling.md`
- `Docs/02_projects/docucore/execution-policy.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/agents/AGENTS-000.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se creo el estandar canonico `observability-and-diagnostics.md` para logs, errores, diagnostico, metricas, issues, alertas, retencion y limpieza operativa de DocuCore. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no aplican en esta corrida. |

## Tareas ejecutadas

- Se documento la arquitectura observable de DocuCore entre Web, Gateway, APIs,
  motores documentales, storage, jobs y descargas.
- Se definieron identificadores obligatorios: `request_id`, `session_id`,
  `project_id`, `document_id`, `job_id`, `issue_id`, `trace_id` y
  `execution_id`.
- Se normalizaron tipos de eventos, niveles, etapas, flujo PDF minimo y estados
  de preview.
- Se definieron tablas objetivo `docucore_logs` y `docucore_errors`.
- Se agrego regla de `fingerprint` para agrupar errores sin exponer datos
  sensibles.
- Se creo catalogo inicial de codigos de error para PDF, Word, Excel/CSV,
  imagen, ZIP/XML y motores futuros.
- Se documentaron prioridades, reglas para crear issues, vista de diagnostico,
  retencion, limpieza programada, metricas minimas e integracion con JobCron.
- Se enlazo el nuevo estandar desde README, manejo de errores, politica de
  ejecucion, estado de herramientas e indices documentales.

## Archivos modificados

- `Docs/02_projects/docucore/observability-and-diagnostics.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/error-handling.md`
- `Docs/02_projects/docucore/execution-policy.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `rg -n "observability-and-diagnostics\|DocuCore Observability\|PDF_RENDER_FAILED\|job_cleanup_docucore_logs" Docs` | Aprobado; se confirmaron referencias en documento canonico, README, documentos relacionados e indices. |
| `Test-Path Docs/02_projects/docucore/observability-and-diagnostics.md` | Aprobado. |
| Build/Lint/Test de Web o APIs | No ejecutado; la corrida solo modifico documentacion y metadatos documentales. |

## Decisiones tomadas

- Se creo un documento canonico especifico de DocuCore en lugar de modificar el
  estandar global de observabilidad, porque el agent pide reglas operativas
  propias del producto documental.
- OCR, IA documental e indexacion inteligente quedan como motores futuros o
  bloqueados cuando no exista backend productivo habilitado, para respetar el
  alcance actual de herramientas visibles.
- `request_id` se permite como `REQ-YYYYMMDD-000001` o UUID cuando ya exista
  trazabilidad tecnica, evitando contradiccion con contratos ERP existentes.
- No se implementaron tablas, jobs ni dashboards porque el agent no incluia
  criterios tecnicos suficientes para tocar APIs productivas.

## Informacion faltante

- Falta definir en que repositorio se implementaran primero `docucore_logs` y
  `docucore_errors`.
- Falta modelo fisico de base de datos, migraciones y permisos de diagnostico.
- Falta contrato backend de la vista `Workspace -> Diagnostico`.
- Falta decidir si `job_cleanup_docucore_logs` vive en JobCron, Document API o
  una API operativa compartida.

## Limpieza

`AGENTS-000.md` se copia a:

```text
Docs/_archive/agents/2026-06-04-docucore-observability-diagnostics/
```

Despues de copiarse, el archivo original se conserva en `Docs/agents/` pero
queda vacio. Los agents vacios `001` a `030` se dejan sin cambios.

---

# Ejecucion agents activos - Diagnostico carga PDF DocuCore

Fecha: 2026-06-04

## Alcance

Se solicito ejecutar agents activos y explicar por que no cargaban debidamente
los PDFs en DocuCore. Al revisar `Docs/agents/AGENTS-*.md`, todos los archivos
estan vacios, por lo que no habia tareas ejecutables de agent.

Se realizo diagnostico directo con base en la documentacion canonica de
DocuCore y el estado runtime del contenedor.

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/observability-and-diagnostics.md`
- `Docs/02_projects/docucore/error-handling.md`

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tarea ejecutable. |

## Diagnostico detectado

La documentacion de `api-contracts.md` indica que el preview backend por pagina
sigue siendo objetivo pendiente y que el frontend usa un puente MVP con PDF.js
y `objectUrl` en `sessionStorage`.

En runtime se encontro que el contenedor `web-frontend-node` no tenia
`pdfjs-dist` instalado dentro de `/usr/src/web/docucore/node_modules`, aunque
el `package.json` del proyecto si declara la dependencia. Esto ocurrio porque
el compose usa un volumen anonimo para `node_modules`; cuando cambia
`package.json`, el volumen puede conservar dependencias antiguas o incompletas.

El log de Next mostraba:

```text
Module not found: Can't resolve 'pdfjs-dist'
Module not found: Can't resolve 'pdfjs-dist/build/pdf.worker.mjs'
```

Impacto:

- `/workspace` no podia compilar correctamente el modulo que genera miniaturas
  reales.
- El puente MVP de PDF.js fallaba antes de leer/renderizar el archivo.
- El error corresponde a `PDF_PREVIEW_FAILED` o `PDF_RENDER_FAILED` segun la
  etapa documentada en `observability-and-diagnostics.md`.

## Accion aplicada

Se sincronizaron dependencias dentro del contenedor activo:

```text
docker exec web-frontend-node sh -lc "cd /usr/src/web/docucore && npm install --no-audit --no-fund"
docker restart web-frontend-node
```

## Validaciones

| Validacion | Resultado |
|---|---|
| `docker exec web-frontend-node sh -lc "cd /usr/src/web/docucore && npm ls pdfjs-dist --depth=0"` | Aprobado; `pdfjs-dist@4.10.38` instalado. |
| `Invoke-WebRequest http://127.0.0.1:3004/workspace` | Aprobado; status `200`. |
| `docker logs web-frontend-node --since 30s` | Aprobado; `/workspace` compilo y respondio sin repetir el error de modulo faltante en logs nuevos. |

## Decisiones tomadas

- No se modifico codigo porque la causa inmediata fue desincronizacion de
  dependencias dentro del contenedor runtime.
- Se dejo identificado que el contrato backend definitivo de previews por
  pagina sigue pendiente; mientras tanto, el frontend depende de PDF.js local.

## Informacion faltante

- Falta un protocolo automatizado para reinstalar dependencias del contenedor
  cuando cambia `package.json` o `package-lock.json` y existe volumen anonimo de
  `node_modules`.
- Falta implementar el endpoint backend definitivo:
  `GET /api/gateway/files/{file_id}/pages/{page}/preview/`.

---

# Ejecucion agents activos - Arquitectura visual Workspace DocuCore

Fecha: 2026-06-05

## Alcance

Se ejecutaron los agents activos `AGENTS-000.md` y `AGENTS-001.md`. Los agents
`AGENTS-002.md` a `AGENTS-030.md` estaban vacios y no contenian instrucciones
ejecutables.

Antes de implementar se hicieron commits de los cambios previos en los
repositorios afectados para dejar una base limpia de trabajo.

## Orden de ejecucion

| Orden | Agent | Motivo |
|---|---|---|
| 1 | `AGENTS-000.md` | Define la arquitectura visual y jerarquia del Workspace. |
| 2 | `AGENTS-001.md` | Propone la estructura de codigo basada en herramientas, documento y configuracion. |

## Documentos revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/02_projects/docucore/feature-visibility-map.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/03_standards/frontend/nextjs-runtime-recovery-standard.md`

## Tareas ejecutadas

- Se separo el Workspace en tres zonas operativas:
  herramientas a la izquierda, preview central y configuracion a la derecha.
- Se agrego una cabecera compacta con documento activo, paginas, bloques,
  previews listas y estado operativo.
- Se movieron las herramientas compatibles al rail izquierdo del Workspace.
- Se dejo la configuracion de herramienta activa como panel derecho persistente.
- Se redujo la barra inferior a accesos secundarios y accion de aplicar,
  evitando duplicar herramientas y configuracion.
- Se mantuvieron los drawers existentes para documento, estado, bloques,
  seleccion, archivos, informacion y resultado.
- Se documento la nueva regla canonica en
  `Docs/02_projects/docucore/frontend-navigation-and-ux.md`.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores ESLint. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; Next.js compilo, valido tipos y genero rutas. |
| Script de test dedicado | No existe script `test` en `package.json`; `build` cubrio typecheck de Next. |

## Decisiones tomadas

- `AGENTS-000.md` se ejecuto primero porque contiene la decision de arquitectura
  visual; `AGENTS-001.md` se uso despues como guia de implementacion.
- No se reemplazo todo el Workspace por la maqueta del agent; se adapto la
  estructura sobre el componente real para no perder preview PDF, drawers,
  seleccion, bloques ni ejecucion Gateway ya existentes.
- No se modificaron APIs ni contratos backend porque el alcance era de
  interfaz y procesos visuales del Workspace.
- Las herramientas no ejecutables siguen gobernadas por `feature-gates.ts` y
  por `workspace-tool-compatibility.ts`.

## Informacion faltante

- Falta prueba visual automatizada desktop/mobile para verificar que rail,
  panel derecho, cabecera compacta y barra inferior no se solapan.
- Falta definir comportamiento completo de configuracion colapsada en mobile
  para herramientas complejas.
- Falta contrato backend productivo de proyectos documentales multiarchivo para
  que algunas configuraciones de herramientas puedan persistirse remotamente.

## Resultado por agent

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Jerarquia visual del Workspace aplicada y documentada. |
| `AGENTS-001.md` | Completado parcial | Estructura herramientas/documento/configuracion aplicada sobre codigo real; la maqueta completa queda adaptada, no copiada literalmente. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Limpieza

`AGENTS-000.md` y `AGENTS-001.md` se copian al historico de agents completados
y los archivos originales se conservan en `Docs/agents/` vacios. Los agents
vacios `002` a `030` se dejan sin cambios.

---

# Ejecucion Agents DocuCore - 2026-06-05 - Workspace multi-documento y Dividir PDF simple

## Alcance

Se ejecuto solo `Docs/agents/AGENTS-000.md`. Los archivos `AGENTS-001.md` a
`AGENTS-030.md` estaban vacios, por lo que no contenian tareas ejecutables.

## Documentacion revisada

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/02_projects/docucore/observability-and-diagnostics.md`
- `Docs/02_projects/docucore/supported-file-types.md`

## Agent ejecutado

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Ajustes de Workspace multi-documento, panel ocultable, zoom de previews y simplificacion de Dividir PDF implementados y documentados. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Tareas detectadas

- Permitir varios documentos en un mismo proyecto local sin reemplazar el
  primero.
- Mostrar selector de documentos y renderizar solo el documento activo.
- Agregar archivos desde Workspace sin crear automaticamente otro proyecto.
- Registrar cada documento agregado con `requestId`.
- Hacer ocultable y recuperable el panel derecho de configuracion.
- Agregar zoom de previews entre 60% y 180%.
- Simplificar el panel de `Dividir PDF`.
- Quitar eventos internos, logs, portapapeles y bloques visuales del panel de
  usuario.
- Evitar scroll horizontal en el panel derecho.
- Documentar decisiones, faltantes y validaciones.

## Tareas ejecutadas

- `WorkspaceClient.tsx` ahora mantiene selector visual cuando existen dos o mas
  documentos en el proyecto.
- Se agrego input oculto para sumar archivos al proyecto abierto desde el drawer
  de Archivos.
- Cada archivo agregado recibe `documentId`, se guarda con `saveWorkspaceFile`
  y registra evento tecnico `docucore_workspace_document_added` con
  `requestId` en consola.
- El documento activo se conserva en `sessionStorage` y el cambio de documento
  recarga `/workspace` con `documentId` correspondiente.
- El panel derecho de configuracion puede ocultarse y recuperarse con boton
  visible; su estado se persiste en `localStorage`.
- El area central se expande cuando el panel de configuracion esta oculto.
- Se agrego control de zoom para miniaturas con botones, slider, porcentaje y
  reset; el zoom se persiste en `localStorage`.
- Se simplifico `Dividir PDF` a cuatro opciones de usuario: rango, paginas
  seleccionadas, cada pagina y cada N paginas.
- Se retiro el bloque de eventos esperados del panel de usuario.
- Se actualizo la documentacion canonica de Workspace y readiness de
  herramientas.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-05-docucore-workspace-multidoc-simple-tools/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores ESLint. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; Next.js compilo, valido tipos y genero rutas. |
| Script de test dedicado | No existe script `test` en `package.json`; `build` cubrio typecheck de Next. |

## Decisiones tomadas

- El soporte multi-documento queda local en frontend hasta tener contrato
  productivo de proyecto documental en backend.
- Los logs de archivo agregado se registran en consola tecnica con `requestId`;
  Observability remoto queda pendiente de contrato.
- El selector cambia el documento activo mediante `documentId` en la URL y
  `sessionStorage` para reutilizar el cargador existente de previews sin
  duplicar logica PDF.
- Los bloques visuales siguen existiendo como soporte interno/drawers del
  Workspace, pero ya no aparecen en el panel simple de `Dividir PDF`.
- Los eventos internos de herramienta se conservan como configuracion tecnica,
  pero no se renderizan en la UI de usuario final.

## Informacion faltante

- Falta contrato backend para persistir proyectos documentales multiarchivo.
- Falta endpoint de log/observability para registrar `requestId` de cada archivo
  fuera de consola del navegador.
- Falta prueba visual automatizada desktop/mobile para selector
  multi-documento, panel oculto/visible, zoom y ausencia de scroll horizontal.
- Falta validar manualmente con dos PDF reales en navegador que ambos se
  agregan al mismo proyecto y pueden alternarse desde el selector.

## Limpieza

`AGENTS-000.md` se archivo en
`Docs/_archive/agents/2026-06-05-docucore-workspace-multidoc-simple-tools/` y
el archivo original se conserva vacio en `Docs/agents/`. Los demas agentes se
dejaron sin cambios porque ya estaban vacios.

---

# Ejecucion Agents DocuCore - 2026-06-05 - Workspace layout aislado

## Alcance

Se ejecutaron `Docs/agents/AGENTS-000.md` y `Docs/agents/AGENTS-001.md` en
orden numerico. Ambos trataban el mismo problema: aislar el layout del
Workspace para evitar encimamientos entre topbar global, header documental,
herramientas, zoom y configuracion.

`AGENTS-002.md` a `AGENTS-030.md` estaban vacios y quedaron como sin
instrucciones.

## Documentacion revisada

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`

## Agents ejecutados

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se aplico aislamiento de layout del Workspace: header documental dentro del Workspace, body en grid y estilos scoped bajo `.shell-workspace`/`workspace-*`. |
| `AGENTS-001.md` | Completado | Se adapto la maqueta propuesta al componente real sin reemplazar la logica existente de PDF, documentos, herramientas ni jobs. |
| `AGENTS-002.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Tareas ejecutadas

- Se reestructuro `WorkspaceClient.tsx` para envolver herramientas, documento y
  configuracion dentro de `workspace-body`.
- Se mantuvo `workspace-status-header` dentro de `workspace-root`.
- Se agregaron pestañas laterales dentro del area documental para
  configuracion y zoom.
- El zoom dejo de ser toolbar permanente y ahora aparece como popover temporal.
- El panel derecho se comporta como columna real cuando esta visible y deja
  expandir el documento cuando se oculta.
- Se agregaron reglas CSS scoped bajo `.shell-workspace` para no afectar otras
  rutas.
- Se compactaron separadores de bloque y sus acciones secundarias quedan
  visibles solo en hover/foco.
- Se documento el nuevo estandar en
  `Docs/02_projects/docucore/frontend-navigation-and-ux.md`.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/globals.css`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/agents/AGENTS-001.md`
- `Docs/_archive/agents/2026-06-05-docucore-workspace-isolated-layout/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-05-docucore-workspace-isolated-layout/AGENTS-001.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores ESLint. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; Next.js compilo, valido tipos y genero rutas. |
| Script de test dedicado | No existe script `test` en `package.json`; `build` cubrio typecheck de Next. |

## Decisiones tomadas

- No se copio la maqueta del agent de forma literal; se adapto al componente
  real para conservar carga de PDFs, seleccion, documentos multiples, drawers,
  ejecucion Gateway y configuracion simple ya implementada.
- No se modificaron estilos globales de `topbar`, `sidebar`, `app-content`,
  `main`, `header`, `aside`, `button`, `section` o `article` fuera de reglas
  scoped del Workspace.
- Se conservaron clases historicas como `canvas-workspace` para no romper
  componentes existentes, pero el nuevo layout queda gobernado por
  `workspace-root` y `workspace-body`.

## Informacion faltante

- Falta prueba visual automatizada desktop/mobile con capturas reales de
  `/workspace`.
- Falta validacion manual con PDF real para confirmar que no hay encimamiento
  en navegador despues de reiniciar el contenedor.

## Limpieza

`AGENTS-000.md` y `AGENTS-001.md` se copiaron al historico:

`Docs/_archive/agents/2026-06-05-docucore-workspace-isolated-layout/`

Los archivos originales se conservaron en `Docs/agents/` vacios. Los demas
agents quedaron sin cambios por estar vacios.

---

# Ejecucion Agents DocuCore - 2026-06-05 - Metadata real y reflow de zoom

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md`. Los archivos `AGENTS-001.md` a
`AGENTS-030.md` estaban vacios y quedaron como sin instrucciones.

## Documentacion revisada

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/docucore/README.md`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/02_projects/docucore/tool-readiness-and-configuration.md`

## Agent ejecutado

| Agent | Estado | Resultado |
|---|---|---|
| `AGENTS-000.md` | Completado | Se ajusto el Workspace para recalcular zoom, scroll, separadores e inserciones desde metadata real de pagina PDF. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Tareas detectadas

- Recalcular layout completo al cambiar zoom.
- Evitar scroll fantasma por medidas viejas de filas.
- Detectar tamano real de pagina por metadata PDF.
- Identificar `LETTER`, `LEGAL`, `A4` y `CUSTOM` con tolerancia.
- Mantener escala visual coherente sin deformar previews.
- Recalcular separadores e inserciones con base en paginas visibles.
- Mantener visibles etiquetas y zonas de insercion.

## Tareas ejecutadas

- `previewGridStyle` ahora recibe las paginas visibles y calcula slot,
  separadores y gaps desde dimensiones reales de PDF.
- `pageLayoutStyle` expone variables de metadata (`--page-width-points`,
  `--page-height-points`, `--page-aspect-inverse`, `--zoom-scale`) ademas de
  las dimensiones visuales usadas por la preview.
- `detectPageSizeName` usa tolerancia de 12 puntos y normaliza a `LETTER`,
  `LEGAL`, `A4` o `CUSTOM`.
- Se agrego recalculo diferido de grid con limpieza previa de
  `--row-preview-height` y `--next-channel-width`.
- Se agrego `ResizeObserver` para volver a medir el grid cuando cambia su
  tamano real.
- Las guias de insercion se miden por fila real con `getBoundingClientRect`.
- El scroll del area PDF se limita al nuevo tamano disponible despues del
  recalculo.
- La resolucion interna de render PDF.js subio para soportar mejor zoom alto.
- Se documento la regla canonica en
  `Docs/02_projects/docucore/frontend-navigation-and-ux.md`.

## Archivos modificados

- `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore/app/workspace/WorkspaceClient.tsx`
- `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-05-docucore-metadata-zoom-reflow/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
|---|---|
| `npm run lint` en `WEB.NJ.NEXT.DocuCore` | Aprobado; sin warnings ni errores ESLint. |
| `npm run build` en `WEB.NJ.NEXT.DocuCore` | Aprobado; Next.js compilo, valido tipos y genero rutas. |

## Decisiones tomadas

- Se conservaron las reglas ya estabilizadas de zoom tipo Word 10%-500% y el
  esquema de tabs/sidebar/tools existente.
- No se cambio el motor de preview ni el contrato Gateway; el ajuste queda en
  layout, metadata y render PDF.js del frontend.
- Se uso metadata de PDF.js (`getViewport({ scale: 1 })`) como fuente de
  verdad para ancho, alto, orientacion y tamano de papel.
- No se modifico funcionalidad fuera del Workspace.

## Informacion faltante

- Falta prueba visual automatizada que recorra 10%, 100%, 300% y 500% con PDF
  mixto vertical/horizontal.
- Falta validacion manual en navegador con documentos reales para confirmar
  que no quedan guias ocultas ni scroll fantasma al cambiar zoom rapidamente.
- Falta contrato backend para persistir metadata por pagina si se requiere
  compartir el mismo proyecto documental entre sesiones o usuarios.

## Limpieza

`AGENTS-000.md` se copio al historico
`Docs/_archive/agents/2026-06-05-docucore-metadata-zoom-reflow/` y el archivo
original se conserva vacio en `Docs/agents/`. Los demas agents se dejaron sin
cambios por estar vacios.

---
# 2026-06-07 - LeadHunter Active Agents Execution

## Agents Ejecutados

1. `AGENTS-000.md`
   - Estado: completado y archivado en `Docs/_archive/agents/2026-06-07-leadhunter/AGENTS-000.md`.
   - Resultado: se aplicaron reglas backend/frontend, variables de entorno, validacion, documentacion y evidencia de ejecucion.

2. `AGENTS-001.md`
   - Estado: completado y archivado en `Docs/_archive/agents/2026-06-07-leadhunter/AGENTS-001.md`.
   - Resultado: se implemento el MVP LeadHunter con API, Gateway, Web, PostgreSQL-ready models, Apify client, sample mode, scoring, filtros y exportaciones.

## Puntos Cumplidos

1. Se definio el producto independiente `LeadHunter`.
2. Se creo `Docker.API.PY/API.PY.DJANGO.LeadHunter`.
3. Se creo `Docker.API.PY/API.PY.DJANGO.LeadHunter.Gateway`.
4. Se creo `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter`.
5. Se definieron categorias de alto valor: transporte pesado, maquinaria pesada, autos premium, off-road, industria/negocio y tecnologia premium.
6. Se implemento busqueda dinamica por latitud, longitud, radio, pais, estado, ciudad y direccion.
7. Se implemento cliente Apify Google Maps Scraper con `APIFY_TOKEN`, `APIFY_ACTOR_ID` y `LEADHUNTER_USE_SAMPLE_DATA`.
8. Se implemento persistencia de `ProspectSearches` y `BusinessProspects`.
9. Se implemento scoring comercial.
10. Se implementaron filtros sin telefono, sin website, reviews y score.
11. Se implemento export CSV por Gateway y XLS desde Web.
12. Se dejo Docker enfocado por defecto en `auth leadhunter_gateway leadhunter` y Web en `leadhunter`.
13. Se documentaron modulos ERP vs independientes.
14. Se actualizaron indices documentales, catalogo de modulos y registro de puertos.
15. Se inicializaron repos Git locales independientes para `API.PY.DJANGO.LeadHunter`, `API.PY.DJANGO.LeadHunter.Gateway` y `WEB.NJ.NEXT.LeadHunter`.

## Clasificacion ERP vs Independiente

| Modulo/API | Clasificacion | Estado |
| --- | --- | --- |
| `WEB.NJ.NEXT.LeadHunter` | Independiente | Implementado |
| `API.PY.DJANGO.LeadHunter.Gateway` | Independiente | Implementado |
| `API.PY.DJANGO.LeadHunter` | Independiente | Implementado |
| Apify Google Maps integration | Independiente LeadHunter | Implementado |
| Prospect scoring | Independiente LeadHunter | Implementado |
| `API.PY.DJANGO.Auth` | ERP/Core | Dependencia por Gateway |
| CRM/Customers | ERP futuro | Pendiente |
| Sales opportunities | ERP futuro | Pendiente |
| Notifications | Core futuro | Pendiente |
| Job scheduler async searches | Core/Shared futuro | Pendiente |

## Validaciones

| Validacion | Resultado |
| --- | --- |
| `python manage.py check` LeadHunter API | OK |
| `python manage.py check` LeadHunter Gateway | OK |
| `python -m compileall` API/Gateway | OK |
| `python manage.py makemigrations --check --dry-run` | OK |
| `npm install` LeadHunter Web | OK |
| `npm run build` LeadHunter Web | OK |
| `npm run build` LeadHunter Web despues de limpiar assets heredados | OK |
| `docker compose config --quiet` API | OK |
| `docker compose config --quiet` Web | OK |
| Docker runtime | Pendiente externo: Docker Desktop no estaba activo |
| Local API/Gateway/Web runtime | OK con SQLite y sample mode |

## Prueba Funcional Local

- API local: `http://127.0.0.1:8021/api/leadhunter/health/`
- Gateway local: `http://127.0.0.1:8020/api/leadhunter/health/`
- Web local: `http://127.0.0.1:3007/prospectos`
- Busqueda de prueba por Gateway: completada con `total_found=4` y `total_without_phone=4`.

## Pendientes Externos

1. Probar Docker real cuando Docker Desktop este encendido.
2. Probar Apify real con `APIFY_TOKEN` y creditos disponibles usando `LEADHUNTER_USE_SAMPLE_DATA=false`.
3. Crear remotos GitHub si se requiere publicar por repositorio separado:
   - `MexIngSoft/API.PY.DJANGO.LeadHunter`
   - `MexIngSoft/API.PY.DJANGO.LeadHunter.Gateway`
   - `MexIngSoft/WEB.NJ.NEXT.LeadHunter`

## Documentos Revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/03_standards/global-governance.md`
- `Docs/03_standards/architecture/api-gateway-standard.md`
- `Docs/03_standards/product/product-strategy.md`
- `Docs/03_standards/product/module-catalog.md`
- `Docs/03_standards/frontend/ui-ux-standard.md`
- `Docs/03_standards/frontend/undocumented-modernization-standard.md`
- `Docs/03_standards/frontend/shared-docker-frontend-architecture.md`
- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/03_standards/docker.md`
- `Docs/03_standards/docker/grouped-containers-isolated-config.md`
- `Docs/03_standards/operations/django-api-project-compliance.md`
- `Docs/03_standards/database/sql-server-publication-standard.md`

## Quedo Fuera

- Busqueda exhaustiva en todo `Docs`; se uso indice documental y documentos canonicos relacionados.
- Publicacion a GitHub; no fue parte de este pedido.

---

# 2026-06-07 - LeadHunter Export CSV Gateway Fix

## Agents Ejecutados

| Agent | Estado | Resultado |
| --- | --- | --- |
| `AGENTS-000.md` | Completado | Se corrigio la descarga CSV de LeadHunter Gateway para evitar `TemplateDoesNotExist: rest_framework/api.html`. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Problema Detectado

Al descargar resultados desde:

```text
GET /api/leadhunter/prospects/export.csv?search_id=<uuid>
```

el navegador enviaba `Accept: text/html,...` y el Gateway respondia el archivo usando `rest_framework.response.Response`. DRF intentaba renderizar la respuesta con el browsable API template `rest_framework/api.html`, que no esta instalado en este proyecto, provocando:

```text
TemplateDoesNotExist at /api/leadhunter/prospects/export.csv
rest_framework/api.html
```

## Implementacion

- Se cambio `proxy_file` en `API.PY.DJANGO.LeadHunter.Gateway` para devolver `django.http.HttpResponse` nativo.
- Se preservan `Content-Type` y `Content-Disposition` del API de dominio.
- Se mantiene `Response` de DRF solo para endpoints JSON y errores estructurados.

## Archivos Modificados

- `Docker.API.PY/API.PY.DJANGO.LeadHunter.Gateway/gateway/views.py`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-07-leadhunter-export-csv-fix/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
| --- | --- |
| `python manage.py check` en `API.PY.DJANGO.LeadHunter.Gateway` | OK |
| `python -m compileall gateway config` en `API.PY.DJANGO.LeadHunter.Gateway` | OK |
| `python manage.py check` en `API.PY.DJANGO.LeadHunter` | OK |
| `docker compose -f Docker.API.PY/docker-compose.yml config --quiet` | OK |
| Reinicio de `api-multiproyecto` | OK |
| `GET /api/leadhunter/health/` en Gateway | OK |
| Descarga `export.csv` con `Accept: text/html,...` | OK, `200`, `text/csv; charset=utf-8`, `Content-Disposition=attachment` |

## Decisiones

- Se uso `HttpResponse` nativo para archivos porque evita negociacion de renderer de DRF y es el patron correcto para bytes/descargas.
- No se cambio el contrato del API de dominio ni la ruta publica.
- No se agrego `rest_framework` a `INSTALLED_APPS` solo para ocultar el error, porque eso mantendria una respuesta de archivo acoplada al renderer HTML.

## Informacion Faltante

- Falta prueba automatizada unitaria/integracion para validar headers de descarga en Gateway.

## Limpieza

`AGENTS-000.md` se copio a:

```text
Docs/_archive/agents/2026-06-07-leadhunter-export-csv-fix/AGENTS-000.md
```

El archivo original se conserva vacio en `Docs/agents/`.

---

# 2026-06-11 - Estandar de proyecto completo Web/API

## Agents Ejecutados

| Agent | Estado | Resultado |
| --- | --- | --- |
| `AGENTS-000.md` | Completado | Se convirtio la instruccion temporal en documentacion canonica complementaria para definir el minimo obligatorio de una Web/API completa. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Implementacion

- Se creo `Docs/03_standards/project-completeness-standard.md`.
- Se documento que toda Web/API debe tener identidad, variables, metadata,
  documentacion, healthcheck y entrada Docker.
- Se aclaro que no se necesita Dockerfile por proyecto salvo runtime,
  dependencias de sistema, build o configuracion realmente distintos.
- Se enlazo el nuevo estandar desde `Docs/README.md`.
- Se agrego el documento a `Docs/_meta/master-index.md`,
  `Docs/_meta/master-index.yaml` y `Docs/_meta/navigation-map.md`.

## Decisiones

- No se modificaron masivamente todas las Webs/APIs existentes para evitar
  regresiones sin auditoria especifica por proyecto.
- La aplicacion del estandar a proyectos existentes queda como auditoria futura
  y debe hacerse proyecto por proyecto.
- Se mantiene Dockerfile base por capa y compose por proyecto como overlay
  delgado, de acuerdo con el estandar Docker vigente.

## Validaciones

| Validacion | Resultado |
| --- | --- |
| Busqueda local de estandares existentes de Web/API/Docker | OK |
| Actualizacion de indices documentales | OK |
| Archivo de `AGENTS-000.md` | OK |

## Documentos Revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/active-work-index.md`
- `Docs/03_standards/frontend/nextjs-project-standard.md`
- `Docs/03_standards/operations/project-closure-standard.md`
- `Docs/03_standards/docker/jobcron-official-docker-architecture.md`
- `Docs/03_standards/frontend/shared-docker-frontend-architecture.md`

## Quedo Fuera

- Auditoria completa de cada Web/API existente contra el nuevo estandar.
- Cambios funcionales en proyectos Web/API.
- Crear Dockerfiles especificos por proyecto sin una diferencia real de build.

## Limpieza

`AGENTS-000.md` se copio a:

```text
Docs/_archive/agents/2026-06-11-web-api-project-completeness-standard/AGENTS-000.md
```

El archivo original se conserva vacio en `Docs/agents/`.

---

# 2026-06-07 - LeadHunter Async Search And Panel Controls

## Agents Ejecutados

| Agent | Estado | Resultado |
| --- | --- | --- |
| `AGENTS-000.md` | Completado | Se implemento busqueda asincrona para evitar timeout HTTP mientras Apify procesa. |
| `AGENTS-001.md` | Completado | Se dejo Docker/API listos para cargar Apify desde `.env` sin export manual y sin guardar tokens reales. |
| `AGENTS-002.md` | Completado | Se corrigio el selector de ciudades con grid responsivo, scroll interno y ciudad/estado visibles. |
| `AGENTS-003.md` | Completado | Se agrego seleccion multiple reutilizable, seleccionar/deseleccionar todo por bloque, validaciones y ordenamiento por prioridad. |
| `AGENTS-004.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Implementacion

- `POST /api/leadhunter/prospects/search/` ahora crea una busqueda `pending` y responde sin esperar Apify.
- El procesamiento Apify corre en segundo plano con `ThreadPoolExecutor` controlado para el MVP.
- Se agregaron campos de progreso: `TotalQueries`, `CompletedQueries`, `StartedAt`, `FinishedAt`.
- Se agregaron endpoints de polling:
  - `GET /api/leadhunter/prospects/searches/<search_id>/status/`
  - `GET /api/leadhunter/prospects/searches/<search_id>/results/`
- El Gateway expone los mismos endpoints para mantener Web -> Gateway -> API.
- La web ahora crea busqueda, consulta estado cada 3 segundos y carga resultados al completar.
- El selector de ciudades muestra todas las ubicaciones con grid responsivo, scroll vertical y estado activo.
- Todas las verticales, marcas, servicios y palabras reales inician seleccionadas.
- Cada bloque tiene `Seleccionar todo` y `Deseleccionar todo`.
- La web bloquea busquedas sin verticales o sin criterios seleccionados.
- Los resultados se ordenan por defecto por `score DESC`, `rating DESC`, `reviews_count DESC`.
- La tabla permite ordenar por score, rating, resenas, nombre, ciudad/direccion y categoria.
- El CSV/Excel incluye `latitude`, `longitude`, `source` y campos comerciales.
- Docker Compose carga `Docker.API.PY/.env` mediante `env_file`.

## Archivos Modificados

- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/models.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/migrations/0002_async_search_progress.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/prospect_service.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/serializers.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/views.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/urls.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/config/settings.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/README.md`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter.Gateway/gateway/views.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter.Gateway/gateway/urls.py`
- `Docker.API.PY/docker-compose.yml`
- `Docker.API.PY/.env.example`
- `Docker.API.PY/.env` local con token vacio
- `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter/lib/api.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter/app/prospectos/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter/app/globals.css`
- `Docs/02_projects/leadhunter/architecture.md`
- `Docs/02_projects/leadhunter/api-contracts.md`
- `Docs/02_projects/leadhunter/database.md`
- `Docs/02_projects/leadhunter/frontend.md`
- `Docs/02_projects/leadhunter/local-runbook.md`
- `Docs/agents/EXECUTION_REPORT.md`

## Validaciones

| Validacion | Resultado |
| --- | --- |
| `python manage.py check` en `API.PY.DJANGO.LeadHunter` | OK |
| `python manage.py migrate --noinput` local LeadHunter | OK |
| `python -m compileall core config` en `API.PY.DJANGO.LeadHunter` | OK |
| `python manage.py check` en `API.PY.DJANGO.LeadHunter.Gateway` | OK |
| `python -m compileall gateway config` en `API.PY.DJANGO.LeadHunter.Gateway` | OK |
| `npm run build` en `WEB.NJ.NEXT.LeadHunter` | OK |
| `docker compose -f Docker.API.PY/docker-compose.yml config --quiet` | OK |
| `docker compose -f Docker.WEB.NJ/docker-compose.yml config --quiet` | OK |
| Recreate de `api-multiproyecto` | OK |
| Migracion Docker `core.0002_async_search_progress` | OK |
| `POST /api/leadhunter/prospects/search/` via Gateway | OK, 0.807s, `pending` |
| `GET /api/leadhunter/prospects/searches/<id>/status/` | OK, `failed` controlado cuando falta token |
| `GET /prospectos` | OK, HTTP 200 |
| Busqueda de textos sample/mock/fake/demo/placeholder en codigo vivo | OK, solo regla de bloqueo y texto documental permitido |
| Busqueda de tokens `apify_api_*` | OK, sin tokens reales despues de archivar/redactar agents |

## Documentos Revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/leadhunter/architecture.md`
- `Docs/02_projects/leadhunter/api-contracts.md`
- `Docs/02_projects/leadhunter/database.md`
- `Docs/02_projects/leadhunter/frontend.md`
- `Docs/02_projects/leadhunter/local-runbook.md`

## Decisiones

- Se uso `ThreadPoolExecutor` en vez de Celery/Redis porque esa infraestructura no esta activa en el Docker enfocado de LeadHunter.
- No se guardo el token real recibido en codigo, TypeScript, Dockerfile, compose ni documentacion.
- `Docker.API.PY/.env` queda con `APIFY_TOKEN=` vacio para que el usuario coloque el valor real localmente fuera del repositorio.
- Con token faltante, la busqueda termina en `failed` controlado y la web no muestra datos inventados.
- La ruta canonica se mantiene como `/api/leadhunter/*`; no se agrego `/api/v1` para no romper el estandar Gateway actual del proyecto.

## Quedo Fuera

- Prueba masiva real con Apify en Docker, porque no se persistio el token real por seguridad.
- Celery/Redis productivo; queda como mejora futura si se requiere cola durable.

## Limpieza

`AGENTS-000.md` a `AGENTS-003.md` se copiaron con secretos redactados a:

```text
Docs/_archive/agents/2026-06-07-leadhunter-async-search-and-controls/
```

Los archivos originales se conservan vacios en `Docs/agents/`.

---

# 2026-06-07 - LeadHunter Apify Real Configuration

## Agents Ejecutados

| Agent | Estado | Resultado |
| --- | --- | --- |
| `AGENTS-000.md` | Completado | Se verifico el token real de Apify sin guardarlo en codigo, se detecto actor configurado invalido y se actualizo LeadHunter para usar un actor publico valido con `locationQuery`. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Hallazgos

- El token entregado corresponde al user id de Apify informado.
- El actor anterior `nwua9Gu5YrADL7ZDj` no existe o no es accesible con ese token.
- El actor publico `compass~crawler-google-places` si es accesible y devuelve datos reales de Google Maps.
- Una prueba real limitada a 1 resultado devolvio un negocio real con nombre, direccion y URL de Google Maps.
- Ese resultado tenia telefono, por lo que LeadHunter correctamente no lo guardaria como prospecto prioritario sin telefono.

## Implementacion

- Se cambio el actor por defecto a `compass~crawler-google-places`.
- Se agrego `locationQuery` al payload de Apify usando ciudad, estado y pais, manteniendo latitud/longitud/radio para actores que soporten busqueda por area.
- Se agregaron parametros de bajo enriquecimiento (`maximumLeadsEnrichmentRecords=0`, `maxImages=0`) para reducir costo y ruido en busquedas iniciales.
- Se separo el error `APIFY_EXECUTION_FAILED` para distinguir fallas de actor/proveedor de errores genericos.
- Se actualizo documentacion y ejemplos de entorno sin registrar el token real.

## Archivos Modificados

- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/apify_client.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/views.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/.env.local.example`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/README.md`
- `Docker.API.PY/docker-compose.yml`
- `Docs/02_projects/leadhunter/api-contracts.md`
- `Docs/02_projects/leadhunter/local-runbook.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`
- `Docs/_archive/agents/2026-06-07-leadhunter-apify-real-configuration/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
| --- | --- |
| Verificacion de user id Apify con token temporal | OK |
| Verificacion actor anterior `nwua9Gu5YrADL7ZDj` | Fallo esperado: actor no encontrado o sin acceso |
| Verificacion actor `compass~crawler-google-places` | OK |
| Prueba Apify real limitada a 1 resultado | OK, devolvio negocio real con direccion y URL Google Maps |
| `python manage.py check` en `API.PY.DJANGO.LeadHunter` | OK |
| `python -m compileall core config` en `API.PY.DJANGO.LeadHunter` | OK |
| `python manage.py check` en `API.PY.DJANGO.LeadHunter.Gateway` | OK |
| `python -m compileall gateway config` en `API.PY.DJANGO.LeadHunter.Gateway` | OK |
| `npm run build` en `WEB.NJ.NEXT.LeadHunter` | OK |
| `docker compose -f Docker.API.PY/docker-compose.yml config --quiet` | OK |
| `docker compose -f Docker.WEB.NJ/docker-compose.yml config --quiet` | OK |
| Recreate de `api-multiproyecto` | OK |
| `GET /api/leadhunter/health/` en Domain API | OK |
| `POST /api/leadhunter/prospects/search/` sin token persistido | OK, `APIFY_NOT_CONFIGURED`; no genera datos falsos |
| `GET /prospectos` en web local | OK, HTTP 200 |

## Documentos Revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/02_projects/leadhunter/README.md`
- `Docs/02_projects/leadhunter/api-contracts.md`
- `Docs/02_projects/leadhunter/local-runbook.md`
- Documentacion publica de Apify sobre `run-sync-get-dataset-items` y Google Maps Scraper input.

## Decisiones

- No se guardo el token real en codigo, compose, `.env.local.example` ni documentacion.
- El agent archivado se redacto para no conservar secretos en el repositorio.
- Se mantiene la regla de negocio: si los resultados reales tienen telefono, no se guardan como prospectos prioritarios.
- Si no hay token configurado en el entorno, el sistema muestra error controlado y no inventa datos.

## Quedo Fuera

- Guardar el token en `.env` local; debe configurarse manualmente fuera del repositorio.
- Busquedas masivas con Apify; solo se hizo una prueba minima para validar datos reales y reducir consumo.

## Limpieza

`AGENTS-000.md` se copio con token redactado a:

```text
Docs/_archive/agents/2026-06-07-leadhunter-apify-real-configuration/AGENTS-000.md
```

El archivo original se conserva vacio en `Docs/agents/`.

---

# 2026-06-07 - LeadHunter Real Results Only Search

## Agents Ejecutados

| Agent | Estado | Resultado |
| --- | --- | --- |
| `AGENTS-000.md` | Completado | Se elimino el flujo de datos inventados y se reforzo LeadHunter para mostrar solo negocios reales obtenidos por Apify/Google Maps, o nada/error controlado cuando no exista proveedor configurado. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Implementacion

- Se elimino el uso de modo sample/fallback en `API.PY.DJANGO.LeadHunter`.
- Se agrego catalogo editable de ciudades para Pachuca, CDMX, Monterrey, Guadalajara, Queretaro, Puebla, Toluca, Leon, San Luis Potosi, Aguascalientes, Merida, Tijuana, Cancun, Saltillo y Torreon.
- Se reemplazaron categorias genericas por verticales de alto valor: transporte pesado, pipas/liquidos, maquinaria pesada, off-road, autos premium e industria B2B.
- Se agregaron marcas, servicios y keywords reales por vertical para construir busquedas mas precisas.
- Se agregaron filtros de calidad: sin telefono, nombre real, direccion, URL de Google Maps, deduplicacion y descarte de `sample`, `test`, `demo`, `fake` y `placeholder`.
- Se ajusto el scoring para priorizar negocios sin telefono, sin sitio web, con categoria de alto valor, rating, reviews, direccion completa y coordenadas validas.
- Se agrego endpoint `GET /api/leadhunter/locations/` en API de dominio y Gateway.
- Se actualizo la web para seleccionar ciudad, vertical, marcas, servicios y keywords, con el boton `Buscar negocios reales sin telefono`.
- Se actualizo la documentacion canonica de LeadHunter para dejar claro que no se generan datos de ejemplo.

## Archivos Modificados

- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/categories.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/prospect_service.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/scoring_service.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/serializers.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/views.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/urls.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/core/apify_client.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/README.md`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter.Gateway/gateway/views.py`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter.Gateway/gateway/urls.py`
- `Docker.API.PY/docker-compose.yml`
- `Docker.API.PY/API.PY.DJANGO.LeadHunter/.env.local.example`
- `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter/lib/api.ts`
- `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter/app/prospectos/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter/app/globals.css`
- `Docs/02_projects/leadhunter/README.md`
- `Docs/02_projects/leadhunter/api-contracts.md`
- `Docs/02_projects/leadhunter/local-runbook.md`
- `Docs/agents/EXECUTION_REPORT.md`
- `Docs/agents/AGENTS-000.md`

## Validaciones

| Validacion | Resultado |
| --- | --- |
| `python manage.py check` en `API.PY.DJANGO.LeadHunter` | OK |
| `python -m compileall core config` en `API.PY.DJANGO.LeadHunter` | OK |
| `python manage.py check` en `API.PY.DJANGO.LeadHunter.Gateway` | OK |
| `python -m compileall gateway config` en `API.PY.DJANGO.LeadHunter.Gateway` | OK |
| `npm run build` en `WEB.NJ.NEXT.LeadHunter` | OK |
| `docker compose -f Docker.API.PY/docker-compose.yml config --quiet` | OK |
| `docker compose -f Docker.WEB.NJ/docker-compose.yml config --quiet` | OK |
| Reinicio de `api-multiproyecto` y `web-frontend-node` | OK |
| `GET /api/leadhunter/categories/` por Gateway | OK, 6 verticales reales |
| `GET /api/leadhunter/locations/` por Gateway | OK, 15 ciudades configurables |
| `GET /prospectos` en web local | OK, HTTP 200 |
| `POST /api/leadhunter/prospects/search/` sin Apify configurado | OK, HTTP 424 `APIFY_NOT_CONFIGURED`; no se generan datos falsos |

## Documentos Revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/active-work-index.md`
- `Docs/02_projects/leadhunter/README.md`
- `Docs/02_projects/leadhunter/architecture.md`
- `Docs/02_projects/leadhunter/api-contracts.md`
- `Docs/02_projects/leadhunter/local-runbook.md`

## Decisiones

- Si Apify no esta configurado, la busqueda falla con `APIFY_NOT_CONFIGURED` y no se inventan negocios.
- Si Apify devuelve cero resultados reales, la busqueda queda completada con lista vacia y mensaje claro.
- Las coordenadas viven en un catalogo central editable, no mezcladas en la logica principal de busqueda.
- El frontend consume categorias y ciudades del API para evitar listas divergentes.

## Quedo Fuera

- Busqueda exhaustiva en todo `Docs`; se uso el indice documental y documentos canonicos relacionados.
- Commit/push a GitHub; no fue parte de este pedido.
- Prueba con Apify real, porque el entorno local no tiene `APIFY_TOKEN` y `APIFY_ACTOR_ID` configurados.

## Limpieza

`AGENTS-000.md` se copio a:

```text
Docs/_archive/agents/2026-06-07-leadhunter-real-results-only/AGENTS-000.md
```

El archivo original se conserva vacio en `Docs/agents/`.

---

# 2026-06-11 - Arquitectura Docker oficial JobCron

## Agents Ejecutados

| Agent | Estado | Resultado |
| --- | --- | --- |
| `AGENTS-000.md` | Completado | Se documento como regla oficial la arquitectura Docker del ecosistema JobCron: corridas master, corridas por proyecto, red objetivo compartida, variables por scope y reutilizacion de APIs compartidas. |
| `AGENTS-001.md` - `AGENTS-030.md` | Sin instrucciones | Archivos vacios; no habia tareas ejecutables. |

## Implementacion

- Se creo el documento canonico `Docs/03_standards/docker/jobcron-official-docker-architecture.md`.
- Se enlazo la regla desde `Docs/03_standards/docker.md`.
- Se actualizo `Docs/03_standards/docker/grouped-containers-isolated-config.md` para declarar que los contenedores agrupados son compatibilidad de bajo costo y no contradicen la arquitectura objetivo.
- Se actualizo `Docs/03_standards/frontend/shared-docker-frontend-architecture.md` y `Docs/03_standards/frontend/pre-development-checklist.md` para usar `jobcron_network` como red objetivo y `crejo` como red heredada.
- Se actualizo `Docs/03_standards/operations/docker-recovery-runbook.md` para diferenciar estado operativo actual de arquitectura objetivo.
- Se agrego referencia en `Docs/02_projects/jobcron/README.md`.
- Se sincronizaron indices: `Docs/_meta/master-index.md`, `Docs/_meta/master-index.yaml` y `Docs/_meta/navigation-map.md`.

## Decision principal

No se renombraron redes ni compose reales de `crejo` a `jobcron_network` en esta corrida, porque el estado actual tiene compose, scripts, Nginx y runbooks acoplados a `crejo`. La migracion debe hacerse como fase coordinada para evitar romper comunicacion interna o duplicar servicios compartidos.

## Validaciones

| Validacion | Resultado |
| --- | --- |
| `git -C Docs diff --check` | OK |
| `docker compose -f Docker.DB.PG/docker-compose.yml config --quiet` | OK |
| `docker compose -f Docker.API.PY/docker-compose.yml config --quiet` | OK |
| `docker compose -f Docker.WEB.NJ/docker-compose.yml config --quiet` | OK |
| `docker compose -f Docker.SW.Nginx/docker-compose.yml config --quiet` | OK |
| Busqueda local de `jobcron-official-docker-architecture`, `jobcron_network` y `crejo` | OK; referencias objetivo y compatibilidad quedaron documentadas. |

## Documentos Revisados

- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
- `Docs/agents/AGENT_GLOBAL_RULES.md`
- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/03_standards/docker.md`
- `Docs/03_standards/docker/grouped-containers-isolated-config.md`
- `Docs/03_standards/frontend/shared-docker-frontend-architecture.md`
- `Docs/03_standards/frontend/pre-development-checklist.md`
- `Docs/03_standards/operations/docker-recovery-runbook.md`
- `Docs/03_standards/operations/local-port-registry.md`
- `Docs/02_projects/jobcron/README.md`

## Quedo Fuera

- Crear fisicamente los compose `docker-compose.master.*.yml` y `docker-compose.<proyecto>.*.yml`.
- Migrar los compose actuales, scripts, Nginx y contenedores activos de `crejo` a `jobcron_network`.
- Cambiar nombres de contenedores actuales como `api-backend-python` o `web-frontend-node`.

## Limpieza

`AGENTS-000.md` se copia a:

```text
Docs/_archive/agents/2026-06-11-jobcron-official-docker-architecture/AGENTS-000.md
```

El archivo original se conserva vacio en `Docs/agents/`.
