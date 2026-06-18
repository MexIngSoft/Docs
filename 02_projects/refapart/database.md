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

## Tablas requeridas para cierre operativo

| Tabla | Uso | Estado |
|---|---|---|
| `SearchDictionaryTerm` | Normalizacion, sinonimos y errores comunes. | PENDIENTE |
| `SearchResultLog` | Auditoria de resultados devueltos. | CUBIERTO_PARCIALMENTE_POR_SearchQuery |
| `UnfulfilledSearchDemand` | Demanda no satisfecha. | CUBIERTO_PARCIALMENTE_POR_PartRequest |
| `PartRequestSupplier` | Relacion solicitud-proveedor. | PENDIENTE |
| `SupplierContactLog` | Contactos WhatsApp/telefono/correo. | CUBIERTO_PARCIALMENTE_POR_SupplierMessage |
| `SupplierMessageTemplate` | Plantillas de mensaje a proveedor. | PENDIENTE |
| `SupplierOfferPhoto` | Fotos de oferta proveedor. | PENDIENTE |
| `QuoteItem` | Lineas de cotizacion. | PENDIENTE_DE_DEFINIR |
| `OrderStatusHistory` | Historial de pedido. | PENDIENTE |
| `CustomerContactLog` | Contacto con cliente. | PENDIENTE |
| `LogisticsTask` | Recoleccion, envio e incidencias. | EXISTE_EN_CODIGO |
| `NotificationLog` | WhatsApp/email/notificaciones. | PENDIENTE |
| `AuditLog` | Auditoria operativa. | EXISTE_EN_CODIGO |
| `Favorite` | Favoritos del cliente. | PENDIENTE |
| `Cart` | Carrito si aplica. | PENDIENTE_DE_DEFINIR |
| `CartItem` | Lineas de carrito si aplica. | PENDIENTE_DE_DEFINIR |

## Campos esenciales pendientes de confirmar

Los campos siguientes son contrato documental y deben validarse contra
migraciones antes de marcarlos como implementados:

- `SearchQuery`: `Id`, `SessionId`, `UserId`, `RawQuery`, `NormalizedQuery`,
  `DetectedIntentJson`, `DetectedBrand`, `DetectedModel`, `DetectedYear`,
  `DetectedPartName`, `DetectedSide`, `DetectedPosition`, `ResultsCount`,
  `BestScore`, `SearchStatus`, `CreatedAt`.
- `PartRequest`: `Id`, `SearchQueryId`, `CustomerId`, `SessionId`,
  `CustomerName`, `CustomerPhone`, `CustomerCity`, `RawSearchText`,
  `NormalizedSearchText`, `Brand`, `Model`, `Year`, `PartName`, `Engine`,
  `Version`, `Side`, `Position`, `Notes`, `PhotosJson`, `Urgency`,
  `RequestStatus`, `AssignedUserId`, `CreatedAt`, `UpdatedAt`.
- `Supplier`: `Id`, `BusinessName`, `SupplierType`, `WhatsappPhone`, `Phone`,
  `City`, `State`, `AddressText`, `BrandsJson`, `CategoriesJson`,
  `OpeningHoursJson`, `InternalRating`, `AverageResponseTimeMinutes`,
  `ReliabilityScore`, `IsAuthorized`, `IsActive`, `Notes`, `CreatedAt`,
  `UpdatedAt`.
- `SupplierOffer`: `Id`, `PartRequestId`, `SupplierId`, `SupplierHasPart`,
  `SupplierPrice`, `PartCondition`, `WarrantyText`, `WarrantyDays`,
  `OriginCity`, `PickupCost`, `EstimatedDeliveryCost`,
  `EstimatedDeliveryTime`, `PhotosJson`, `OfferStatus`, `InternalNotes`,
  `CreatedAt`, `UpdatedAt`.
- `Quote`: `Id`, `PartRequestId`, `SupplierOfferId`, `CustomerId`, `Cost`,
  `PickupCost`, `ShippingCost`, `MarginAmount`, `MarginPercent`,
  `FinalPrice`, `WarrantyText`, `ExpirationDate`, `QuoteStatus`, `CreatedAt`,
  `UpdatedAt`.
- `Order`: `Id`, `QuoteId`, `CustomerId`, `OrderStatus`, `PaymentStatus`,
  `LogisticsStatus`, `FinalPrice`, `CreatedAt`, `UpdatedAt`.

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
