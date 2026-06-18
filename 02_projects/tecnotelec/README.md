# Proyecto Tecno Telec

## Objetivo

Documentar la implementacion Tecno Telec sobre el nucleo ERP.

Tecno Telec es una plataforma empresarial de soluciones tecnologicas, telecomunicaciones, redes, WiFi, energia solar, videovigilancia y proyectos completos.

## Contenido

| Carpeta | Contenido |
|---|---|
| `auth` | Proceso documental de usuarios y roles del proyecto. |
| `backend` | Contratos del Gateway General para Web Tecno Telec. |
| `business` | Identidad, objetivos, FODA, servicios y propuesta de valor. |
| `cart` | Proceso futuro de carrito, pedido y compra. |
| `catalog` | Procesos de catalogo publico y detalle de producto. |
| `frontend` | Rutas, layout, componentes, sistema visual, flujos web y preparacion de desarrollo. |
| `pricing` | Publicacion de precios y pricing avanzado futuro. |
| `quotes` | Proceso de cotizacion. |
| `solutions` | Estrategia de armado, publicacion y presentacion de soluciones. |
| `tasks` | Tareas, APIs requeridas, tablas faltantes y orden de desarrollo. |
| `decisions` | ADRs especificos de Tecno Telec. |
| `AGENTE.md` | Guia operativa de desarrollo segun instrucciones de `Docs/AGENTS.md`. |

Documento MVP:

```txt
00_initial_stage_readiness_review.md
tasks/05_mvp_scope.md
```

Plan inicial de precios:

```txt
tasks/06_pricing_first_plan.md
```

Estrategia de soluciones:

```txt
solutions/00_solution_presentation_and_assembly_strategy.md
solutions/01_dynamic_solution_technical_design.md
solutions/02_solution_operating_architecture_analysis.md
solutions/03_development_start_recommendation.md
solutions/05_solution_module_implementation_report.md
solutions/06_solution_detail_definition.md
```

Checklist previo a programar:

```txt
tasks/07_pre_development_checklist.md
```

## Regla

Tecno Telec no debe documentarse como marketplace generico. El foco es vender soluciones y proyectos, no solo productos.

Las tablas y campos publicados de Tecno Telec deben documentarse con nombres PascalCase estilo SQL Server.

## Interfaz

La propuesta de interfaz esta en `frontend/09_interface_proposal.md`.

Preparacion antes de desarrollo:

```txt
frontend/10_pre_development_analysis.md
frontend/11_web_platform_structure.md
frontend/12_initial_web_blueprint.md
frontend/18_solution_navigation_map.md
```

Arquitectura corregida:

```txt
../../01_core_erp/architecture/09_tecnotelec_gateway_corrected_pattern.md
backend/00_gateway_product_endpoints.md
catalog/00_public_catalog_process.md
catalog/01_product_detail_process.md
quotes/00_quote_process.md
quotes/02_quote_implementation_scope_analysis.md
```
