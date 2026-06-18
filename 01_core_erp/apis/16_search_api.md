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
POST /api/search/reindex/
GET  /api/search/logs/
GET  /api/search/demands/
POST /api/search/demands/
PATCH /api/search/demands/{id}/
```

## Contrato Minimo

Los requests deben enviar `projectCode` y, cuando aplique, `domainCode`.

El frontend no debe llamar esta API directamente; debe usar `NEXT_PUBLIC_GATEWAY_BASE_URL`.
