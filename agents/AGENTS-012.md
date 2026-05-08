## FASE 11 — Cotizador básico

Crear:

02_projects/tecnotelec/quotes/00_quote_process.md

Proceso:

Web solicita cotización.
Gateway recibe.
Gateway consulta:

- TecnoTelec API para configuración del formulario.
- Catalog API para productos.
- Pricing API para precio.
- Sales o Quote API para guardar cotización.
- JobCron para seguimiento administrativo.

Datos mínimos:

- nombre
- teléfono
- correo
- tipo de cliente
- necesidad
- ubicación
- presupuesto estimado
- productos seleccionados
- solución seleccionada
- mensaje
- origen: Web / WhatsApp / asesor

Estados:

NEW
IN_REVIEW
NEEDS_INFO
QUOTED
ACCEPTED
REJECTED
EXPIRED
CONVERTED_TO_ORDER