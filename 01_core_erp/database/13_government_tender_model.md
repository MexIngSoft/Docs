# Modelo de datos: GovernmentTender

## Schema

```text
GovernmentTender
```

## Tablas principales

```text
GovernmentTender.TenderOpportunities
GovernmentTender.TenderRequirements
GovernmentTender.TenderProposals
GovernmentTender.TenderDocuments
GovernmentTender.TenderEvents
```

## Campos base

```text
TenderOpportunities
- ExternalSource
- ExternalId
- Title
- InstitutionName
- ProcedureType
- TenderStatus
- PublishDate
- DeadlineDate
- EstimatedAmount
- Currency
- Category
- SourceUrl
- RawData
```

## Relaciones

- `TenderProposals.ProjectId` apunta a `Projects`.
- `TenderProposals.QuoteId` apunta a `Sales`.
- `TenderDocuments` apunta al repositorio documental definido.

