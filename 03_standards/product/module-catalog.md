# Catalogo global de modulos

## Objetivo

Mantener una vista unica de modulos core, compartidos, comerciales e internos.

## Catalogo inicial

| Modulo | Tipo | Owner documental | Estado |
|---|---|---|---|
| Auth | Core ERP | `01_core_erp/auth` | Activo |
| Billing | Core ERP | `01_core_erp/erp/12_billing_returns.md` | Activo |
| Jobs/Scheduler | Core ERP / JobCron | `01_core_erp/architecture/scheduling` | Activo |
| FeatureAvailability | Shared Module / JobCron | `02_projects/jobcron/feature-availability.md` | Activo |
| Document Intelligence | Shared Module | `02_projects/docucore/document-intelligence.md` | MVP |
| PDF Tools | Commercial Module | `02_projects/docucore/tools-catalog.md` | MVP |
| DocuCore Credits | Commercial Module | `02_projects/docucore/monetization-and-credits.md` | Documentado |
| DocuCore Ads | Commercial Module | `02_projects/docucore/advertising-strategy.md` | Documentado |
| Execution Resource Manager | Core ERP / Shared Operational Module | `01_core_erp/erp/24_execution_resource_manager.md` | Documentado |
| LexNova Case Management | Independent Product Module | `02_projects/lexnova` | Activo |
| Fiscora CFDI | Independent Product Module | `02_projects/fiscora` | Activo |
| Imagrafity Customizer | Independent Product Module | `02_projects/imagrafity` | Pendiente |
| Tecno Telec Catalog/Quote | Project Module | `02_projects/tecnotelec` | Activo |

## Regla de alta

Antes de agregar un modulo:

1. Clasificar tipo.
2. Definir owner.
3. Definir proyecto consumidor.
4. Documentar API/Gateway si aplica.
5. Documentar datos y permisos.
6. Definir monetizacion si es comercial.
