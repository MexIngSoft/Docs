# Calendario de jobs

## Reglas de programacion

- Jobs de token: programar antes de expiracion.
- Jobs rapidos: intervalos cortos y payload pequeno.
- Jobs completos: ventanas de baja demanda.
- Jobs de reparacion: manuales y auditados.

## Tabla base

| Job | Ventana | Reintentos | Observabilidad |
|---|---|---|---|
| Token proveedor | Permanente | 3 | Log + estado |
| Stock/precio | Operacion | 3 | Conteos actualizados |
| Catalogo completo | Nocturna | 3 | Paginacion y checkpoint |
| DocuCore OCR/conversion | Por demanda | 1-3 | Progreso por job |
