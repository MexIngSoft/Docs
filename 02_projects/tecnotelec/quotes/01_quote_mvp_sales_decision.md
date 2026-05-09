# Decision MVP: cotizacion en Sales API

## Contexto

La documentacion define que la cotizacion puede vivir en una `Quote API` separada o iniciar dentro de `Sales API` si se documenta la separacion.

## Decision

Para habilitar operaciones reales iniciales de Tecno Telec, el MVP guarda cotizaciones en `Sales API`.

## Flujo operativo

```text
Web Tecno Telec
  -> TecnoTelec Gateway API
  -> Catalog API valida productos
  -> Pricing API entrega precio visible
  -> Inventory API entrega disponibilidad
  -> Supplier API entrega referencia de proveedor cuando existe
  -> Sales API guarda cotizacion y partidas
  -> JobCron revisa seguimiento administrativo
```

## Regla de separacion

Sales API puede guardar cotizaciones MVP, partidas y snapshots basicos. No debe absorber reglas permanentes de precio, catalogo, inventario ni proveedor.

Cuando exista `Quote API`, Sales debera delegar o migrar la responsabilidad de cotizaciones sin cambiar el contrato publico del Gateway.

## Estado

Decision vigente para implementacion inicial.
