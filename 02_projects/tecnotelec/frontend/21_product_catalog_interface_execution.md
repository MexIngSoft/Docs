# Ejecucion interfaz de productos Tecno Telec

## Alcance

Esta ejecucion impacta solo la experiencia de productos en Tecno Telec:

- `/catalogo`
- tarjetas de producto
- filtros de catalogo
- busqueda
- ordenamiento
- mensajes de estado
- llamadas Gateway relacionadas con productos

No cambia flujos de soluciones, portal, admin, ventas reales ni checkout.

## Reglas implementadas

- La carga inicial usa `sortBy=newest` y `pageSize=12`.
- Si existen productos, no se debe mostrar mensaje de base vacia.
- Si no hay coincidencias con filtros o busqueda, el mensaje correcto es `No se encontraron productos con estos filtros.`
- Si no hay datos en catalogo, el mensaje correcto es `No hay productos disponibles para mostrar.`
- Si Gateway no responde, el mensaje correcto es `Error al cargar productos. Intenta nuevamente.`
- La busqueda superior queda sticky y permite buscar por producto, marca, modelo, categoria o palabra clave.
- Los filtros de escritorio quedan a la izquierda.
- En movil, los filtros se abren desde el boton `Filtros`.
- Marca y categoria tienen buscador interno y seleccion multiple.
- Precio usa campos numericos `minPrice` y `maxPrice`.
- Si `minPrice > maxPrice`, se muestra validacion y no se aplica una busqueda valida.
- Las tarjetas muestran imagen, nombre, marca, modelo, categoria, precio, existencia, `Ver detalle` y CTA de cotizacion/producto.

## Ajustes tecnicos

- Tecno Telec usa timeout de `8000 ms` hacia Gateway para evitar falsos vacios cuando Core APIs tardan en responder con productos reales.
- Gateway usa timeout de `8 s` hacia Core Catalog.
- Gateway acepta `best_sellers` y `random` como ordenamientos.
- Catalog API busca tambien por marca, categoria y descripcion.
- Gateway filtra por `minPrice` y `maxPrice` despues de obtener precio visible desde Pricing.

## Pruebas realizadas

| Prueba | Resultado |
|---|---|
| Build Tecno Telec `npm run build` | Correcto. Solo warnings conocidos por `<img>`. |
| Sintaxis Python Gateway/Catalog | Correcto. |
| `GET /api/products/?page=1&pageSize=12&sortBy=newest` | `200`. |
| `GET /api/products/?page=1&pageSize=12&search=camera` | `200`. |
| `GET /api/products/?page=1&pageSize=12&minPrice=500&maxPrice=3000&sortBy=price_asc` | `200`. |
| `GET /api/products/?page=1&pageSize=12&sortBy=random` | `200`. |
| `/catalogo` | `200`, muestra busqueda, filtros, orden y tarjetas. |
| `/catalogo?search=camera` | `200`, muestra busqueda, filtros, orden y tarjetas. |
| `/catalogo?minPrice=500&maxPrice=3000&sortBy=price_asc` | `200`, muestra busqueda, filtros, orden y tarjetas. |
| `/catalogo?minPrice=5000&maxPrice=1000` | `200`, muestra validacion de precio invalido. |
| `/catalogo?sortBy=random` | `200`, muestra busqueda, filtros, orden y tarjetas. |

## Observaciones

- El contenedor web sigue corriendo en `next dev`; la primera carga despues de recrear Docker puede tardar por compilacion bajo demanda.
- Las cargas calientes verificadas quedaron entre 4 y 10 segundos segun endpoint y cantidad de dependencias consultadas.
- Para rendimiento final de produccion se mantiene pendiente crear modo `next build` + `next start`.

## Estado

La interfaz de productos queda funcional para la etapa actual y cumple los dos agents ejecutados.
