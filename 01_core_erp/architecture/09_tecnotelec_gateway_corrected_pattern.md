# Patron corregido TecnoTelec Gateway

## Regla canonica

```text
Web Tecno Telec
  -> TecnoTelec Gateway API
  -> Core APIs necesarias
  -> TecnoTelec API solo para configuracion propia
  -> JobCron administra todo
```

La Web Tecno Telec no consume APIs internas directamente. El Gateway es BFF y punto unico de entrada para el frontend.

## Flujo de producto

```text
Web
  -> tecnotelec-gateway-api
    -> catalog-api
    -> pricing-api
    -> supplier-api
    -> inventory-api
    -> quote-api o sales-api cuando aplique
    -> tecnotelec-api solo para configuracion propia
```

## El Gateway debe hacer

1. Recibir peticiones de la Web.
2. Validar token si existe.
3. Consultar Core APIs.
4. Consultar TecnoTelec API solo para contenido propio.
5. Unir datos.
6. Ocultar campos internos.
7. Preparar respuesta lista para frontend.
8. Aplicar cache cuando exista politica.
9. Aplicar fallback visual.
10. Devolver placeholders si no hay imagen.
11. Exponer endpoints limpios para frontend.
12. Centralizar paginacion, filtros y ordenamiento.
13. Manejar errores de Core APIs.
14. Evitar que la Web conozca APIs internas.

## El Gateway no debe hacer

1. Guardar catalogo completo.
2. Guardar precios oficiales.
3. Guardar stock oficial.
4. Reemplazar Pricing API.
5. Reemplazar Catalog API.
6. Duplicar Supplier API.
7. Convertirse en base maestra.
8. Calcular precios finales por su cuenta.
9. Inventar datos.
10. Consultar proveedores externos directamente si ya existe Supplier API.

## TecnoTelec API debe guardar solo

- Banners.
- Textos comerciales.
- Secciones de Home.
- Soluciones.
- Productos destacados.
- Reglas de publicacion por proyecto.
- Formularios propios.
- Configuracion visual.
- Slugs comerciales.
- Agrupaciones propias de Tecno Telec.
- Orden visual.
- Landings.

## JobCron

JobCron administra, configura y supervisa. Debe permitir revisar lo que se publica, corregir faltantes, aprobar visibilidad y operar leads/cotizaciones/proyectos.

## Decision

Este documento corrige y centraliza la interpretacion de arquitectura para Tecno Telec. Si otro documento parece permitir consumo directo desde Web hacia Core APIs, debe leerse como referencia de dominio, no como contrato de consumo frontend.
