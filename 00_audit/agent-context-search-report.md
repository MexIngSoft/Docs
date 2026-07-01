# Reporte de busqueda de contexto agent

Generado: 2026-07-01T11:23:37

## Docs pendientes/bloqueos
```text
Docs\02_projects\_templates\gateway-migration-template.md:14:| Gateway anterior | PENDIENTE_DE_DEFINIR |
Docs\02_projects\_templates\gateway-migration-template.md:17:| Fecha | PENDIENTE_DE_DEFINIR |
Docs\02_projects\_templates\gateway-migration-template.md:18:| Auth | PENDIENTE_DE_DEFINIR |
Docs\02_projects\_templates\auth-migration-template.md:6:PENDIENTE_DE_DEFINIR
Docs\02_projects\_templates\auth-migration-template.md:40:| `/login` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR |
Docs\02_projects\_templates\auth-migration-template.md:46:| PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR |
Docs\02_projects\_templates\auth-migration-template.md:50:- PENDIENTE_DE_DEFINIR
Docs\02_projects\_templates\auth-migration-template.md:64:PENDIENTE_DE_DEFINIR
Docs\02_projects\_templates\api-dependencies-template.md:11:| Auth | `API.PY.DJANGO.Auth` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR |
Docs\02_projects\_templates\api-dependencies-template.md:22:- PENDIENTE_DE_DEFINIR
Docs\04_integrations\ct-internacional\README.md:10:PENDIENTE_DE_DEFINIR
Docs\04_integrations\dc-mayorista\README.md:10:PENDIENTE_DE_DEFINIR
Docs\02_projects\_ecosystem\api-version-matrix.md:16:| MexIngSof | `WEB.NJ.NEXT.MexIngSof` | `API.PY.DJANGO.Gateway` | Auth v1 | JobCron API, Sales/CRM PENDIENTE_DE_DEFINIR | Parcial | Web MVP existe; produccion de leads requiere Gateway/JobCron. |
Docs\03_standards\documentation\documentation-cleanup-standard.md:84:4. use `PENDIENTE_DE_DEFINIR` only for real missing information, not for rules
Docs\03_standards\project-completeness-standard.md:162:PENDIENTE_DE_DEFINIR
Docs\02_projects\mexingsof\technical\code-actions-map.md:42:| MEXINGSOF.CONTACT.SUBMIT | Enviar lead de contacto | form | MexIngSof | Leads | `/` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/components/ContactForm.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/contact/route.ts` | `POST /api/v1/projects/MEXINGSOF/leads` | JobCron API | PENDIENTE_DE_IMPLEMENTAR | POST | Publico con anti-abuso; admin via Auth | Prisma local temporal; destino canonico PENDIENTE_DE_DEFINIR en JobCron | loading / error / success | Gateway no disponible, validacion de formulario, persistencia temporal fallida | `npm run lint`; validar contrato Gateway antes de produccion | `api-contracts.md` | pendiente | 2026-06-29 |
Docs\02_projects\mexingsof\technical\code-actions-map.md:43:| MEXINGSOF.PRODUCTS.LIST | Listar productos/servicios | endpoint | MexIngSof | Servicios | `/` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/components/SolutionsSection.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/products/route.ts` | `GET /api/v1/projects/MEXINGSOF/services` | JobCron API o Catalog | PENDIENTE_DE_DEFINIR | GET | Publico | Prisma local temporal; Catalog/JobCron pendiente | loading / empty / error / success | Catalog/JobCron no definido, datos vacios | `npm run lint`; validar `api-contracts.md` | `api-contracts.md` | pendiente | 2026-06-29 |
Docs\02_projects\mexingsof\technical\code-actions-map.md:44:| MEXINGSOF.ADMIN.LEADS.UPDATE_STATUS | Actualizar estado de lead | button | MexIngSof | Admin leads | `/admin/leads` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/admin/leads/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/contact-leads/[id]/route.ts` | PENDIENTE_DE_DEFINIR | JobCron API/Auth | PENDIENTE_DE_DEFINIR | PATCH | PENDIENTE_DE_DEFINIR | Prisma local temporal; tabla destino PENDIENTE_DE_DEFINIR | loading / error / success | Auth admin no definido, lead inexistente | `npm run lint`; definir Auth admin antes de produccion | `tasks/00_mvp_gap_report.md` | pendiente | 2026-06-29 |
Docs\02_projects\mexingsof\technical\code-actions-map.md:45:| MEXINGSOF.ADMIN.PRODUCTS.MANAGE | Administrar productos/servicios | page | MexIngSof | Admin productos | `/admin/products` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/admin/products/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/products/route.ts` | PENDIENTE_DE_DEFINIR | Catalog o JobCron API | PENDIENTE_DE_DEFINIR | GET/POST/PATCH/DELETE | PENDIENTE_DE_DEFINIR | Prisma local temporal; Catalog/JobCron pendiente | loading / empty / error / success | Auth admin no definido, producto inexistente | `npm run lint`; definir contrato API | `productive-launch.md` | pendiente | 2026-06-29 |
Docs\02_projects\_ecosystem\06_productive_launch_plan.md:78:| MexIngSof | `GET /api/v1/projects/MEXINGSOF/services` | JobCron API o Catalog | Listar servicios/paquetes publicados. | PENDIENTE_DE_DEFINIR |
Docs\02_projects\_ecosystem\06_productive_launch_plan.md:169:   `PENDIENTE_DE_DEFINIR`.
Docs\02_projects\mexingsof\tasks\00_mvp_gap_report.md:32:| Migracion Prisma real | PENDIENTE_DE_DEFINIR: falta PostgreSQL local/oficial `mexingsof`. |
Docs\02_projects\mexingsof\tasks\00_mvp_gap_report.md:34:| Auth admin | PENDIENTE_DE_DEFINIR: debe integrarse via Gateway General/Auth, no Auth local. |
Docs\02_projects\mexingsof\tasks\00_mvp_gap_report.md:35:| Datos reales de contacto | PENDIENTE_DE_DEFINIR: telefono, ubicacion y horario final. |
Docs\02_projects\mexingsof\README.md:75:- PENDIENTE_DE_DEFINIR: dominio final de despliegue inicial.
Docs\02_projects\mexingsof\README.md:76:- PENDIENTE_DE_DEFINIR: Auth para panel admin.
Docs\03_standards\docker\project-docker-execution-documents.md:61:| MexIngSof | `Docs/02_projects/mexingsof/local-runbook.md` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | `Docker.WEB.NJ/docker-compose.mexingsof.web.yml` | Parcial; web definida, DB/API pendientes |
Docs\03_standards\docker\project-docker-execution-documents.md:88:- PENDIENTE_DE_DEFINIR: confirmar si `Docker.SW.Nginx` necesita overlays
Docs\03_standards\docker\project-docker-execution-documents.md:90:- PENDIENTE_DE_DEFINIR: confirmar si todos los runbooks listados deben usar el
Docs\02_projects\mexingsof\productive-launch.md:35:| `/api/v1/projects/MEXINGSOF/services` | GET | JobCron API o Catalog | Publicar servicios/paquetes autorizados. | PENDIENTE_DE_DEFINIR |
Docs\02_projects\mexingsof\productive-launch.md:73:| Migraciones PostgreSQL | PENDIENTE_DE_DEFINIR por conexion/base oficial. |
Docs\02_projects\mexingsof\productive-launch.md:79:- PENDIENTE_DE_DEFINIR: dominio final de despliegue.
Docs\02_projects\mexingsof\productive-launch.md:80:- PENDIENTE_DE_DEFINIR: datos reales de telefono, direccion y horarios.
Docs\02_projects\mexingsof\productive-launch.md:81:- PENDIENTE_DE_DEFINIR: si servicios viven en JobCron API o Catalog API.
Docs\02_projects\mexingsof\local-runbook.md:87:- PENDIENTE_DE_DEFINIR: URL y base PostgreSQL local/oficial.
Docs\02_projects\mexingsof\local-runbook.md:88:- PENDIENTE_DE_DEFINIR: Auth para admin.
Docs\02_projects\mexingsof\frontend.md:67:Docs/_archive/PENDIENTE_DE_DEFINIR
Docs\02_projects\mexingsof\frontend.md:89:- PENDIENTE_DE_DEFINIR: integrar Auth via Gateway General para rutas admin.
Docs\02_projects\mexingsof\frontend.md:90:- PENDIENTE_DE_DEFINIR: datos reales de telefono, direccion y horario.
Docs\02_projects\mexingsof\frontend\code-actions-map.md:18:| `/admin/leads` | MEXINGSOF.ADMIN.LEADS.UPDATE_STATUS | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/admin/leads/page.tsx` | `LeadStatusControl.tsx`, `app/api/contact-leads/[id]/route.ts` | PENDIENTE_DE_DEFINIR | pendiente |
Docs\02_projects\mexingsof\frontend\code-actions-map.md:19:| `/admin/products` | MEXINGSOF.ADMIN.PRODUCTS.MANAGE | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/admin/products/page.tsx` | `ProductAdminTable.tsx`, `app/api/products/route.ts` | PENDIENTE_DE_DEFINIR | pendiente |
Docs\02_projects\_ecosystem\01_company_portfolio.md:27:| Pensavart | `pensavart` | PENDIENTE_DE_DEFINIR | LEGACY | Decidir si se fusiona con Imagiland. |
Docs\02_projects\_ecosystem\01_company_portfolio.md:28:| Tip Smart | `tip-smart` | PENDIENTE_DE_DEFINIR | BASE | Definir app utilitaria independiente. |
Docs\02_projects\_ecosystem\01_company_portfolio.md:29:| Social Networks | `social-networks` | PENDIENTE_DE_DEFINIR | BASE | Definir automatizacion de publicaciones. |
Docs\02_projects\_ecosystem\01_company_portfolio.md:30:| MockWander | `mockwander` | PENDIENTE_DE_DEFINIR | BASE | Definir alcance etico/legal y MVP. |
Docs\02_projects\_ecosystem\01_company_portfolio.md:31:| Phone Shop | `phone-shop` | PENDIENTE_DE_DEFINIR | BASE | Definir tienda/canal de telefonia y accesorios. |
Docs\02_projects\mexingsof\api-contracts.md:64:- PENDIENTE_DE_DEFINIR: Auth/Gateway para admin.
Docs\02_projects\mexingsof\api-contracts.md:65:- PENDIENTE_DE_DEFINIR: si los leads se integran a un CRM core futuro o quedan
Docs\02_projects\mexingsof\api\code-actions-map.md:18:| MEXINGSOF.ADMIN.LEADS.UPDATE_STATUS | `PATCH /api/contact-leads/[id]` | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof/app/api/contact-leads/[id]/route.ts` | PENDIENTE_DE_DEFINIR con Auth admin | pendiente |
Docs\02_projects\tip-smart\README.md:9:PENDIENTE_DE_DEFINIR.
Docs\02_projects\tecnotelec\technical\code-actions-map.md:33:| TECNOTELEC.SOLUTIONS.LIST | Listar soluciones | page | Tecno Telec | Soluciones | `/soluciones` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/soluciones/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/lib/gateway-solutions.ts` | `GET /api/v1/projects/TECNOTELEC/solutions` | TecnoTelec API | PENDIENTE_DE_VALIDAR | GET | Publico | PENDIENTE_DE_DEFINIR | loading / empty / error / success | Gateway/API no disponible, fallback temporal | `npm run lint`; `python manage.py check` | `solutions/01_dynamic_solution_technical_design.md` | vigente_parcial | 2026-06-29 |
Docs\02_projects\tecnotelec\technical\code-actions-map.md:34:| TECNOTELEC.CATALOG.LIST | Listar catalogo publico | page | Tecno Telec | Catalogo | `/catalogo` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/catalogo/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/lib/gateway-catalog.ts` | `GET /api/v1/projects/TECNOTELEC/catalog` | Catalog/Pricing/Supplier | PENDIENTE_DE_VALIDAR | GET | Publico | PENDIENTE_DE_DEFINIR | loading / empty / error / success | Catalog/Pricing no disponible, productos sin precio | `npm run lint`; validar contrato Gateway | `catalog/00_public_catalog_process.md` | vigente_parcial | 2026-06-29 |
Docs\02_projects\tecnotelec\technical\code-actions-map.md:35:| TECNOTELEC.QUOTE.REQUEST | Solicitar cotizacion consultiva | form | Tecno Telec | Cotizaciones | `/cotizador/[solution]` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/cotizador/[solution]/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/cotizador/[solution]/actions.ts` | `POST /api/v1/projects/TECNOTELEC/quotes` | Sales API | PENDIENTE_DE_IMPLEMENTAR | POST | Publico/Auth opcional | PENDIENTE_DE_DEFINIR | loading / error / success | Validacion de formulario, Sales no disponible | `npm run lint`; validar contrato Sales | `quotes/02_quote_implementation_scope_analysis.md` | pendiente | 2026-06-29 |
Docs\02_projects\tecnotelec\technical\code-actions-map.md:36:| TECNOTELEC.AUTH.LOGIN | Login portal | page | Tecno Telec | Auth | `/login` | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/login/page.tsx` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | Auth API | PENDIENTE_DE_DEFINIR | POST | PENDIENTE_DE_DEFINIR | Auth User/Application | loading / error / success | Auth no conectado | Definir flujo antes de produccion | `auth/00_user_process.md` | pendiente | 2026-06-29 |
Docs\03_standards\codex\codex-skills-standard.md:44:- Cada skill debe usar `PENDIENTE_DE_DEFINIR` si falta informacion real.
Docs\03_standards\codex\codex-output-report-standard.md:23:- Pendientes reales con `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\operations\search-implementation-standard.md:34:  `PENDIENTE_DE_DEFINIR` en su documentacion de proyecto.
Docs\01_core_erp\erp\19_supplier_catalog_strategy.md:107:PENDIENTE_DE_DEFINIR:
Docs\02_projects\tecnotelec\tasks\08_productive_launch_plan.md:70:- PENDIENTE_DE_DEFINIR: proveedor/pricing real para primeras categorias.
Docs\01_core_erp\erp\18_government_tender_adoption.md:69:PENDIENTE_DE_DEFINIR:
Docs\03_standards\codex\codex-anti-vices-checklist.md:23:  `PENDIENTE_DE_DEFINIR`.
Docs\02_projects\lexnova\legal-process-data-model.md:598:Las siguientes decisiones quedan como `PENDIENTE_DE_DEFINIR` antes de cerrar un
Docs\03_standards\code-actions\code-actions-map-standard.md:59:| Nombre visible | Texto funcional o `PENDIENTE_DE_DEFINIR`. |
Docs\03_standards\code-actions\code-actions-map-standard.md:70:| Permiso requerido | Permiso backend o `PENDIENTE_DE_DEFINIR`. |
Docs\03_standards\code-actions\code-actions-map-standard.md:71:| Modelos/tablas afectadas | Tablas reales o `PENDIENTE_DE_DEFINIR`. |
Docs\03_standards\code-actions\code-actions-map-standard.md:82:- Si falta informacion real, usar `PENDIENTE_DE_DEFINIR`.
Docs\01_core_erp\erp\14_async_jobs_notifications.md:47:PENDIENTE_DE_DEFINIR:
Docs\01_core_erp\erp\12_billing_returns.md:44:PENDIENTE_DE_DEFINIR:
Docs\01_core_erp\erp\11_costs_profitability.md:54:PENDIENTE_DE_DEFINIR:
Docs\01_core_erp\erp\10_roles_permissions.md:103:PENDIENTE_DE_DEFINIR:
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:64:NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:PENDIENTE_DE_DEFINIR/api/$projectKey
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:169:  description: "PENDIENTE_DE_DEFINIR",
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:195:      <p>PENDIENTE_DE_DEFINIR</p>
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:262:- PENDIENTE_DE_DEFINIR: dominio visual.
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:263:- PENDIENTE_DE_DEFINIR: URL real del Gateway General.
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:297:API_DESCRIPTION=PENDIENTE_DE_DEFINIR
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:302:API_DOCS_PATH=PENDIENTE_DE_DEFINIR
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:522:- PENDIENTE_DE_DEFINIR: contratos API.
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:523:- PENDIENTE_DE_DEFINIR: permisos.
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:524:- PENDIENTE_DE_DEFINIR: modelo de datos.
Docs\03_standards\operations\scripts\New-WorkspaceProject.ps1:551:    Write-Host "Proyecto $Type creado para $Name. Revisa PENDIENTE_DE_DEFINIR antes de cerrar."
Docs\01_core_erp\erp\05_purchase_model.md:26:Politicas de autorizacion, niveles de compra y aprobadores: `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\auth\auth-feedback-standard.md:81:el reenvio o estado fino como `PENDIENTE_DE_DEFINIR` y no fingir confirmacion
Docs\03_standards\auth\auth-feedback-standard.md:111:PENDIENTE_DE_DEFINIR: endpoint de reenvio Auth/Gateway.
Docs\03_standards\auth\auth-email-notification-standard.md:148:`PENDIENTE_DE_DEFINIR`; no se debe mostrar como flujo productivo.
Docs\03_standards\auth\auth-email-notification-standard.md:165:brecha como `PENDIENTE_DE_DEFINIR` y no presentar una confirmacion tecnica
Docs\03_standards\auth\auth-email-delivery-diagnostics-standard.md:361:  "provider_request_id": "PENDIENTE_DE_DEFINIR",
Docs\03_standards\auth\auth-email-delivery-diagnostics-standard.md:362:  "provider_message_id": "PENDIENTE_DE_DEFINIR",
Docs\03_standards\auth\auth-email-delivery-diagnostics-standard.md:387:  `PENDIENTE_DE_DEFINIR`.
Docs\02_projects\jobcron\ui\03_dynamic_content_model.md:131:- PENDIENTE_DE_DEFINIR: permisos finales del administrador global por accion.
Docs\02_projects\jobcron\technical\code-actions-map.md:32:| JOBCRON.FEATURE_AVAILABILITY.LIST | Ver disponibilidad de modulos | page | JobCron | FeatureAvailability | `/admin/feature-availability` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/admin/feature-availability/page.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/lib/feature-availability.ts` | PENDIENTE_DE_DEFINIR | JobCron API | `GET /api/features/` | GET | PENDIENTE_DE_DEFINIR | `features.models.Feature`, `FeatureAvailabilityAudit` | loading / empty / error / success | API no disponible, Auth no integrado | `python manage.py check`; `npm run lint` | `feature-availability.md` | vigente_parcial | 2026-06-29 |
Docs\02_projects\jobcron\technical\code-actions-map.md:33:| JOBCRON.FEATURE_AVAILABILITY.UPDATE | Activar/desactivar modulo | form | JobCron | FeatureAvailability | `/admin/feature-availability` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/components/operation-create-form.tsx` | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/lib/feature-availability.ts` | PENDIENTE_DE_DEFINIR | JobCron API | `POST /api/features/operations/` | POST | PENDIENTE_DE_DEFINIR | `features.models.Feature`, `FeatureAvailabilityAudit` | loading / error / success | Validacion de payload, modulo inexistente, Auth no integrado | `python manage.py check`; `npm run lint` | `operational-admin-center.md` | vigente_parcial | 2026-06-29 |
Docs\02_projects\jobcron\technical\code-actions-map.md:35:| JOBCRON.SEARCH.PUBLIC | Busqueda autorizada | service | JobCron | Search | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | `GET /api/v1/projects/JOBCRON/search` | Search API | PENDIENTE_DE_IMPLEMENTAR | GET | `jobcron.search.read` | PENDIENTE_DE_DEFINIR | loading / empty / error / success | Search no sincronizado, permiso faltante | Validar contrato Search | `../../01_core_erp/apis/gateway-route-registry.md` | pendiente | 2026-06-29 |
Docs\02_projects\jobcron\productive-operations-roadmap.md:55:- PENDIENTE_DE_DEFINIR: si JobCron sera SaaS publico, ERP interno o ambos.
Docs\03_standards\architecture\shared-library-registry.md:11:Si falta evidencia real, se registra como `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\architecture\shared-library-registry.md:21:| jobcron_common | `Docker.API.PY/libs/jobcron_common` | PENDIENTE_DE_DEFINIR | Utilidades backend compartidas | PENDIENTE_DE_DEFINIR | Configuracion DB, healthcheck, errores, paginacion, auth client, logging |
Docs\03_standards\architecture\shared-library-registry.md:22:| jobcron-ui | `Docker.WEB.NJ/packages/jobcron-ui` | PENDIENTE_DE_DEFINIR | Componentes UI compartidos | PENDIENTE_DE_DEFINIR | Layout, tablas, formularios, cards, estados vacios, loaders |
Docs\03_standards\architecture\shared-library-registry.md:23:| jobcron-api-client | `Docker.WEB.NJ/packages/jobcron-api-client` | PENDIENTE_DE_DEFINIR | Cliente Gateway compartido | PENDIENTE_DE_DEFINIR | Fetcher, tokens, errores normalizados, tipos compartidos |
Docs\01_core_erp\database\07_sales_model.md:15:Facturacion CFDI Mexico: `PENDIENTE_DE_DEFINIR`.
Docs\01_core_erp\database\04_catalog_model.md:18:Modelo final de kits/bundles: `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\api\api-decision-record-standard.md:23:Si alguno de estos documentos no existe, registrar `PENDIENTE_DE_DEFINIR` en el
Docs\03_standards\api\api-contract-first-standard.md:28:Si falta informacion real, usar `PENDIENTE_DE_DEFINIR`. No inventar endpoints,
Docs\03_standards\api\address-api-standard.md:49:| `GET /postal-codes/{postalCode}` | PENDIENTE_DE_DEFINIR |
Docs\03_standards\api\address-api-standard.md:50:| `GET /settlements?postalCode=` | PENDIENTE_DE_DEFINIR |
Docs\03_standards\api\address-api-standard.md:51:| `POST /addresses/normalize` | PENDIENTE_DE_DEFINIR |
Docs\03_standards\api\address-api-standard.md:52:| `POST /addresses/validate` | PENDIENTE_DE_DEFINIR |
Docs\02_projects\jobcron\api\code-actions-map.md:11:| JOBCRON.FEATURE_AVAILABILITY.LIST | `GET /api/features/` | `Docker.API.PY/API.PY.DJANGO.JobCron/features/views.py` | GET | `Feature`, `FeatureAvailabilityAudit` | PENDIENTE_DE_DEFINIR | vigente_parcial |
Docs\02_projects\jobcron\api\code-actions-map.md:12:| JOBCRON.FEATURE_AVAILABILITY.UPDATE | `POST /api/features/operations/` | `Docker.API.PY/API.PY.DJANGO.JobCron/features/views.py` | POST | `Feature`, `FeatureAvailabilityAudit` | PENDIENTE_DE_DEFINIR | vigente_parcial |
Docs\02_projects\jobcron\api\code-actions-map.md:14:| JOBCRON.SEARCH.PUBLIC | PENDIENTE_DE_IMPLEMENTAR | PENDIENTE_DE_DEFINIR | GET | Search API | `jobcron.search.read` | pendiente |
Docs\02_projects\tecnotelec\frontend\code-actions-map.md:16:| `/cotizador` | TECNOTELEC.QUOTE.START | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/cotizador/page.tsx` | `components/quote-stepper-preview.tsx` | PENDIENTE_DE_DEFINIR | vigente_parcial |
Docs\02_projects\tecnotelec\frontend\code-actions-map.md:18:| `/login` | TECNOTELEC.AUTH.LOGIN | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/login/page.tsx` | PENDIENTE_DE_DEFINIR | Auth/Gateway pendiente | pendiente |
Docs\03_standards\operations\project-script-behavior-matrix.md:96:- Cualquier API o web faltante debe documentarse como `PENDIENTE_DE_DEFINIR`
Docs\01_core_erp\auth\user-application-traceability.md:220:- PENDIENTE_DE_DEFINIR: endpoint administrativo via Gateway para consultar
Docs\01_core_erp\auth\user-application-traceability.md:222:- PENDIENTE_DE_DEFINIR: politica productiva de borrado por cumplimiento legal
Docs\03_standards\operations\project-docker-dependency-map.md:68:| MexIngSof | `3009` | `WEB.NJ.NEXT.MexIngSof` | `auth gateway jobcron search` | `PENDIENTE_DE_DEFINIR`; MVP actual usa Prisma local | `start-mexingsof.ps1` | `stop-mexingsof.ps1` |
Docs\03_standards\operations\project-docker-dependency-map.md:81:| MexIngSof | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | `Docker.WEB.NJ/docker-compose.mexingsof.web.yml` |
Docs\03_standards\operations\local-port-registry.md:54:| `3010-3050` | Futuras webs | PENDIENTE_DE_DEFINIR | Reservado |
Docs\03_standards\operations\local-port-registry.md:84:| `8024` | REFAPART API | `Docker.API.PY/API.PY.DJANGO.Refapart` | PENDIENTE_DE_DEFINIR |
Docs\03_standards\operations\local-port-registry.md:86:| `8026-8050` | Futuras APIs/Gateways | PENDIENTE_DE_DEFINIR | Reservado |
Docs\03_standards\operations\git-repository-map.md:28:- La rama default en GitHub requiere permiso administrativo; si no se puede cambiar desde terminal, se registra como `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\operations\git-repository-map.md:172:  `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\operations\git-repository-map.md:242:- PENDIENTE_DE_DEFINIR: confirmar si todos los repos tendran protecciones
Docs\03_standards\operations\git-repository-map.md:358:- PENDIENTE_DE_DEFINIR: crear o corregir acceso remoto para
Docs\03_standards\operations\git-repository-map.md:360:- PENDIENTE_DE_DEFINIR: asignar `main`, `dev` o `pro` como default branch de
Docs\03_standards\operations\git-repository-map.md:418:- PENDIENTE_DE_DEFINIR: corregir acceso o crear remotos para
Docs\03_standards\operations\git-repository-map.md:421:- PENDIENTE_DE_DEFINIR: asignar `main`, `dev` o `pro` como default branch de
Docs\02_projects\tecnotelec\frontend\10_pre_development_analysis.md:53:| Rules Engine | PENDIENTE_DE_DEFINIR | Requerido para diagnostico inteligente avanzado. |
Docs\02_projects\tecnotelec\frontend\10_pre_development_analysis.md:54:| Projects | PENDIENTE_DE_DEFINIR | Requerido para seguimiento de proyectos completos. |
Docs\03_standards\operations\context-packs.md:161:- si falta informacion real, usar `PENDIENTE_DE_DEFINIR`;
Docs\02_projects\tecnotelec\frontend\05_design_system.md:25:Fuente final de marca: `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\operations\codex-execution-standard.md:55:- Faltantes con `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\operations\codex-anti-patterns.md:23:| Crear endpoints sin registrar contrato | Rompe trazabilidad | Documentar contrato o usar `PENDIENTE_DE_DEFINIR` |
Docs\03_standards\operations\codex-anti-patterns.md:29:| Crear proyecto sin `api-dependencies.md` | Deja dependencias ambiguas | Crear documento o marcar `PENDIENTE_DE_DEFINIR` |
Docs\03_standards\operations\codex-anti-patterns.md:30:| Crear proveedor externo sin `mappers.md` | Mezcla datos externos con ERP | Documentar mapper o `PENDIENTE_DE_DEFINIR` |
Docs\agents\_archive\2026-06-18\AGENTS-014.md:383:15. Registrar pendientes como `PENDIENTE_DE_DEFINIR`.
Docs\agents\_archive\2026-06-18\AGENTS-013.md:375:Si falta información real, usar PENDIENTE_DE_DEFINIR.
Docs\01_core_erp\architecture\04_security.md:37:Modelo final RBAC/ABAC: `PENDIENTE_DE_DEFINIR`.
Docs\02_projects\tecnotelec\business\06_value_proposition.md:22:Mensajes comerciales finales, slogan y tono de marca: `PENDIENTE_DE_DEFINIR`.
Docs\03_standards\frontend\pre-development-checklist.md:36:PENDIENTE_DE_DEFINIR
Docs\02_projects\tecnotelec\business\03_business_model.md:25:Montos, margenes objetivo y politicas comerciales: `PENDIENTE_DE_DEFINIR`.
Docs\02_projects\tecnotelec\business\02_foda.md:24:- Estrategia de facturacion y pagos: `PENDIENTE_DE_DEFINIR`.
Docs\agents\specialized\tecnotelec.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\tecnotelec.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\tecnotelec.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\tecnotelec.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\refapart.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\refapart.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\refapart.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\refapart.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\payments-billing.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\payments-billing.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\payments-billing.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\payments-billing.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\nginx.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\nginx.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\nginx.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\nginx.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\mexingsof.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\mexingsof.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\mexingsof.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\mexingsof.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\02_projects\tecnotelec\business\00_tecnotelec_identity.md:33:Datos de segmentos finales, tamanos de empresa y zonas comerciales: `PENDIENTE_DE_DEFINIR`.
Docs\agents\specialized\jobcron.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\jobcron.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\jobcron.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\jobcron.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\gateway.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\gateway.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\gateway.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\gateway.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\frontend.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\frontend.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\frontend.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\frontend.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\erp-modules.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\erp-modules.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\erp-modules.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\erp-modules.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\documentation-cleanup.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\documentation-cleanup.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\documentation-cleanup.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\documentation-cleanup.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\docker.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\docker.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\docker.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\docker.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\database.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\database.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\database.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\database.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\customer-crm.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\customer-crm.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\customer-crm.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\customer-crm.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\code-audit.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\code-audit.md:92:- `BLOQUEADO_POR_CREDENCIALES`
Docs\agents\specialized\code-audit.md:93:- `BLOQUEADO_POR_INFRAESTRUCTURA`
Docs\agents\specialized\code-audit.md:94:- `BLOQUEADO_POR_PROVEEDOR_EXTERNO`
Docs\agents\specialized\backend-api.md:91:- `BLOQUEADO_POR_DECISION`
Docs\agents\specialized\backend-api.md:92:- `BLOQUEADO_POR_CREDENCIALES`
```

## Fetch/direct API en webs
```text
Docker.WEB.NJ\README.md:41:| `NEXT_PUBLIC_GATEWAY_BASE_URL` | `http://localhost/api/tecnotelec` | Entrada al gateway de Tecno Telec. |
```

## SQLite prohibido
```text
Sin coincidencias.
```

## Nginx rutas
```text
Docker.SW.Nginx\nginx.conf:19:        proxy_pass $jobcron_web_server;
Docker.SW.Nginx\nginx.conf:29:        proxy_pass $jobcron_web_server;
Docker.SW.Nginx\nginx.conf:34:        proxy_pass $web_server;
Docker.SW.Nginx\nginx.conf:64:        proxy_pass $tecnotelec_web_server;
Docker.SW.Nginx\nginx.conf:69:        proxy_pass $web_server;
Docker.SW.Nginx\nginx.conf:98:        proxy_pass $lexnova_web_server;
Docker.SW.Nginx\nginx.conf:103:        proxy_pass $web_server;
```

## Application code
```text
Sin coincidencias.
```

