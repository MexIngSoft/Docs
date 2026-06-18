# Panorama de base de datos

## Objetivo

Documentar entidades, schemas y tablas reutilizables del nucleo ERP.

## Base oficial

La base de datos oficial del ecosistema es PostgreSQL.

PostgreSQL es obligatorio para:

- desarrollo;
- pruebas integradas;
- staging;
- produccion;
- Docker local.

Esta prohibido usar:

- motores embebidos de archivo;
- archivos locales de base de datos;
- fallback local;
- motores embebidos.

Regla de publicacion: toda tabla publicable debe documentarse con nombres PascalCase estilo SQL Server.

Documento canonico:

```txt
Docs/03_standards/database/sql-server-publication-standard.md
```

Base principal recomendada:

```text
jobcron
```

## Schemas principales

- Auth.
- Catalog.
- Inventory.
- Pricing.
- Supplier.
- Procurement.
- Sales.
- Search.
- Notification.
- Document.
- FeatureVisibility.
- Refapart.
- LexNova.
- Fiscora.

## Modelos canonicos

- `04_catalog_model.md`
- `05_supplier_model.md`
- `06_pricing_model.md`
- `07_sales_model.md`
- `08_quotes_model.md`
- `09_cart_model.md`
- `10_pos_model.md`
- `11_rules_model.md`
- `12_billing_model.md`
- `13_government_tender_model.md`
- `14_documents_model.md`
- `15_channel_assortment_model.md`
- `16_product_compatibility_model.md`
- `17_sql_server_table_publication.md`
