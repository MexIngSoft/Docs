# REFAPART Admin Overview

## Objetivo

Definir el panel interno para operar solicitudes, proveedores, cotizaciones,
pedidos, demanda y logistica sin exponer informacion sensible al cliente.

## Rutas admin requeridas

| Ruta | Uso | Estado |
|---|---|---|
| `/admin/refapart` | Dashboard operativo. | EXISTE_EN_CODIGO |
| `/admin/refapart/part-requests` | Bandeja de solicitudes. | EXISTE_EN_CODIGO |
| `/admin/refapart/part-requests/[id]` | Detalle de solicitud. | EXISTE_EN_CODIGO |
| `/admin/refapart/part-requests/[id]/suppliers` | Proveedores sugeridos/contactados. | PENDIENTE |
| `/admin/refapart/part-requests/[id]/quote` | Generacion de cotizacion. | PENDIENTE |
| `/admin/refapart/suppliers` | Gestion de proveedores. | EXISTE_EN_CODIGO |
| `/admin/refapart/products` | Productos publicables. | EXISTE_EN_CODIGO |
| `/admin/refapart/search-logs` | Logs de busqueda. | EXISTE_EN_CODIGO |
| `/admin/refapart/demand` | Demanda no satisfecha. | EXISTE_EN_CODIGO |
| `/admin/refapart/quotes` | Cotizaciones. | EXISTE_EN_CODIGO |
| `/admin/refapart/orders` | Pedidos. | EXISTE_EN_CODIGO |
| `/admin/refapart/logistics` | Logistica. | EXISTE_EN_CODIGO |
| `/admin/refapart/audit` | Auditoria. | EXISTE_EN_CODIGO |
| `/admin/refapart/settings` | Configuracion operativa. | PENDIENTE_DE_DEFINIR |

## Datos no publicos

- telefono real del proveedor;
- costo proveedor;
- margen REFAPART;
- notas internas;
- auditoria;
- errores tecnicos.
