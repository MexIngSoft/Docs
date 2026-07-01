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
| `/admin/refapart/part-requests/[id]/suppliers` | Proveedores sugeridos/contactados. | EXISTE_EN_CODIGO |
| `/admin/refapart/part-requests/[id]/quote` | Generacion de cotizacion. | EXISTE_EN_CODIGO |
| `/admin/refapart/suppliers` | Gestion de proveedores. | EXISTE_EN_CODIGO |
| `/admin/refapart/products` | Alta, edicion, publicacion/ocultamiento y eliminacion de productos publicables. | EXISTE_EN_CODIGO |
| `/admin/refapart/search-logs` | Logs de busqueda. | EXISTE_EN_CODIGO |
| `/admin/refapart/demand` | Demanda no satisfecha. | EXISTE_EN_CODIGO |
| `/admin/refapart/quotes` | Cotizaciones. | EXISTE_EN_CODIGO |
| `/admin/refapart/orders` | Pedidos. | EXISTE_EN_CODIGO |
| `/admin/refapart/logistics` | Logistica. | EXISTE_EN_CODIGO |
| `/admin/refapart/audit` | Auditoria. | EXISTE_EN_CODIGO |
| `/admin/refapart/settings` | Configuracion operativa. | EXISTE_EN_CODIGO |

## Paneles por perfil implementados

| Perfil | Ruta | Estado | Alcance |
|---|---|---|---|
| Cliente / buscador | `/dashboard` | IMPLEMENTADO_UI | Resumen de solicitudes, cotizaciones, pedidos, favoritos, busqueda rapida, timeline y ayuda. Usa informacion segura y no muestra proveedor ni costos internos. |
| Cotizador / gestor de busqueda | `/admin/refapart` y `/admin/refapart/part-requests` | IMPLEMENTADO_UI_PARCIAL_API | Bandeja operativa, metricas, solicitudes asignadas y acciones rapidas. Si el endpoint dashboard responde, usa datos reales; si no, usa fallback controlado para no romper la UI. |
| Proveedor | `/proveedor` | IMPLEMENTADO_UI | Panel de solicitudes recibidas, estadisticas, respuesta y reglas operativas. No expone datos sensibles de clientes. |
| Administrador REFAPART | `/admin/refapart` | IMPLEMENTADO_UI_PARCIAL_API | Vista global de busquedas, solicitudes, cotizaciones, pedidos, operacion controlada y accesos a modulos admin. |

## Reglas visuales del panel

- Mantener tarjetas blancas, bordes suaves, mucho espacio util y acento rojo
  REFAPART.
- Cada perfil debe entrar directo a su trabajo principal.
- No mostrar funciones como productivas si dependen de contrato, proveedor de
  pago, outbox, Search o permisos finales.
- Usar fallback de desarrollo solo para que la UI sea navegable; los datos
  reales deben venir del Gateway General y la API REFAPART.

## Pendientes por backend/productivo

- Seed productivo de roles y permisos por perfil REFAPART agregado en Auth:
  `access/migrations/0020_seed_refapart_specialized_roles.py`.
- PENDIENTE_DE_IMPLEMENTAR: asignacion productiva desde UI JobCron mediante
  Gateway `/api/v1/admin/identity/*`.
- PENDIENTE_DE_IMPLEMENTAR: eventos JobCron/outbox para solicitudes,
  cotizaciones y pedidos.
- PENDIENTE_DE_IMPLEMENTAR: Search sync productivo para solicitudes y ordenes.
- PENDIENTE_DE_DEFINIR: pasarela de pago y proveedor logistico.
- PENDIENTE_DE_DEFINIR: proveedores autorizados reales y contrato comercial.

## Datos no publicos

- telefono real del proveedor;
- costo proveedor;
- margen REFAPART;
- notas internas;
- auditoria;
- errores tecnicos.
