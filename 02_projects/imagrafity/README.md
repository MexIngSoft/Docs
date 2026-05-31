# Imagrafity

## Rol

Personalizacion de productos.

## Dominios

- imagrafity.com
- imagrafity.mx

## Que hace

Permite personalizar productos como tazas, playeras u otros articulos con editor y vista previa.

## Necesidades JobCron

- Catalog.
- Product customizer.
- Cart.
- Pricing.
- Sales.
- Production workflow.
- Shipping.

## MVP sugerido

1. Catalogo de productos personalizables.
2. Editor basico.
3. Vista previa.
4. Cotizacion/compra.
5. Orden de produccion.

## Documentos canonicos

- `architecture.md`: frontera tecnica Frontend -> Gateway -> API.
- `api-contracts.md`: endpoints y contratos iniciales del Gateway/API.
- `database.md`: entidades MVP y decisiones de persistencia.
- `design-system.md`: identidad visual, paleta y reglas de interfaz.
- `frontend.md`: reglas y alcance de la web Next.js.
- `implementation-report.md`: resultado de ejecucion directa sin agents.
- `personalization-editor.md`: decision tecnica del editor 2D/3D y alcance MVP.
- `prompt-preview-flow.md`: prompts editables, preview obligatorio y modelo de datos.
- `product-strategy.md`: propuesta de valor, MVP, expansiones y relacion ERP.
- `repositories.md`: rutas locales y remotos sugeridos.
- `security.md`: reglas de seguridad y datos sensibles.
- `site-map.md`: mapa inicial de 20 paginas y modulos futuros.

## Proyectos locales

| Proyecto | Ruta | Puerto |
|---|---|---:|
| Frontend | `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity` | `3006` |
| Gateway | `Docker.API.PY/API.PY.DJANGO.Imagrafity.Gateway` | `8018` |
| API | `Docker.API.PY/API.PY.DJANGO.Imagrafity` | `8019` |

## Pendientes

- Definir productos iniciales.
- Definir margenes, costos e impuestos.
- Definir proveedor de impresion.
- Definir politica de derechos de autor.
