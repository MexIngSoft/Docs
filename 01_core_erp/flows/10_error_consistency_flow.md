# Flujo de errores y consistencia

```text
API recibe operacion critica
Valida idempotency key
Ejecuta paso de dominio
Si falla dependencia, guarda estado intermedio
Agenda retry o revision manual
Registra auditoria
Notifica si requiere accion
```

## Reglas

- Pagos, stock y facturacion requieren idempotencia.
- Una falla no debe dejar ventas invisibles ni stock descontado sin referencia.
- Los estados intermedios deben poder resolverse manualmente.

