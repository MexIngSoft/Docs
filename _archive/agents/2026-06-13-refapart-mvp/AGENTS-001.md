Sí. Para **Refapart** debemos construir la web como un **marketplace controlado de refacciones**, donde el cliente compra a Refapart y los proveedores quedan detrás.

## Objetivo principal

**Refapart debe ser la cara del negocio.**

Flujo:

```text
Cliente → Refapart → Proveedores → Refapart → Cliente
```

No debe ser:

```text
Cliente → Proveedor
```

Porque ahí pierdes control, marca, comisión y recompra.

## Módulos principales del desarrollo

### 1. Panel de solicitudes

Aquí llegan las peticiones de piezas.

Campos:

```text
Cliente
Teléfono
Pieza solicitada
Marca
Modelo
Año
Motor
VIN opcional
Fotos
Ciudad destino
Estado de solicitud
```

Estados:

```text
Nueva
Buscando proveedores
Cotizando
Opción encontrada
Esperando pago
Pagado
En recolección
Enviado
Entregado
Cancelado
Garantía / reclamo
```

---

### 2. Panel de proveedores

Cada proveedor debe clasificarse por lo que vende.

Campos:

```text
Nombre interno
Teléfono WhatsApp
Ciudad
Estado
Tipo: refaccionaria / deshuesadero / transmisiones / motores
Marcas que maneja: Nissan, VW, BMW, Toyota, etc.
Categorías: motor, transmisión, suspensión, carrocería, eléctrico
Entrega local: sí/no
Envía por paquetería: sí/no
Usa fletera: sí/no
Calificación interna
Tiempo promedio de respuesta
Notas internas
```

Importante:
**Estos datos nunca se muestran al cliente.**

---

### 3. Sistema semi automático de WhatsApp

Al recibir una solicitud, el sistema debe encontrar proveedores compatibles.

Ejemplo:

```text
Pieza: transmisión automática
Marca: Nissan
Modelo: Versa 2018
Ciudad: Pachuca
```

Refapart filtra proveedores:

```text
Marca: Nissan
Categoría: transmisiones
Zona: Hidalgo / cercanos
```

Y muestra botones:

```text
[Enviar WhatsApp]
[Copiar mensaje]
[Marcar como enviado]
[Registrar respuesta]
```

Mensaje generado:

```text
Hola, busco esta pieza:

Pieza: Transmisión automática
Auto: Nissan Versa 2018
Motor: 1.6
Ciudad destino: Pachuca, Hidalgo

¿La tienes disponible?
Favor de responder con:
- Precio
- Condición
- Garantía
- Fotos
- Tiempo de entrega
```

El botón abre:

```text
https://wa.me/521XXXXXXXXXX?text=MENSAJE_GENERADO
```

---

### 4. Panel de cotizaciones recibidas

Cuando un proveedor responda, tú registras:

```text
Proveedor
Precio proveedor
Precio venta Refapart
Margen
Condición
Garantía
Fotos
Ubicación de la pieza
Costo de envío
Tiempo estimado
Notas
```

El cliente solo debe ver:

```text
Pieza encontrada
Precio final
Garantía
Tiempo estimado de entrega
Fotos
Vendido por Refapart
```

No debe ver al proveedor.

---

### 5. Gestión de logística

Para piezas chicas:

```text
Paquetería
Guía
Costo
Fecha estimada
```

Para piezas grandes:

```text
Motor
Transmisión
Diferencial
Puerta
Cofre
```

Debe manejarse como:

```text
Fletera / transporte local / recolección acordada
```

Campos:

```text
Origen
Destino
Peso aproximado
Volumen aproximado
Tipo de embalaje
Quién entrega la pieza
Quién recoge
Costo logístico
Estado del envío
```

Estados logísticos:

```text
Pendiente de coordinar
Recolección programada
Recolectado
En camino
Entregado
Incidencia
```

---

### 6. Flujo de pago

Al principio puede ser manual:

```text
Transferencia
Pago contra entrega
Anticipo
Pago completo
```

Pero el sistema debe guardar:

```text
Precio proveedor
Precio cliente
Margen Refapart
Costo envío
Comisión
Utilidad final
Estado de pago
```

Regla importante:

```text
El cliente paga a Refapart.
Refapart paga al proveedor.
```

---

## Páginas necesarias

### Cliente

```text
/
Buscar refacción
Formulario de solicitud
Detalle de cotización
Seguimiento de pedido
Garantías
Contacto
```

### Admin

```text
/admin
/admin/solicitudes
/admin/proveedores
/admin/cotizaciones
/admin/logistica
/admin/pagos
/admin/clientes
/admin/reportes
```

---

## Tablas base

```text
users
customers
suppliers
supplier_brands
supplier_categories
part_requests
request_supplier_messages
supplier_quotes
orders
order_payments
shipments
shipment_events
warranty_claims
internal_notes
```

---

## Regla central para Codex

Refapart debe desarrollarse como:

```text
Marketplace privado de refacciones con operación semi automática por WhatsApp, control interno de proveedores, cotización manual asistida, margen propio, logística controlada y cliente comprando siempre a Refapart.
```

No como directorio.

No como catálogo abierto de proveedores.

No como sistema donde el cliente vea teléfonos externos.

## MVP recomendado

Primera versión:

```text
1. Formulario de solicitud de pieza
2. Panel admin de solicitudes
3. Registro de proveedores categorizados
4. Filtro automático de proveedores compatibles
5. Botón WhatsApp semi automático
6. Registro manual de respuestas
7. Cotización final al cliente
8. Control de pago y logística
```

Con eso ya puedes operar sin Cloud API, sin inventario propio y sin comprar piezas por adelantado.
