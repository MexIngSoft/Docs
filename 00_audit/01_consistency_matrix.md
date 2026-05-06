# Matriz de consistencia documental

| Elemento | Documento origen | Documento relacionado | Coincide | Problema | Accion |
|---|---|---|---|---|---|
| Separacion nucleo/proyecto | AGENTS.md | README.md | OK | Antes estaba mezclado. | Crear `01_core_erp` y `02_projects/tecnotelec`. |
| Tecno Telec como plataforma de soluciones | AGENTS.md | `02_projects/tecnotelec/business/00_tecnotelec_identity.md` | OK | No debe tratarse como marketplace generico. | Mantener en proyecto Tecno Telec. |
| Flujo proveedor -> catalogo -> precios -> venta | Documentacion previa ERP | `01_core_erp/erp/00_erp_vision.md` | OK | Ninguno. | Mantener en nucleo. |
| Pricing como dueno de listas de precios | Documentos entrantes | `01_core_erp/erp/04_sales_model.md` y `01_core_erp/apis/04_pricing_api.md` | OK | Lista de precios no debe vivir en Supplier, Catalog ni Inventory. | Mantener en nucleo. |
| Cart vs Sales | Documentos entrantes | `01_core_erp/apis/00_api_index.md` | OK | Cart es intencion de compra, Sales es venta formal. | Separar responsabilidades. |
| Projects vs Sales | Documentacion dominio | `01_core_erp/erp/03_quote_engine.md` | OK | Projects disena solucion; Sales formaliza cotizacion/orden. | Separar APIs. |
| Rules Engine | Documentos entrantes | `01_core_erp/erp/02_rules_engine.md` | OK | Faltaba especificacion concreta. | Mantener como nucleo. |
| Gateway Tecno Telec | AGENTS.md | `02_projects/tecnotelec/decisions/adr_0001_api_gateway_name.md` | OK | El nombre `tecnotelec-gateway-api` es especifico del proyecto. | Mantener decision en proyecto. |
| Licitaciones | Documentos entrantes integrados | `01_core_erp/erp/17_government_tender.md` y `18_government_tender_adoption.md` | OK | Debe ser reusable por cualquier empresa. | Mantener como modulo de nucleo y API futura. |
| PDF visual | Imagenes extraidas | `02_projects/tecnotelec/frontend/09_interface_proposal.md` | OK | El boceto tiene textos rotos y no es interfaz final exacta. | Usarlo como referencia visual historica. |
| Syscom | Documentacion previa | `04_integrations/syscom` | OK | Antes estaba en `apis` y `etl` al nivel raiz. | Separar como integracion. |
| Operacion/seguridad/testing | Documentacion previa | `03_standards` | OK | Antes competia con arquitectura. | Mantener como estandares. |
