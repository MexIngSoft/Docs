# Search API

## Base

La API Search se consume por Gateway General.

```text
Web -> Gateway General -> Search API
```

## Endpoints Canonicos

```text
POST /api/search/query/
POST /api/search/normalize/
GET  /api/search/suggestions/
POST /api/search/index/
POST /api/search/bulk-index/
POST /api/search/delete/
POST /api/search/bulk-delete/
POST /api/search/reindex/
POST /api/search/reconcile/
POST /api/search/retry-failed/
GET  /api/search/logs/
GET  /api/search/events/
GET  /api/search/sync-status/
GET  /api/search/demands/
POST /api/search/demands/
PATCH /api/search/demands/{id}/
```

## Contrato Minimo

Los requests deben enviar `projectCode`, `domainCode`, `entityType` y
`externalId` cuando creen, actualicen, restauren o eliminen documentos del
indice.

El frontend no debe llamar esta API directamente; debe usar `NEXT_PUBLIC_GATEWAY_BASE_URL`.

## Contrato de Indexacion

Cada API origen debe publicar a Search un documento normalizado con:

- `projectCode`: codigo del proyecto propietario.
- `domainCode`: dominio funcional del documento.
- `tenantCode`: tenant o contexto comercial, si aplica.
- `entityType`: tipo de entidad origen.
- `externalId`: identificador estable en la API origen.
- `title`: texto principal buscable.
- `subtitle`: texto secundario opcional.
- `content` o `searchableText`: texto completo buscable.
- `keywords`: lista de terminos adicionales.
- `payload` o `attributes`: datos no sensibles necesarios para resolver el resultado.
- `permissions`: reglas de visibilidad evaluables por backend.
- `version` o `sourceVersion`: version monotona del origen.
- `sourceUpdatedAt`: fecha de ultima actualizacion en origen.

Search debe aplicar `UPSERT` idempotente. Un documento con el mismo
`projectCode`, `domainCode`, `entityType` y `externalId` se actualiza, no se
duplica.

## Recuperacion Automatica

Si una entidad quedo guardada en la tabla origen pero no llego a Search, la API
origen debe poder reenviar el documento completo mediante `bulk-index`,
`reindex` o `reconcile`.

Reglas:

- Los eventos atrasados no deben sobrescribir informacion mas reciente si su
  `version` o `sourceUpdatedAt` es menor que el valor indexado.
- `delete` debe soportar borrado logico, restauracion y borrado fisico
  controlado.
- `bulk-delete` se usa para bajas masivas por dominio o entidad.
- `reconcile` compara el lote fuente contra el indice y registra
  `SearchSyncStatus` con faltantes, sobrantes, fallos y fecha de conciliacion.
- `retry-failed` reprocesa eventos fallidos sin requerir que el frontend
  intervenga.
- Todo error de indexacion debe quedar en `SearchIndexEvent` con payload,
  estado, intento y mensaje de error.

Search es reconstruible desde las APIs origen. Si no existe endpoint origen
para exportar la entidad completa, se registra `PENDIENTE_DE_DEFINIR` en el
proyecto que corresponda.
