# Regla de catalogo y navegacion dinamica

> Estado: vigente.

## Problema corregido

La web no debe mostrar productos, marcas o categorias inventadas cuando ya existe una base de datos y un Gateway para exponer catalogo real.

El contenido estatico solo puede usarse para estructura visual, placeholders o mensajes vacios. No debe usarse como fuente de verdad para:

- Productos.
- Marcas.
- Categorias.
- Precios.
- Existencias.
- Paginacion.
- Filtros de catalogo.

## Regla

La web de Tecno Telec consume catalogo publico desde `TecnoTelec Gateway API`.

```text
Web Tecno Telec
  -> TecnoTelec Gateway API
  -> Catalog API
  -> Pricing API
  -> Inventory API
  -> Supplier API
```

Si el Gateway no responde, la web debe mostrar un estado vacio o recuperable. No debe llenar el catalogo con productos falsos.

## Regla de contenido dinamico

Toda seccion que dependa de informacion publicada por APIs debe quedar vacia cuando no existan datos reales.

| Seccion | Fuente esperada | Si no hay datos |
|---|---|---|
| Productos | Gateway -> Catalog/Pricing/Inventory/Supplier | Mostrar `Sin productos para mostrar`. |
| Marcas | Gateway -> Catalog | Mostrar `Sin marcas disponibles`. |
| Categorias | Gateway -> Catalog | Mostrar `Sin categorias disponibles`. |
| Soluciones | Gateway -> TecnoTelec API | Mostrar `Sin soluciones publicadas por el momento`. |
| Proyectos tipo/casos | Gateway -> TecnoTelec API o modulo de proyectos | Mostrar `Sin proyectos publicados por el momento`. |
| Portal cliente | Gateway/Auth/Sales/Projects | Mostrar `Sin informacion disponible`. |
| Admin | Gateway/Auth/JobCron | Mostrar `Sin datos administrativos`. |

No se debe reemplazar contenido faltante con arreglos locales, textos de maqueta, productos ficticios, proyectos ficticios o listas de modulos inventadas.

## Filtros

Los filtros de catalogo deben venir de datos reales:

| Filtro | Fuente |
|---|---|
| Categorias | Catalog API via Gateway |
| Marcas | Catalog API via Gateway |
| Precio | Pricing via Gateway |
| Existencia | Inventory/Supplier via Gateway |

## Seleccion multiple

Categorias y marcas deben permitir seleccion multiple.

Formato recomendado para el Gateway:

```http
GET /api/products/?category=energia,redes&brand=ubiquiti,hikvision&page=1&pageSize=24
```

El Gateway puede recibir valores CSV y pasarlos a Catalog API. Catalog API debe filtrar por `Slug__in`.

## Paginacion

La lista de productos debe usar la paginacion del Gateway:

- `page`
- `pageSize`
- `total`

La web debe mostrar controles `Anterior` y `Siguiente`, y nunca intentar renderizar todo el catalogo en una sola pagina.

## Navbar dinamica

La Navbar puede conservar rutas base fijas:

- Inicio.
- Soluciones.
- Productos.
- Diagnostico.
- Contacto.

Pero los accesos de categorias destacadas deben venir del Gateway cuando existan categorias reales. Si el Gateway no responde, la Navbar debe caer a las rutas base.

## Decision

Los arreglos visuales quedan en la web, pero la fuente de verdad de catalogo y contenido publicable es el Gateway. `lib/catalog.ts` puede conservar tipos y etiquetas internas, pero no debe alimentar el listado publico.
