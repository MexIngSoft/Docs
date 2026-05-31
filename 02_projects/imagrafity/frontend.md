# Frontend Imagrafity

## Estado

ACTIVE

## Proyecto

```text
Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity
```

## Puerto

```text
3006
```

## Reglas aplicadas

- Mobile first.
- Producto visible en el primer viewport.
- Editor y preview antes que contenido promocional.
- Catalogo, cotizacion, estado de Gateway y flujo de produccion inicial.
- Identidad de Imagrafity basada en azul electrico, fucsia neon, violeta y
  negro grafito.
- Fallback visual si el Gateway no esta disponible.

## Rutas MVP

| Ruta | Uso |
|---|---|
| `/` | Marketplace principal, catalogo, filtros, detalle y rutas de personalizacion. |

## Home marketplace

La pantalla de inicio debe comportarse como una tienda tipo marketplace:

- Primer viewport con marca, buscador, hero de producto y estado del Gateway.
- Catalogo visible con todos los productos disponibles.
- Accesos por categoria, secciones de mas vendidos, nuevos y entrega inmediata.
- Filtros por categoria, disponibilidad y modo de personalizacion.
- Tarjetas con imagen, badges, precio publico, disponibilidad y acciones.
- Detalle de producto con origen de precio, inventario y tiempos de produccion.
- Seccion de prompts IA con flujo editar, visualizar sobre producto y aplicar.
- Navegacion conectada para que el usuario siempre tenga siguiente accion.

## Personalizador MVP

El personalizador visible en la home debe mostrar:

- Dos rutas: disenar por cuenta propia o solicitar apoyo creativo.
- Prompts configurables por producto.
- Preview sobre el mockup del producto.
- Acciones separadas: guardar cambios, visualizar resultado y aplicar al
  producto.
- Estado claro de que IA real, upload y render 3D dependen de integraciones
  futuras.

Ningun prompt debe tratarse como listo si no tiene preview asociada al
producto.

## Assets visuales

- Las imagenes de producto demo viven en `public/products`.
- Las imagenes de productos son placeholders operativos y no deben sustituir el
  origen de producto, precio o inventario en ERP.
- Los assets de marca y web viven en `public/brand`, `public/favicon.svg` y
  `public/placeholders`.
- Las imagenes de web pueden generarse localmente si no existe asset canonico;
  deben mantener consistencia con el sistema visual de Imagrafity.

## Fuente de datos

La web no define precios ni inventario. Debe consumir:

- Productos desde Catalog del ERP.
- Precios desde Pricing del ERP.
- Inventario desde Inventory del ERP.

El fallback de frontend solo existe para que la pantalla no quede vacia durante
desarrollo local cuando el Gateway no este disponible.

## Fuera de alcance

- Checkout real.
- Perfil autenticado.
- Admin interno.
- Carga de imagenes.
- Comunidad completa.
- IA real y preview 3D productivo.
