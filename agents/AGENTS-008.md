## FASE 7 — Publicación de precios en Web

Crear:

02_projects/tecnotelec/pricing/00_price_publication_process.md

Reglas:

1. Todo precio visible debe venir de Pricing API.
2. Gateway no inventa precios.
3. Si no hay precio, mostrar “Solicitar cotización”.
4. Si es precio demo, mostrar solo en ambiente development.
5. Si el producto cambió de costo, recalcular.
6. Si ya existe cotización, mantener snapshot.
7. Si el cliente vuelve a cotizar, generar nuevo snapshot.
8. Web nunca calcula precios.
9. Web nunca muestra costos internos.
10. Web nunca muestra margen.

Estados:

NO_PRICE
DEMO_PRICE
ACTIVE_PRICE
EXPIRED_PRICE
QUOTE_REQUIRED
SPECIAL_PRICE
INTERNAL_ONLY