Después de revisar la estructura documental que ya tienes, creo que hay un ajuste importante respecto a lo que habíamos definido antes:

**Network Control sí debe ser responsable del mapeo y modelado de la red.**

¿Por qué?

Porque SatWi no es realmente el producto técnico; SatWi es la empresa ISP y la marca comercial.

Si mañana vendes Network Control a otro ISP, ese ISP también necesitará:

* Mapear torres.
* Mapear fibra.
* Mapear clientes.
* Mapear NAP.
* Mapear splitters.
* Diseñar expansiones.
* Ver cobertura.
* Ver topología.

Por lo tanto, esas capacidades pertenecen al producto Network Control y no a SatWi.

La separación correcta sería:

```txt
SatWi
=
Empresa ISP

Network Control
=
Producto técnico de operación ISP

JobCron
=
ERP administrativo

POS
=
Punto de venta
```

# DECISIÓN DE ARQUITECTURA DEFINITIVA

## SatWi + Network Control + JobCron + POS

### PRINCIPIO GENERAL

SatWi no es un software.

SatWi es una empresa ISP.

Network Control es el producto técnico.

JobCron es el ERP.

POS es el punto de venta.

---

# SATWI

Responsabilidades:

* Marca comercial.
* Venta de internet.
* Atención a clientes.
* Estrategia comercial.
* Expansión del negocio.
* Comercialización de servicios.
* Operación como ISP.

NO debe contener:

* Configuración de routers.
* Gestión de MikroTik.
* PPPoE.
* Hotspot.
* Diseño técnico de red.
* Mapeo técnico.
* Inventario.
* Facturación ERP.

SatWi consume servicios.

No los implementa.

---

# NETWORK CONTROL

Network Control es un producto independiente y comercializable.

Debe poder venderse a:

* ISP.
* WISP.
* FTTH.
* Hoteles.
* Restaurantes.
* Cafeterías.
* Plazas comerciales.
* Escuelas.
* Empresas.

Network Control es el dueño de la red.

---

## RESPONSABILIDADES DE NETWORK CONTROL

### Infraestructura

* Torres.
* Antenas.
* Radios.
* MikroTik.
* Switches.
* OLT.
* ONU.
* ONT.
* NAP.
* Splitters.
* Fibra.
* Backhaul.
* Clientes de red.

---

### Mapeo

Network Control debe ser responsable de:

* Mapa GIS.
* Topología.
* Cobertura.
* Diseño de red.
* Planeación FTTH.
* Planeación inalámbrica.
* Mapa de clientes.
* Mapa de infraestructura.
* Mapa de incidencias.
* Mapa de crecimiento.

---

### Operación

* Hotspot.
* PPPoE.
* DHCP.
* Radius.
* Vouchers.
* Portales cautivos.
* Control de ancho de banda.
* Sesiones activas.
* Consumo.
* Cortes.
* Reactivaciones.

---

### Multi ISP

Network Control debe ser:

Multi Tenant.

Cada ISP debe tener:

* Usuarios.
* Equipos.
* Clientes.
* Infraestructura.
* Portales.
* Vouchers.
* Configuración.

Completamente aislados.

---

### Diseño de red

Network Control debe permitir:

* Crear torres.
* Crear enlaces.
* Crear zonas.
* Crear rutas FTTH.
* Crear OLT.
* Crear Splitters.
* Crear NAP.
* Crear clientes.
* Diseñar crecimiento.

---

### Planeación inteligente

Debe permitir:

* Encuestas.
* Captura GPS.
* Prospección.
* Detección de demanda.
* Agrupación geográfica.
* Planeación FTTH.
* Planeación inalámbrica.
* ROI estimado.
* Costos estimados.

Porque todo eso es parte del producto vendible.

---

# JOBCRON ERP

JobCron NO administra la red.

JobCron administra el negocio.

---

## Responsabilidades

### Clientes

* Clientes.
* Prospectos.
* Contratos.
* Historial.

---

### Inventario

Debe controlar:

* Antenas.
* Radios.
* MikroTik.
* Switches.
* OLT.
* Splitters.
* NAP.
* ONU.
* ONT.
* Fibra.
* Herramientas.

Pero únicamente como existencia.

Ejemplo:

```txt
Tengo 15 MikroTik.
Tengo 2 OLT.
Tengo 12 Splitters.
Tengo 8 NAP.
```

JobCron no configura nada.

---

### Compras

* Solicitudes.
* Órdenes.
* Recepción.
* Costos.

---

### Ventas

* Servicios.
* Instalaciones.
* Contratos.
* Renovaciones.

---

### Cobranza

* Mensualidades.
* Pagos.
* Suspensiones comerciales.

---

### Técnicos

* Órdenes de trabajo.
* Instalaciones.
* Mantenimiento.
* Evidencias.

---

### Integración con Network Control

JobCron puede solicitar:

```txt
activar servicio
suspender servicio
reactivar servicio
consultar consumo
consultar estado
```

Pero no administra la configuración.

---

# POS

POS debe ser módulo del ERP.

No debe vivir dentro de Network Control.

---

## Responsabilidades

* Ventas.
* Productos.
* Recargas.
* Pagos.
* Cortes de caja.
* Facturación.
* Inventario de tienda.

---

# INTEGRACIÓN POS + NETWORK CONTROL

Caso de uso:

Restaurante.

```txt
Compra mínima:
$150
```

POS detecta promoción.

Solicita:

```txt
voucher 1 hora
```

a Network Control.

Network Control:

* genera código.
* genera QR.
* registra expiración.
* registra velocidad.

POS imprime ticket.

Cliente usa portal cautivo.

---

# PORTAL CAUTIVO

Debe pertenecer a Network Control.

No al POS.

Debe permitir:

* Voucher.
* Login social.
* Código QR.
* Campañas.
* Publicidad.
* Tiempo gratis.
* Internet por compra.

---

# PRODUCTOS DOCUMENTALES

## Proyecto

02_projects/satwi

Empresa ISP.

---

## Proyecto

02_projects/network-control

Producto comercial.

---

## Proyecto

02_projects/jobcron

ERP.

---

## Proyecto

02_projects/pos

POS.

---

# APIs

## API DE PROYECTO

Network Control API

Responsable de:

* Red.
* GIS.
* Hotspot.
* PPPoE.
* Radius.
* MikroTik.
* FTTH.
* Planeación.

---

## API DE PROYECTO

JobCron API

Responsable de:

* ERP.
* Clientes.
* Inventario.
* Compras.
* Ventas.
* Cobranza.

---

## API DE PROYECTO

POS API

Responsable de:

* Ventas.
* Caja.
* Recargas.
* Tickets.

---

# DECISIÓN FINAL

Network Control es el sistema técnico central.

JobCron es el sistema administrativo central.

POS es el sistema comercial de punto de venta.

SatWi es la empresa ISP que consume los tres sistemas.

La principal corrección respecto a la propuesta anterior es esta:

**El mapeo, diseño FTTH, cobertura, topología, planeación y expansión sí deben vivir en Network Control**, porque son capacidades del producto técnico que después quieres vender a otros ISP. En cambio, **inventario, compras, contratos, cobranza, técnicos, órdenes de trabajo y control administrativo deben permanecer en JobCron**, porque son capacidades ERP reutilizables para cualquier negocio.
Entonces hay que corregir la arquitectura porque ya cambió bastante respecto a lo que habíamos definido antes.

Por lo que entiendo ahora:

## MexIngSof

Es la empresa de software.

Productos:

```txt
JobCron ERP
Network Controller
Universal POS
DocuCore
Refapart
LexNova
etc.
```

---

## Network Controller

No es un módulo de SatWi.

Es un producto independiente.

Su función es:

```txt
Control de redes
Mapeo GIS
FTTH
GPON
MikroTik
Hotspot
PPPoE
Radius
Portal cautivo
Vouchers
Multi ISP
```

Y es el producto que se venderá a otros ISP.

---

## Universal POS

Tampoco pertenece a SatWi.

Universal POS es un producto independiente.

Pero se integra con Network Controller.

Ejemplo:

```txt
Restaurante
   ↓
Universal POS
   ↓
Genera ticket
   ↓
Solicita voucher
   ↓
Network Controller
   ↓
Portal cautivo
```

El POS puede funcionar perfectamente sin Network Controller.

Y Network Controller puede funcionar perfectamente sin POS.

La integración es opcional.

---

## SatWi

Aquí es donde cambia todo.

SatWi ya no es:

```txt
Sistema
Módulo
Plataforma
Producto
```

SatWi es simplemente:

```txt
Tu ISP
```

Es decir:

```txt
SatWi
=
Cliente de Network Controller
```

Exactamente igual que cualquier otro ISP que compre tu software.

---

## Entonces las responsabilidades quedan así

### SatWi

```txt
Vender internet
Atender clientes
Instalar servicios
Cobrar
Operar como ISP
```

Nada más.

---

### Network Controller

```txt
GIS
Mapeo
Topología
Torres
Cobertura
FTTH
GPON
MikroTik
Hotspot
Portal cautivo
Vouchers
PPPoE
Radius
Monitoreo
Diseño de red
Planeación
Multi ISP
```

---

### JobCron

```txt
Clientes
Contratos
Inventario
Compras
Ventas
Cobranza
Técnicos
Órdenes de trabajo
Facturación
Reportes
```

---

### Universal POS

```txt
Punto de venta
Recargas
Pagos
Inventario local
Caja
Promociones
Tickets
```

---

## El caso de uso que cambia todo

Tienda:

```txt
Compra una coca
↓
POS imprime ticket
↓
POS pide voucher
↓
Network Controller genera acceso
↓
Portal cautivo valida
↓
Cliente navega
```

Aquí POS y Network Controller colaboran.

Pero ninguno depende del otro.

---

## Lo que yo documentaría para Codex

La jerarquía real sería:

```txt
MexIngSof
│
├── JobCron ERP
├── Universal POS
├── Network Controller
├── DocuCore
├── Refapart
├── LexNova
└── Otros productos
```

Y aparte:

```txt
SatWi
```

como empresa operadora que consume:

```txt
Network Controller
JobCron
Universal POS (si lo desea)
```

De hecho, con esta definición, el nombre **SatWi deja de ser relevante para la arquitectura técnica**, porque ya no es el dueño del sistema; es simplemente uno de los ISP que utilizarán Network Controller. Por eso la decisión del nombre de SatWi debe tomarse más desde marketing y posicionamiento comercial del ISP que desde la arquitectura de software.
