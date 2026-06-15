Sí. Debe quedar como **estándar global del ecosistema**, no como buscador exclusivo de RefaPart.

La documentación permite justificarlo porque separa lo reutilizable en `01_core_erp`, lo específico en `02_projects/<nombre>`, y establece que el frontend solo debe consumir su Gateway/BFF, no APIs core directamente. ([GitHub][1]) ([GitHub][2])

# Regla global nueva

```txt
Toda web del ecosistema MexIngSoft que necesite buscador debe usar el Search Engine avanzado del Core ERP.

Ningún proyecto debe implementar buscadores aislados con LIKE, filtros simples o lógica duplicada.

El frontend debe consultar:
Web -> Project Gateway/BFF -> Project Domain API -> Core ERP Search API
```

# Dónde documentarlo

Crear estos documentos:

```txt
01_core_erp/erp/16_search_engine.md
01_core_erp/apis/16_search_api.md
01_core_erp/database/16_search_model.md
01_core_erp/flows/03_global_search_flow.md
03_standards/frontend/search-component-standard.md
03_standards/backend/search-implementation-standard.md
02_projects/_ecosystem/05_search_adoption_map.md
```

# Proyectos que deben analizarse

La documentación lista proyectos de comercio, operación, servicios, legal, contenido y utilidades. Los candidatos naturales a buscador son: `tecnotelec`, `imagrafity`, `buildora`, `refakto`, `phone-shop`, `stockara`, `lexnova`, `docucore`, `imagiland`, `pensavart`, `clientix`, `nexora`, `nutriva` y `festora`. ([GitHub][3])

# Clasificación por tipo de buscador

## 1. Buscador de productos

Aplica a:

```txt
Refakto / RefaPart
TecnoTelec
Imagrafity
Buildora
PhoneShop
Nutriva
Imagiland
```

Debe buscar:

```txt
productos
categorías
compatibilidades
precios
inventario
proveedores
variantes
sinónimos
errores de escritura
```

## 2. Buscador documental

Aplica a:

```txt
DocuCore
LexNova
```

Debe buscar:

```txt
documentos
expedientes
archivos
folios
clientes
texto extraído
metadatos
etiquetas
fechas
```

## 3. Buscador operativo

Aplica a:

```txt
Stockara
Rutexa
Pagora
JobCron
Clientix
```

Debe buscar:

```txt
órdenes
clientes
movimientos
pagos
rutas
inventario
proveedores
tareas
reportes
```

## 4. Buscador de servicios

Aplica a:

```txt
Festora
Lavanderia 3P
Sekura Tech
Innovation Engines Repair
Nexora
```

Debe buscar:

```txt
servicios
paquetes
disponibilidad
zonas
precios
cotizaciones
clientes
```

# Search Engine Core

Crear un módulo reutilizable:

```txt
Core ERP Search Engine
```

Debe tener:

```txt
normalización
corrección de errores
sinónimos
diccionarios por dominio
ranking
logs
sugerencias
autocompletado
filtros
búsquedas fallidas
demanda no satisfecha
analítica
```

# Tablas globales

Usar PascalCase porque la documentación lo marca como estándar para tablas y campos publicados. ([GitHub][1])

```sql
SearchDomain
- Id
- ProjectCode
- DomainCode
- Name
- Description
- IsActive

SearchIndex
- Id
- ProjectCode
- DomainCode
- EntityType
- EntityId
- Title
- Summary
- SearchText
- NormalizedSearchText
- Keywords
- Tags
- MetadataJson
- IsActive
- CreatedAt
- UpdatedAt

SearchDictionaryTerm
- Id
- ProjectCode
- DomainCode
- Term
- NormalizedTerm
- TermType
- CanonicalValue
- Confidence
- IsActive

SearchQueryLog
- Id
- ProjectCode
- DomainCode
- UserId
- SessionId
- RawQuery
- NormalizedQuery
- DetectedIntentJson
- ResultsCount
- BestScore
- SearchStatus
- CreatedAt

SearchResultLog
- Id
- SearchQueryLogId
- EntityType
- EntityId
- Score
- MatchType
- RankPosition
- WasClicked
- WasConverted
- CreatedAt

UnfulfilledSearchDemand
- Id
- SearchQueryLogId
- ProjectCode
- DomainCode
- RawQuery
- NormalizedQuery
- DetectedIntentJson
- ContactName
- ContactPhone
- ContactEmail
- DemandStatus
- Priority
- CreatedAt
- UpdatedAt
```

# API global

```txt
POST /api/search/query
POST /api/search/normalize
GET /api/search/suggestions
POST /api/search/index
POST /api/search/reindex
GET /api/search/logs
GET /api/search/demands
POST /api/search/demands
PATCH /api/search/demands/{id}
```

# Estándar frontend

Todo proyecto Next.js debe crear:

```txt
features/search/
components/search/
lib/api/searchClient.ts
types/search.ts
```

Y consumir solo:

```txt
NEXT_PUBLIC_GATEWAY_BASE_URL
```

Esto coincide con el estándar de Next.js del repo: el frontend debe consumir solo su Gateway/BFF y no APIs core, proveedor, pricing o base de datos directamente. ([GitHub][4])

# Algoritmo global

```txt
1. Recibir búsqueda.
2. Detectar ProjectCode y DomainCode.
3. Normalizar texto.
4. Corregir errores.
5. Aplicar diccionario del proyecto.
6. Detectar intención.
7. Buscar coincidencia exacta.
8. Buscar coincidencia flexible.
9. Buscar por sinónimos.
10. Buscar por etiquetas.
11. Buscar por compatibilidad si aplica.
12. Calcular SearchScore.
13. Ordenar resultados.
14. Guardar SearchQueryLog.
15. Guardar SearchResultLog.
16. Si no hay resultados útiles, crear UnfulfilledSearchDemand.
```

# Instrucción para Codex

```txt
Estandarizar el buscador avanzado como módulo reutilizable del Core ERP.

Crear documentación y estructura para que cualquier proyecto web que necesite búsqueda use el mismo Search Engine.

Respetar la arquitectura documentada:
Web/Mobile/Admin -> Project Gateway/BFF API -> Project Domain API -> Core ERP APIs.

No permitir que el frontend consulte Search Core directamente.
No duplicar lógica de búsqueda dentro de cada proyecto.
Lo reutilizable debe vivir en 01_core_erp.
Lo específico de cada negocio debe vivir en 02_projects/<nombre>.
Los estándares de implementación deben vivir en 03_standards.

Crear:
- 01_core_erp/erp/16_search_engine.md
- 01_core_erp/apis/16_search_api.md
- 01_core_erp/database/16_search_model.md
- 01_core_erp/flows/03_global_search_flow.md
- 03_standards/frontend/search-component-standard.md
- 03_standards/backend/search-implementation-standard.md
- 02_projects/_ecosystem/05_search_adoption_map.md

Implementar tablas:
SearchDomain, SearchIndex, SearchDictionaryTerm, SearchQueryLog, SearchResultLog, UnfulfilledSearchDemand.

Implementar endpoints:
POST /api/search/query
POST /api/search/normalize
GET /api/search/suggestions
POST /api/search/index
POST /api/search/reindex
GET /api/search/logs
GET /api/search/demands
POST /api/search/demands
PATCH /api/search/demands/{id}

Cada proyecto deberá declarar:
- ProjectCode
- DomainCode
- entidades buscables
- campos indexables
- diccionario propio
- reglas de ranking
- comportamiento cuando no hay resultados.

Analizar proyectos viejos con buscador y migrarlos al Search Engine avanzado.
Todo proyecto nuevo que requiera búsqueda debe nacer usando este estándar.
```

La regla final sería:

```txt
Si una web necesita buscador, no se crea uno nuevo: se configura el Search Engine global.
```

[1]: https://github.com/MexIngSoft/Docs "GitHub - MexIngSoft/Docs · GitHub"
[2]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/architecture/07_project_api_pattern.md "raw.githubusercontent.com"
[3]: https://github.com/MexIngSoft/Docs/tree/main/02_projects "Docs/02_projects at main · MexIngSoft/Docs · GitHub"
[4]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/03_standards/frontend/nextjs-project-standard.md "raw.githubusercontent.com"
