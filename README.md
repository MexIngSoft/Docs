# Documentacion del proyecto

## Objetivo

Este directorio organiza la documentacion del ERP modular y de los proyectos que usan ese ERP.

La regla principal es separar:

- **Nucleo ERP**: reglas reutilizables para cualquier negocio o proyecto.
- **Proyectos**: identidad, negocio, frontend, tareas y decisiones especificas por empresa o producto.
- **Estandares**: normas de Django, frontend, operacion, seguridad, pruebas y Docker.
- **Integraciones**: proveedores externos como Syscom.
- **Archivo**: solo fuentes utiles que explican decisiones documentales, como referencias visuales.

## Estructura canonica

| Area | Carpeta | Contenido |
|---|---|---|
| Auditoria | `00_audit` | Inventario, inconsistencias, diccionario, estado documental. |
| Nucleo ERP | `01_core_erp` | Modulos, arquitectura, base de datos, APIs y flujos reutilizables. |
| Proyectos | `02_projects` | Documentacion especifica por proyecto/empresa. |
| Estandares | `03_standards` | Django, frontend, operacion, seguridad, testing, Docker. |
| Integraciones | `04_integrations` | Proveedores externos y ETL. |
| Archivo | `_archive` | Fuentes utiles conservadas para trazabilidad. |

## Directorios de soporte

Ademas de la estructura canonica funcional, este repositorio incluye carpetas
de soporte para gobierno, metadatos, agents, plantillas y automatizacion:

| Area | Carpeta | Contenido |
|---|---|---|
| Gobierno GitHub | `.github` | CODEOWNERS, plantillas, seguridad, soporte y CI documental. |
| Metadatos | `_meta` | Indices, relaciones, inventarios y reportes de calidad. |
| Agents | `agents` | Instrucciones temporales y reporte de ejecucion. |
| Scripts | `scripts` | Automatizacion local y de CI para documentacion. |
| Plantillas | `templates` | Esqueletos reutilizables para documentos nuevos. |
| Pendientes | `pendientes` | Ideas o modulos sin MVP cerrado. |

## Ruta rapida de trabajo

Para trabajar mas rapido sin leer todo `Docs`, usar:

```text
Docs/_meta/active-work-index.md
```

Ese indice traduce conceptos operativos como Core, Shared, Meta, Agents y
Templates a la estructura canonica real del repositorio, y define que leer segun
la tarea.

Cuando la tarea sea cerrar MVPs, APIs faltantes o brechas de desarrollo, leer
tambien:

```text
Docs/00_audit/10_development_gap_analysis.md
```

Para reducir contexto y evitar duplicar APIs o documentacion, leer tambien:

```text
Docs/00_audit/codex-context-map.md
Docs/00_audit/document-ownership-map.md
Docs/00_audit/reusable-api-map.md
Docs/01_core_erp/apis/reusable-api-contracts.md
Docs/03_standards/operations/codex-execution-standard.md
Docs/03_standards/operations/codex-anti-patterns.md
Docs/03_standards/operations/context-packs.md
Docs/03_standards/codex/codex-minimal-reading-standard.md
Docs/03_standards/codex/codex-anti-vices-checklist.md
```

## Optimizacion para Codex

Documentos canonicos para reducir contexto y evitar decisiones repetidas:

```text
AGENTS.md
.codex-context.yml
Docs/03_standards/operations/context-packs.md
Docs/03_standards/codex/codex-minimal-reading-standard.md
Docs/03_standards/codex/codex-anti-vices-checklist.md
Docs/03_standards/architecture/reusable-api-decision-standard.md
Docs/03_standards/api/api-contract-first-standard.md
Docs/03_standards/architecture/shared-libraries-standard.md
Docs/01_core_erp/apis/api-decision-matrix.md
Docs/templates/api-contract-template.md
Docs/templates/api-specialized-justification-template.md
Docs/templates/frontend-module-template.md
Docs/templates/etl-contract-template.md
```

Antes de ejecutar agents o iniciar una fase nueva, leer tambien:

```text
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/03_standards/operations/standard-request-prompts.md
Docs/03_standards/documentation-first-workflow.md
Docs/03_standards/documentation/documentation-cleanup-standard.md
Docs/03_standards/global-governance.md
Docs/03_standards/frontend/ui-ux-standard.md
Docs/03_standards/frontend/undocumented-modernization-standard.md
Docs/03_standards/architecture/api-gateway-standard.md
Docs/03_standards/auth/web-auth-login-standard.md
Docs/03_standards/auth/auth-versioning-standard.md
Docs/03_standards/product/product-strategy.md
Docs/03_standards/product/module-catalog.md
```

## Que pertenece al nucleo ERP

Va en `01_core_erp` todo lo que pueda reutilizarse para varios negocios:

- Vision ERP.
- Modulos.
- Rules Engine.
- Cotizador.
- Carrito web.
- Punto de venta.
- Ventas.
- Compras.
- Logistica.
- Estados, roles, costos, facturacion, devoluciones y notificaciones.
- Licitaciones cuando sean reutilizables.
- Arquitectura general.
- Contratos entre APIs.
- Modelos de datos.
- Flujos genericos.
- APIs internas reutilizables.
- Patron Gateway General unico + APIs compartidas por responsabilidad + APIs especializadas solo si aplica.

Reglas de arquitectura vigentes:

- El ecosistema no utiliza pasarelas ni capas intermedias dedicadas por proyecto.
- Todas las webs consumen el Gateway General.
- Las APIs especializadas solo existen cuando contienen logica exclusiva del dominio.

## Que pertenece a un proyecto

Va en `02_projects/<nombre>` todo lo que depende de una empresa, marca, vertical o implementacion:

- Identidad de negocio.
- Objetivos comerciales.
- FODA.
- Servicios concretos.
- Segmentos de cliente.
- Frontend especifico.
- Rutas web.
- Sistema visual.
- Tareas y roadmap del proyecto.
- Decisiones particulares.

Proyecto principal actual:

```text
02_projects/tecnotelec
```

Proyecto creativo activo:

```text
02_projects/imagrafity
```

Mapa del ecosistema:

```text
02_projects/_ecosystem
```

## Que pertenece a estandares

Va en `03_standards` todo lo que define como se trabaja:

- Estandar de proyectos Django API.
- Estandar de proyectos Next.js.
- Estandar de proyecto completo Web/API.
- Estandares de estructura, metadata y naming documental.
- Arquitectura Docker frontend compartida.
- Estandar de cierre.
- Runbook.
- Observabilidad.
- Seguridad.
- Testing.
- Docker local.
- Publicacion de tablas y campos con nombres PascalCase estilo SQL Server.
- Gobierno global, UI/UX, API/Gateway, producto y catalogo de modulos.
- Prompts estandar para pedir trabajo con agents, sin agents y modernizacion visual.

## Que pertenece a integraciones

Va en `04_integrations` todo lo que dependa de un proveedor externo:

- Referencia API del proveedor.
- Sync.
- Publish.
- Tokens.
- Mappers.
- Reglas especificas del proveedor.

Proveedor actual:

```text
04_integrations/syscom
```

## Lectura recomendada

1. `00_audit/99_final_review.md`
2. `00_audit/07_recommended_documentation_strategy.md`
3. `01_core_erp/erp/00_erp_vision.md`
4. `01_core_erp/erp/01_modules.md`
5. `01_core_erp/architecture/00_general_architecture.md`
6. `01_core_erp/apis/00_api_index.md`
7. `01_core_erp/apis/reusable-api-contracts.md`
8. `00_audit/codex-context-map.md`
9. `00_audit/reusable-api-map.md`
10. `01_core_erp/database/00_database_overview.md`
11. `01_core_erp/architecture/06_general_system_diagram.md`
12. `01_core_erp/architecture/07_project_api_pattern.md`
13. `01_core_erp/erp/09_system_states.md`
14. `01_core_erp/flows/01_customer_quote_flow.md`
15. `02_projects/tecnotelec/business/00_tecnotelec_identity.md`
16. `03_standards/operations/git-repository-map.md`
17. `02_projects/tecnotelec/frontend/00_frontend_overview.md`
18. `02_projects/tecnotelec/frontend/09_interface_proposal.md`
19. `02_projects/tecnotelec/frontend/10_pre_development_analysis.md`
20. `02_projects/tecnotelec/frontend/11_web_platform_structure.md`
21. `02_projects/tecnotelec/frontend/12_initial_web_blueprint.md`
22. `02_projects/tecnotelec/frontend/13_visual_mockup_spec.md`
23. `03_standards/frontend/nextjs-project-standard.md`
24. `03_standards/frontend/ui-ux-standard.md`
25. `03_standards/frontend/undocumented-modernization-standard.md`
26. `03_standards/frontend/shared-docker-frontend-architecture.md`
27. `03_standards/operations/standard-request-prompts.md`
28. `03_standards/operations/codex-execution-standard.md`
29. `03_standards/operations/codex-anti-patterns.md`
30. `03_standards/documentation-first-workflow.md`
31. `03_standards/documentation/documentation-cleanup-standard.md`
32. `03_standards/architecture/api-gateway-standard.md`
33. `03_standards/auth/web-auth-login-standard.md`
34. `03_standards/auth/auth-versioning-standard.md`
35. `02_projects/_ecosystem/api-version-matrix.md`
36. `03_standards/product/product-strategy.md`
37. `03_standards/product/module-catalog.md`
38. `03_standards/database/sql-server-publication-standard.md`
39. `00_audit/09_api_routes_inventory.md`
40. `02_projects/tecnotelec/tasks/04_development_order.md`
41. `02_projects/_ecosystem/00_ecosystem_overview.md`
42. `02_projects/_ecosystem/01_company_portfolio.md`
43. `02_projects/_ecosystem/04_process_convergence_and_conflicts.md`
44. `03_standards/project-completeness-standard.md`
45. `03_standards/documentation/README.md`

## Reglas

- No duplicar documentos entre nucleo y proyecto.
- No mezclar negocio con arquitectura tecnica.
- No mezclar proveedor externo con modelo interno del ERP.
- No borrar documentos fuente; mover a `_archive`.
- Excepcion obligatoria: los archivos `Docs/agents/AGENTS-*.md` nunca se borran,
  nunca se mueven y nunca se reemplazan por un archivo en `_archive`; cuando un
  agent queda concluido, cualquier instruccion de limpiar, quitar, retirar,
  cerrar o archivar significa vaciar su contenido y conservar el archivo
  original en `Docs/agents`.
- Usar `PENDIENTE_DE_DEFINIR` cuando falte informacion real.
- Documentar tablas y campos publicados con nombres PascalCase estilo SQL Server.
- Registrar decisiones en `02_projects/<proyecto>/decisions` si son del proyecto.
- Registrar decisiones de nucleo en `01_core_erp/architecture` o en un ADR futuro del nucleo.
