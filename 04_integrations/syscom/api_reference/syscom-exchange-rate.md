# SYSCOM Exchange Rate API

## Objetivo

Consultar el tipo de cambio publicado por SYSCOM para costos de proveedor que vengan en USD o dependan del dolar.

Este dato debe considerarse para recalcular precios cuando el costo proveedor no este expresado directamente en MXN.

## Endpoint

```http
GET https://developers.syscom.mx/api/v1/tipocambio
```

## Response documentado

```json
{
  "normal": "17.85",
  "preferencial": "17.85",
  "un_dia": "17.90",
  "una_semana": "17.95",
  "dos_semanas": "18.00",
  "tres_semanas": "18.05",
  "un_mes": "18.10"
}
```

## Uso recomendado

`supplier-api` debe sincronizar y guardar el tipo de cambio como snapshot historico.

`pricing-api` debe usar el snapshot vigente para convertir costo proveedor a moneda base antes de aplicar margen, descuentos, redondeo e impuestos.

## Campos sugeridos

| Campo | Descripcion |
|---|---|
| `supplier` | Proveedor origen, por ejemplo `SYSCOM`. |
| `rate_type` | `normal`, `preferencial`, `un_dia`, `una_semana`, etc. |
| `from_currency` | `USD`. |
| `to_currency` | `MXN`. |
| `rate` | Valor decimal del tipo de cambio. |
| `captured_at` | Fecha/hora de captura. |
| `raw_data` | Respuesta original del proveedor. |

## Reglas

- No consultar SYSCOM en vivo durante cada calculo de precio si existe snapshot vigente.
- Si el snapshot de tipo de cambio esta vencido, marcar el precio como `requires_review` o refrescar antes de recalcular.
- Conservar historico para auditoria y para explicar cotizaciones pasadas.
- La cotizacion o venta debe guardar el tipo de cambio usado en el snapshot.
- Si SYSCOM entrega diferentes tipos de cambio por plazo, Pricing debe escoger el `rate_type` definido por politica comercial.

## Frecuencia sugerida

| Proceso | Frecuencia |
|---|---:|
| Sync tipo de cambio SYSCOM | Diario o 2 veces al dia |
| Refresco antes de rebuild masivo | Obligatorio si el ultimo snapshot esta vencido |
| Refresco antes de cotizacion grande | Recomendado |

## Comando futuro

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_exchange_rate
```
