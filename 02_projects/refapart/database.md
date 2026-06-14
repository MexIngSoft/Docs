# Base de datos REFAPART

## Estado

FUTURE_OR_PENDING

## Tablas comerciales propias

| Tabla | Uso |
|---|---|
| `customers` | Clientes finales. |
| `customer_addresses` | Direcciones de entrega. |
| `vehicle_brands` | Marcas visibles. |
| `vehicle_models` | Modelos visibles. |
| `part_categories` | Categorias publicas. |
| `public_parts` | Piezas publicables, no inventario real profundo. |
| `public_part_compatibilities` | Compatibilidad visible. |
| `search_requests` | Busquedas y solicitudes del cliente. |
| `quotations` | Cotizaciones visibles. |
| `quotation_items` | Piezas cotizadas. |
| `orders` | Pedidos comerciales. |
| `order_items` | Piezas del pedido. |
| `payments` | Pagos de cliente. |
| `customer_messages` | Mensajes visibles. |
| `tracking_events` | Seguimiento publico. |

## Datos operativos en JobCron

| Dominio | Motivo |
|---|---|
| Proveedores | Deben ser internos y auditables. |
| Costos y margenes | No son datos publicos. |
| WhatsApp proveedor | Operacion interna. |
| Compras proveedor | Pertenece a abastecimiento. |
| Logistica profunda | Recoleccion, fletera, incidencias y costos reales. |
| Automatizaciones | Jobs, reintentos y auditoria. |

## Decision MVP actual

No se crean migraciones en esta corrida. La web usa datos mock para validar
experiencia, copy, flujo y assets de marca.
