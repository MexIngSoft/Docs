Trabaja en la rama `dev`.

Optimiza únicamente:

`Docs/agents/AGENTS-003.md`

No ejecutes el agent.
No ejecutes otros agents.
No modifiques otros `AGENTS-*.md`.
No elimines, muevas ni renombres `Docs/agents/AGENTS-003.md`.
No limpies el contenido del agent; esta tarea solo optimiza su instrucción.

# AGENTS-003 — Separación Image API, Document API y DocuCore

## Objetivo

Reescribir `Docs/agents/AGENTS-003.md` para que documente de forma concisa, ejecutable y verificable la separación entre Image API, Document API y DocuCore, sin perder ninguna decisión vigente del agent actual.

La optimización debe conservar toda la intención original: Image API como API técnica visual compartida, Document API como orquestador documental/ETL, DocuCore como producto comercial/UX, LeadHunter como módulo interno de JobCron y prohibición de OCR duplicado por proyecto.

## Alcance

Sí puede tocar:

* `Docs/agents/AGENTS-003.md`
* `Docs/agents/EXECUTION_REPORT.md`, solo para registrar la optimización realizada

Sí debe revisar:

* Documentos base obligatorios
* Context Pack mínimo según `Docs/_meta/active-work-index.md`
* Documentación canónica relacionada con:

  * Core APIs
  * Document API
  * DocuCore
  * Ecosistema LexNova / Fiscora / DocuCore
  * Catálogo de módulos
  * ADR/API decision records si aplica

Entregable:

* `AGENTS-003.md` reescrito con estructura clara, lectura mínima, tareas verificables, validaciones y criterio de cierre.
* Registro en `EXECUTION_REPORT.md`.

## Lectura mínima obligatoria

Leer primero:

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/operations/standard-request-prompts.md`
* `Docs/03_standards/codex/codex-minimal-reading-standard.md`
* `Docs/03_standards/codex/codex-change-budget-standard.md`
* `Docs/03_standards/codex/codex-documentation-diff-standard.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`

Después leer únicamente el Context Pack mínimo relacionado con el agent.

Documentos canónicos esperados, salvo que el índice indique otros más vigentes:

* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/01_core_erp/apis/15_documents_api.md`
* `Docs/02_projects/docucore/README.md`
* `Docs/02_projects/docucore/mvp-roadmap.md`
* `Docs/02_projects/docucore/api-contracts.md`
* `Docs/02_projects/docucore/document-intelligence.md`
* `Docs/02_projects/_ecosystem/05_lexnova_docucore_fiscora_mvp_alignment.md`
* `Docs/02_projects/_ecosystem/api-version-matrix.md`
* `Docs/03_standards/product/module-catalog.md`

Si algún documento no existe, registrar la ruta faltante como bloqueo o pendiente real.
No sustituirlo con `_archive/` salvo trazabilidad.

## Fuera de alcance

* No ejecutar otros agents.
* No ejecutar el contenido funcional de `AGENTS-003.md`.
* No crear APIs nuevas en código.
* No crear schemas, modelos o migraciones.
* No modificar main/pro.
* No leer todo `Docs`.
* No tocar proyectos no relacionados.
* No crear contratos nuevos si solo se está optimizando la instrucción.
* No marcar Image API como ACTIVA si no existe implementación, contrato, compose, persistencia y pruebas.
* No convertir DocuCore en dueño global del OCR.
* No convertir Document API en motor visual.
* No convertir LeadHunter en producto independiente.
* No borrar decisiones previas; si algo se reemplaza, marcarlo como superseded o pendiente según aplique.

## Tareas

1. Analizar el contenido actual de `AGENTS-003.md` y extraer todas sus decisiones sin perder información:

   * Image API centraliza procesamiento visual.
   * Document API orquesta procesamiento documental y consume Image API.
   * DocuCore es producto comercial, workspace y escaparate técnico.
   * OCR, limpieza, previews, thumbnails, deskew, rotación, recorte y conversión visual pertenecen a Image API.
   * Clasificación documental, storage, metadatos, versiones, artefactos, índices y ETL documental pertenecen a Document API.
   * La decisión de negocio pertenece al producto consumidor.
   * LeadHunter queda como módulo interno de JobCron.
   * Fiscora, LexNova, DocuCore y Refapart deben consumir capacidades compartidas sin duplicar OCR.

2. Reescribir `AGENTS-003.md` con estructura operativa:

   * Objetivo
   * Alcance
   * Lectura mínima obligatoria
   * Fuera de alcance
   * Tareas
   * Validaciones
   * Reporte obligatorio
   * Criterio de cierre

3. Convertir la instrucción larga actual en tareas verificables:

   * Crear o actualizar documentación de Image API solo si corresponde.
   * Actualizar índice de APIs solo si la documentación canónica lo requiere.
   * Ajustar Document API para declarar dependencia de Image API.
   * Ajustar DocuCore para quedar como UX/producto, no motor OCR.
   * Ajustar documentos de ecosistema para LexNova, Fiscora, DocuCore y Refapart.
   * Ajustar catálogo de módulos para LeadHunter como módulo interno.
   * Crear ADR solo si el estándar documental confirma ruta y necesidad.

4. Reducir duplicidad:

   * No repetir reglas globales ya cubiertas por `AGENT_GLOBAL_RULES.md`.
   * No repetir estándares Codex completos.
   * No repetir prompts largos de `standard-request-prompts.md`.
   * Mantener referencias a documentos canónicos en vez de copiar su contenido.

5. Aplicar presupuesto de cambio:

   * Mantener la optimización enfocada en el agent.
   * No ampliar alcance sin justificación.
   * Si se requiere modificar más documentos para cerrar contradicciones, registrar bloqueo y no ejecutar cambios funcionales fuera de esta tarea.

6. Validar que la versión optimizada no pierda información del agent original:

   * Responsabilidades de Image API.
   * Responsabilidades de Document API.
   * Responsabilidades de DocuCore.
   * Flujo objetivo:
     `Frontend/App → Gateway → API de producto → Document API → Image API → motor OCR/limpieza/previews`
   * Endpoints objetivo de Image API como planeados/documentados, no activos si no hay implementación real.
   * Estados de jobs:
     `PENDING`, `PROCESSING`, `COMPLETED`, `FAILED`, `CANCELLED`, `PARTIAL_COMPLETED`
   * Contrato base de respuesta con `job_id`, `source_file_id`, `status`, `operation`, `artifacts`, `metadata`, `ocr` y `errors`.
   * Reglas para no publicar herramientas como enabled si devuelven mock o placeholder.
   * LeadHunter como módulo interno de JobCron.

## Validaciones

Ejecutar solo validaciones aplicables al cambio documental:

* Verificar que `Docs/agents/AGENTS-003.md` exista.
* Verificar que no se hayan modificado otros `AGENTS-*.md`.
* Verificar rutas/enlaces mencionados en el agent.
* Buscar contradicciones activas sobre:

  * OCR
  * Image API
  * Document API
  * DocuCore
  * Document Intelligence
  * LeadHunter
  * Independent Product Module
* Confirmar que el agent optimizado no ordena leer todo `Docs`.
* Confirmar que el agent optimizado no duplica reglas globales.
* Confirmar que el agent optimizado mantiene tareas verificables.
* Confirmar que `EXECUTION_REPORT.md` fue actualizado.

Si existe script documental disponible, ejecutar:

* `bash scripts/validate-docs-rules.sh`

Si no existe o falla por entorno, registrar la causa exacta.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Registrar:

* Agent revisado: `AGENTS-003.md`
* Rama: `dev`
* Documentos leídos
* Context Pack elegido
* Documentos fuera de alcance
* Cambios realizados
* Validaciones ejecutadas
* Resultado de validaciones
* Pendientes reales
* Bloqueos
* Decisiones documentales
* APIs reutilizadas
* APIs no creadas y motivo

## Criterio de cierre

El agent queda optimizado solo si:

* Es más corto y ejecutable que la versión original.
* No pierde ninguna decisión vigente.
* No duplica reglas globales.
* Usa lectura mínima.
* Tiene alcance claro.
* Tiene tareas concretas y verificables.
* Define qué queda fuera.
* Define validaciones reales.
* Define dónde reportar.
* Mantiene Image API como API técnica visual compartida.
* Mantiene Document API como orquestador documental/ETL.
* Mantiene DocuCore como producto comercial/UX.
* Mantiene LeadHunter como módulo interno de JobCron.
* No marca capacidades como activas si no están implementadas y validadas.

## Reglas finales

Si el agent está vacío, no inventes tareas; déjalo como `Sin instrucciones`.

Si el agent ya fue ejecutado y no hay cambios nuevos, documenta que está cerrado.

Si falta información esencial, marca `Bloqueado` y deja preguntas concretas.

No limpies `AGENTS-003.md` después de optimizarlo, porque esta tarea no ejecuta el agent; solo mejora su instrucción.
