# Estrategia de pruebas

## Objetivo

Definir una estrategia de pruebas para proteger modelos, mappers, comandos ETL, publishers, contratos entre APIs y reglas de dominio.

## Principios

- Probar primero reglas puras y mappers.
- Probar idempotencia de sync y publish.
- Simular proveedores externos.
- Evitar depender de red real en pruebas automatizadas.
- Validar que los errores parciales no rompan todo el proceso.

## Capas de prueba

### Unitarias

Aplican a:

- Mappers de proveedor.
- Normalizadores.
- Calculos de pricing.
- Calculos logisticos.
- Validadores de dominio.

Criterio:

- Sin base de datos cuando sea posible.
- Casos de datos incompletos, duplicados y formatos inesperados.

### Integracion con base de datos

Aplican a:

- Writers de `Supplier`.
- Publishers hacia `Catalog` y `Pricing`.
- Movimientos de inventario.
- Reservas y liberaciones.

Criterio:

- Verificar creacion.
- Verificar actualizacion.
- Verificar que repetir no duplica.
- Verificar transacciones y rollback.

### Comandos operativos

Aplican a:

- `sync_*`.
- `publish_*`.
- `rebuild_*`.
- `cleanup_*`.

Criterio:

- Ejecutan con datos simulados.
- Registran conteos.
- Manejan errores parciales.
- Son idempotentes cuando corresponde.

### Contratos entre APIs

Aplican a:

- `Supplier -> Catalog`.
- `Supplier -> Pricing`.
- `Inventory -> Sales`.
- `Logistics -> Sales`.
- `Projects -> Sales`.

Criterio:

- Validar campos requeridos.
- Validar tipos.
- Validar errores esperados.
- Validar versionado.

## Pruebas minimas por modulo

Supplier:

- Token.
- Mappers por endpoint.
- Writers.
- Sync con respuesta simulada.
- Publish idempotente.

Catalog:

- Creacion de producto interno.
- Relacion producto interno / externo.
- Normalizacion de marca y categoria.

Pricing:

- Calculo con margen.
- Calculo con impuestos.
- Cambio de moneda.
- Vigencia de precio.

Inventory:

- Creacion de almacen.
- Inventario por almacen.
- Movimiento IN/OUT/TRANSFER.
- Reserva idempotente.
- Liberacion de reserva.

Sales:

- Cotizacion.
- Congelamiento de precio.
- Aprobacion.
- Reserva de inventario.

Logistics:

- Cotizacion con carrier simulado.
- Fallback si un carrier falla.
- Expiracion de cotizacion.

Projects:

- Formulario configurable.
- Recomendacion.
- Envio de contrato a Sales.

## Datos de prueba

Usar fixtures o factories para:

- Tenant.
- Proveedor.
- Producto externo.
- Producto interno.
- Almacen.
- Inventario.
- Cotizacion.
- Carrier.

No usar secretos reales ni respuestas privadas completas de proveedores.

## Comandos de validacion

Check Django:

```powershell
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier check
```

Tests por API:

```powershell
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier test
```

## Criterio de cierre

Un cambio critico debe incluir pruebas cuando:

- Modifica modelos.
- Modifica writers o publishers.
- Modifica calculos de precio.
- Modifica inventario o reservas.
- Modifica contratos entre APIs.
- Modifica autenticacion o secretos.

Si no hay prueba automatizada, debe quedar validacion manual documentada en el PR o commit.
