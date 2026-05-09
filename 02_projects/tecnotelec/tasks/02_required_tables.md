# Tablas requeridas

## Regla de publicacion

Cuando estas tablas pasen de requeridas a publicadas, deben documentarse con nombres PascalCase estilo SQL Server segun:

```txt
Docs/03_standards/database/sql-server-publication-standard.md
```

| Tabla | Modulo | Existe | Motivo | Prioridad |
|---|---|---|---|---|
| Product | Catalog | PENDIENTE_DE_CONFIRMAR | Producto interno. | ALTA |
| Category | Catalog | PENDIENTE_DE_CONFIRMAR | Clasificacion interna. | ALTA |
| Brand | Catalog | PENDIENTE_DE_CONFIRMAR | Marca interna. | ALTA |
| Supplier | Supplier | SI | Proveedor. | ALTA |
| SupplierProduct | Supplier | SI | Producto externo. | ALTA |
| SupplierStock | Supplier | SI | Stock proveedor. | ALTA |
| SupplierPrice | Supplier | SI | Costo/precio proveedor. | ALTA |
| Quote | Quote/Sales | NO | Cotizacion. | ALTA |
| QuoteItem | Quote/Sales | NO | Partidas y snapshot. | ALTA |
| Order | Sales | PENDIENTE_DE_CONFIRMAR | Pedido confirmado. | ALTA |
| OrderItem | Sales | PENDIENTE_DE_CONFIRMAR | Partidas de orden. | ALTA |
| Customer | Sales/Auth | NO | Cliente. | ALTA |
| Address | Sales | NO | Direcciones. | ALTA |
| Shipment | Logistics | NO | Envio. | MEDIA |
| Rule | Rules | NO | Regla negocio. | ALTA |
| RuleCondition | Rules | NO | Condiciones. | ALTA |
| RuleAction | Rules | NO | Acciones. | ALTA |
| TecnoTelecServiceConfig | TecnoTelec | NO | Configuracion propia de servicios/soluciones del proyecto. | ALTA |
| TecnoTelecLeadForm | TecnoTelec | NO | Formularios de diagnostico/contacto especificos del proyecto. | ALTA |
| TecnoTelecProjectCase | TecnoTelec | NO | Casos o proyectos tipo mostrados en la web. | MEDIA |
