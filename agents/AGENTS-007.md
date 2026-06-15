Sí. Esta interfaz debe ser el **panel de cotización y búsqueda con proveedores**. Debe vivir en RefaPart/Refakto, pero usando módulos del ERP: Supplier, Catalog, Pricing, Inventory, Quote, Sales, Logistics, Notifications y ProductCompatibility. La documentación confirma que Refakto es marketplace de refacciones usadas y necesita Catalog, Inventory, Seller management, Pricing, Sales, Logistics y Trust/Safety. ([GitHub][1])

# 1. Regla de arquitectura

El flujo debe respetar:

```txt
Admin RefaPart
→ refakto-gateway-api
→ refakto-api
→ Core ERP APIs
```

La documentación indica que el frontend no debe consumir APIs core directamente; siempre debe pasar por Gateway/BFF y API del proyecto. ([GitHub][2])

---

# 2. Módulo administrador

Nombre recomendado:

```txt
Panel de Cotización de Piezas
```

Ruta:

```txt
/admin/refakto/part-requests
```

Secciones principales:

```txt
1. Bandeja de búsquedas pendientes
2. Detalle de solicitud del cliente
3. Proveedores sugeridos
4. Mensaje WhatsApp
5. Respuestas de proveedores
6. Cálculo de precio y margen
7. Logística
8. Cotización al cliente
9. Seguimiento
10. Historial y evidencias
```

---

# 3. Bandeja de búsquedas pendientes

Debe mostrar solicitudes que vienen del buscador.

Columnas:

```txt
Folio
Pieza buscada
Marca
Modelo
Año
Cliente
WhatsApp cliente
Ciudad
Urgencia
Estado
Número de proveedores contactados
Mejor precio encontrado
Fecha de búsqueda
Cotizador asignado
```

Filtros:

```txt
Pendiente
Buscando proveedor
Proveedor respondió
Lista para cotizar
Cotizada
Vendida
Sin existencia
Cancelada
```

---

# 4. Detalle de solicitud

Debe mostrar:

```txt
Texto original del cliente
Texto normalizado por el buscador
Pieza detectada
Marca
Modelo
Año
Motor
Versión
Lado
Posición
Fotos si el cliente subió
Notas del cliente
Historial de búsquedas similares
```

Ejemplo:

```txt
Cliente escribió:
"facía nisan versa 2020"

Sistema entendió:
"fascia delantera Nissan Versa 2020"
```

---

# 5. Proveedores sugeridos

El sistema debe sugerir proveedores según:

```txt
marca que maneja
categoría de pieza
ubicación
historial de respuestas
precio promedio
confiabilidad
tiempo de respuesta
calificación interna
```

Acciones por proveedor:

```txt
Enviar WhatsApp
Copiar mensaje
Marcar como contactado
Registrar respuesta
Adjuntar foto
Registrar precio
Registrar garantía
Registrar ubicación
Descartar proveedor
```

---

# 6. Botón de WhatsApp

Cada proveedor debe tener botón:

```txt
Enviar WhatsApp
```

Debe generar un link:

```txt
https://wa.me/52NUMERO?text=MENSAJE_CODIFICADO
```

Ejemplo de mensaje:

```txt
Hola, lo contactamos de RefaPart.

Estamos buscando esta pieza para un cliente:

Pieza: Fascia delantera
Auto: Nissan Versa 2020
Lado: delantero
Motor/versión: pendiente de confirmar
Ciudad destino: Pachuca, Hidalgo

¿La tiene en existencia?
Si la tiene, por favor indíquenos:
1. Precio
2. Estado de la pieza
3. Fotos
4. Garantía
5. Ubicación
6. Tiempo para entrega

Gracias.
```

---

# 7. Registro de respuesta del proveedor

Cuando el proveedor conteste, el cotizador debe llenar:

```txt
Proveedor tiene pieza: sí/no
Precio proveedor
Condición: nueva/usada/reparada
Estado físico
Garantía
Fotos recibidas
Ubicación
Costo de recolección
Tiempo de entrega
Notas
Confianza del proveedor
```

Estados:

```txt
No contactado
Mensaje enviado
Esperando respuesta
Tiene pieza
No tiene pieza
Pidió más datos
Precio recibido
Fotos recibidas
Descartado
```

---

# 8. Cálculo de precio

Debe usar Pricing y Costing. La documentación separa Pricing para precio final y Costing para costos/rentabilidad. ([GitHub][3])

Campos:

```txt
Costo proveedor
Costo recolección
Costo envío
Comisión RefaPart
Margen deseado
Impuestos si aplica
Descuento permitido
Precio final sugerido
Precio final manual
Utilidad estimada
```

---

# 9. Logística

Debe usar Logistics, porque el flujo de cotización indica que Logistics calcula envío antes de generar la cotización. ([GitHub][4])

Campos:

```txt
Origen de pieza
Destino cliente
Método de entrega
Costo estimado
Tiempo estimado
Requiere recolección
Proveedor entrega
RefaPart recoge
Cliente recoge
```

---

# 10. Cotización al cliente

Cuando ya hay proveedor, el sistema debe generar cotización.

Debe incluir:

```txt
Folio
Pieza
Auto
Condición
Fotos
Precio final
Garantía
Tiempo estimado
Costo de envío
Vigencia de cotización
Notas
Botón aceptar cotización
Botón rechazar
```

La documentación dice que Quote API genera cotización y que la cotización puede convertirse en pedido. ([GitHub][4])

---

# 11. Control del usuario cotizador

El perfil cotizador debe poder:

```txt
tomar solicitud
reasignar solicitud
contactar proveedores
registrar respuestas
comparar opciones
calcular precio
generar cotización
mandar cotización al cliente
dar seguimiento
cerrar como vendido
cerrar como no disponible
```

Permisos sugeridos:

```txt
CanViewPartRequests
CanAssignPartRequests
CanContactSuppliers
CanRegisterSupplierResponse
CanViewSupplierPrices
CanEditFinalPrice
CanGenerateQuote
CanSendCustomerQuote
CanConvertQuoteToOrder
CanCloseRequest
```

---

# 12. Tablas necesarias

```sql
PartRequest
- Id
- SearchQueryLogId
- CustomerId
- SessionId
- CustomerName
- CustomerPhone
- RawSearchText
- NormalizedSearchText
- Brand
- Model
- Year
- PartName
- Side
- Position
- Engine
- Version
- City
- RequestStatus
- Priority
- AssignedUserId
- CreatedAt
- UpdatedAt

PartRequestSupplier
- Id
- PartRequestId
- SupplierId
- ContactPhone
- WhatsappUrl
- MessageText
- ContactStatus
- SentAt
- ResponseAt
- SupplierHasPart
- SupplierPrice
- PartCondition
- WarrantyText
- OriginCity
- DeliveryTime
- Notes
- CreatedAt
- UpdatedAt

SupplierPartOffer
- Id
- PartRequestSupplierId
- SupplierId
- Cost
- PickupCost
- ShippingCost
- WarrantyDays
- Condition
- PhotosJson
- OfferStatus
- CreatedAt
- UpdatedAt

PartQuoteDraft
- Id
- PartRequestId
- SupplierPartOfferId
- Cost
- LogisticsCost
- MarginAmount
- MarginPercent
- FinalPrice
- QuoteStatus
- QuoteId
- CreatedAt
- UpdatedAt
```

---

# 13. Endpoints

```txt
GET /api/refakto/admin/part-requests
GET /api/refakto/admin/part-requests/{id}
PATCH /api/refakto/admin/part-requests/{id}/assign
GET /api/refakto/admin/part-requests/{id}/suppliers
POST /api/refakto/admin/part-requests/{id}/supplier-message
POST /api/refakto/admin/part-requests/{id}/mark-whatsapp-sent
POST /api/refakto/admin/part-requests/{id}/supplier-response
POST /api/refakto/admin/part-requests/{id}/quote-draft
POST /api/refakto/admin/part-requests/{id}/generate-quote
POST /api/refakto/admin/part-requests/{id}/close
```

---

# 14. Pantalla ideal

```txt
┌────────────────────────────────────────────┐
│ Solicitudes de piezas                      │
├────────────────────────────────────────────┤
│ Pendientes | En búsqueda | Cotizadas       │
├────────────────────────────────────────────┤
│ Fascia Nissan Versa 2020 | Urgente         │
│ Calavera Aveo 2018       | Normal          │
│ Motor Sentra 2016        | Alta            │
└────────────────────────────────────────────┘

Al abrir una solicitud:

Cliente buscó:
"facía nisan versa 2020"

Sistema entendió:
Fascia delantera Nissan Versa 2020

Proveedores sugeridos:
[WhatsApp] [Copiar mensaje] [Registrar respuesta]

Mejor oferta:
Proveedor A - $1,200 - Pachuca - usada - 7 días garantía

Precio final sugerido:
$1,650

[Generar cotización] [Enviar al cliente]
```

---

# 15. Instrucción para Codex

```txt
Implementar en Refakto/RefaPart un Panel de Cotización de Piezas para administrar búsquedas no encontradas y solicitudes generadas desde el buscador.

Respetar arquitectura:
Admin Web -> refakto-gateway-api -> refakto-api -> Core ERP APIs.

El panel debe permitir:
1. Ver búsquedas de piezas no encontradas.
2. Tomar o asignar solicitudes a un cotizador.
3. Ver intención detectada por el buscador.
4. Sugerir proveedores según marca, categoría, ubicación e historial.
5. Generar link de WhatsApp por proveedor con mensaje precargado.
6. Registrar si el proveedor tiene o no tiene la pieza.
7. Registrar precio, fotos, garantía, condición, ubicación y tiempo de entrega.
8. Comparar ofertas de proveedores.
9. Calcular precio final usando Costing, Pricing y Logistics.
10. Generar cotización usando Quote API.
11. Convertir cotización aceptada en pedido usando Sales API.
12. Guardar historial completo de mensajes, respuestas, cambios de precio y evidencias.

Crear vistas:
- /admin/refakto/part-requests
- /admin/refakto/part-requests/[id]
- /admin/refakto/part-requests/[id]/quote

Crear entidades:
PartRequest, PartRequestSupplier, SupplierPartOffer, PartQuoteDraft.

Crear permisos:
CanViewPartRequests
CanAssignPartRequests
CanContactSuppliers
CanRegisterSupplierResponse
CanViewSupplierPrices
CanEditFinalPrice
CanGenerateQuote
CanSendCustomerQuote
CanConvertQuoteToOrder
CanCloseRequest

Crear generador de WhatsApp:
https://wa.me/52{SupplierPhone}?text={EncodedMessage}

Mensaje base:
Hola, lo contactamos de RefaPart.
Estamos buscando esta pieza para un cliente:
Pieza: {PartName}
Auto: {Brand} {Model} {Year}
Lado/posición: {Side} {Position}
Motor/versión: {Engine} {Version}
Ciudad destino: {CustomerCity}
¿La tiene en existencia?
Si la tiene, por favor indíquenos precio, estado, fotos, garantía, ubicación y tiempo de entrega.
Gracias.

El sistema debe registrar cada proveedor contactado, mensaje enviado, respuesta recibida, precio, disponibilidad, evidencia y resultado final.
```

La idea central: **el cotizador no debe trabajar en WhatsApp de forma desordenada; WhatsApp solo es el canal, pero el control real debe vivir dentro del ERP.**

[1]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/02_projects/refakto/README.md "raw.githubusercontent.com"
[2]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/architecture/07_project_api_pattern.md "raw.githubusercontent.com"
[3]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/erp/01_modules.md "raw.githubusercontent.com"
[4]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/flows/01_customer_quote_flow.md "raw.githubusercontent.com"
