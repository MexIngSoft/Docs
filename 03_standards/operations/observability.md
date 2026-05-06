# Observabilidad

## Objetivo

Definir logs, metricas, trazabilidad y alertas minimas para operar el ERP modular.

La observabilidad debe permitir responder:

```text
Que se ejecuto, cuando, que cambio, que fallo y que quedo pendiente.
```

## Principios

- Todo proceso operativo debe registrar inicio, fin, duracion y resultado.
- Los procesos `sync_*` y `publish_*` deben registrar conteos.
- Los errores deben incluir `correlation_id` cuando crucen APIs.
- Los logs no deben exponer secretos.
- La evidencia debe permitir reprocesar o diagnosticar sin repetir llamadas innecesarias.

## Logs estructurados

Campos recomendados:

```json
{
  "timestamp": "datetime",
  "level": "INFO",
  "service": "Supplier",
  "command": "sync_syscom_products",
  "correlation_id": "uuid",
  "provider": "SYSCOM",
  "event": "sync.completed",
  "created": 10,
  "updated": 20,
  "skipped": 5,
  "failed": 1,
  "duration_ms": 1200
}
```

## SupplierSyncLog

Debe registrar:

- Provider.
- Nombre del comando.
- Fecha de inicio.
- Fecha de fin.
- Estado.
- Conteos creados, actualizados, omitidos y fallidos.
- Mensaje de error resumido.
- Correlation id.

Estados sugeridos:

- `STARTED`.
- `COMPLETED`.
- `FAILED`.
- `PARTIAL`.
- `CANCELLED`.

## Metricas minimas

Por comando:

- Duracion.
- Registros procesados.
- Registros creados.
- Registros actualizados.
- Registros omitidos.
- Registros fallidos.
- Reintentos.

Por proveedor:

- Tiempo de respuesta.
- Errores de autenticacion.
- Errores de rate limit.
- Errores 5xx.
- Fecha de ultimo sync exitoso.

Por publish:

- Entidades publicadas.
- Entidades sin mapeo.
- Conflictos de normalizacion.
- Duplicados evitados por idempotencia.

## Alertas

Alertas recomendadas:

- Token vencido o credenciales invalidas.
- Sync critico fallido.
- Publish fallido despues de sync exitoso.
- Incremento anormal de errores.
- Datos incompletos en campos obligatorios.
- No hay sync exitoso en ventana esperada.
- Reservas de inventario vencidas sin liberar.
- Cotizaciones logisticas con tasa alta de fallo por carrier.

## Trazabilidad

Debe poder seguirse:

```text
ExternalId proveedor
  -> SupplierProduct
  -> CatalogProduct
  -> Pricing final
  -> Inventory availability
  -> SalesQuote / Project
```

Campos clave:

- `ExternalId`.
- `SupplierProviderId`.
- `CatalogProductId`.
- `ReferenceType`.
- `ReferenceId`.
- `IdempotencyKey`.
- `CorrelationId`.

## Retencion

Recomendacion inicial:

- Logs de aplicacion: 30 dias en local o entorno simple.
- Logs de sync y publish: 90 dias.
- Auditoria de movimientos y ventas: permanente o segun politica legal.
- RawData de proveedor: conservar mientras sea util para reproceso y auditoria.

## Criterio de cierre

Un proceso es observable cuando:

- Tiene log de inicio y fin.
- Reporta conteos.
- Reporta errores con codigo.
- Tiene correlation id si cruza APIs.
- No imprime secretos.
- Permite saber si es seguro reintentar.
