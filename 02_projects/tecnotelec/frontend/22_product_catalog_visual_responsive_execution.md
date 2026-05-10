# Ejecucion visual responsiva del catalogo Tecno Telec

## Fecha

2026-05-09

## Alcance

Se ejecuto `Docs/agents/AGENTS-000.md` para la seccion de productos de Tecno Telec, sin retirar el avance previo del catalogo dinamico.

El alcance se limito a:

- tarjetas del catalogo,
- buscador,
- filtros laterales y panel movil,
- selector de cantidad de productos,
- limpieza de descripciones,
- rendimiento del listado.

## Criterios UX aplicados

Se valido la estructura contra buenas practicas de comercio electronico:

- Baymard recomienda que busqueda, filtros y ordenamiento trabajen juntos en listados de productos.
- Baymard identifica marca y precio como filtros esenciales cuando aplican.
- Baymard recomienda permitir multiples valores dentro de un mismo filtro.
- En escritorio, los filtros visibles en una barra lateral facilitan ajustar resultados.
- En movil, los filtros deben moverse a un panel o capa dedicada para no invadir el listado.

Fuentes consultadas:

- Baymard Institute, Product List UX Best Practices 2025: https://baymard.com/blog/current-state-product-list-and-filtering
- Baymard Institute, E-Commerce Product Lists & Filtering UX: https://baymard.com/research/ecommerce-product-lists
- Baymard Institute, Ecommerce Filter UI Best Practices: https://baymard.com/learn/ecommerce-filter-ui

Decision aplicada:

- El buscador queda arriba del listado como control principal y sticky.
- En escritorio los filtros quedan en barra lateral izquierda.
- En movil los filtros se abren desde boton visible.
- Orden y cantidad por pagina quedan en la barra superior de resultados.

## Cambios funcionales

- Se agrego selector de productos por pagina con opciones `20`, `50` y `100`.
- El valor por defecto del catalogo ahora es `20`.
- La paginacion conserva busqueda, marcas, categorias, rango de precio, orden y cantidad por pagina.
- El formulario de busqueda conserva filtros activos y cantidad seleccionada.
- El formulario de filtros conserva orden y cantidad seleccionada.

## Cambios visuales

- Se reforzo el grid escritorio con filtros de ancho fijo y productos en el area derecha.
- Los campos dentro del panel de filtros usan ancho completo.
- Precio minimo y precio maximo se apilan para evitar desbordamiento.
- Las tarjetas mantienen altura uniforme.
- El nombre de producto se limita a 2 lineas.
- La descripcion visible se limita a 3 lineas con corte visual.
- Se agregaron transiciones suaves en botones, tarjetas, imagenes y panel movil.
- Se respeto `prefers-reduced-motion` para usuarios que reducen animaciones.

## Limpieza de descripciones y caracteres

Regla implementada para tarjeta:

1. `SatDescription`
2. `DescriptionHtml` sin etiquetas HTML
3. `Name`
4. Mensaje `Sin descripcion por el momento.`

Se agrego reparacion basica de texto con mojibake comun (`Ã`, `Â`, `�`) en Catalog API y Gateway. Esto no sustituye la correccion definitiva del ETL cuando el proveedor guarde caracteres ya perdidos como `C?maras`.

## Rendimiento

Antes, Gateway consultaba precio, inventario y proveedor por cada producto del listado. Para `20`, `50` o `100` productos esto generaba demasiadas llamadas internas.

Se agregaron endpoints internos:

- `GET /api/pricing/products/bulk/?productIds=...`
- `GET /api/inventory/products/bulk/availability/?productIds=...`

Gateway ahora usa estos endpoints bulk para listados. El detalle de producto conserva la consulta completa por producto.

## Archivos modificados

- `Docker.API.PY/API.PY.DJANGO.Catalog/catalog/serializers.py`
- `Docker.API.PY/API.PY.DJANGO.Inventory/inventory/urls.py`
- `Docker.API.PY/API.PY.DJANGO.Inventory/inventory/views.py`
- `Docker.API.PY/API.PY.DJANGO.Pricing/pricing/urls.py`
- `Docker.API.PY/API.PY.DJANGO.Pricing/pricing/views.py`
- `Docker.API.PY/API.PY.DJANGO.TecnoTelec.Gateway/gateway/catalog_gateway.py`
- `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/catalogo/page.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/app/globals.css`
- `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/components/catalog-browser.tsx`
- `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec/lib/gateway-catalog.ts`

## Pruebas ejecutadas

| Prueba | Resultado |
|---|---|
| `python -m py_compile` en Catalog, Gateway, Pricing e Inventory | Correcto |
| `npm run build` en Tecno Telec | Correcto |
| Rebuild Docker API | Correcto |
| Rebuild Docker Web | Correcto |
| `GET /api/products/?page=1&pageSize=20&sortBy=newest` | `20` productos, sin HTML visible en descripcion |
| `GET /api/products/?page=1&pageSize=50&sortBy=newest` | `50` productos |
| `GET /api/products/?page=1&pageSize=100&sortBy=newest` | `100` productos |
| `GET /catalogo?pageSize=20` | `200`, buscador, filtros, selector 20/50/100 y productos visibles |
| Bulk Pricing | Responde con productos solicitados |
| Bulk Inventory | Responde con productos solicitados |

## Observaciones

- La primera carga posterior a recrear Docker puede tardar por arranque y calentamiento de servicios.
- Los warnings de Next por `<img>` siguen sin bloquear el build.
- La correccion completa de caracteres irrecuperables requiere revisar el ETL y el dato guardado en origen.

## Estado

Completado para la etapa actual del catalogo responsivo de productos.
