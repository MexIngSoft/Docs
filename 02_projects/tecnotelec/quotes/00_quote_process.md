# Proceso de cotizacion Tecno Telec

## Objetivo

Documentar el flujo minimo de cotizacion antes de programar integraciones reales.

## Flujo

```text
Web solicita cotizacion
  -> Gateway recibe
  -> TecnoTelec API entrega configuracion del formulario
  -> Catalog API valida productos/soluciones
  -> Pricing API calcula precio visible
  -> Quote API o Sales API guarda cotizacion y snapshot
  -> JobCron da seguimiento administrativo
```

## Datos minimos

- Nombre.
- Telefono.
- Correo.
- Tipo de cliente.
- Necesidad.
- Ubicacion.
- Presupuesto estimado.
- Productos seleccionados.
- Solucion seleccionada.
- Mensaje.
- Origen: Web, WhatsApp o asesor.

## Estados

| Estado | Descripcion |
|---|---|
| `NEW` | Solicitud recibida. |
| `IN_REVIEW` | Asesor revisa alcance. |
| `NEEDS_INFO` | Falta informacion. |
| `QUOTED` | Cotizacion emitida. |
| `ACCEPTED` | Cliente acepta. |
| `REJECTED` | Cliente rechaza. |
| `EXPIRED` | Vigencia vencida. |
| `CONVERTED_TO_ORDER` | Convertida a orden. |

## Pendientes

- Definir request/response final del Gateway.
- Definir notificaciones y consentimiento.

## Decision MVP

La cotizacion inicial se guarda en Sales API segun `01_quote_mvp_sales_decision.md`.
