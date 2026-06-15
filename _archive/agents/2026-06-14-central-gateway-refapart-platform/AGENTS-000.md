Sí. Como **ya no usarás Gateway por proyecto**, la estructura debe cambiar a un **Gateway único de JobCron** + **APIs core** + **API específica de RefaPart**.

La documentación actual todavía menciona Gateway/BFF por proyecto, pero si la decisión nueva es eliminarlo por proyecto, hay que actualizar el patrón: antes era `Web -> Gateway Proyecto -> API Proyecto -> Core`; ahora debe ser `Web -> JobCron Gateway -> API Proyecto/Core`. La doc actual sí confirma que las APIs core deben mantener responsabilidades separadas y reutilizables. 

## Nueva estructura recomendada

```text
WEB.NJ.NEXT.RefaPart
  -> API.PY.DJANGO.JobCron.Gateway
      -> API.PY.DJANGO.Auth
      -> API.PY.DJANGO.Customer
      -> API.PY.DJANGO.Address
      -> API.PY.DJANGO.Supplier
      -> API.PY.DJANGO.Catalog
      -> API.PY.DJANGO.Vehicle
      -> API.PY.DJANGO.ProductCompatibility
      -> API.PY.DJANGO.Inventory
      -> API.PY.DJANGO.Pricing
      -> API.PY.DJANGO.Costing
      -> API.PY.DJANGO.Quote
      -> API.PY.DJANGO.Sales
      -> API.PY.DJANGO.Payments
      -> API.PY.DJANGO.Logistics
      -> API.PY.DJANGO.Documents
      -> API.PY.DJANGO.Notifications
      -> API.PY.DJANGO.RulesEngine
      -> API.PY.DJANGO.ChannelAssortment
      -> API.PY.DJANGO.RefaPart
```

## APIs que ya existen según documentación

```text
auth-api
supplier-api
catalog-api parcial
pricing-api parcial
sales-api parcial
```

El índice del repo marca esas como existentes o parciales. 

## APIs que faltan y sí necesita RefaPart

```text
API.PY.DJANGO.JobCron.Gateway
API.PY.DJANGO.Customer
API.PY.DJANGO.Address
API.PY.DJANGO.Vehicle
API.PY.DJANGO.ProductCompatibility
API.PY.DJANGO.Quote
API.PY.DJANGO.Logistics
API.PY.DJANGO.Payments
API.PY.DJANGO.Documents
API.PY.DJANGO.Notifications
API.PY.DJANGO.RulesEngine
API.PY.DJANGO.ChannelAssortment
API.PY.DJANGO.RefaPart
```

La documentación ya marca como faltantes `quote-api`, `logistics-api`, `rules-engine-api`, `cart-api`, `billing-api`, `notifications-api` y `documents-api`. 

## Qué se toma del script viejo

Del script que subiste, yo lo dividiría así:

```text
Auth:
tbUsuario, tbTipoUsuario, tbEstadoUsuario, tbCargo, tbPermisoCargo

Customer:
tbUsuario, tbTelefono, tbCorreo, tbContacto

Address:
tbPais, tbEstado, tbMunicipio, tbCodigoPostal, tbAsentamiento,
tbTipoAsentamiento, tbZona, tbCiudad, tbCalle, tbTipoCalle,
tbUbicacion, tbDireccion, tbTipoDireccion, tbEstadoDireccion

Documents:
tbArchivo, tbDocumento, tbTipoDocumento, tbEstadoArchivo, tbComentarioArchivo

Catalog:
tbDescripcionEquipo, tbMarcaEquipo, tbClasificacionEquipo,
tbConceptoEquipo, tbFotoDescripcionEquipo

Sales:
tbPedido, tbConceptoPedido, tbEstadoPedido

Payments:
tbPago, tbParcialidadPago, tbProrrogaPago, tbFormaPago, tbEstadoPago

Inventory:
tbCompra, tbCompraEquipo, tbInstalacionEquipo

LegacyTelecom:
tbPlan, tbContratacion, tbInstalacion, tbFrecuencia,
tbVelocidadPlan, tbIpEstacion, tbDnsEstacion
```

Lo de telecom no debe mezclarse con RefaPart. Debe ir a un módulo heredado o proyecto separado, no al core principal de refacciones.

## Responsabilidad nueva de JobCron

JobCron debe ser el dueño de:

```text
usuarios
clientes
direcciones
proveedores
catálogo maestro
vehículos
compatibilidades
precios
costos
cotizaciones
ventas
pagos
inventario
logística
documentos
notificaciones
reglas
publicación por canal
```

Clientes y direcciones ya están contemplados en la documentación como datos mínimos para ventas, envíos, proyectos y facturación. 

## Responsabilidad de RefaPart

RefaPart debe guardar solo lo específico del negocio:

```text
solicitud de pieza
formulario de vehículo
fotos de pieza buscada
preferencia nuevo/usado
urgencia
ranking de proveedores por refacción
flujo operativo para preguntar a proveedores
panel público de búsqueda
panel de cliente
panel de operador de refacciones
reglas específicas de autopartes
```

No debe guardar usuarios globales, precios globales, ventas core, inventario core ni catálogo reutilizable.

## Estructura final de repositorios

```text
WEB.NJ.NEXT.RefaPart

API.PY.DJANGO.JobCron.Gateway

API.PY.DJANGO.Auth
API.PY.DJANGO.Customer
API.PY.DJANGO.Address
API.PY.DJANGO.Supplier
API.PY.DJANGO.Catalog
API.PY.DJANGO.Vehicle
API.PY.DJANGO.ProductCompatibility
API.PY.DJANGO.Inventory
API.PY.DJANGO.Pricing
API.PY.DJANGO.Costing
API.PY.DJANGO.Quote
API.PY.DJANGO.Sales
API.PY.DJANGO.Payments
API.PY.DJANGO.Logistics
API.PY.DJANGO.Documents
API.PY.DJANGO.Notifications
API.PY.DJANGO.RulesEngine
API.PY.DJANGO.ChannelAssortment

API.PY.DJANGO.RefaPart
```

## Orden correcto para construir

```text
1. JobCron.Gateway
2. Auth
3. Customer
4. Address
5. Supplier
6. Catalog
7. Vehicle
8. ProductCompatibility
9. Quote
10. Pricing
11. Sales
12. Payments
13. Logistics
14. Notifications
15. Documents
16. RefaPart API
17. RefaPart Web
```

## Regla para Codex

```text
Ya no crear gateways por proyecto.

Crear un solo API.PY.DJANGO.JobCron.Gateway como entrada común para webs, apps y paneles.

Cada proyecto puede tener API propia solo si tiene reglas o tablas específicas.
RefaPart sí debe tener API propia.

Todo lo reutilizable vive en APIs core de JobCron.
Todo lo específico de refacciones vive en API.PY.DJANGO.RefaPart.

Toda tabla publicada debe documentarse con schemas SQL Server en PascalCase:
[Customer].[Customer]
[Address].[Address]
[Supplier].[Supplier]
[Catalog].[Part]
[Vehicle].[VehicleModel]
[Quote].[QuoteRequest]
[RefaPart].[PartSearchRequest]
```

Así queda más limpio y escalable: **un solo Gateway para todo JobCron**, APIs core reutilizables y RefaPart como vertical específica de refacciones.
