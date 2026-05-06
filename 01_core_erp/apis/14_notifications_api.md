# Notifications API

## Objetivo

Centralizar eventos y notificaciones para que los modulos del ERP no dependan directamente de proveedores de mensajeria.

## Responsabilidades

- Recibir eventos notificables.
- Renderizar plantillas.
- Enviar por email, WhatsApp, SMS, push o notificacion interna.
- Registrar entregas, errores y reintentos.

## Endpoints base

```http
POST /api/notifications/events
POST /api/notifications/messages
GET /api/notifications/messages/{message_id}
POST /api/notifications/messages/{message_id}/retry
```

## Regla

Las notificaciones deben ser asincronas y no deben bloquear ventas, pagos ni movimientos de inventario.

