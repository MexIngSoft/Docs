# LeadHunter Frontend

The frontend lives in `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter` and runs on port `3007`.

## Route

`/prospectos`

## UI Features

- Scrollable city grid with city and state labels for all configured locations.
- Manual latitude and longitude inputs.
- Country, state, city and address context.
- Radius selector for 5, 10, 20 and 50 km.
- High-value vertical selector with all options selected by default.
- Independent select-all and clear-all controls for verticals, brands, services and keywords.
- Asynchronous search creation with polling every 3 seconds.
- Progress display for completed queries, total found and no-phone prospects.
- Result table with no-phone, no-website, min score and min reviews filters.
- Default result order: score descending, rating descending, reviews descending.
- Manual sorting by score, rating, reviews, name, city/address and category.
- CSV export from the Gateway.
- Excel-compatible XLS export from the visible table.

The screen is operational by default and does not include a marketing landing page.
