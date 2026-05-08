## FASE 2 — APIs para mostrar productos en Web Tecno Telec

Crear las APIs necesarias para que Web Tecno Telec pueda mostrar productos correctamente desde el ecosistema actual.

Crear o actualizar:

02_projects/tecnotelec/backend/00_gateway_product_endpoints.md
02_projects/tecnotelec/catalog/00_public_catalog_process.md

La Web debe poder consultar y mostrar:

1. Productos.
2. Categorías.
3. Subcategorías.
4. Marcas.
5. Precios.
6. Existencias.
7. Imágenes principales.
8. Galerías de imágenes.
9. Imágenes 360 si existen.
10. Descripción del producto.
11. Modelo.
12. SKU o identificador externo.
13. Proveedor.
14. Ficha técnica.
15. Dimensiones.
16. Peso.
17. Garantía.
18. Información SAT si aplica.
19. Productos relacionados.
20. Productos por categoría.
21. Productos por marca.
22. Búsqueda de productos.
23. Filtros de productos.
24. Ordenamiento de productos.
25. Paginación.

Responsabilidades:

Catalog API:
- productos
- categorías
- subcategorías
- marcas
- descripción
- modelo
- ficha técnica
- dimensiones
- peso
- garantía
- SAT
- imágenes
- galería
- imágenes 360 si existen
- productos relacionados base

Pricing API:
- precio público
- precio especial
- precio interno oculto
- regla aplicada
- vigencia
- snapshot de precio

Supplier API:
- proveedor
- SKU externo
- identificador externo
- origen del producto
- datos externos del proveedor
- disponibilidad proveedor

Inventory API:
- existencia
- disponibilidad
- stock visible
- estado de inventario

TecnoTelec API:
- productos destacados
- orden visual
- textos comerciales
- soluciones relacionadas
- configuración de publicación
- banners
- secciones propias
- reglas visuales del proyecto

TecnoTelec Gateway API:
- consumir Core APIs
- consumir TecnoTelec API solo para configuración propia
- unir respuestas
- limpiar datos
- ocultar campos internos
- aplicar reglas de presentación
- aplicar caché
- manejar paginación
- manejar filtros
- manejar ordenamiento
- devolver JSON listo para frontend

Web Tecno Telec:
- consumir solo Gateway
- mostrar productos
- mostrar filtros
- mostrar detalle
- mostrar placeholders
- no calcular precios
- no consultar APIs internas
- no consumir Catalog API directo
- no consumir Pricing API directo
- no consumir Supplier API directo