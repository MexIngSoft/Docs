Aquí tienes la instrucción completa para Codex, uniendo **todo lo faltante** y cómo debe relacionarse para completar RefaPart.

```txt
# IMPLEMENTACIÓN COMPLETA REFAPART

## Objetivo

Completar RefaPart como web funcional para búsqueda, solicitud, cotización y venta de refacciones nuevas/usadas.

RefaPart no debe ser solo catálogo. Debe permitir:
1. Buscar piezas aunque el usuario escriba mal.
2. Mostrar resultados si existen.
3. Guardar búsquedas fallidas.
4. Convertir búsquedas fallidas en solicitudes.
5. Contactar proveedores por WhatsApp.
6. Registrar respuestas.
7. Cotizar al cliente.
8. Convertir cotización en venta.
9. Gestionar logística básica.

---

# 1. Corrección de nombre

Aplicar migración completa:

refakto → refapart
Refakto → RefaPart
REFAKTO → REFAPART
/api/refakto → /api/refapart
02_projects/refakto → 02_projects/refapart

No crear nuevos archivos con el nombre Refakto.

---

# 2. Arquitectura obligatoria

Respetar este flujo:

Web pública
→ refapart-gateway-api
→ refapart-api
→ Core ERP APIs

Admin web
→ refapart-gateway-api
→ refapart-api
→ Core ERP APIs

El frontend nunca debe consumir directamente APIs core.

---

# 3. Módulos Core ERP relacionados

Conectar RefaPart con:

Auth
Search Engine
Demand
Supplier
Catalog
Inventory
ProductCompatibility
Pricing
Costing
Quote
Sales
Cart
Logistics
Notifications
AuditLog

---

# 4. Web pública

Crear rutas:

/
/buscar
/resultados
/pieza/[id]
/solicitar-pieza
/carrito
/checkout
/login
/registro
/perfil
/mis-solicitudes
/mis-cotizaciones
/mis-pedidos

---

# 5. Home

Debe contener:

Buscador principal grande.
Categorías principales.
Marcas populares.
Texto de confianza.
Botón para solicitar pieza no encontrada.
Sección “Nosotros la buscamos por ti”.
Acceso a WhatsApp.
Piezas destacadas si existen.

---

# 6. Buscador avanzado

Implementar motor de búsqueda con:

normalización
corrección de errores
sinónimos
detección de marca
detección de modelo
detección de año
detección de pieza
detección de lado
detección de posición
detección de motor
compatibilidad
ranking de resultados
sugerencias
autocompletado
registro de búsquedas

Ejemplos:

facía → fascia
fasia → fascia
nisan → nissan
calabera → calavera
piloto → izquierdo
copiloto → derecho
defensa → fascia, según contexto

---

# 7. Flujo de búsqueda

Cuando el cliente busque:

1. Guardar SearchQueryLog.
2. Normalizar texto.
3. Detectar intención.
4. Buscar en catálogo.
5. Buscar en inventario.
6. Buscar compatibilidades.
7. Calcular SearchScore.
8. Mostrar resultados ordenados.
9. Guardar SearchResultLog.
10. Si no hay resultado útil, crear UnfulfilledSearchDemand.
11. Mostrar formulario para solicitar pieza.

---

# 8. Pieza no encontrada

Cuando no exista resultado, mostrar:

“No encontramos esta pieza disponible por ahora.
Podemos buscarla con proveedores.
Déjanos tu WhatsApp y te avisamos cuando la encontremos.”

Campos:

Nombre opcional
WhatsApp opcional
Ciudad
Notas
Urgencia
Fotos opcionales

Al enviar, crear PartRequest.

---

# 9. Catálogo de piezas

Cada pieza debe tener:

nombre
marca
modelo
año inicial
año final
categoría
lado
posición
motor
versión
condición
precio
fotos
existencia
proveedor
ubicación
garantía
compatibilidad
estado de publicación

---

# 10. Detalle de pieza

La página /pieza/[id] debe mostrar:

fotos
nombre
auto compatible
condición
precio
garantía
ubicación
tiempo estimado de entrega
proveedor oculto al cliente
botón comprar
botón solicitar información
botón WhatsApp cliente
piezas similares
compatibilidades

---

# 11. Carrito y checkout básico

Implementar:

agregar al carrito
ver carrito
calcular subtotal
calcular envío estimado
crear intención de pedido
crear orden
estado de pago pendiente
estado de logística pendiente

No bloquear MVP por pasarela de pago. Permitir pedido manual.

---

# 12. Panel administrador

Crear rutas:

/admin/refapart
/admin/refapart/part-requests
/admin/refapart/part-requests/[id]
/admin/refapart/part-requests/[id]/suppliers
/admin/refapart/part-requests/[id]/quote
/admin/refapart/suppliers
/admin/refapart/products
/admin/refapart/search-logs
/admin/refapart/demand
/admin/refapart/quotes
/admin/refapart/orders
/admin/refapart/logistics

---

# 13. Panel de solicitudes

Debe mostrar:

folio
pieza buscada
cliente
WhatsApp cliente
marca
modelo
año
ciudad
urgencia
estado
cotizador asignado
proveedores contactados
mejor precio
fecha

Estados:

RequestPending
RequestAssigned
SupplierSearchInProgress
SupplierAnswered
SupplierFoundPart
SupplierNotFoundPart
QuoteDrafted
QuoteSent
QuoteAccepted
QuoteRejected
OrderCreated
Delivered
Closed
Cancelled

---

# 14. Detalle de solicitud

Debe mostrar:

texto original buscado
texto normalizado
intención detectada
cliente
WhatsApp
ciudad
fotos del cliente
notas
historial
búsquedas similares
proveedores sugeridos
respuestas
cotización
pedido relacionado

---

# 15. Proveedores

Crear CRUD de proveedores:

nombre comercial
tipo
WhatsApp
teléfono
ciudad
estado
dirección
marcas que maneja
categorías que maneja
horarios
calificación interna
tiempo promedio de respuesta
confiabilidad
notas
activo/inactivo

Tipos:

refaccionaria
deshuesadero
taller
distribuidor
particular
importador

---

# 16. Proveedores sugeridos

Para cada solicitud, sugerir proveedores por:

marca
modelo
categoría
ubicación
historial
confiabilidad
tiempo de respuesta
precio promedio
disponibilidad previa

---

# 17. WhatsApp a proveedores

Crear botón:

Enviar WhatsApp

Generar link:

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

Si la tiene, por favor indíquenos:
1. Precio
2. Estado de la pieza
3. Fotos
4. Garantía
5. Ubicación
6. Tiempo de entrega

Gracias.

Registrar cada mensaje enviado.

---

# 18. Respuesta del proveedor

El cotizador debe registrar:

sí tiene / no tiene
precio proveedor
condición
fotos
garantía
ubicación
costo de recolección
tiempo de entrega
notas
confianza
fecha de respuesta

---

# 19. Comparador de ofertas

Para una misma solicitud, comparar:

proveedor
precio
condición
garantía
ubicación
costo logístico
tiempo de entrega
calificación
utilidad estimada

Permitir seleccionar mejor oferta.

---

# 20. Precio final

Calcular:

costo proveedor
+ recolección
+ envío
+ comisión RefaPart
+ margen
+ ajuste manual
= precio final cliente

Mostrar:

utilidad estimada
margen porcentaje
precio mínimo permitido
precio sugerido
precio final editable con permiso

---

# 21. Cotización

Crear cotización con:

folio
cliente
pieza
auto
condición
fotos
precio final
envío
garantía
vigencia
notas
estado

Estados:

Draft
Sent
Accepted
Rejected
Expired
ConvertedToOrder

---

# 22. Envío de cotización al cliente

Permitir enviar por WhatsApp:

Hola, encontramos la pieza que solicitaste en RefaPart.

Pieza: {PartName}
Auto: {Brand} {Model} {Year}
Condición: {Condition}
Garantía: {Warranty}
Tiempo estimado: {DeliveryTime}
Precio final: ${FinalPrice}

La cotización tiene vigencia de {ExpirationDate}.

¿Deseas que avancemos con el pedido?

---

# 23. Venta / pedido

Si cliente acepta:

1. Convertir Quote en Order.
2. Reservar oferta del proveedor.
3. Crear LogisticsTask.
4. Cambiar PartRequest a OrderCreated.
5. Notificar al cliente.
6. Registrar auditoría.

---

# 24. Logística básica

Gestionar:

origen
destino
quién recoge
quién entrega
costo
tiempo estimado
estado
evidencia
notas

Estados:

PendingPickup
PickedUp
InTransit
Delivered
Failed
Cancelled

---

# 25. Tablas principales

Crear o documentar:

SearchQueryLog
SearchResultLog
SearchDictionaryTerm
UnfulfilledSearchDemand
PartRequest
PartRequestSupplier
SupplierPartOffer
PartQuoteDraft
Supplier
Product
ProductCompatibility
Cart
Order
LogisticsTask
NotificationLog
AuditLog

---

# 26. Permisos

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
CanManageSuppliers
CanManageProducts
CanViewSearchLogs
CanViewDemandDashboard
CanManageOrders
CanManageLogistics
CanClosePartRequest

---

# 27. Relación completa del flujo

Cliente busca pieza
→ SearchQueryLog
→ Search Engine
→ Catalog / Inventory / Compatibility
→ resultados

Si hay resultado:
→ Detalle de pieza
→ carrito
→ checkout
→ orden
→ logística

Si no hay resultado:
→ UnfulfilledSearchDemand
→ PartRequest
→ panel cotizador
→ proveedores sugeridos
→ WhatsApp proveedor
→ SupplierResponse
→ SupplierPartOffer
→ cálculo de precio
→ cotización
→ WhatsApp cliente
→ aceptación
→ orden
→ logística
→ cierre

---

# 28. Dashboard de demanda

Crear vista:

/admin/refapart/demand

Mostrar:

piezas más buscadas
piezas no encontradas
marcas más buscadas
modelos más buscados
ciudades con más demanda
proveedores más efectivos
solicitudes convertidas en venta
búsquedas sin contacto
búsquedas con contacto
tasa de conversión

---

# 29. Auditoría

Registrar:

quién tomó solicitud
quién contactó proveedor
qué mensaje envió
cuándo lo envió
qué respuesta registró
quién cambió precio
quién generó cotización
quién convirtió a pedido
quién cerró solicitud

---

# 30. MVP obligatorio

No considerar terminada la web hasta que funcionen:

1. Home con buscador.
2. Buscador avanzado.
3. Resultados.
4. Pieza no encontrada.
5. Captura de WhatsApp.
6. Creación de solicitud.
7. Panel de solicitudes.
8. Proveedores.
9. WhatsApp a proveedores.
10. Registro de respuesta.
11. Cálculo de precio.
12. Cotización.
13. WhatsApp al cliente.
14. Conversión a pedido.
15. Logística básica.
16. Dashboard de demanda.

---

# Resultado esperado

RefaPart debe quedar preparada para operar aunque no tenga mucho inventario inicial.

La web debe poder vender piezas cargadas y también convertir búsquedas fallidas en oportunidades reales de venta mediante proveedores.
```
