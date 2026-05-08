## FASE 4 — Catálogo público visible

Crear o actualizar:

02_projects/tecnotelec/catalog/00_public_catalog_process.md

Proceso:

Web solicita:
GET /products

Gateway consulta:

1. TecnoTelec API:
   - productos destacados
   - reglas de publicación
   - orden visual
   - textos comerciales

2. Catalog API:
   - producto
   - nombre
   - modelo
   - marca
   - categoría
   - subcategoría
   - descripción
   - imagen
   - galería
   - imagen 360
   - ficha técnica
   - dimensiones
   - peso
   - garantía
   - SAT

3. Pricing API:
   - precio público
   - precio especial
   - regla aplicada
   - vigencia

4. Supplier API:
   - proveedor origen
   - SKU externo
   - disponibilidad externa

5. Inventory API:
   - stock visible si aplica

Respuesta Gateway:

- id
- slug
- name
- model
- sku
- externalSku
- brand
- category
- subcategory
- shortDescription
- imageUrl
- placeholderImage
- gallery
- has360Image
- price
- priceLabel
- stockStatus
- quoteOnly
- sellable
- supplierOrigin
- warranty
- satKey
- satDescription
- weight
- dimensions
- isPublished
- url

Reglas:

1. Si no hay imagen, usar placeholder.
2. Si no hay precio, mostrar “Solicitar cotización”.
3. Si no hay stock, mostrar “Consultar disponibilidad”.
4. Si el producto es componente, no mostrar como producto final.
5. Si el producto requiere asesor, marcar quoteOnly.
6. Si el producto está bloqueado en JobCron, no mostrar.
7. Si no hay galería, usar solo imagen principal.
8. Si no hay imagen 360, no mostrar sección 360.
9. Si no hay ficha técnica, ocultar bloque técnico.
10. Si no hay dimensiones, no romper la vista.

Estados:

DRAFT
ACTIVE
HIDDEN
BLOCKED
QUOTE_ONLY
COMPONENT_ONLY
SELLABLE
DISCONTINUED
PENDING_REVIEW
NO_IMAGE
NO_PRICE
NO_STOCK