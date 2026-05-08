## FASE 1 — Arquitectura corregida

Crear o actualizar:

01_core_erp/architecture/09_tecnotelec_gateway_corrected_pattern.md

Definir esta regla:

Web Tecno Telec
→ TecnoTelec Gateway API
→ Catalog API
→ Pricing API
→ Supplier API
→ Inventory API
→ Sales / Quote API
→ TecnoTelec API solo cuando se requiera configuración propia.

Gateway debe hacer:

1. Recibir peticiones de la Web.
2. Validar token si existe.
3. Consultar Core APIs.
4. Consultar TecnoTelec API solo para contenido propio.
5. Unir datos.
6. Ocultar campos internos.
7. Preparar respuesta lista para frontend.
8. Aplicar cache.
9. Aplicar fallback visual.
10. Devolver placeholders si no hay imagen.
11. Exponer endpoints limpios para frontend.
12. Centralizar paginación, filtros y ordenamiento.
13. Manejar errores de Core APIs.
14. Evitar que la Web conozca APIs internas.

Gateway NO debe hacer:

1. Guardar catálogo completo.
2. Guardar precios oficiales.
3. Guardar stock oficial.
4. Reemplazar Pricing API.
5. Reemplazar Catalog API.
6. Duplicar Supplier API.
7. Convertirse en base maestra.
8. Calcular precios finales por su cuenta.
9. Inventar datos.
10. Consultar proveedores externos directamente si ya existe Supplier API.

TecnoTelec API debe guardar solo:

1. Banners.
2. Textos comerciales.
3. Secciones de Home.
4. Soluciones.
5. Productos destacados.
6. Reglas de publicación por proyecto.
7. Formularios propios.
8. Configuración visual.
9. Slugs comerciales.
10. Agrupaciones propias de Tecno Telec.