# Permisos

## Modelo

```text
recurso:accion:ambito
```

Ejemplos:

- `catalog:read:project`
- `pricing:update:tenant`
- `document:process:user`

## Reglas

- Todo permiso debe tener recurso y accion.
- Los permisos sensibles requieren auditoria.
- Costos y margenes no deben exponerse sin permiso explicito.
