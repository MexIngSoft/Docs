# Correccion de experiencia: catalogo visible Tecno Telec

> Estado: vigente.

## Problema detectado

Se estaba validando el catalogo principalmente con URLs tecnicas de APIs. Eso sirve para desarrollo, pero no cumple el objetivo de la web publica.

Tecno Telec no debe presentarse ante el usuario como una lista de APIs. La web debe mostrar informacion clara, manipulable y comercialmente util.

## Regla corregida

La web publica muestra soluciones, productos, precios visibles, disponibilidad, imagenes y controles de busqueda. Las APIs quedan detras del Gateway y no se presentan como experiencia principal del usuario.

```text
Usuario
  -> Web Tecno Telec
  -> Buscador, filtros, tarjetas, detalle, cotizacion
  -> TecnoTelec Gateway API
  -> Core APIs necesarias
```

## Objetivo de la pagina

La pagina debe orientar a empresas que buscan soluciones de:

- Telecomunicaciones.
- Energia solar.
- Redes empresariales.
- Seguridad.
- Electricidad y respaldo.
- Infraestructura.
- Automatizacion.
- Servicios similares.

El catalogo existe para apoyar la decision y la cotizacion, no para convertir la experiencia en una pantalla tecnica.

## Controles minimos visibles

| Control | Uso |
|---|---|
| Buscador | Buscar por producto, marca, modelo, categoria o descripcion. |
| Categoria | Filtrar por tipo de solucion o producto. |
| Marca | Filtrar por marca visible. |
| Uso | Separar compra/agendado, cotizacion y componente de solucion. |
| Rango de precio | Limitar productos con precio visible. |
| Resultados | Mostrar conteo claro de productos encontrados. |

## Tarjeta minima de producto

Cada producto visible debe mostrar:

- Imagen o placeholder contextual.
- Marca.
- Nombre.
- Resumen comercial.
- Modelo.
- Categoria.
- Precio visible o mensaje de cotizacion.
- Existencia o disponibilidad visible.
- CTA hacia detalle, cotizacion o solucion compatible.

## Estados visibles

La web no debe mostrar estados tecnicos crudos al usuario.

| Estado interno | Texto para usuario |
|---|---|
| `SELLABLE` | `Disponible para compra o cotizacion` |
| `QUOTE_ONLY` | `Requiere cotizacion` |
| `COMPONENT_ONLY` | `Parte de una solucion` |

`SELLABLE` no habilita compra automatica por si solo. Mientras carrito y checkout no esten completos, el CTA debe llevar a solicitud, cotizacion o contacto.

## Regla sobre APIs

Los documentos de endpoints son necesarios para desarrollo, pero no sustituyen la experiencia web. Al presentar avances al owner o usuario final, se deben mostrar URLs web como:

```text
/soluciones
/catalogo
/catalogo/[slug]
/cotizador
/contacto
```

Las URLs de API solo se usan para validacion tecnica.

## Pendiente siguiente

Conectar el catalogo visible a `TecnoTelec Gateway API` cuando el contrato de respuesta este estable y tenga datos suficientes de Catalog, Pricing, Supplier e Inventory.
