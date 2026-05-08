## FASE 5 — Detalle de producto

Crear:

02_projects/tecnotelec/catalog/01_product_detail_process.md

Proceso:

Web solicita:
GET /products/{slug}

Gateway consulta:

1. TecnoTelec API:
   - texto comercial
   - solución relacionada
   - producto destacado
   - reglas de visualización

2. Catalog API:
   - datos técnicos
   - descripción HTML
   - marca
   - categoría
   - subcategoría
   - imágenes
   - galería
   - imagen 360
   - peso
   - dimensiones
   - garantía
   - SAT key si aplica
   - productos relacionados

3. Pricing API:
   - precio calculado
   - lista aplicada
   - vigencia

4. Supplier API:
   - proveedor
   - origen
   - SKU externo
   - link privado oculto
   - existencia proveedor

5. Inventory API:
   - existencia interna
   - disponibilidad visible

Respuesta debe incluir:

- título
- subtítulo
- slug
- modelo
- SKU
- imagen principal
- galería
- imagen 360 si existe
- placeholder si falta imagen
- precio visible
- disponibilidad
- ficha técnica
- descripción limpia
- dimensiones
- peso
- garantía
- SAT si aplica
- botón cotizar
- botón WhatsApp
- productos relacionados
- productos por categoría
- productos por marca
- soluciones relacionadas

No mostrar:

- costo proveedor
- precio descuento interno
- link privado proveedor
- reglas internas
- margen
- proveedor si se decide ocultarlo al cliente