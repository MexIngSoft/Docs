# Modelo De Datos Search

## Tablas Logicas

- `SearchDocument`
- `SearchDictionaryTerm`
- `SearchQueryLog`
- `SearchDemand`

## Reglas

- Cada documento indexado pertenece a un `projectCode`.
- Cada documento puede pertenecer a un `domainCode`.
- Las consultas se guardan para auditoria operativa.
- Si una busqueda no devuelve resultados, puede generar demanda no satisfecha.

## Separacion

Search guarda indice y demanda de busqueda.

No reemplaza Catalog, Inventory, Pricing, Supplier ni Sales.
