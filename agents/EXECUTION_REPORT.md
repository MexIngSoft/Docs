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
