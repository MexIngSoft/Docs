# Modelo de datos: ChannelAssortment

## Schema

```text
Catalog
```

## Objetivo

Controlar que productos del catalogo interno se muestran en cada proyecto o canal.

## Tablas principales

```text
Catalog.ChannelAssortments
Catalog.ChannelAssortmentRules
Catalog.ProjectCategoryPolicies
```

## Campos base

```text
ChannelAssortments
- Id
- ProjectCode
- ChannelCode
- ProductId
- CategoryId
- PublishStatus
- DisplayNameOverride
- DescriptionOverride
- RequiresService
- RequiresHumanReview
- MinimumMargin
- IsActive
```

## Estados

```text
HIDDEN
VISIBLE
QUOTE_ONLY
SELLABLE
COMPONENT_ONLY
BLOCKED
```

