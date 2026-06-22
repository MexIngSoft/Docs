Trabaja en la rama `dev`.

Objetivo: optimizar únicamente `Docs/agents/AGENTS-004.md` sin ejecutar el agent, sin borrar información vigente y sin modificar otros agents.

No ejecutes todos los agents.
No modifiques otros `AGENTS-*.md`.
No elimines, muevas ni renombres `Docs/agents/AGENTS-004.md`.

Antes de editar, lee únicamente:

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

Después abre completo:

* `Docs/agents/AGENTS-004.md`

Detecta que el agent corresponde a:

* Proyecto: `MexIngSof`
* Dominio: consola interna de administración técnica del ecosistema
* Módulo: control de software, APIs, despliegues, ambientes, clientes por software, usuarios por plataforma, health checks e incidentes
* API: posible `API.PY.DJANGO.MexIngSof`, solo como `PENDIENTE_DE_DEFINIR`, nunca como activa si no existe repo ejecutable, contrato y migraciones

Con base en `Docs/_meta/active-work-index.md`, selecciona el Context Pack mínimo para modificar proyecto/documentación. No leas todo `Docs`.

Lectura canónica específica para este agent:

* `Docs/02_projects/mexingsof/README.md`
* `Docs/02_projects/_ecosystem/00_ecosystem_overview.md`
* `Docs/02_projects/_ecosystem/api-version-matrix.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/03_standards/operations/git-repository-map.md`

No uses `_archive/` ni `agents/_archive/` como fuente vigente, salvo trazabilidad.

Revisa `Docs/agents/EXECUTION_REPORT.md` para confirmar si `AGENTS-004.md` ya fue ejecutado, quedó vacío, fue marcado como sin instrucciones o tiene trabajo nuevo pendiente.

Evalúa si el contenido actual de `AGENTS-004.md`:

* repite reglas globales ya cubiertas por `AGENT_GLOBAL_RULES.md`;
* pide leer demasiados documentos;
* mezcla MexIngSof con JobCron sin frontera clara;
* convierte MexIngSof en ERP, CRM, POS, facturación o ventas cuando eso pertenece a JobCron u otros módulos;
* crea una API de MexIngSof como activa sin contrato;
* duplica APIs reutilizables como Auth, Gateway, JobCron, Sales, Address o Search;
* propone tablas sin marcar datos faltantes como `PENDIENTE_DE_DEFINIR`;
* contiene tareas vagas, largas o no verificables;
* contiene decisiones que deberían ir en `01_core_erp`, `02_projects`, `03_standards` o `04_integrations`.

Reescribe únicamente `Docs/agents/AGENTS-004.md` con esta estructura:

# AGENTS-004 — MexIngSof Software Control

## Objetivo

Optimizar la documentación de MexIngSof como consola interna de administración técnica del ecosistema, sin convertirla en ERP ni duplicar JobCron. Debe dejar claro qué administra MexIngSof: software, APIs, webs, repositorios, despliegues, ambientes, health checks e incidentes.

## Alcance

Puede actualizar únicamente documentación relacionada con MexIngSof y su registro dentro del ecosistema.

Debe revisar la documentación canónica de MexIngSof, ecosistema, APIs, módulos y repositorios.

Debe dejar una instrucción ejecutable, corta, verificable y alineada con Gateway/Auth/APIs reutilizables.

## Lectura mínima obligatoria

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/02_projects/mexingsof/README.md`
* `Docs/02_projects/_ecosystem/00_ecosystem_overview.md`
* `Docs/02_projects/_ecosystem/api-version-matrix.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/03_standards/operations/git-repository-map.md`

## Fuera de alcance

* No ejecutar otros agents.
* No limpiar, borrar, mover ni renombrar `AGENTS-004.md`.
* No modificar `main` ni `pro`.
* No leer todo `Docs`.
* No crear APIs nuevas como activas.
* No crear schemas, modelos ni migraciones sin contrato documentado.
* No mover responsabilidades de JobCron a MexIngSof.
* No meter facturación, POS, inventario físico, ventas o CRM operativo dentro de MexIngSof si pertenecen a JobCron u otra API reutilizable.
* No guardar tokens, passwords, secretos ni variables reales.
* No hacer que el frontend consuma APIs core directo; debe usar Gateway General.

## Tareas

1. Normalizar el objetivo de `AGENTS-004.md` para que MexIngSof quede definido como consola técnica interna del ecosistema, no como ERP ni sustituto de JobCron.

2. Conservar y ordenar toda la información vigente del agent actual sobre:

   * inventario de software;
   * APIs;
   * webs;
   * repositorios;
   * despliegues;
   * ambientes;
   * clientes por software;
   * usuarios por plataforma;
   * health checks;
   * incidentes técnicos.

3. Revisar si deben existir o actualizarse estos documentos, sin inventar datos:

   * `Docs/02_projects/mexingsof/software-control-platform.md`
   * `Docs/02_projects/mexingsof/api-contracts.md`
   * `Docs/02_projects/mexingsof/database.md`
   * `Docs/02_projects/mexingsof/tasks/01_software_control_mvp.md`

4. Si se documenta `API.PY.DJANGO.MexIngSof`, marcarla únicamente como `PENDIENTE_DE_DEFINIR` hasta confirmar:

   * repositorio ejecutable;
   * contrato API;
   * migraciones;
   * compose/configuración;
   * pruebas mínimas.

5. Mantener como endpoints MVP sugeridos, sin marcarlos activos si no existe contrato:

   * `/software/`
   * `/apis/`
   * `/deployments/`
   * `/client-software/`
   * `/platform-users/`
   * `/health-checks/`
   * `/incidents/`

6. Mantener como tablas sugeridas, no implementadas, usando nombres PascalCase:

   * `SoftwareProduct`
   * `SoftwareApi`
   * `SoftwareDeployment`
   * `ClientSoftwareAccess`
   * `PlatformUserAccess`
   * `HealthCheckLog`
   * `IncidentLog`

7. Actualizar o validar `Docs/02_projects/_ecosystem/api-version-matrix.md` solo si falta MexIngSof o si contradice la documentación vigente:

   * Frontend: `WEB.NJ.NEXT.MexIngSof`
   * Gateway: `API.PY.DJANGO.Gateway`
   * Auth: `Auth v1`
   * APIs reutilizadas: JobCron, Auth, Gateway y las que estén documentadas
   * API propia: solo `PENDIENTE_DE_DEFINIR` si no está confirmada

8. Actualizar o validar `Docs/03_standards/product/module-catalog.md` solo si falta el módulo:

   * `MexIngSof Software Control`
   * Tipo: `Independent Product Module / Internal Technical Platform`
   * Owner documental: `02_projects/mexingsof`
   * Estado: `Documentado` o `PENDIENTE_DE_DEFINIR`, según evidencia real

9. Usar `PENDIENTE_DE_DEFINIR` para cualquier URL, puerto, dominio, rama, servidor, contrato, tabla, endpoint o estado no comprobado.

10. Eliminar duplicidad de reglas globales y dejar referencias a los documentos canónicos en vez de repetirlos.

## Validaciones

* Validar que todos los documentos citados existan.
* Validar que no se hayan usado documentos de `_archive/` como fuente vigente.
* Validar que MexIngSof no duplique responsabilidades de JobCron.
* Validar que ninguna API nueva quede marcada como activa sin contrato.
* Validar rutas y enlaces modificados.
* Ejecutar validación documental disponible si existe.
* Si una validación no puede ejecutarse, registrar la causa exacta.

## Reporte obligatorio

Actualizar:

* `Docs/agents/EXECUTION_REPORT.md`

Debe registrar:

* agent revisado: `AGENTS-004.md`;
* Context Pack usado;
* documentos leídos;
* documentos fuera de alcance;
* cambios realizados;
* archivos modificados;
* validaciones ejecutadas;
* resultado de validaciones;
* APIs reutilizadas;
* APIs no creadas y motivo;
* pendientes reales;
* bloqueos;
* decisiones documentales.

## Criterio de cierre

`AGENTS-004.md` queda listo solo si:

* conserva toda la información vigente del agent original;
* agrega claridad sin inventar datos;
* es más corto y ejecutable;
* no duplica reglas globales;
* tiene lectura mínima;
* tiene alcance claro;
* tiene tareas verificables;
* define qué queda fuera;
* define validaciones;
* define dónde reportar;
* no marca MexIngSof API como activa sin evidencia;
* no convierte MexIngSof en ERP ni reemplazo de JobCron.

## Reglas finales

Si `AGENTS-004.md` está vacío, no inventes tareas; déjalo como `Sin instrucciones`.

Si `AGENTS-004.md` ya fue ejecutado y no hay cambios nuevos, documenta que está cerrado.

Si falta información esencial, marca `Bloqueado` y deja preguntas concretas.

No elimines, muevas ni renombres `Docs/agents/AGENTS-004.md`.

No limpies el contenido del agent, porque esta tarea es solo optimizar su instrucción, no ejecutarlo.
