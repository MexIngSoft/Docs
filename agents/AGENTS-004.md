## FASE 3 — Endpoints públicos del Gateway para productos

Crear o documentar estos endpoints en TecnoTelec Gateway API:

1. GET /products
2. GET /products/{slug}
3. GET /products/search
4. GET /products/category/{categorySlug}
5. GET /products/brand/{brandSlug}
6. GET /categories
7. GET /categories/{slug}
8. GET /brands
9. GET /brands/{slug}
10. GET /products/{slug}/related
11. GET /products/{slug}/gallery
12. GET /products/{slug}/technical-sheet
13. GET /products/{slug}/availability
14. GET /products/{slug}/price
15. GET /products/featured
16. GET /products/recommended
17. GET /products/filters
18. GET /products/by-solution/{solutionSlug}

Cada endpoint debe documentar:

1. Objetivo.
2. API origen.
3. APIs consultadas.
4. Parámetros de entrada.
5. Parámetros opcionales.
6. Filtros.
7. Ordenamiento.
8. Paginación.
9. Request.
10. Response.
11. Estructura JSON.
12. Validaciones.
13. Manejo de errores.
14. Seguridad.
15. Permisos si aplican.
16. Caché si aplica.
17. Tiempo de respuesta esperado.
18. Ejemplo de request.
19. Ejemplo de response.
20. Pruebas básicas.
21. Pendientes.

Parámetros mínimos de GET /products:

- page
- pageSize
- search
- category
- subcategory
- brand
- minPrice
- maxPrice
- stockStatus
- quoteOnly
- sortBy
- sortDirection

Ordenamientos permitidos:

- name_asc
- name_desc
- price_asc
- price_desc
- newest
- relevance
- stock
- brand

Filtros permitidos:

- categoría
- subcategoría
- marca
- rango de precio
- disponibilidad
- proveedor
- solución
- quoteOnly
- sellable