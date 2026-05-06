# Jobs asincronos y notificaciones

## Objetivo

Separar procesos de fondo de las acciones inmediatas del usuario.

## Jobs base

- Sincronizacion de proveedores.
- Actualizacion de precios.
- Recalculo de disponibilidad.
- Tracking de envios.
- Envio de notificaciones.
- Reintentos de integraciones externas.
- Procesamiento de documentos.

## Notificaciones base

Canales posibles:

```text
EMAIL
WHATSAPP
SMS
PUSH
IN_APP
```

Eventos:

- Cotizacion lista.
- Pago recibido.
- Envio en camino.
- Pedido entregado.
- Licitacion requiere revision.
- Error operativo requiere accion.

## Reglas

- Una notificacion no debe bloquear la venta.
- Cada job debe registrar inicio, fin, resultado y error si aplica.
- Las notificaciones deben ser idempotentes cuando se reintenten.

## Pendientes

```text
PENDIENTE_DE_DEFINIR:
- Motor de colas definitivo.
- Proveedores de mensajeria.
- Politica de reintentos.
```

