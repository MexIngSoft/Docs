# Integraciones

## Objetivo

Documentar proveedores externos, APIs externas y procesos ETL.

## Proveedores actuales

- `syscom`
- `ct-internacional`
- `dc-mayorista`

## Regla

Si el contenido depende de un proveedor externo, no pertenece al nucleo ERP. El nucleo define contratos internos; la integracion define como transformar datos externos hacia esos contratos.

Cada integracion debe documentar mapper, sync, seguridad y errores cuando haya
contrato real del proveedor. Si falta informacion, usar `PENDIENTE_DE_DEFINIR`;
no inventar endpoints ni credenciales.

## Regla de publicacion

Las integraciones descargan informacion. No deciden en que proyecto se muestra cada producto.

La publicacion por proyecto se define en:

```text
docs/01_core_erp/erp/20_channel_assortment.md
```
