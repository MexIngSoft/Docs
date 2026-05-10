# Revision de navegacion para usuario final

> Estado: vigente.

## Objetivo

Validar que el mapa de navegacion de Tecno Telec corresponda con una experiencia clara para cliente final y no solo con una estructura tecnica de paginas.

## Hallazgo principal

El mapa de navegacion existente si contempla los caminos necesarios:

- Soluciones.
- Catalogo/productos.
- Diagnostico/cotizacion.
- Contacto.
- Cuenta/portal.

La brecha estaba en la interfaz: el usuario podia ver `Soluciones` y `Catalogo`, pero la home no explicaba con suficiente claridad que existen dos caminos distintos:

1. Necesito una solucion completa.
2. Quiero revisar o comprar/cotizar productos directamente.

## Correccion requerida

La web debe ayudar al usuario a decidir antes de entrar al catalogo o al cotizador.

```text
Inicio
  -> Necesito una solucion completa
    -> Soluciones
    -> Detalle solucion
    -> Diagnostico / contacto

Inicio
  -> Quiero revisar productos
    -> Catalogo
    -> Busqueda / filtros
    -> Detalle producto
    -> Cotizacion o compra si el producto lo permite
```

## Reglas de experiencia

| Regla | Aplicacion |
|---|---|
| El usuario final no ve lenguaje de APIs. | La web habla de soluciones, productos, precios, disponibilidad, diagnostico y contacto. |
| El camino consultivo y el camino de producto deben estar separados. | Home muestra dos opciones principales. |
| Catalogo no debe sentirse como marketplace generico. | Debe permitir compra/cotizacion directa cuando aplique, pero mantiene contexto de solucion. |
| El usuario no debe quedar atrapado en paginas sin salida. | Cada pagina publica debe llevar a soluciones, productos, diagnostico o contacto. |
| La navegacion debe ser entendible sin conocer la arquitectura. | Header usa `Productos` para el usuario; `Catalogo` queda como concepto interno/documental. |

## Regla de estados visibles de producto

Los estados tecnicos pueden existir internamente, pero no deben mostrarse al usuario final con nombres como `SELLABLE`, `QUOTE_ONLY` o `COMPONENT_ONLY`.

| Estado interno | Etiqueta visible | Significado comercial | CTA recomendado |
|---|---|---|---|
| `SELLABLE` | `Disponible para compra o cotizacion` | Producto publicable, con precio visible si Pricing lo permite, que el usuario puede solicitar directamente. No implica checkout automatico mientras carrito/checkout no esten listos. | `Solicitar producto` |
| `QUOTE_ONLY` | `Requiere cotizacion` | Producto o solucion que necesita asesor, volumen, instalacion, ubicacion o validacion tecnica antes de precio final. | `Cotizar con asesor` |
| `COMPONENT_ONLY` | `Parte de una solucion` | Producto que no debe venderse aislado porque depende de compatibilidad, instalacion o paquete tecnico. | `Ver solucion compatible` |

Regla clave:

```text
SELLABLE no significa compra automatica.
SELLABLE significa producto publicable y solicitabile directamente.
```

La compra directa solo debe activarse cuando existan carrito, checkout, reglas de venta, inventario y Sales API listos para operacion real.

## Cambios definidos para la interfaz

- Agregar bloque en home: `Elige como avanzar`.
- Ofrecer dos tarjetas principales:
  - `Necesito una solucion completa`.
  - `Quiero revisar productos`.
- Agregar CTA directo a productos en hero.
- Cambiar etiqueta de navegacion publica de `Catalogo` a `Productos`.
- Mantener `Diagnostico` como CTA principal.
- En `/soluciones`, agregar salida rapida hacia diagnostico o productos.
- En `/catalogo`, mantener buscador, categoria, marca, uso y rango de precio.

## Pendientes a fijar

| Pendiente | Motivo |
|---|---|
| Activar compra directa real. | Solo cuando carrito, checkout, Pricing, Inventory y Sales esten completos. |
| Crear `/carrito` o renombrarlo a `cotizacion` si la compra directa no estara lista en MVP. | Evita prometer ecommerce incompleto. |
| Conectar catalogo visible al Gateway real. | Hoy la interfaz puede funcionar con maqueta, pero datos reales deben venir del Gateway. |
| Revisar mobile con drawer real. | El boton de menu existe como placeholder y debe abrir navegacion. |
| Agregar breadcrumb en producto y solucion. | Ya esta definido como obligatorio en el mapa SEO. |

## Decision vigente

Para el MVP, Tecno Telec prioriza una experiencia de cliente final:

```text
Soluciones primero
Productos como camino alterno
Cotizacion/diagnostico como conversion principal
Compra directa solo cuando el flujo comercial este completo
```

## Estado de etapa 1

El cierre de experiencia publica inicial queda documentado en:

```text
02_projects/tecnotelec/frontend/18_stage_one_user_experience_closure.md
```

La regla de catalogo y navegacion dinamica queda documentada en:

```text
02_projects/tecnotelec/frontend/19_dynamic_catalog_and_navigation_rule.md
```
