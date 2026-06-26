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

## Relacion con Auth

Los correos de autenticacion usan Auth como propietario de identidad,
aplicacion, template y trazabilidad.

Notification Service puede encargarse de entrega asincrona, reintentos y
adaptadores de proveedor, pero debe conservar la referencia de Auth:

- `UserId`;
- `ApplicationId`;
- `ApplicationCode`;
- `ActionCode`;
- `TemplateId`;
- `CorrelationId`;
- `ProviderMessageId`;
- estado operativo.

El detalle de diagnostico, errores por ambiente, SES, reintentos y mensajes
seguros de produccion se documenta en:

```text
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
```

No se debe crear un notification service por proyecto para resolver registro,
verificacion, reset, cambio de correo o invitaciones Auth.
