# LeadHunter API Contracts

## Gateway Base URL

```text
http://localhost:8025/api/v1/projects/LEADHUNTER
```

## Domain API Base URL

```text
http://localhost:8021/api/leadhunter
```

The Web only uses the Gateway base URL.

## Search Request

```http
POST /api/leadhunter/prospects/search/
```

```json
{
  "latitude": "20.6596980",
  "longitude": "-103.3496090",
  "radius_meters": 10000,
  "categories": ["heavy_transport", "heavy_machinery"],
  "brands": ["Volvo", "Cummins"],
  "services": ["refacciones", "taller"],
  "keywords": ["refacciones tractocamiones", "taller diesel Cummins"],
  "max_places_per_category": 25,
  "country": "Mexico",
  "state": "Jalisco",
  "city": "Guadalajara",
  "address": "",
  "min_rating": "4.0",
  "min_reviews": 5
}
```

## Search Response

```json
{
  "id": "uuid",
  "search_id": "uuid",
  "status": "pending",
  "message": "Busqueda creada correctamente. El procesamiento continuara en segundo plano.",
  "progress": {
    "total_queries": 0,
    "completed_queries": 0,
    "total_found": 0,
    "total_without_phone": 0
  },
  "total_found": 0,
  "total_without_phone": 0,
  "total_queries": 0,
  "completed_queries": 0,
  "error_message": "",
  "prospects": []
}
```

The create endpoint is asynchronous and must respond quickly. It only creates
the search record and starts background processing.

## Search Status

```http
GET /api/leadhunter/prospects/searches/{search_id}/status/
```

```json
{
  "search_id": "uuid",
  "status": "running",
  "progress": {
    "total_queries": 20,
    "completed_queries": 7,
    "total_found": 45,
    "total_without_phone": 12
  },
  "message": "Busqueda en proceso.",
  "error_message": ""
}
```

When Apify fails, status becomes `failed` and `error_message` contains a
controlled backend error without secrets.

## Search Results

```http
GET /api/leadhunter/prospects/searches/{search_id}/results/
```

```json
{
  "search_id": "uuid",
  "status": "completed",
  "count": 0,
  "error_message": "No se encontraron negocios reales sin telefono para los criterios enviados.",
  "results": []
}
```

Successful searches only include real businesses obtained from Apify/Google Maps. Sample, test, demo, fake or placeholder results are discarded.

The domain API sends Apify Google Maps Scraper requests with:

- `searchStringsArray`: generated from vertical, brand, service, keyword and city.
- `locationQuery`: selected city, state and country.
- `maxCrawledPlacesPerSearch`: request limit per generated query.
- `skipClosedPlaces`: enabled.

The default actor id is `compass~crawler-google-places`. Real tokens must only
be supplied through environment variables.

## Prioritized Prospect Rules

A result is saved as a prioritized prospect only when:

- The phone is empty, null or `N/A`.
- The result has a real name, address and Google Maps URL.
- It has at least two quality signals: category, rating, reviews, Google Maps URL, coordinates or missing website.

Blocked URL/name fragments:

```text
sample
test
demo
fake
placeholder
```

## Example Real Search Terms

```text
refacciones Volvo camiones Pachuca
taller diesel Cummins Queretaro
bombas hidraulicas Puebla
pipas de agua Hidalgo
refacciones RZR CDMX
transmisiones automaticas BMW
```

## Empty Response

```json
{
  "id": "uuid",
  "status": "completed",
  "total_found": 0,
  "total_without_phone": 0,
  "error_message": "No se encontraron negocios reales sin telefono para los criterios enviados.",
  "prospects": [
  ]
}
```

## Categories

```http
GET /api/leadhunter/categories/
```

Available canonical category ids:

- `heavy_transport`
- `liquid_transport`
- `heavy_machinery`
- `premium_auto`
- `off_road`
- `industrial_business`

## Locations

```http
GET /api/leadhunter/locations/
```

Returns editable/configurable city presets for Pachuca, CDMX, Monterrey, Guadalajara, Queretaro, Puebla, Toluca, Leon, San Luis Potosi, Aguascalientes, Merida, Tijuana, Cancun, Saltillo and Torreon.

## Export

```http
GET /api/leadhunter/prospects/export.csv?search_id=<uuid>
```

The web also generates an Excel-compatible `.xls` file client-side from the visible table.
