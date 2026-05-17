# Recuperacion ante fallos de jobs

## Procedimiento

1. Identificar job y correlacion.
2. Revisar logs.
3. Verificar si el error es de datos, red o dependencia externa.
4. Confirmar si el job es idempotente.
5. Reintentar manualmente solo si no duplica efectos.
6. Registrar cierre.

## Fallos comunes

| Tipo | Accion |
|---|---|
| Timeout proveedor | Reintentar con backoff. |
| Credenciales invalidas | Bloquear job y renovar secreto. |
| Datos corruptos | Mover a estado `FAILED` y crear error de validacion. |
| Parcial completado | Reanudar desde checkpoint si existe. |
