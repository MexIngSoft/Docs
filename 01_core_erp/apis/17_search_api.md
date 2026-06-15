# Search API

## Endpoints

```text
POST /api/search/query
POST /api/search/normalize
GET  /api/search/suggestions
POST /api/search/index
POST /api/search/reindex
GET  /api/search/logs
GET  /api/search/demands
POST /api/search/demands
PATCH /api/search/demands/{id}
```

Toda solicitud incluye `ProjectCode`, `DomainCode`, `UserId` o `SessionId`.
Los resultados incluyen consulta normalizada, intencion, score, tipo de
coincidencia y estado de demanda.
