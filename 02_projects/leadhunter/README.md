# LeadHunter

LeadHunter is an independent prospecting product for finding high-value businesses from Google Maps data and ranking commercial opportunities.

## Product Scope

- Search by latitude, longitude, radius, country, state, city and address.
- Run high-value category searches through Apify Google Maps Scraper.
- Persist searches and business prospects in PostgreSQL.
- Detect real businesses without phone or website.
- Score prospects for commercial follow-up.
- Export results as CSV and Excel-compatible XLS.

## Project Components

| Component | Repository name | Type | Responsibility |
| --- | --- | --- | --- |
| Web | `WEB.NJ.NEXT.LeadHunter` | Independent product web | Prospecting cockpit and exports |
| Gateway | `API.PY.DJANGO.Gateway` | Central gateway with `LEADHUNTER` routing | Single public API surface for Web |
| Domain API | `API.PY.DJANGO.LeadHunter` | Independent product API | Apify integration, scoring, persistence |
| Auth | `API.PY.DJANGO.Auth` | ERP/Core dependency | Identity, tokens and application access |

## ERP vs Independent Modules

LeadHunter is independent from ERP transactional modules. It depends on ERP/Core Auth for identity and can later integrate with ERP CRM, Sales or Notifications.

| Module/API | Classification | Current State |
| --- | --- | --- |
| LeadHunter Web | Independent | Implemented |
| LeadHunter Gateway | Independent | Implemented |
| LeadHunter Domain API | Independent | Implemented |
| Apify Google Maps integration | Independent LeadHunter integration | Implemented; real results only |
| Prospect scoring | Independent LeadHunter domain | Implemented |
| Auth | ERP/Core | Required upstream through Gateway |
| CRM/Customers | ERP extension | Future, not required for MVP |
| Sales opportunities | ERP extension | Future, not required for MVP |
| Notifications | ERP/Core extension | Future, not required for MVP |
| Job scheduler | Shared/Core extension | Future for async searches |

## Canonical Documents

- [Architecture](./architecture.md)
- [API Contracts](./api-contracts.md)
- [Database](./database.md)
- [Frontend](./frontend.md)
- [Runbook](./local-runbook.md)

## Real Results Rule

LeadHunter must not invent businesses. If Apify is not configured, the API returns a controlled error. If Apify returns no valid businesses, the API returns an empty list and a clear message.
