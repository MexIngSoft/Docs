Sí. La separación técnica debería quedar así:

# Responsabilidades Técnicas de RefaPart y JobCron

## 1. Regla principal

**RefaPart es la cara comercial.**
Maneja clientes, catálogo visible, búsquedas, carrito, cotizaciones, pedidos y seguimiento público.

**JobCron es el ERP/API Manager.**
Maneja proveedores, inventario real, costos, logística, compras, WhatsApp, facturación, auditoría, automatizaciones y reglas internas.

---

# 2. Arquitectura general

```txt
Cliente / Usuario
      │
      ▼
RefaPart Web / App
      │
      ▼
RefaPart Backend
      │
      ▼
API Gateway
      │
      ▼
JobCron ERP
      │
      ├── Proveedores
      ├── Inventarios
      ├── Compras
      ├── Logística
      ├── WhatsApp
      ├── Facturación
      ├── CRM
      ├── Pagos
      └── Auditoría
```

---

# 3. Funciones de RefaPart

## RefaPart debe encargarse de:

* Registro de clientes.
* Login de clientes.
* Búsqueda de refacciones.
* Catálogo público.
* Filtros por marca, modelo, año, motor y categoría.
* Carrito.
* Cotizaciones visibles.
* Pedido del cliente.
* Pago del cliente.
* Seguimiento del pedido.
* Mensajes visibles al cliente.
* Calificaciones.
* Historial de compras.
* Panel público de vendedor/proveedor, si después se permite.

## RefaPart NO debe encargarse de:

* Comprar al proveedor.
* Administrar inventario real.
* Decidir qué proveedor surtirá.
* Manejar costos internos.
* Gestionar WhatsApp con proveedor.
* Generar órdenes internas de compra.
* Coordinar logística profunda.
* Controlar comisiones internas.
* Facturación interna.
* Auditoría operativa.
* Automatizaciones programadas.

Eso pertenece a JobCron.

---

# 4. Tablas principales de RefaPart

## customers

Clientes finales.

```txt
id
name
email
phone
password_hash
status
created_at
updated_at
```

---

## customer_addresses

Direcciones del cliente.

```txt
id
customer_id
street
external_number
internal_number
neighborhood
city
state
postal_code
country
references
is_default
created_at
updated_at
```

---

## vehicle_brands

Marcas visibles.

```txt
id
name
slug
status
created_at
updated_at
```

Ejemplos:

```txt
Nissan
BMW
Volkswagen
Chevrolet
Toyota
Honda
Ford
```

---

## vehicle_models

Modelos visibles.

```txt
id
brand_id
name
slug
status
created_at
updated_at
```

---

## vehicle_years

Años compatibles.

```txt
id
model_id
year
status
created_at
updated_at
```

---

## part_categories

Categorías visibles de piezas.

```txt
id
name
slug
parent_id
status
created_at
updated_at
```

Ejemplos:

```txt
Motor
Transmisión
Suspensión
Frenos
Carrocería
Eléctrico
Dirección
Enfriamiento
```

---

## public_parts

Catálogo público de piezas.

Esta tabla no debe representar necesariamente el inventario real. Es el producto visible para el cliente.

```txt
id
category_id
name
slug
description
main_image
status
created_at
updated_at
```

---

## public_part_compatibilities

Compatibilidad visible de una pieza.

```txt
id
public_part_id
brand_id
model_id
year_from
year_to
engine
version
created_at
updated_at
```

Ejemplo:

```txt
Bomba de gasolina
Nissan
Versa
2012
2018
1.6
```

---

## search_requests

Búsquedas realizadas por clientes.

```txt
id
customer_id
search_text
brand_id
model_id
year
engine
category_id
status
created_at
updated_at
```

Estados posibles:

```txt
pending
matched
not_found
quoted
converted_to_order
cancelled
```

---

## carts

Carrito del cliente.

```txt
id
customer_id
status
created_at
updated_at
```

Estados:

```txt
active
converted
abandoned
cancelled
```

---

## cart_items

Productos dentro del carrito.

```txt
id
cart_id
public_part_id
quantity
estimated_price
notes
created_at
updated_at
```

---

## quotations

Cotizaciones mostradas al cliente.

```txt
id
customer_id
search_request_id
status
subtotal
shipping_cost
service_fee
total
expires_at
created_at
updated_at
```

Estados:

```txt
draft
sent
accepted
expired
cancelled
converted_to_order
```

---

## quotation_items

Piezas cotizadas.

```txt
id
quotation_id
public_part_id
name
description
quantity
unit_price
total
estimated_delivery_days
created_at
updated_at
```

---

## orders

Pedido comercial del cliente.

```txt
id
customer_id
quotation_id
order_number
status
subtotal
shipping_cost
service_fee
total
payment_status
created_at
updated_at
```

Estados del pedido:

```txt
pending_payment
paid
processing
sourcing
purchased
in_transit
delivered
cancelled
refunded
```

---

## order_items

Piezas del pedido.

```txt
id
order_id
public_part_id
name
quantity
unit_price
total
created_at
updated_at
```

---

## payments

Pagos del cliente.

```txt
id
order_id
customer_id
payment_provider
payment_method
amount
status
transaction_id
paid_at
created_at
updated_at
```

Estados:

```txt
pending
paid
failed
refunded
cancelled
```

---

## customer_messages

Mensajes visibles para el cliente.

```txt
id
customer_id
order_id
message
channel
direction
status
created_at
updated_at
```

Canales:

```txt
web
email
sms
whatsapp
```

---

## tracking_events

Eventos visibles del pedido.

```txt
id
order_id
title
description
public_status
created_at
```

Ejemplos:

```txt
Pedido recibido
Pago confirmado
Estamos buscando tu pieza
Pieza comprada
Pieza en camino
Pedido entregado
```

---

# 5. Eventos principales de RefaPart

## customer.created

Cuando se registra un cliente.

```json
{
  "event": "customer.created",
  "customer_id": "123",
  "name": "Cliente",
  "phone": "7710000000"
}
```

---

## search.requested

Cuando el cliente busca una pieza.

```json
{
  "event": "search.requested",
  "search_request_id": "9001",
  "customer_id": "123",
  "brand": "Nissan",
  "model": "Versa",
  "year": 2018,
  "part": "motor"
}
```

Este evento debe enviarse a JobCron para que el ERP busque proveedores.

---

## quotation.accepted

Cuando el cliente acepta una cotización.

```json
{
  "event": "quotation.accepted",
  "quotation_id": "5001",
  "customer_id": "123"
}
```

---

## order.created

Cuando se crea un pedido.

```json
{
  "event": "order.created",
  "order_id": "7001",
  "customer_id": "123",
  "total": 8500
}
```

---

## payment.confirmed

Cuando el cliente paga.

```json
{
  "event": "payment.confirmed",
  "order_id": "7001",
  "payment_id": "8001",
  "amount": 8500
}
```

Este evento debe activar en JobCron la compra interna al proveedor.

---

# 6. Funciones de JobCron ERP

JobCron debe encargarse de:

* Alta de proveedores.
* Clasificación de proveedores por marca.
* Clasificación de proveedores por tipo de pieza.
* Costos internos.
* Inventario real.
* Disponibilidad.
* Compras internas.
* Órdenes de proveedor.
* Automatización de WhatsApp.
* Control de envíos.
* Recolecciones.
* Entregas.
* Comisiones.
* Facturación.
* Reportes.
* Auditoría.
* Integración con APIs externas.
* Tareas programadas.
* Reintentos.
* Logs.
* Reglas de negocio.

---

# 7. Tablas principales de JobCron

## suppliers

Proveedores.

```txt
id
business_name
contact_name
phone
whatsapp
email
city
state
address
status
trust_level
payment_terms
created_at
updated_at
```

Estados:

```txt
active
inactive
blocked
pending_validation
```

Niveles de confianza:

```txt
new
trusted
preferred
critical
blocked
```

Condiciones de pago:

```txt
cash_on_delivery
advance_payment
credit
mixed
```

---

## supplier_brands

Marcas que maneja cada proveedor.

```txt
id
supplier_id
brand_id
status
created_at
updated_at
```

Ejemplo:

```txt
Proveedor 1 maneja Nissan
Proveedor 2 maneja BMW
Proveedor 3 maneja Volkswagen
```

---

## supplier_categories

Categorías que maneja cada proveedor.

```txt
id
supplier_id
category_id
status
created_at
updated_at
```

---

## supplier_locations

Ubicaciones del proveedor.

```txt
id
supplier_id
address
city
state
latitude
longitude
is_main
created_at
updated_at
```

---

## supplier_inventory

Inventario real o semi-real del proveedor.

```txt
id
supplier_id
internal_sku
part_name
brand
model
year_from
year_to
engine
condition
quantity
cost_price
sale_price_suggested
availability_status
last_verified_at
created_at
updated_at
```

Condición:

```txt
new
used
rebuilt
remanufactured
unknown
```

Disponibilidad:

```txt
available
not_available
pending_confirmation
reserved
sold
```

---

## sourcing_requests

Solicitudes internas para buscar una pieza.

Nacen desde RefaPart cuando un cliente busca o compra.

```txt
id
external_search_request_id
external_order_id
customer_reference
part_name
brand
model
year
engine
quantity
status
priority
created_at
updated_at
```

Estados:

```txt
new
searching
supplier_contacted
quoted
supplier_selected
not_found
cancelled
completed
```

---

## sourcing_request_suppliers

Proveedores consultados para una solicitud.

```txt
id
sourcing_request_id
supplier_id
contact_status
response_status
quoted_cost
available_quantity
estimated_delivery_days
notes
created_at
updated_at
```

Estados de contacto:

```txt
pending
message_sent
answered
no_answer
failed
```

Respuesta:

```txt
available
not_available
needs_more_info
quoted
rejected
```

---

## supplier_messages

Mensajes enviados a proveedores.

```txt
id
supplier_id
sourcing_request_id
channel
message
direction
status
provider_message_id
sent_at
received_at
created_at
updated_at
```

Canales:

```txt
whatsapp
sms
email
phone_manual
```

Estados:

```txt
draft
sent
delivered
read
failed
answered
```

---

## supplier_quotes

Cotizaciones recibidas de proveedores.

```txt
id
sourcing_request_id
supplier_id
part_name
condition
cost_price
supplier_delivery_cost
estimated_pickup_date
estimated_delivery_days
warranty_days
notes
status
created_at
updated_at
```

Estados:

```txt
pending_review
accepted
rejected
expired
cancelled
```

---

## purchase_orders

Órdenes internas de compra al proveedor.

```txt
id
supplier_id
external_order_id
supplier_quote_id
purchase_number
status
subtotal
delivery_cost
total_cost
payment_terms
payment_status
created_at
updated_at
```

Estados:

```txt
draft
sent_to_supplier
accepted_by_supplier
paid
ready_for_pickup
picked_up
cancelled
completed
```

---

## purchase_order_items

Piezas compradas al proveedor.

```txt
id
purchase_order_id
part_name
quantity
unit_cost
total_cost
condition
notes
created_at
updated_at
```

---

## logistics_orders

Órdenes logísticas.

```txt
id
external_order_id
purchase_order_id
origin_supplier_id
origin_address
destination_address
carrier_type
carrier_name
tracking_number
status
estimated_cost
final_cost
created_at
updated_at
```

Tipos de transporte:

```txt
local_motorcycle
local_car
pickup
freight
parcel
tow_truck
manual
```

Estados:

```txt
pending
quoted
assigned
pickup_scheduled
picked_up
in_transit
delivered
failed
cancelled
```

---

## logistics_events

Eventos internos de logística.

```txt
id
logistics_order_id
status
description
is_public
created_at
```

Si `is_public = true`, JobCron puede enviar ese evento a RefaPart para que el cliente vea el avance.

---

## commissions

Comisiones internas.

```txt
id
external_order_id
supplier_id
base_amount
commission_type
commission_value
commission_amount
status
created_at
updated_at
```

Tipos:

```txt
fixed
percentage
mixed
```

---

## invoices

Facturación.

```txt
id
external_order_id
customer_reference
invoice_type
amount
tax_amount
total
status
uuid
created_at
updated_at
```

Estados:

```txt
pending
issued
cancelled
failed
```

---

## automation_jobs

Tareas automáticas.

```txt
id
job_type
reference_type
reference_id
status
scheduled_at
started_at
finished_at
attempts
max_attempts
last_error
created_at
updated_at
```

Tipos:

```txt
send_supplier_whatsapp
check_supplier_response
sync_inventory
update_order_status
generate_report
retry_failed_payment
expire_quotation
```

---

## audit_logs

Auditoría.

```txt
id
actor_type
actor_id
action
entity_type
entity_id
old_value
new_value
ip_address
created_at
```

Ejemplo:

```txt
admin cambió proveedor de pending_validation a active
sistema envió WhatsApp a proveedor
JobCron actualizó estado de logística
```

---

# 8. Eventos principales de JobCron

## sourcing.started

Cuando JobCron empieza a buscar proveedores.

```json
{
  "event": "sourcing.started",
  "external_search_request_id": "9001",
  "status": "searching"
}
```

---

## supplier.message.sent

Cuando se envía mensaje al proveedor.

```json
{
  "event": "supplier.message.sent",
  "supplier_id": "3001",
  "sourcing_request_id": "4001",
  "channel": "whatsapp"
}
```

---

## supplier.quote.received

Cuando un proveedor responde con precio.

```json
{
  "event": "supplier.quote.received",
  "sourcing_request_id": "4001",
  "supplier_id": "3001",
  "cost_price": 6000,
  "estimated_delivery_days": 2
}
```

---

## quotation.ready_for_customer

Cuando JobCron ya tiene una cotización que RefaPart puede mostrar.

```json
{
  "event": "quotation.ready_for_customer",
  "external_search_request_id": "9001",
  "part_name": "Motor Nissan Versa",
  "cost_price": 6000,
  "sale_price": 8500,
  "estimated_delivery_days": 3
}
```

---

## purchase_order.created

Cuando se crea la compra interna.

```json
{
  "event": "purchase_order.created",
  "external_order_id": "7001",
  "supplier_id": "3001",
  "total_cost": 6000
}
```

---

## logistics.updated

Cuando cambia el estado logístico.

```json
{
  "event": "logistics.updated",
  "external_order_id": "7001",
  "public_status": "in_transit",
  "description": "La pieza ya va en camino"
}
```

---

# 9. Flujo completo de una venta

## Paso 1: Cliente busca pieza en RefaPart

RefaPart crea:

```txt
search_requests
```

Y manda evento:

```txt
search.requested
```

---

## Paso 2: JobCron recibe la búsqueda

JobCron crea:

```txt
sourcing_requests
```

Busca proveedores compatibles en:

```txt
supplier_brands
supplier_categories
supplier_inventory
```

---

## Paso 3: JobCron contacta proveedores

JobCron crea:

```txt
sourcing_request_suppliers
supplier_messages
automation_jobs
```

---

## Paso 4: Proveedor responde

JobCron guarda:

```txt
supplier_quotes
```

---

## Paso 5: JobCron manda cotización a RefaPart

JobCron emite:

```txt
quotation.ready_for_customer
```

RefaPart crea:

```txt
quotations
quotation_items
```

---

## Paso 6: Cliente acepta y paga

RefaPart crea:

```txt
orders
order_items
payments
```

Y manda:

```txt
payment.confirmed
```

---

## Paso 7: JobCron compra al proveedor

JobCron crea:

```txt
purchase_orders
purchase_order_items
```

---

## Paso 8: JobCron gestiona logística

JobCron crea:

```txt
logistics_orders
logistics_events
```

Y manda eventos públicos a RefaPart.

---

## Paso 9: RefaPart muestra seguimiento

RefaPart crea:

```txt
tracking_events
```

El cliente ve:

```txt
Pedido recibido
Pago confirmado
Pieza comprada
Pieza en camino
Pedido entregado
```

---

# 10. Acciones permitidas por sistema

## Acciones de RefaPart

```txt
Crear cliente
Editar cliente
Crear búsqueda
Crear carrito
Crear cotización visible
Aceptar cotización
Crear pedido
Registrar pago
Mostrar tracking
Enviar mensaje al cliente
Cancelar pedido público
Solicitar devolución
Calificar compra
```

---

## Acciones de JobCron

```txt
Crear proveedor
Validar proveedor
Bloquear proveedor
Clasificar proveedor por marca
Clasificar proveedor por categoría
Crear solicitud de búsqueda
Enviar WhatsApp a proveedor
Registrar respuesta del proveedor
Crear cotización interna
Seleccionar proveedor
Crear orden de compra
Registrar pago al proveedor
Crear envío
Asignar transportista
Actualizar logística
Generar factura
Calcular comisión
Ejecutar automatización
Crear reporte
Registrar auditoría
```

---

# 11. Qué datos se comparten entre RefaPart y JobCron

## RefaPart envía a JobCron:

```txt
search_request_id
order_id
customer_reference
pieza buscada
marca
modelo
año
motor
cantidad
dirección de entrega
pago confirmado
```

---

## JobCron envía a RefaPart:

```txt
cotización disponible
precio de venta
tiempo estimado
estado de compra
estado logístico público
tracking
cancelación interna
pieza no encontrada
```

---

# 12. Qué datos NO debe ver RefaPart

RefaPart no debería mostrar ni controlar directamente:

```txt
Costo real del proveedor
Margen de ganancia
Comisión interna
Lista completa de proveedores
Teléfono real del proveedor
Condiciones internas de pago
Notas internas
Auditoría
Errores técnicos
Automatizaciones internas
```

---

# 13. Qué datos NO debe manejar JobCron como plataforma pública

JobCron no debería encargarse de:

```txt
Diseño del catálogo público
SEO
Landing page
Experiencia de usuario final
Carrito visual
Checkout público
Campañas comerciales públicas
Perfil público del cliente
Interfaz comercial principal
```

---

# 14. Regla técnica final

**RefaPart convierte visitantes en clientes.**
**JobCron convierte pedidos en operaciones reales.**

RefaPart debe ser ligero, comercial y orientado al cliente.

JobCron debe ser profundo, administrativo, auditable y conectado por APIs.

La comunicación entre ambos debe hacerse por:

```txt
API Gateway
Webhooks
Eventos
Jobs automáticos
Logs
Auditoría
```

Nunca por acceso directo de RefaPart a las tablas internas de JobCron.

La idea clave es esta: **RefaPart puede tener tablas comerciales, pero no debe tener tablas operativas profundas**. Todo lo pesado —proveedores, compras, costos, logística y automatización— debe quedarse en **JobCron**.
