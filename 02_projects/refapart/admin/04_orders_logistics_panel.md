# REFAPART Orders And Logistics Panel

## Objetivo

Dar seguimiento interno a pedidos creados desde cotizaciones aceptadas.

## Flujo minimo

1. Convertir `Quote` aceptada en `Order`.
2. Reservar oferta proveedor.
3. Crear `LogisticsTask`.
4. Cambiar `PartRequest` a `OrderCreated`.
5. Emitir `order.created`.
6. Registrar auditoria.

## Estados logisticos

| Estado |
|---|
| PendingPickup |
| PickedUp |
| InTransit |
| Delivered |
| Failed |
| Cancelled |

## Datos requeridos

- origen;
- destino;
- quien recoge;
- quien entrega;
- costo;
- tiempo estimado;
- estado;
- evidencia;
- notas.
