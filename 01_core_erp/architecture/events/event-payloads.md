# Payloads de eventos

## Campos base

```json
{
  "event_id": "uuid",
  "event_name": "FileUploaded",
  "version": 1,
  "occurred_at": "ISO-8601",
  "correlation_id": "uuid",
  "data": {}
}
```

## Reglas

- Payload pequeño.
- Referenciar entidades por ID.
- No enviar secretos.
- Incluir `correlation_id` para trazabilidad.
