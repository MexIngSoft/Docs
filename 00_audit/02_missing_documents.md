# Documentos faltantes detectados

## Ya creados

| Documento | Motivo | Estado |
|---|---|---|
| `01_core_erp/README.md` | Explicar el nucleo reutilizable. | CREADO |
| `02_projects/README.md` | Separar proyectos del nucleo. | CREADO |
| `02_projects/tecnotelec/README.md` | Explicar proyecto Tecno Telec. | CREADO |
| `03_standards/README.md` | Explicar estandares. | CREADO |
| `04_integrations/README.md` | Explicar integraciones. | CREADO |
| `01_core_erp/erp/02_rules_engine.md` | Hueco critico detectado en documentos nuevos. | CREADO |
| `01_core_erp/apis/08_rules_engine_api.md` | API requerida por Rules Engine. | CREADO |
| `02_projects/tecnotelec/frontend/04_web_references.md` | Requerido por PDF/bocetos. | CREADO |
| `02_projects/tecnotelec/tasks/01_required_apis.md` | Necesario para APIs faltantes. | CREADO |
| `02_projects/tecnotelec/tasks/02_required_tables.md` | Necesario para tablas faltantes. | CREADO |
| `01_core_erp/erp/07_cart_model.md` | Separar carrito web de venta formal. | CREADO |
| `01_core_erp/erp/08_pos_model.md` | Separar punto de venta de Sales. | CREADO |
| `01_core_erp/erp/09_system_states.md` | Estados reutilizables del ERP. | CREADO |
| `01_core_erp/erp/10_roles_permissions.md` | Roles y permisos base. | CREADO |
| `01_core_erp/erp/11_costs_profitability.md` | Costos reales, margen y utilidad. | CREADO |
| `01_core_erp/erp/12_billing_returns.md` | Facturacion y devoluciones. | CREADO |
| `01_core_erp/erp/13_error_consistency.md` | Falla, retry, estados intermedios y consistencia. | CREADO |
| `01_core_erp/erp/14_async_jobs_notifications.md` | Jobs de fondo y notificaciones. | CREADO |
| `01_core_erp/erp/15_bundles_kits.md` | Kits, bundles y soluciones compuestas. | CREADO |
| `01_core_erp/erp/16_addresses_customers.md` | Clientes y direcciones reutilizables. | CREADO |
| `01_core_erp/erp/17_government_tender.md` | Licitaciones como inteligencia y seguimiento. | CREADO |
| `01_core_erp/architecture/06_general_system_diagram.md` | Diagrama logico del ERP. | CREADO |
| `01_core_erp/architecture/08_data_isolation_and_reference_tables.md` | Requerido para separar APIs, bases propias y evaluar tablas referenciadas PostgreSQL. | CREADO |
| `02_projects/tecnotelec/AGENTE.md` | Requerido por `Docs/AGENTS.md` para guiar desarrollo pendiente y realizado. | CREADO |
| `01_core_erp/apis/10_cart_api.md` | API de carrito web. | CREADO |
| `01_core_erp/apis/11_pos_api.md` | API de punto de venta. | CREADO |
| `01_core_erp/apis/12_government_tender_api.md` | API de licitaciones. | CREADO |
| `01_core_erp/apis/13_billing_api.md` | API de facturacion. | CREADO |
| `01_core_erp/apis/14_notifications_api.md` | API de notificaciones. | CREADO |
| `01_core_erp/flows/07_cart_flow.md` | Flujo carrito web. | CREADO |
| `01_core_erp/flows/08_pos_flow.md` | Flujo punto de venta. | CREADO |
| `01_core_erp/flows/09_returns_flow.md` | Flujo devoluciones. | CREADO |
| `01_core_erp/flows/10_error_consistency_flow.md` | Flujo de errores y consistencia. | CREADO |
| `01_core_erp/flows/11_government_tender_flow.md` | Flujo licitaciones. | CREADO |
| `03_standards/frontend/nextjs-project-standard.md` | Requerido por `Docs/AGENTS.md` para estandarizar proyectos web. | CREADO |
| `03_standards/frontend/shared-docker-frontend-architecture.md` | Requerido por `Docs/AGENTS.md` para convivencia de varios Next.js en Docker. | CREADO |
| `03_standards/frontend/pre-development-checklist.md` | Requerido por `Docs/AGENTS.md` para validar antes de programar frontend. | CREADO |
| `02_projects/tecnotelec/frontend/10_pre_development_analysis.md` | Requerido por `Docs/AGENTS.md` antes del desarrollo web. | CREADO |
| `02_projects/tecnotelec/frontend/11_web_platform_structure.md` | Requerido por `Docs/AGENTS.md` para estructura funcional. | CREADO |
| `02_projects/tecnotelec/frontend/12_initial_web_blueprint.md` | Requerido por `Docs/AGENTS.md` para propuesta inicial implementable. | CREADO |

## Pendientes reales

- Revisar visualmente el PDF archivado.
- Confirmar si `GovernmentTender API` entra en alcance del MVP o fase posterior.
- Confirmar si `Cart API` y `POS API` seran proyectos/repos independientes o modulos posteriores.
- Confirmar proveedor de secretos y estrategia CI/CD.
- Confirmar proveedor fiscal y alcance CFDI.
- Confirmar proveedor de notificaciones.
- Confirmar datos reales de contacto de Tecno Telec antes de implementar la web.
- Confirmar contrato final de `tecnotelec-gateway-api` para MVP frontend.
