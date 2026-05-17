# Dependencias de jobs

## Ejemplos

| Job | Depende de |
|---|---|
| SYSCOM product sync | Token valido |
| Publicacion Catalog | Supplier product sync |
| Pricing resolved | Catalog product + supplier price |
| Inventory availability | Supplier stock |
| DocuCore processing | File uploaded + validation passed |

## Regla

Si una dependencia falla, el job dependiente debe quedar `PENDING`, `FAILED` o `CANCELLED`, nunca ejecutarse a ciegas.
