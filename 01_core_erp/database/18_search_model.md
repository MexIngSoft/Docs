# Modelo Search

Tablas publicadas en schema `[Search]`:

- `[Search].[Domain]`
- `[Search].[Index]`
- `[Search].[DictionaryTerm]`
- `[Search].[QueryLog]`
- `[Search].[ResultLog]`
- `[Search].[UnfulfilledDemand]`
- `[Search].[IndexEvent]`
- `[Search].[SyncStatus]`

Usan `Id` UUID, campos PascalCase, auditoria temporal e indices por proyecto,
dominio, texto normalizado, entidad y estado.

## Indice

`[Search].[Index]` representa el documento buscable, no la tabla fuente.

Campos minimos:

- `ProjectCode`
- `DomainCode`
- `TenantCode`
- `EntityType`
- `ExternalId`
- `Title`
- `Subtitle`
- `Content`
- `Keywords`
- `PayloadJson`
- `PermissionsJson`
- `SourceVersion`
- `SourceUpdatedAt`
- `SourceHash`
- `IndexedAt`
- `DeletedAt`
- `IsActive`

La unicidad logica del indice es:

```text
ProjectCode + DomainCode + EntityType + ExternalId
```

## Eventos de Indexacion

`[Search].[IndexEvent]` registra cada intento de sincronizacion.

Tipos canonicos:

- `UPSERT`
- `DELETE`
- `RESTORE`
- `HARD_DELETE`
- `BULK_REINDEX`
- `BULK_DELETE`

Estados canonicos:

- `PROCESSED`
- `SKIPPED`
- `FAILED`

La tabla conserva `PayloadJson`, `ErrorMessage`, `Attempts` y `ProcessedAt`
para permitir reintentos automaticos y auditoria operativa.

## Estado de Sincronizacion

`[Search].[SyncStatus]` resume conciliaciones por:

```text
ProjectCode + DomainCode + TenantCode + EntityType
```

Campos minimos:

- `SourceCount`
- `IndexedCount`
- `MissingCount`
- `StaleCount`
- `FailedCount`
- `LastReconciledAt`
- `LastError`

Si `MissingCount`, `StaleCount` o `FailedCount` es mayor que cero, el proyecto
origen debe ejecutar una conciliacion o exponer el export completo necesario.
