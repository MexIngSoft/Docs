# Cierre productivo REFAPART

## Objetivo

Cerrar la ruta productiva de REFAPART como primer vertical comercial del
ecosistema: busqueda, solicitud, cotizacion, venta asistida y operacion interna.

## Arquitectura productiva

```text
WEB.NJ.NEXT.RefaPart
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.RefaPart
  -> Auth, Catalog, Supplier, Pricing, Sales, Address, Inventory, Document, Search
  -> JobCron para operacion
```

El cliente compra y conversa con REFAPART. Los proveedores, costos internos y
notas operativas no se exponen al cliente.

## Contratos productivos

| Ruta Gateway | Metodo | Destino | Proposito | Estado |
|---|---|---|---|---|
| `/api/v1/projects/REFAPART/parts/search` | GET | REFAPART API/Search | Buscar piezas publicables. | Parcial |
| `/api/v1/projects/REFAPART/parts/{id}` | GET | REFAPART API | Detalle publico de pieza. | Parcial |
| `/api/v1/projects/REFAPART/requests` | POST | REFAPART API | Crear solicitud de pieza no visible. | Parcial |
| `/api/v1/projects/REFAPART/quotes` | POST | REFAPART API/Sales | Crear cotizacion asistida. | Parcial |
| `/api/v1/projects/REFAPART/orders` | POST | REFAPART API/Sales | Convertir cotizacion a pedido. | PENDIENTE_DE_IMPLEMENTAR |
| `/api/v1/projects/REFAPART/admin/requests` | GET/PATCH | REFAPART API | Operacion interna. | PENDIENTE_DE_IMPLEMENTAR |

## Entidades minimas

| Entidad | Fuente |
|---|---|
| Pieza publicable | REFAPART API + Catalog |
| Solicitud de pieza | REFAPART API |
| Proveedor oculto | Supplier API / REFAPART API segun dato propio |
| Oferta proveedor | REFAPART API |
| Cotizacion cliente | Sales API con snapshot REFAPART |
| Orden | Sales API |
| Direccion | Address API |

## Search

REFAPART debe indexar:

- piezas publicables;
- categorias;
- marcas/modelos compatibles;
- solicitudes internas autorizadas;
- cotizaciones y ordenes solo para usuarios autorizados.

Search debe filtrar por `project_code=REFAPART`, visibilidad, tenant y permiso.
Los eventos de piezas, solicitudes, cotizaciones y ordenes deben salir por
outbox para permitir reintentos y reconciliacion.

## Permisos productivos

| Rol | Permisos minimos |
|---|---|
| `CUSTOMER` | Crear solicitudes, ver sus cotizaciones y ordenes. |
| `REFAPART_ADMIN` | Administrar catalogo REFAPART, solicitudes, cotizaciones y ordenes. |
| `REFAPART_QUOTER` | Crear ofertas/cotizaciones y asignar proveedor. |
| `REFAPART_SUPPLIER_MANAGER` | Administrar proveedores ocultos y condiciones internas. |
| `REFAPART_LOGISTICS` | Gestionar entrega, tracking y direcciones. |
| `REFAPART_FINANCE` | Ver pagos, costos, margen y facturacion. |
| `REFAPART_SUPPORT` | Ver casos de cliente sin costos internos sensibles. |

## Pendientes reales

- PENDIENTE_DE_DEFINIR: pasarela de pago real.
- PENDIENTE_DE_DEFINIR: politica final de garantia/devolucion.
- PENDIENTE_DE_DEFINIR: proveedores autorizados reales y reglas de exposicion.
- PENDIENTE_DE_IMPLEMENTAR: seed productivo de roles/permisos en Auth.
- PENDIENTE_DE_IMPLEMENTAR: eventos JobCron/outbox para solicitudes,
  cotizaciones y ordenes.
- IMPLEMENTADO_UI_PARCIAL_API: paneles por perfil cliente, proveedor,
  cotizador/admin y administrador REFAPART. Falta conectar todos los datos
  productivos, permisos finales y eventos operativos.
