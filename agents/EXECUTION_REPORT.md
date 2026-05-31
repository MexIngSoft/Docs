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
