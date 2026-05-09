# Proceso de publicacion de precios en Web

## Regla principal

Todo precio visible en Web Tecno Telec debe venir de Pricing API a traves de TecnoTelec Gateway.

## Reglas

1. Gateway no inventa precios.
2. Web nunca calcula precios.
3. Web nunca muestra costos internos.
4. Web nunca muestra margen.
5. Si no hay precio, mostrar `Solicitar cotizacion`.
6. Si es precio demo, mostrar solo en ambiente `development`.
7. Si el producto cambio de costo, Pricing recalcula.
8. Si ya existe cotizacion, mantener snapshot.
9. Si el cliente vuelve a cotizar, generar nuevo snapshot.
10. Precios especiales requieren identidad/permisos.

## Estados

| Estado | Comportamiento |
|---|---|
| `NO_PRICE` | Mostrar `Solicitar cotizacion`. |
| `DEMO_PRICE` | Visible solo en desarrollo. |
| `ACTIVE_PRICE` | Mostrar precio segun politica. |
| `EXPIRED_PRICE` | Solicitar recalculo o cotizacion. |
| `QUOTE_REQUIRED` | CTA a asesor. |
| `SPECIAL_PRICE` | Requiere usuario/permisos. |
| `INTERNAL_ONLY` | Nunca visible publicamente. |

## Flujo

```text
Web
  -> Gateway solicita producto
  -> Gateway solicita precio a Pricing API
  -> Pricing devuelve precio visible o estado
  -> Gateway oculta internos
  -> Web muestra precioLabel
```

## Pendientes

- Politica final de impuestos visibles.
- Vigencia por proveedor/lista.
- Reglas de comprador especial.
- Decision final de snapshots en `quote-api` o `sales-api`.
