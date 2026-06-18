# REFAPART Order To Logistics Flow

## Objetivo

Dar seguimiento a pedido, recoleccion, envio, entrega e incidencias.

## Flujo

1. Crear `Order` desde `Quote` aceptada.
2. Crear `OrderStatusHistory`.
3. Crear `LogisticsTask`.
4. Confirmar origen y destino.
5. Registrar costo y responsable.
6. Actualizar estado logistico.
7. Publicar tracking permitido al cliente.
8. Registrar evidencia.
9. Cerrar o escalar incidencia.

## Eventos relacionados

| Evento | Direccion |
|---|---|
| `order.created` | REFAPART -> JobCron |
| `logistics.updated` | JobCron -> REFAPART |
| `payment.confirmed` | REFAPART -> JobCron |
