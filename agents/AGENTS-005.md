Sí veo una brecha importante en la documentación actual.

Después de revisar la estructura existente y lo discutido sobre UniversalPOS, **no debes documentar UniversalPOS como un POS tradicional**, sino como una **plataforma POS vertical configurable por industria**, reutilizando el Core ERP existente y evitando crear duplicados de Sales, Inventory, Pricing o Fiscal. Esto es consistente con la arquitectura actual del repositorio.

La instrucción para Codex debería ser algo similar a esto:

# AGENT – UNIVERSAL POS GAP ANALYSIS Y DOCUMENTACIÓN CORE

## Objetivo

Analizar la documentación actual del repositorio y agregar únicamente la documentación faltante necesaria para soportar UniversalPOS como módulo ERP reutilizable.

No duplicar documentación existente.

No recrear funcionalidades ya cubiertas por:

* Auth
* Catalog
* Inventory
* Pricing
* Sales
* Supplier
* Procurement
* Fiscal
* Address
* Document

UniversalPOS debe reutilizar dichas APIs.

---

# CONTEXTO ARQUITECTÓNICO

La documentación actual establece que:

POS es responsable de:

* Venta física rápida
* Caja
* Tickets
* Cortes

y que Sales continúa siendo el libro comercial central.

Por lo tanto:

UniversalPOS NO debe reemplazar Sales.

UniversalPOS debe funcionar como capa operativa especializada.

---

# DOCUMENTOS A CREAR

Crear únicamente si no existen.

## 01_core_erp/pos

Crear:

```text
01_core_erp/pos/
├── 00_universal_pos_vision.md
├── 01_pos_architecture.md
├── 02_pos_entities.md
├── 03_pos_vertical_configuration.md
├── 04_cash_management.md
├── 05_payments_processing.md
├── 06_loyalty_rewards.md
├── 07_advertising_engine.md
├── 08_pos_hardware.md
├── 09_restaurant_extension.md
├── 10_cafe_internet_extension.md
├── 11_retail_extension.md
├── 12_library_extension.md
├── 13_service_business_extension.md
├── 14_pos_reporting.md
└── 15_pos_api_contract.md
```

---

# ACTUALIZACIONES OBLIGATORIAS

Actualizar únicamente si el contenido no existe.

## 01_core_erp/apis/00_api_index.md

Actualizar:

POS API

Estado:

PENDIENTE_DE_DEFINIR

Cambiar por:

PLANNED

Agregar:

* Payments API
* Customer API
* Cash Management API
* Loyalty API
* Advertising API

como capacidades pendientes.

No marcarlas como activas.

---

# NUEVAS APIs CORE PROPUESTAS

Documentar únicamente como roadmap.

## Customer API

Responsabilidad:

* Clientes
* Historial
* Segmentación
* RFC
* Programas de lealtad

No administrar direcciones.

Debe consumir Address API.

---

## Payments API

Responsabilidad:

* Efectivo
* Tarjeta
* Transferencia
* Pago mixto
* Crédito interno
* Vales

No generar ventas.

No modificar inventario.

---

## Cash Management API

Responsabilidad:

* Aperturas
* Cierres
* Arqueos
* Movimientos
* Retiros
* Fondos

---

## Loyalty API

Responsabilidad:

* Puntos
* Monedero
* Cupones
* Recompensas

---

## Advertising API

Responsabilidad:

* Publicidad en POS
* Publicidad en ticket
* Publicidad contextual
* Campañas por sucursal

Debe permitir monetización futura.

---

# UNIVERSALPOS COMO PLATAFORMA MULTIVERTICAL

Documentar configuración por vertical.

No crear módulos separados.

Usar:

BusinessType

Valores:

```text
RETAIL
RESTAURANT
CAFE
CAFE_INTERNET
BOOKSTORE
ELECTRONICS
AUTOPARTS
PHARMACY
SERVICE_CENTER
CONVENIENCE_STORE
```

Toda personalización debe partir de BusinessType.

---

# EXTENSIÓN RESTAURANTE

Documentar:

* Mesas
* Comandas
* Cocina
* Meseros
* Propinas
* División de cuentas

Sin crear Restaurant API.

Debe ser extensión POS.

---

# EXTENSIÓN CAFÉ INTERNET

Documentar:

* Equipos
* Estaciones
* Tiempo
* Minutos
* Paquetes
* Bloqueo automático
* Internet promocional

Sin crear Internet API.

Debe ser extensión POS.

---

# EXTENSIÓN LIBRERÍA

Documentar:

* ISBN
* Autor
* Editorial
* Género
* Colección

Extensión de Catalog.

No duplicar catálogo.

---

# EXTENSIÓN REFACCIONES

Documentar:

* Compatibilidades
* VIN
* Aplicaciones
* Equivalencias

Consumir ProductCompatibility.

No duplicar información.

---

# SISTEMA DE RECOMPENSAS

Documentar:

* Internet gratis por compra
* Cupones
* Cashback
* Puntos
* Monedero

Controlado mediante Rules Engine.

No embebido dentro de POS.

---

# MOTOR DE PUBLICIDAD

Documentar:

Publicidad:

* Pantalla POS
* Ticket
* Portal cliente
* Pantallas secundarias

Preparar monetización futura.

Integración con:

* Loyalty
* Notifications
* Rules Engine

---

# REPORTES

Documentar métricas:

* Ventas por sucursal
* Ventas por caja
* Ventas por cajero
* Ventas por hora
* Ticket promedio
* Margen
* Productos más vendidos
* Campañas publicitarias
* Recompensas otorgadas

No crear Reporting API activa.

Solo roadmap.

---

# HARDWARE SOPORTADO

Documentar:

* Escáner código barras
* Impresoras térmicas
* Cajón de dinero
* Pantalla cliente
* Balanza
* Terminal bancaria
* Lectores QR
* NFC

---

# REGLA CRÍTICA

No mover funcionalidades existentes.

No duplicar:

* Inventory
* Sales
* Pricing
* Fiscal
* Catalog
* Address

UniversalPOS debe orquestar dichas APIs.

Toda venta final debe terminar registrada en Sales.

Toda afectación de stock debe terminar en Inventory.

Toda facturación debe terminar en Fiscal/Billing.

Toda dirección debe terminar en Address.

Todo archivo debe terminar en Document.

```
```

Adicionalmente, yo agregaría una decisión arquitectónica que hoy no aparece claramente en la documentación:

**UniversalPOS debe convertirse en el producto comercial principal después de Refapart**, porque reutiliza prácticamente todo el Core ERP ya existente (Auth, Catalog, Inventory, Pricing, Sales, Fiscal, Address, Document), mientras que crear un sistema de facturación independiente o nuevos verticales requeriría más desarrollo neto. Esa relación entre JobCron ↔ UniversalPOS ↔ ERP Core debería quedar documentada formalmente.
