# Matriz API A Responsabilidad

## Auth

Responsable de usuarios, roles, permisos, JWT, refresh tokens, sesiones, aplicaciones y auditoria de acceso.

No maneja negocio.

## Gateway General

Responsable de enrutamiento, validacion transversal, versionado, observabilidad y proxy hacia APIs de dominio/core.

No contiene logica de negocio especifica.

## Search

Responsable de normalizacion, sinonimos, indexacion, consulta, logs de busqueda y demanda no satisfecha.

No decide precios, stock ni ventas.

## Catalog

Responsable de productos, categorias, marcas, compatibilidades y datos catalogables.

No maneja existencia fisica ni precio final.

## Inventory

Responsable de stock, almacenes, disponibilidad, reservados y movimientos.

No maneja proveedores como entidad comercial.

## Pricing

Responsable de listas de precio, margenes, reglas de precio, descuentos e impuestos.

No crea pedidos ni cotizaciones comerciales.

## Supplier

Responsable de proveedores, contactos, reputacion, productos de proveedor y condiciones.

No maneja usuarios Auth ni ventas finales.

## Procurement

Responsable de solicitudes de compra, ordenes de compra, comparacion operativa y recepcion.

No maneja ventas al cliente final.

## Sales

Responsable de leads, cotizaciones, ordenes, pagos comerciales y cierre de venta.

No maneja compras a proveedor.

## RefaPart

Responsable del flujo especifico de RefaPart: solicitud de pieza, contacto a proveedores, respuesta, cotizacion, orden, logistica basica y auditoria de su dominio.

Consume core APIs mediante Gateway General.
