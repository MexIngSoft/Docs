# LeadHunter Database

LeadHunter uses PostgreSQL in schema `LeadHunter`.

## Tables

`LeadHunter.ProspectSearches`

| Column | Purpose |
| --- | --- |
| `Id` | Search id |
| `Latitude`, `Longitude` | Search center |
| `RadiusMeters` | Search radius |
| `Categories` | Selected category ids |
| `Country`, `State`, `City`, `Address` | Dynamic location context |
| `Status` | `pending`, `running`, `completed`, `failed` |
| `TotalFound` | Persisted prospect count |
| `TotalWithoutPhone` | Count of prospects missing phone |
| `TotalQueries` | Generated Apify query count |
| `CompletedQueries` | Completed Apify query count |
| `ErrorMessage` | Failure detail |
| `StartedAt`, `FinishedAt` | Background processing timestamps |

`LeadHunter.BusinessProspects`

| Column | Purpose |
| --- | --- |
| `Id` | Prospect id |
| `SearchId` | Parent search |
| `PlaceId` | Apify/Google identifier |
| `Name`, `Category`, `Address` | Business identity |
| `Phone`, `Website` | Contact signals |
| `Rating`, `ReviewsCount` | Google Maps signals |
| `Latitude`, `Longitude` | Business coordinates |
| `GoogleMapsUrl` | Deduplication and review URL |
| `Score` | Commercial priority |
| `HasPhone`, `HasWebsite` | Boolean filters |
| `RawPayload` | Original source payload for audit |
| `CreatedAt`, `UpdatedAt` | Audit fields |

Duplicates are prevented by `PlaceId` or `GoogleMapsUrl` when those values are present.
