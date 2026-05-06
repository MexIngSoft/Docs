# Flujo de devoluciones

```text
Usuario solicita devolucion
Sales API valida venta original
Rules Engine valida politica
Inventory API define reingreso si aplica
Billing API gestiona nota o cancelacion si aplica
Sales API registra reembolso o ajuste
Auditoria registra evento
```

## Reglas

- Toda devolucion debe conservar referencia a venta original.
- El reingreso a inventario no debe ser automatico si el producto requiere inspeccion.

