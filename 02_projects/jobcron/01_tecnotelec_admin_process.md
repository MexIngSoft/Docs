# Proceso administrativo Tecno Telec en JobCron

## Objetivo

Definir que todo lo visible u operable en Web Tecno Telec debe poder administrarse, revisarse o supervisarse desde JobCron.

## JobCron debe administrar

| Grupo | Elementos |
|---|---|
| Catalogo visible | Publicados, ocultos, bloqueados, solo cotizacion, vendibles, destacados. |
| Contenido comercial | Soluciones, categorias comerciales, banners, secciones de Home, textos. |
| Pricing | Reglas de precio, listas de precio, margenes, precios vencidos, productos sin precio. |
| CRM/ventas | Leads, cotizaciones, clientes, seguimiento, estados. |
| Operacion | Usuarios internos, permisos, reportes, sincronizaciones de proveedores, errores. |
| Calidad de datos | Imagenes faltantes, productos sin categoria, descripcion, ficha tecnica, garantia, SAT, proveedor o stock. |

## Regla

Todo lo que se muestre en Web Tecno Telec debe poder administrarse o revisarse en JobCron.

## Relacion con APIs

| Accion JobCron | API responsable |
|---|---|
| Aprobar visibilidad de producto | TecnoTelec API / Catalog segun frontera. |
| Editar texto comercial | TecnoTelec API. |
| Configurar lista o regla de precio | Pricing API. |
| Revisar producto base | Catalog API. |
| Revisar proveedor/sync | Supplier API. |
| Revisar stock | Inventory API. |
| Revisar cotizacion | Quote API o Sales API. |

## Pendientes

- Definir pantallas reales de JobCron para estas tareas.
- Definir permisos por rol interno.
- Definir si JobCron sera producto SaaS publico o ERP interno.

## Endpoints MVP disponibles para JobCron

JobCron puede iniciar revision administrativa consultando:

- Catalog API: productos, categorias y marcas.
- Pricing API: listas de precio, precio resuelto y precios por producto.
- Inventory API: disponibilidad por producto.
- Supplier API: fuente/proveedor por producto.
- Sales API: cotizaciones MVP.

Los permisos finos por rol siguen pendientes antes de exponer costos, margenes y datos internos a usuarios no autorizados.
