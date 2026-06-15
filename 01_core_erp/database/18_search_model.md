# Modelo Search

Tablas publicadas en schema `[Search]`:

- `[Search].[Domain]`
- `[Search].[Index]`
- `[Search].[DictionaryTerm]`
- `[Search].[QueryLog]`
- `[Search].[ResultLog]`
- `[Search].[UnfulfilledDemand]`

Usan `Id` UUID, campos PascalCase, auditoria temporal e indices por proyecto,
dominio, texto normalizado, entidad y estado.
