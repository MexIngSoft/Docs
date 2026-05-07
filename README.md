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
- Patron gateway/BFF + API propia por proyecto.

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

Mapa del ecosistema:

```text
02_projects/_ecosystem
```

## Que pertenece a estandares

Va en `03_standards` todo lo que define como se trabaja:

- Estandar de proyectos Django API.
- Estandar de proyectos Next.js.
- Arquitectura Docker frontend compartida.
- Estandar de cierre.
- Runbook.
- Observabilidad.
- Seguridad.
- Testing.
- Docker local.

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
7. `01_core_erp/database/00_database_overview.md`
8. `01_core_erp/architecture/06_general_system_diagram.md`
9. `01_core_erp/architecture/07_project_api_pattern.md`
10. `01_core_erp/erp/09_system_states.md`
11. `01_core_erp/flows/01_customer_quote_flow.md`
12. `02_projects/tecnotelec/business/00_tecnotelec_identity.md`
13. `02_projects/tecnotelec/frontend/00_frontend_overview.md`
14. `02_projects/tecnotelec/frontend/09_interface_proposal.md`
15. `02_projects/tecnotelec/frontend/10_pre_development_analysis.md`
16. `02_projects/tecnotelec/frontend/11_web_platform_structure.md`
17. `02_projects/tecnotelec/frontend/12_initial_web_blueprint.md`
18. `02_projects/tecnotelec/frontend/13_visual_mockup_spec.md`
19. `03_standards/frontend/nextjs-project-standard.md`
20. `03_standards/frontend/shared-docker-frontend-architecture.md`
21. `02_projects/tecnotelec/tasks/04_development_order.md`
22. `02_projects/_ecosystem/00_ecosystem_overview.md`
23. `02_projects/_ecosystem/01_company_portfolio.md`
24. `02_projects/_ecosystem/04_process_convergence_and_conflicts.md`

## Reglas

- No duplicar documentos entre nucleo y proyecto.
- No mezclar negocio con arquitectura tecnica.
- No mezclar proveedor externo con modelo interno del ERP.
- No borrar documentos fuente; mover a `_archive`.
- Usar `PENDIENTE_DE_DEFINIR` cuando falte informacion real.
- Registrar decisiones en `02_projects/<proyecto>/decisions` si son del proyecto.
- Registrar decisiones de nucleo en `01_core_erp/architecture` o en un ADR futuro del nucleo.
