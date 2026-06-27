# LeadHunter Architecture

LeadHunter follows the repository standard for product isolation:

```text
WEB.NJ.NEXT.LeadHunter
  -> API.PY.DJANGO.Gateway
    -> API.PY.DJANGO.Auth
    -> API.PY.DJANGO.LeadHunter
      -> Apify Google Maps Scraper
      -> PostgreSQL schema LeadHunter
```

The Web must not call Auth or the domain API directly. All browser-facing calls go through `LeadHunter.Gateway`.

## API Responsibilities

`API.PY.DJANGO.Gateway`:

- Exposes `/api/leadhunter/*` to the web.
- Proxies Auth routes under `/api/leadhunter/auth/*`.
- Proxies prospect routes to `LeadHunter`.

`API.PY.DJANGO.LeadHunter`:

- Validates search input.
- Creates prospect search records immediately and returns `pending` without waiting for Apify.
- Runs Apify searches in a controlled background worker using `ThreadPoolExecutor` for the MVP.
- Updates progress counters while each generated query finishes.
- Builds Apify actor input from dynamic location and selected categories.
- Normalizes Apify business records.
- Scores commercial value.
- Persists searches and prospects.
- Exports CSV.

## Async Search Flow

```text
Web
  -> POST Gateway /api/leadhunter/prospects/search/
  <- search_id + pending
Web polls every 3 seconds
  -> GET Gateway /api/leadhunter/prospects/searches/{search_id}/status/
  <- pending/running/completed/failed + progress
When completed
  -> GET Gateway /api/leadhunter/prospects/searches/{search_id}/results/
  <- real filtered prospects
```

The request must not block while Apify is running. If Apify fails, the search
status becomes `failed`; the system never returns invented businesses.

## Required Repositories

The following repositories are required if this product is moved to remote GitHub repositories:

- `MexIngSoft/API.PY.DJANGO.LeadHunter`
- `MexIngSoft/API.PY.DJANGO.Gateway`
- `MexIngSoft/WEB.NJ.NEXT.LeadHunter`

No separate ERP repository is required for the MVP. Auth already exists as a core dependency.
