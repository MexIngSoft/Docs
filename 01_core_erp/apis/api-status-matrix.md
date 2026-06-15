# Matriz de estado de APIs

| Tipo | APIs |
|---|---|
| Shared activas | Auth, Gateway, Catalog, Inventory, Pricing, Procurement, Sales, Supplier, Document, Fiscal, Address |
| Proyecto activas | JobCron, TecnoTelec, LexNova, DocuCore, Fiscora, Imagrafity, RefaPart |
| Servicio interno | LeadHunter/Prospecting |
| Pendientes de decision | Quote independiente, Logistics compartida, Rules Engine, Projects, Cart compartida, POS, Billing independiente, Notifications, Reporting |

Una API pasa a activa solo con repositorio, README, `.env.example`, health,
version, migraciones, contrato y validacion reproducible.
