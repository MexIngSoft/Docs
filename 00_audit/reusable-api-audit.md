# Auditoria de APIs reutilizables

## Objetivo

Registrar si una necesidad funcional debe resolverse con APIs reutilizables
vigentes antes de proponer una API especializada.

## Regla principal

Codex no debe crear una API nueva sin revisar:

- `01_core_erp/apis/reusable-api-contracts.md`
- `01_core_erp/apis/api-decision-matrix.md`
- `00_audit/reusable-api-map.md`

## APIs reutilizables vigentes

| API | Estado documental | Faltante real |
|---|---|---|
| Auth | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Gateway General | Documentada como entrada unica | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Catalog | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Inventory | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Pricing | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Supplier | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Procurement | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Sales | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Search | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Document | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Notification | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| FeatureVisibility | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| ETL | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Fiscal | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |
| Address | Documentada como responsabilidad reutilizable | PENDIENTE_DE_DEFINIR: contrato endpoint final |

## Decision vigente

Una API especializada solo se evalua si la necesidad no encaja en una API
reutilizable y existe logica exclusiva de dominio, datos propios, reglas
propias, formularios propios o integracion exclusiva.

## Revision pendiente

- PENDIENTE_DE_DEFINIR: completar endpoints reales por API reutilizable.
- PENDIENTE_DE_DEFINIR: registrar consumidores reales por proyecto cuando cada
  MVP cierre contrato.
