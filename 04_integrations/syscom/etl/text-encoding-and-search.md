# SYSCOM text encoding and searchable catalog data

## Rule

All text downloaded from SYSCOM must be normalized before it is saved in Supplier tables and before it is published to Core Catalog.

This applies to:

- product names,
- models,
- descriptions,
- SAT descriptions,
- brands,
- categories,
- resource names,
- raw JSON payloads that are reused for publishing.

## Implementation

The ETL uses `supplier.syscom.text` for:

- common UTF-8 mojibake repair,
- common `?` replacement repair in known SYSCOM/SAT Spanish terms,
- recursive normalization of JSON payloads.

The HTTP client normalizes JSON immediately after `response.json()`. Writers and publishers also normalize before writing to database.

## Search behavior

Catalog search includes:

- `Name`,
- `Model`,
- `ExternalProductId`,
- `DescriptionHtml`,
- `SatDescription`,
- `Brand.Name`,
- `PrimaryCategory.Name`.

Catalog search also expands common unaccented search terms into accented equivalents. Example:

- `camara` also searches `cámara` and `cámaras`,
- `bateria` also searches `batería` and `baterías`,
- `energia` also searches `energía`.

This keeps product search useful for users who do not type accents.

## Repair command

Existing data can be repaired with:

```bash
sh /usr/src/api/start.sh manage supplier repair_syscom_text_encoding
```

The command repairs Supplier data and the published Catalog projection.

## Validation performed

Date: 2026-05-09

Results after repair:

- `SatDescription` with `?`: `0`
- products with clear `Ã/Â` markers: `1`, remaining marker is inside HTML comment content and does not affect card summary or search terms.
- `SatDescription` containing `cámaras`: `623`
- `SatDescription` containing `baterías`: `79`
- `SatDescription` containing `energía`: `27`
- Catalog API search `camara`: `1072` results.
- Gateway search `camara`: `1072` results.

Python JSON validation confirmed that API text returns real UTF-8 strings such as:

```text
Energía
Cámaras
```

## Pending

If new SYSCOM/SAT terms appear with `?`, add the mapping to `supplier.syscom.text` and rerun `repair_syscom_text_encoding`.

## Clean reload preparation

Date: 2026-05-09

The API container was stopped before the reset so the automatic worker would not reinsert data during verification.

The following ETL-owned or ETL-affected tables were truncated and verified with `0` rows:

- `Supplier.Suppliers`
- `Supplier.SupplierCategories`
- `Supplier.SupplierBrands`
- `Supplier.SupplierProducts`
- `Supplier.SupplierStock`
- `Supplier.SupplierPrices`
- `Supplier.SupplierProductRelations`
- `Supplier.SyscomTokens`
- `Supplier.SupplierSyncLog`
- `Catalog.Categories`
- `Catalog.Brands`
- `Catalog.BrandCategory`
- `Catalog.Products`
- `Catalog.ProductCategoryLink`
- `Catalog.ProductImages`
- `Catalog.ProductResources`
- `Catalog.ProductFeatures`
- `Catalog.ProductVariants`
- `Catalog.ProductRelations`
- `Pricing.ProductPrices`

Tables not truncated:

- `Supplier.SupplierProviders`
- `Pricing.PriceLists`
- `Pricing.MarginRules`
- Django migration/auth/session tables.

Next verification step:

1. Start `api-multiproyecto`.
2. Let the SYSCOM worker run the bootstrap sync.
3. Validate counts and searches again for `camara`, `cámara`, `bateria`, `batería`, `energia` and `energía`.
