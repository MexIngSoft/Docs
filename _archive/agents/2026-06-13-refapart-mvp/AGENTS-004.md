# Documento para Codex — RefaPart Refacciones (MVP V1)

## Objetivo del Negocio

RefaPart NO es una refaccionaria.

RefaPart es una plataforma que encuentra refacciones por el cliente.

El problema que resolvemos es:

> Talleres mecánicos, flotillas y clientes particulares pierden tiempo llamando a múltiples refaccionarias, yonkes y deshuesaderos para localizar una pieza.

RefaPart centraliza la búsqueda y presenta opciones disponibles.

Modelo similar a marketplace/intermediación donde se conecta oferta y demanda sin necesidad de poseer inventario propio. ([iMotriz Marketplace Autopartes][1])

---

# Fase 1 (MVP)

## Lo que SI hace

* Recibir solicitudes de piezas.
* Buscar proveedores.
* Comparar opciones.
* Mostrar resultados.
* Gestionar cotizaciones.
* Gestionar pedidos.
* Gestionar proveedores.
* Gestionar comisiones.

## Lo que NO hace

* Inventario propio.
* Compras masivas.
* Almacenes.
* Control de stock propio.
* Entregas propias.

---

# Roles

## Cliente

Puede:

* Buscar refacciones.
* Ver cotizaciones.
* Ver historial.
* Crear solicitudes.
* Aprobar compras.
* Ver seguimiento.

---

## Taller

Puede:

* Buscar refacciones.
* Solicitar múltiples piezas.
* Gestionar vehículos.
* Consultar historial.
* Descargar cotizaciones.

---

## Proveedor

Puede:

* Recibir solicitudes.
* Cotizar.
* Adjuntar fotografías.
* Definir disponibilidad.
* Definir tiempo de entrega.

Tipos:

* Refaccionaria
* Yonke
* Deshuesadero
* Taller especializado
* Particular autorizado

---

## Administrador

Puede:

* Gestionar usuarios.
* Gestionar proveedores.
* Gestionar solicitudes.
* Gestionar comisiones.
* Gestionar pedidos.
* Gestionar incidencias.

---

# Flujo Principal

## Paso 1

Cliente solicita:

```text
Transmisión automática
Jetta
2016
2.5
```

---

## Paso 2

Sistema genera solicitud

Estado:

```text
Pendiente
```

---

## Paso 3

Se envía a proveedores compatibles

Ejemplo:

```text
Proveedor 1
Proveedor 2
Proveedor 3
Proveedor 4
Proveedor 5
```

---

## Paso 4

Proveedores responden

Ejemplo:

```text
Disponible
$18,000
Usada
Garantía 30 días
```

---

## Paso 5

Sistema consolida resultados

---

## Paso 6

Cliente elige opción

---

## Paso 7

Se genera pedido

---

## Paso 8

Seguimiento de entrega

---

## Paso 9

Pedido completado

---

# Categorías Iniciales

Prioridad 1

```text
Transmisiones automáticas
Motores
ECU
Diferenciales
Turbos
Cajas de transferencia
Direcciones eléctricas
Direcciones hidráulicas
```

Estas piezas suelen tener ticket alto y menor competencia. ([UpSeller][2])

---

# Base de Datos

## users

```sql
id
name
email
phone
role
status
created_at
updated_at
```

---

## providers

```sql
id
business_name
phone
whatsapp
email
address
city
state
provider_type
status
created_at
updated_at
```

---

## vehicle_brands

```sql
id
name
```

---

## vehicle_models

```sql
id
brand_id
name
```

---

## search_requests

```sql
id
user_id
brand_id
model_id
year
engine
piece_name
piece_description
status
created_at
updated_at
```

Estados:

```text
PENDING
SEARCHING
QUOTED
APPROVED
PURCHASED
DELIVERED
CANCELLED
```

---

## provider_quotes

```sql
id
request_id
provider_id
price
condition
availability
warranty
notes
created_at
```

Condición:

```text
NEW
USED
REMANUFACTURED
```

---

## orders

```sql
id
request_id
quote_id
user_id
status
subtotal
commission
total
created_at
```

---

## order_tracking

```sql
id
order_id
status
description
created_at
```

---

# Dashboard Administrativo

## Métricas

Mostrar:

```text
Solicitudes hoy
Solicitudes semana
Solicitudes mes

Cotizaciones recibidas

Proveedores activos

Ventas cerradas

Comisiones generadas
```

---

# Integraciones Futuras

## WhatsApp

Objetivo:

Enviar automáticamente:

```text
¿Tiene disponible?

Transmisión automática
Jetta 2016
Motor 2.5
```

a proveedores registrados.

---

## Google Maps

Objetivo:

Detectar nuevos proveedores.

---

## Scraping

Objetivo:

Extraer:

* Refaccionarias
* Yonkes
* Deshuesaderos
* Autopartes

con:

```text
Nombre
Teléfono
WhatsApp
Sitio web
Ciudad
Estado
```

---

# Modelo de Ingresos

## Comisión fija

Ejemplo:

```text
$300 por operación
```

---

## Comisión porcentual

Ejemplo:

```text
5%
```

---

## Destacado de proveedores

Proveedor paga para aparecer primero.

---

# Visión Final

RefaPart debe convertirse en:

> "El lugar donde talleres y clientes encuentran cualquier refacción sin tener que llamar a decenas de proveedores."

El enfoque inicial no es vender miles de piezas, sino dominar la búsqueda de piezas difíciles y de alto valor (transmisiones, motores, diferenciales y componentes especializados) para crear una red sólida de proveedores y talleres. ([iMotriz Marketplace Autopartes][1])

[1]: https://www.imotriz.com/blog/negocio-de-autopartes-en-marketplaces---c%C3%B3mo-funciona-y-ventajas?utm_source=chatgpt.com "Negocio de autopartes en marketplaces - cómo funciona y ..."
[2]: https://www.upseller.com/es/blog-article-526?utm_source=chatgpt.com "Cómo vender repuestos de autos en Mercado Libre ..."
