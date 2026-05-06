# Modelo de datos: Documents

## Schema

```text
Documents
```

## Tablas principales

```text
Documents.Documents
Documents.DocumentVersions
Documents.DocumentLinks
Documents.DocumentEvents
```

## Campos base

```text
Documents
- Id
- DocumentType
- Name
- Description
- Status
- ExpiresAt
- CreatedByUserId
- CreatedAt
```

```text
DocumentLinks
- Id
- DocumentId
- ContextType
- ContextId
- RelationType
```

## Contextos comunes

```text
CUSTOMER
PROJECT
QUOTE
SALES_ORDER
INVOICE
GOVERNMENT_TENDER
SUPPLIER
```

