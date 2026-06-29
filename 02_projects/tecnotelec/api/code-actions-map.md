# Mapa API de acciones de codigo - Tecno Telec

## Estado

VIGENTE_PARCIAL

## API Django especializada

| Codigo de accion | Endpoint API | Archivo | Metodo HTTP | Modelos/tablas | Gateway route | Estado |
|---|---|---|---|---|---|---|
| TECNOTELEC.SOLUTIONS.LIST | PENDIENTE_DE_VALIDAR | `Docker.API.PY/API.PY.DJANGO.TecnoTelec/tecnotelec/views.py` | GET | `tecnotelec.models` | `GET /api/v1/projects/TECNOTELEC/solutions` | vigente_parcial |
| TECNOTELEC.CATALOG.LIST | PENDIENTE_DE_VALIDAR | `Docker.API.PY/API.PY.DJANGO.TecnoTelec/tecnotelec/views.py` | GET | `tecnotelec.models`; Catalog/Pricing/Supplier reutilizables | `GET /api/v1/projects/TECNOTELEC/catalog` | vigente_parcial |
| TECNOTELEC.QUOTE.REQUEST | PENDIENTE_DE_IMPLEMENTAR | PENDIENTE_DE_DEFINIR | POST | Sales API | `POST /api/v1/projects/TECNOTELEC/quotes` | pendiente |

## APIs reutilizadas o descartadas

- Catalog: fuente preferente para productos compartidos.
- Pricing: fuente preferente para precios y reglas comerciales.
- Supplier: fuente preferente para proveedor/producto proveedor.
- Sales: fuente preferente para cotizaciones y ventas.
- TecnoTelec API: solo para logica exclusiva de soluciones/proyectos que no
  pertenezca a APIs compartidas.

## Bloqueos

- Falta confirmar contratos reales de endpoints en TecnoTelec API antes de
  marcar acciones como completas.
- Falta agent especifico autorizado para cerrar MVP Tecno Telec si se requiere
  desarrollo fuera del alcance de AGENTS-019.
