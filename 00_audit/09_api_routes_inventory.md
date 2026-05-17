# Inventario actual de rutas API

## Objetivo

Registrar el estado real de rutas Django encontradas en el workspace para validar si las APIs necesarias ya estan disponibles.

## Regla arquitectonica

```text
Web Tecno Telec
  -> TecnoTelec Gateway API
  -> Core APIs necesarias
  -> TecnoTelec API solo para configuracion propia
  -> JobCron administra todo
```

La Web no debe consumir directamente las Core APIs. El Gateway expone el contrato publico y coordina con Catalog, Pricing, Supplier, Inventory, Auth, TecnoTelec API y las APIs core que correspondan.

## Estado encontrado

| API | Estado de rutas | Observacion |
|---|---|---|
| Auth | Base ampliada disponible | Tiene Djoser, JWT, logout, permisos efectivos por aplicacion, endpoints admin de roles/permisos/aplicaciones y tablas de sesiones, dispositivos, refresh tokens hasheados, MFA, recuperacion y auditoria. |
| Catalog | MVP implementado | Expone health, productos, detalle, categorias y marcas para Gateway/JobCron. |
| Customization | Minimo disponible | Tiene `api/customization/health/`. |
| Inventory | MVP implementado | Expone health y disponibilidad por producto. |
| LexNova | Minimo disponible | Tiene `api/ping/`. No forma parte del flujo Tecno Telec MVP. |
| Pricing | MVP implementado | Expone health, listas de precio, precio resuelto y precios por producto. |
| Procurement | Pendiente | Solo se encontro `admin/`; no es bloqueo directo del catalogo publico MVP. |
| Sales | MVP implementado | Expone health, crear cotizacion y consultar cotizacion. Cotizacion MVP vive aqui. |
| Supplier | MVP implementado | Expone health y fuente/proveedor por producto. |
| TecnoTelec API | Parcial disponible | Tiene `health/`, `api/health/`, `api/solutions/`, `api/solutions/<slug>/`, `api/leads/`, `api/project-cases/`. |
| TecnoTelec Gateway API | Contrato inicial disponible | Tiene rutas publicas para salud, soluciones, cotizacion, contacto, productos, categorias y marcas. |

## Rutas principales confirmadas de TecnoTelec Gateway

- `health/`
- `api/health/`
- `api/public/solutions/`
- `api/public/solutions/<slug:slug>/`
- `api/quote/start/`
- `api/quote/evaluate/`
- `api/contact/lead/`
- `api/products/`
- `api/products/search/`
- `api/products/category/<slug:slug>/`
- `api/products/brand/<slug:slug>/`
- `api/products/solution/<slug:slug>/`
- `api/products/featured/`
- `api/products/recommended/`
- `api/products/filters/`
- `api/products/<slug:slug>/`
- `api/products/<slug:slug>/related/`
- `api/products/<slug:slug>/gallery/`
- `api/products/<slug:slug>/technical-sheet/`
- `api/products/<slug:slug>/availability/`
- `api/products/<slug:slug>/price/`
- `api/categories/`
- `api/categories/<slug:slug>/`
- `api/brands/`
- `api/brands/<slug:slug>/`

## Resultado

Las rutas MVP necesarias para una primera operacion real Tecno Telec ya estan implementadas.

El Gateway de Tecno Telec consulta Catalog, Pricing, Inventory, Supplier, Sales y Auth. Procurement queda fuera del flujo publico MVP. Quote API separada sigue pendiente cuando el flujo de cotizacion crezca fuera de Sales.

## Rutas Core MVP agregadas

Catalog API:

- `GET /api/catalog/health/`
- `GET /api/catalog/products/`
- `GET /api/catalog/products/{slug}/`
- `GET /api/catalog/categories/`
- `GET /api/catalog/categories/{slug}/`
- `GET /api/catalog/brands/`
- `GET /api/catalog/brands/{slug}/`

Pricing API:

- `GET /api/pricing/health/`
- `GET /api/pricing/price-lists/`
- `GET /api/pricing/product/{productId}/`
- `GET /api/pricing/products/{productId}/prices/`

Inventory API:

- `GET /api/inventory/health/`
- `GET /api/inventory/products/{productId}/availability/`

Supplier API:

- `GET /api/supplier/health/`
- `GET /api/supplier/products/{productId}/source/`

Sales API:

- `GET /api/sales/health/`
- `POST /api/sales/quotes/`
- `GET /api/sales/quotes/{quoteId}/`

## Pendientes recomendados

1. Sembrar datos reales suficientes en Catalog, Pricing, Inventory y Supplier.
2. Configurar matriz concreta de permisos internos de JobCron para costos, margenes, precio interno y seguimiento usando Auth.
3. Crear vistas reales de JobCron para administrar estos endpoints.
4. Separar Quote API cuando el flujo de cotizacion crezca fuera del MVP.
5. Mantener TecnoTelec API limitada a configuracion propia, leads, servicios y contenido propio.
