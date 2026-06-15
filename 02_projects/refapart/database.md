# Base de datos REFAPART

## Estado

ACTIVE_MVP

## Tablas comerciales propias

| Tabla | Uso |
|---|---|
| `Product` | Piezas publicables y compatibilidad MVP. |
| `SearchQuery` | Consulta original, normalizada, intencion y ranking. |
| `PartRequest` | Demanda explicita o creada por busqueda sin resultado. |
| `Supplier` | Proveedores internos habilitados. |
| `SupplierOffer` | Precio, disponibilidad, garantia y logistica de proveedor. |
| `Quote` | Precio final y margen de la oferta seleccionada. |
| `Order` | Pedido comercial creado desde una cotizacion aceptada. |

## Datos operativos en JobCron

| Dominio | Motivo |
|---|---|
| Proveedores | Deben ser internos y auditables. |
| Costos y margenes | No son datos publicos. |
| WhatsApp proveedor | Operacion interna. |
| Compras proveedor | Pertenece a abastecimiento. |
| Logistica profunda | Recoleccion, fletera, incidencias y costos reales. |
| Automatizaciones | Jobs, reintentos y auditoria. |

## Direcciones

El catalogo geografico vive en `API.PY.DJANGO.Address` con pais, estado,
municipio, codigo postal, asentamiento, calle y direccion. REFAPART conserva
solo los campos operativos minimos mientras se integra la referencia formal.

## Migraciones

El esquema inicial y el seed MVP estan versionados. El seed incluye tres
piezas y dos proveedores para pruebas locales reproducibles.
