---
title: Observabilidad operativa
domain: standards
status: active
priority: p1
owner: Equipo de plataforma
last_reviewed: 2026-06-14
---

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

## Logs estructurados obligatorios

Las APIs, gateways, workers, jobs y ETL deben emitir logs JSON en entornos
compartidos. En desarrollo local se permite una salida legible siempre que
conserve los mismos campos semanticos.

Campos base:

- `timestamp`;
- `level`;
- `service_name`;
- `service_version`;
- `environment`;
- `request_id`;
- `correlation_id` cuando la operacion cruza servicios;
- `user_id` solo cuando exista identidad autenticada y sin exponer datos
  sensibles;
- `event`;
- `execution_time_ms`;
- `status`;
- `error_code` cuando falle.

`cpu_usage` y `memory_usage` se registran como metricas de proceso o job cuando
la plataforma pueda obtenerlos de forma fiable. No se deben inventar ni medir
en cada request si el costo operativo es desproporcionado.

Campos recomendados:

```json
{
  "timestamp": "datetime",
  "level": "INFO",
  "service_name": "supplier-api",
  "service_version": "v1",
  "environment": "dev",
  "request_id": "uuid",
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

## Propagacion entre servicios

- El primer punto de entrada crea `request_id` si el cliente no lo envia.
- Gateway/BFF crea o conserva `correlation_id` y lo propaga a APIs internas.
- Cada servicio registra ambos identificadores y los devuelve en errores
  normalizados cuando sea seguro.
- Los reintentos conservan `correlation_id` y generan un `request_id` nuevo por
  intento.
- Ningun identificador sustituye autenticacion, autorizacion o auditoria.

## Seguridad de logs

Nunca registrar tokens, cookies, passwords, secretos, archivos completos,
datos fiscales completos ni payloads sensibles sin redaccion. Los campos de
usuario deben usar identificadores tecnicos y respetar la politica de
retencion aplicable.

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
