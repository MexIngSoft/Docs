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
