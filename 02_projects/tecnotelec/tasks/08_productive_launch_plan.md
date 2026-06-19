# Plan productivo Tecno Telec

## Objetivo

Conectar la documentacion de Tecno Telec con un cierre productivo real para web
consultiva, catalogo publicable, diagnostico y cotizacion.

## Arquitectura productiva

```text
WEB.NJ.NEXT.TecnoTelec
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.TecnoTelec
  -> Catalog, Supplier, Pricing, Sales, Inventory, Document, Search
  -> JobCron para operacion
```

Tecno Telec no es marketplace generico. La publicacion debe priorizar
soluciones, diagnostico y cotizacion consultiva.

## Contratos productivos

| Ruta Gateway | Metodo | Destino | Proposito | Estado |
|---|---|---|---|---|
| `/api/v1/projects/TECNOTELEC/solutions` | GET | TecnoTelec API | Listar soluciones publicadas. | Parcial |
| `/api/v1/projects/TECNOTELEC/solutions/{slug}` | GET | TecnoTelec API/Catalog | Detalle consultivo. | Parcial |
| `/api/v1/projects/TECNOTELEC/catalog` | GET | Catalog/Pricing/Supplier | Catalogo publicable. | Parcial |
| `/api/v1/projects/TECNOTELEC/products/{slug}` | GET | Catalog/Pricing/Inventory | Producto consultivo. | Parcial |
| `/api/v1/projects/TECNOTELEC/quotes` | POST | Sales API | Solicitud de cotizacion MVP. | Parcial |
| `/api/v1/projects/TECNOTELEC/diagnostics` | POST | TecnoTelec API/Sales | Diagnostico guiado por solucion. | PENDIENTE_DE_IMPLEMENTAR |

## Datos minimos

| Entidad | Campos minimos |
|---|---|
| Solucion | slug, nombre, problema, alcance, categorias, estado, orden. |
| Paquete | solucion, nombre, nivel, componentes, servicios, estado. |
| Producto publicable | SKU, nombre, marca, categoria, visibilidad, estado comercial. |
| Pregunta de diagnostico | solucion, pregunta, tipo, opciones, regla. |
| Cotizacion | cliente, necesidad, solucion, productos, servicios, estado, responsable. |

## Reglas de publicacion

- Un producto no se publica si no tiene estado autorizado para Tecno Telec.
- Si no existe precio valido, el producto debe mostrarse como `QUOTE_ONLY`.
- Si un producto solo sirve como componente de solucion, debe quedar
  `COMPONENT_ONLY`.
- Si no hay stock propio ni proveedor confiable, la web debe indicar cotizacion
  o disponibilidad por confirmar.

## Search

Tecno Telec debe indexar:

- soluciones publicadas;
- productos publicables;
- categorias publicables;
- paquetes;
- cotizaciones solo para usuario autorizado.

El indice debe incluir `project_code=TECNOTELEC`, visibilidad, estado,
categoria, marcas, tags y permisos.

## Pendientes reales

- PENDIENTE_DE_IMPLEMENTAR: ChannelAssortment o regla equivalente de surtido.
- PENDIENTE_DE_IMPLEMENTAR: reglas de compatibilidad para soluciones y
  componentes.
- PENDIENTE_DE_IMPLEMENTAR: diagnostico guiado productivo.
- PENDIENTE_DE_DEFINIR: proveedor/pricing real para primeras categorias.
- PENDIENTE_DE_IMPLEMENTAR: panel JobCron para administrar soluciones,
  publicaciones y cotizaciones.
