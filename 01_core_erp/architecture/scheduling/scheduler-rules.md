# Reglas de scheduler

- No ejecutar dos full sync del mismo proveedor al mismo tiempo.
- Usar checkpoints para jobs largos.
- Reintentar errores transitorios con backoff.
- Cancelar jobs manuales solo si el estado lo permite.
- Registrar `started_at`, `finished_at`, `attempts` y `last_error`.
