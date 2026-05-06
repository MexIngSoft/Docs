# Modelo de datos: ProductCompatibility

## Schema

```text
Catalog
```

## Objetivo

Modelar atributos y relaciones de compatibilidad tecnica entre productos.

## Tablas principales

```text
Catalog.ProductAttributes
Catalog.ProductCompatibilityRules
Catalog.ProductCompatibilityChecks
Catalog.ProductAttributeDefinitions
```

## Compatibilidad

```text
ProductCompatibilityRules
- Id
- SourceProductId
- TargetProductId NULL
- SourceCategoryId
- TargetCategoryId
- RelationType
- ConditionJson
- Explanation
- ConfidenceLevel
- IsActive
```

## Reglas

- Los atributos deben ser estructurados.
- Las reglas deben poder aplicar por producto o por categoria.
- La compatibilidad automatica requiere datos suficientes.
- Si faltan datos, el resultado debe ser `REQUIRES_REVIEW`.

