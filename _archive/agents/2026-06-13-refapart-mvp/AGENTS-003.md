Después de revisar todo el contexto del proyecto **RefaPart**, **Refapart**, **JobCron** y las conversaciones relacionadas, si hoy fueras a darle instrucciones a Codex para construir el MVP correcto, no le pediría una tienda de refacciones tradicional.

Le pediría una **plataforma de localización y abastecimiento de refacciones**.

---

# Objetivo principal

RefaPart NO vende inventario propio inicialmente.

RefaPart conecta:

* Cliente
* Taller
* Refaccionaria
* Yonke
* Deshuesadero
* Especialista

para encontrar una pieza en el menor tiempo posible.

---

# MVP 1

## Búsqueda de piezas

Pantalla principal:

```text
¿Qué pieza buscas?

[________________]

Marca
Modelo
Año
Motor
Transmisión
```

Ejemplos:

```text
Transmisión CVT Nissan X-Trail 2018

Motor Mazda 3 2017

Computadora Jetta A4
```

---

# Catálogo por categorías

## Transmisiones

* Automáticas
* CVT
* DSG
* Manuales

---

## Motores

* Nacionales
* Importados

---

## Computadoras

* ECM
* PCM
* BCM
* ABS

---

## Diferenciales

---

## Direcciones

---

## Suspensiones

---

## Carrocería

---

# Módulo de proveedores

Tabla:

```sql
providers
```

Campos:

```sql
id
name
business_type
phone
whatsapp
email
website
city
state
address
rating
status
```

Tipos:

```text
Refaccionaria

Deshuesadero

Yonke

Especialista

Distribuidor
```

---

# Especialidades

Tabla

```sql
provider_specialties
```

Ejemplo:

```text
BMW

Mercedes

Audi

Transmisiones

Motores

Computadoras
```

---

# Inventario

No obligatorio inicialmente.

Tabla:

```sql
provider_products
```

Campos:

```sql
id
provider_id
title
brand
model
year
condition
price
stock
```

---

# Solicitudes

El núcleo del negocio.

Tabla:

```sql
part_requests
```

Campos:

```sql
id
user_id
part_name
vehicle_make
vehicle_model
vehicle_year
description
status
created_at
```

---

Estados

```text
Pendiente

Buscando

Encontrada

Cotizada

Vendida

Cancelada
```

---

# Cotizaciones

Tabla

```sql
quotes
```

Campos

```sql
id
request_id
provider_id
price
shipping
notes
status
```

---

# Panel operador

El operador es quien encuentra la pieza.

Ver:

```text
Solicitudes nuevas

Cotizaciones

Proveedores

Ventas
```

---

# WhatsApp

Prioridad muy alta.

Botón:

```text
Solicitar por WhatsApp
```

Mensaje automático:

```text
Hola.

Busco:

Transmisión CVT Nissan X-Trail 2018

¿La tiene disponible?
```

---

# Motor de proveedores

Tabla:

```sql
provider_tags
```

Ejemplos:

```text
Nissan

BMW

Volkswagen

Motor

Transmisión

CVT

DSG
```

Cuando llega una solicitud:

```text
Transmisión CVT Nissan
```

Se consulta automáticamente:

```sql
providers
provider_tags
```

y se generan candidatos.

---

# Scraping

Módulo independiente.

## Tabla

```sql
provider_sources
```

Campos:

```sql
id
provider_id
source_type
url
last_scan
```

---

Fuentes

```text
Google Maps

Facebook

Sitio web

Marketplace
```

---

# Sistema de eventos

RefaPart debe ser orientado a eventos.

Eventos:

```text
REQUEST_CREATED

REQUEST_ASSIGNED

REQUEST_QUOTED

REQUEST_SOLD

PROVIDER_CREATED

PROVIDER_UPDATED
```

---

# Integración con JobCron

JobCron debe administrar:

```text
Scraping

Importaciones

Envíos masivos

Recordatorios

Actualizaciones de proveedores

Monitoreo
```

---

# Arquitectura

## RefaPart

Responsable de:

```text
Usuarios

Solicitudes

Cotizaciones

Ventas

Marketplace
```

---

## JobCron

Responsable de:

```text
Automatizaciones

Scraping

Procesos programados

Colas

Eventos
```

---

# Fase 2

Inventario real.

Proveedores suben:

```text
Motores

Transmisiones

Computadoras

Refacciones
```

---

# Fase 3

Búsqueda inteligente

Ejemplo:

```text
Transmisión CVT Nissan X-Trail 2018
```

El sistema identifica:

```text
Marca = Nissan

Modelo = X-Trail

Año = 2018

Categoría = Transmisión
```

y consulta automáticamente:

```text
Proveedores compatibles
Inventario
Solicitudes similares
```

---

# Lo más importante que falta implementar hoy

Si mañana empezaras a desarrollar en Codex, las prioridades serían:

1. Base de datos de proveedores.
2. Sistema de solicitudes de piezas.
3. Sistema de cotizaciones.
4. WhatsApp semiautomático.
5. Etiquetas/especialidades de proveedores.
6. Eventos para JobCron.
7. Scraper de Google Maps/Facebook/Sitios Web.
8. Panel de operador.
9. Dashboard de ventas y solicitudes.
10. API pública para futuras integraciones.

Ese conjunto forma el núcleo del negocio que has descrito durante toda la conversación. Una vez funcionando, ya puedes empezar a captar refaccionarias, deshuesaderos y especialistas sin necesidad de tener inventario propio.
