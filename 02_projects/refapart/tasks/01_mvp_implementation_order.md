# REFAPART MVP Implementation Order

## Objetivo

Ordenar el cierre operativo de REFAPART sin mezclar negocio, frontend, API,
base de datos, integraciones ni estandares.

## Orden recomendado

| Orden | Fase | Entregable | Estado |
|---|---|---|---|
| 1 | Permisos | `security/00_permissions_matrix.md` conectado con Auth/Gateway. | DOCUMENTADO |
| 2 | Busqueda | Flujo cliente, normalizacion, logs y demanda no satisfecha. | DOCUMENTADO |
| 3 | Solicitudes | `PartRequest` y bandeja admin. | DOCUMENTADO |
| 4 | Proveedores | Autorizacion, contacto WhatsApp y registro de respuestas. | DOCUMENTADO |
| 5 | Ofertas | `SupplierOffer`, fotos, garantia y costo interno protegido. | DOCUMENTADO |
| 6 | Cotizacion | Precio final, vigencia, aceptacion/rechazo. | DOCUMENTADO |
| 7 | Pedido | Conversion de cotizacion aceptada a `Order`. | DOCUMENTADO |
| 8 | Logistica | `LogisticsTask`, historial y tracking publico. | DOCUMENTADO |
| 9 | Pagos | Politica y pasarela productiva. | PENDIENTE_DE_DEFINIR |
| 10 | Dashboard | Indicadores operativos y demanda. | DOCUMENTADO |

## Criterio de avance

No pasar una fase a completa hasta tener:

- ruta Gateway documentada;
- contrato API o API Decision Record;
- modelo de datos o `PENDIENTE_DE_DEFINIR`;
- permisos definidos;
- validacion disponible ejecutada o bloqueo documentado.
