# Politica de reintentos

## Estados

```text
PENDING
PROCESSING
COMPLETED
FAILED
CANCELLED
PARTIAL_COMPLETED
```

## Politica

- Reintentos maximos por defecto: 3.
- Backoff incremental: 60s, 5min, 15min.
- No reintentar errores de validacion de usuario.
- Reintentar errores de red, timeout y 5xx.
- Registrar ultimo error y contador.
