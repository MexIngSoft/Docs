# AGENTS-005 — Universal POS sobre JobCron Core

## Estado

Activo.

Este agente absorbe la información vigente de:

* `Docs/agents/AGENTS-005.md`
* `Docs/agents/AGENTS-006.md`

`AGENTS-006` debe quedar marcado como absorbido por este agente para evitar duplicidad.

## Objetivo

Optimizar y ejecutar la documentación faltante de Universal POS como producto comercial multivertical montado sobre JobCron ERP Core.

Debe conservar la decisión central:

```text
JobCron ERP Core es el cerebro.
Universal POS es la cara operativa de caja, tickets, venta rápida, cortes y operación diaria.
Sales sigue siendo el libro comercial final.
```

Universal POS no debe documentarse como ERP separado, POS tradicional aislado ni módulo que duplique Core ERP.

## Rama obligatoria

```text
dev
```

## Lectura mínima obligatoria

Antes de modificar documentación, leer únicamente:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/00_audit/codex-context-map.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/agents/EXECUTION_REPORT.md
Docs/03_standards/operations/standard-request-prompts.md
Docs/03_standards/codex/codex-minimal-reading-standard.md
Docs/03_standards/codex/codex-change-budget-standard.md
Docs/03_standards/codex/codex-documentation-diff-standard.md
Docs/03_standards/codex/codex-output-report-standard.md
Docs/01_core_erp/apis/00_api_index.md
Docs/01_core_erp/apis/reusable-api-contracts.md
Docs/01_core_erp/apis/api-decision-matrix.md
Docs/01_core_erp/erp/01_modules.md
Docs/01_core_erp/erp/08_pos_model.md
Docs/02_projects/jobcron/README.md
Docs/03_standards/api/api-decision-record-standard.md
Docs/03_standards/api/api-contract-first-standard.md
Docs/03_standards/architecture/api-gateway-standard.md
Docs/03_standards/gateway/central-gateway-standard.md
Docs/03_standards/operations/module-lifecycle-and-feature-flags.md
Docs/03_standards/product/product-strategy.md
Docs/03_standards/product/module-catalog.md
Docs/02_projects/_ecosystem/api-version-matrix.md
Docs/02_projects/_ecosystem/gateway-matrix.md
```

No leer todo `Docs`.

No usar `_archive/` ni `agents/_archive/` como fuente vigente salvo trazabilidad.

## Alcance

Puede revisar, crear o actualizar documentación relacionada con:

* Universal POS;
* JobCron POS;
* POS Core Model;
* POS como capa operativa de venta física rápida;
* caja;
* tickets;
* cortes;
* pagos;
* devoluciones;
* cancelaciones;
* arqueo;
* sesiones de cajero;
* hardware POS;
* recompensas;
* publicidad;
* reportes;
* configuración por vertical;
* monetización;
* WiFi Rewards;
* recargas como integración futura;
* feature flags por giro comercial;
* Gateway central;
* APIs Core consumidas por POS.

## APIs relacionadas

Universal POS puede consumir u orquestar:

```text
Auth
Gateway
Catalog
Inventory
Pricing
Sales
Supplier
Procurement
Fiscal/Billing
Address
Document
Notifications
Rules Engine
FeatureAvailability
```

Capacidades roadmap relacionadas:

```text
POS API
Payments API
Customer API
Cash Management API
Loyalty API
Advertising API
Reporting API
Recharge Engine
Network Controller / SaTwi NOC
```

No marcar una API como activa si solo existe en roadmap.

## Decisión arquitectónica obligatoria

Documentar y conservar:

* JobCron ERP Core es el cerebro.
* Universal POS / JobCron POS es la cara operativa.
* POS opera caja, tickets, venta física rápida y cortes.
* POS no reemplaza Sales.
* POS no guarda catálogo propio.
* POS no administra proveedores.
* POS no define reglas comerciales por sí solo.
* POS consume Core APIs mediante Gateway central.
* POS puede venderse como producto comercial visible al cliente.
* JobCron puede permanecer como nombre interno/administrativo.
* La marca pública puede ser `Universal POS`, `JobCron POS` o equivalente, pero debe quedar documentado.
* Una venta pagada en POS debe terminar registrada en `SalesOrder`.
* El ticket POS es comprobante operativo, no reemplaza la orden comercial.
* Todo módulo debe quedar preparado para multi-empresa, multi-sucursal y multi-tenant.

## Fronteras obligatorias

Universal POS no debe duplicar responsabilidades:

```text
Toda venta final termina en Sales.
Toda afectación de stock termina en Inventory.
Toda facturación termina en Fiscal/Billing.
Toda dirección termina en Address.
Todo archivo/evidencia termina en Document.
Todo producto/catálogo termina en Catalog.
Todo precio/promoción base termina en Pricing.
Toda regla comercial reutilizable termina en Rules Engine.
Toda autenticación termina en Auth.
Todo consumo frontend pasa por Gateway.
```

## Tipos de negocio mínimos

Documentar Universal POS como plataforma multivertical configurable por `BusinessType`.

Valores mínimos:

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

## Tareas documentales

### 1. Actualizar POS Core Model

Actualizar:

```text
Docs/01_core_erp/erp/08_pos_model.md
```

Debe reforzar:

* POS como capa operativa;
* relación POS -> Sales;
* relación POS -> Inventory;
* relación POS -> Pricing;
* relación POS -> Billing;
* relación POS -> Customers / Addresses;
* relación POS -> Payments;
* relación POS -> Notifications;
* relación POS -> Rules Engine;
* relación POS -> Advertising / Loyalty;
* relación POS -> Network Rewards / WiFi;
* límites del módulo POS.

### 2. Crear o actualizar estrategia Universal POS

Crear o actualizar:

```text
Docs/01_core_erp/erp/25_pos_universal_strategy.md
```

Debe documentar:

* objetivo del POS reutilizable;
* POS como producto comercial/operativo;
* POS UI;
* POS API/BFF solo si aplica;
* consumo de ERP Core APIs;
* módulos comerciales;
* integración futura Network Rewards;
* feature flags por giro.

### 3. Crear carpeta de proyecto Universal POS

Crear o actualizar:

```text
Docs/02_projects/universal-pos/README.md
Docs/02_projects/universal-pos/architecture.md
Docs/02_projects/universal-pos/api-contracts.md
Docs/02_projects/universal-pos/database.md
Docs/02_projects/universal-pos/monetization.md
Docs/02_projects/universal-pos/wifi-rewards.md
Docs/02_projects/universal-pos/tasks/mvp.md
```

### 4. Documentar arquitectura

En `architecture.md`, incluir:

Frontend:

```text
Next.js
UI de caja rápida
modo responsive/tablet
navegación mínima
```

Backend:

```text
Gateway central obligatorio
no conectar frontend directo a Core APIs
POS API solo como capa operativa si existe lógica exclusiva
```

Flujo mínimo:

1. Cajero inicia sesión.
2. Abre caja.
3. Busca o escanea producto.
4. POS consulta Catalog / Pricing / Inventory.
5. Aplica reglas autorizadas.
6. Registra pago.
7. Crea POSTicket.
8. Crea o actualiza SalesOrder.
9. Descuenta inventario.
10. Genera ticket.
11. Si aplica, genera cupón, recarga o WiFi reward.
12. Registra evento para reportes.

### 5. Documentar contratos preliminares

En `api-contracts.md`, incluir como contratos preliminares:

```text
POST /pos/sessions/open
POST /pos/sessions/close
GET /pos/products/search
POST /pos/tickets
POST /pos/tickets/{id}/pay
POST /pos/tickets/{id}/cancel
POST /pos/tickets/{id}/refund
GET /pos/reports/daily-close
POST /pos/rewards/coupon
POST /pos/rewards/wifi-voucher
POST /pos/recharges/create
```

Aclarar:

* no duplican Sales;
* no duplican Inventory;
* no duplican Pricing;
* solo orquestan operación rápida usando Core APIs;
* cualquier API especializada requiere contrato y decisión documentada.

### 6. Documentar entidades mínimas

En `database.md`, documentar:

```text
CashRegister
POSSession
POSTicket
POSTicketLine
POSPayment
POSCashMovement
POSRefund
POSPromotionApplied
POSRewardIssued
POSRechargeTransaction
POSWifiVoucher
```

Si se publican tablas, usar PascalCase estilo SQL Server.

### 7. Documentar MVP

MVP POS:

* login por usuario/cajero;
* apertura de caja;
* búsqueda de producto;
* lector de código de barras;
* venta rápida;
* descuento autorizado;
* pago en efectivo;
* pago mixto preparado para futuro;
* ticket;
* cancelación;
* devolución;
* corte de caja;
* reporte básico diario;
* registro en SalesOrder;
* descuento de Inventory;
* precios desde Pricing.

### 8. Documentar fases

Fase 2:

* mesas/restaurante;
* comandas;
* cocina;
* recargas electrónicas;
* pago de servicios;
* clientes frecuentes;
* puntos;
* cupones;
* promociones en ticket;
* publicidad local;
* QR promocional;
* WiFi reward básico.

Fase 3:

* hotspot integrado;
* voucher WiFi automático;
* límite por tiempo/MB;
* integración MikroTik / Radius / Ubiquiti / OpenWISP si aplica;
* marketplace de promociones;
* analítica comercial;
* campañas WhatsApp / SMS / email.

### 9. Documentar extensiones verticales

Restaurante:

```text
mesas
comandas
cocina
meseros
propinas
división de cuentas
```

Café internet:

```text
equipos
estaciones
tiempo
minutos
paquetes
bloqueo automático
internet promocional
```

Librería:

```text
ISBN
autor
editorial
género
colección
```

Refacciones:

```text
compatibilidades
VIN
aplicaciones
equivalencias
ProductCompatibility o contrato equivalente
```

### 10. Documentar monetización

En `monetization.md`, incluir:

Planes:

```text
gratis con publicidad opcional
básico
pro
restaurante
hotspot/cyber
multi-sucursal
enterprise
```

Ingresos:

```text
suscripción
comisión por recargas
comisión por pago de servicios
publicidad local
cupones patrocinados
módulos premium
soporte / instalación
```

Reglas:

* publicidad no debe interrumpir cobro;
* publicidad recompensada debe ser opcional;
* créditos promocionales deben separarse de créditos comprados;
* no depender de publicidad como ingreso principal en MVP.

### 11. Documentar WiFi Rewards

En `wifi-rewards.md`, documentar:

Objetivo:

```text
Permitir que un negocio entregue internet como recompensa por compra.
```

Ejemplos:

```text
compra mínima $50 = 30 minutos WiFi
compra mínima $100 = 1 hora WiFi
compra mínima $200 = 1 GB
cliente frecuente = cupón WiFi
```

Arquitectura:

```text
POS -> Rewards API -> Network Controller / SaTwi NOC -> MikroTik / Radius / Ubiquiti / OpenWISP
```

Reglas:

* POS no administra red directamente;
* POS solicita emisión de voucher;
* Network Controller crea usuario, contraseña, QR, límite de tiempo, límite de datos y velocidad;
* ticket puede imprimir QR o código;
* deben existir límites contra abuso;
* no declarar WiFi Rewards productivo sin contrato con Network Controller / SaTwi NOC.

### 12. Documentar recargas

Recargas quedan como integración futura.

No declararlas activas si no existe proveedor definido.

Debe documentarse:

* proveedor pendiente;
* contrato pendiente;
* reglas antifraude pendientes;
* conciliación pendiente;
* comisión pendiente.

### 13. Actualizar catálogo de módulos

Actualizar si aplica:

```text
Docs/03_standards/product/module-catalog.md
```

Agregar o ajustar:

```text
POS Universal | Commercial Module / Core ERP consumer | 02_projects/universal-pos | Pendiente/MVP
POS Core Model | Core ERP | 01_core_erp/erp/08_pos_model.md | Documentado
WiFi Rewards | Shared/Commercial Module | 02_projects/universal-pos/wifi-rewards.md | Pendiente
Recharge Engine | Commercial Module / Integration pending | 04_integrations cuando se defina proveedor | Pendiente
Advertising Engine | Shared/Commercial Module | owner documental pendiente | Pendiente
```

### 14. Actualizar índice de trabajo activo

Actualizar:

```text
Docs/_meta/active-work-index.md
```

Agregar ruta rápida para Universal POS:

```text
02_projects/universal-pos/README.md
02_projects/universal-pos/architecture.md
02_projects/universal-pos/api-contracts.md
02_projects/universal-pos/database.md
02_projects/universal-pos/monetization.md
02_projects/universal-pos/wifi-rewards.md
02_projects/universal-pos/tasks/mvp.md
01_core_erp/erp/08_pos_model.md
01_core_erp/erp/25_pos_universal_strategy.md
```

### 15. Actualizar matrices del ecosistema

Actualizar solo si aplica:

```text
Docs/02_projects/_ecosystem/api-version-matrix.md
Docs/02_projects/_ecosystem/gateway-matrix.md
```

Agregar Universal POS como consumidor de Gateway/Core APIs solo si queda documentado como proyecto activo o MVP.

## Fuera de alcance

No hacer:

* ejecutar otros agents;
* implementar código runtime;
* crear APIs nuevas sin contrato;
* crear Gateway/BFF por proyecto;
* crear Auth por proyecto;
* crear Docker por proyecto;
* crear schemas, modelos o migraciones sin decisión documentada;
* modificar `main` o `pro`;
* leer todo `Docs`;
* tocar proyectos no relacionados;
* convertir POS en ERP separado;
* crear Sales paralelo;
* crear Inventory paralelo;
* crear Pricing paralelo;
* crear Catalog paralelo;
* hacer que POS administre proveedores;
* hacer que POS administre red directamente;
* hacer que publicidad interrumpa el cobro;
* declarar recargas como activas sin proveedor;
* declarar WiFi Rewards como productivo sin contrato.

## Validaciones

Ejecutar o registrar por qué no se pudo ejecutar:

```text
validación de rutas y enlaces modificados
validación de documentos creados
búsqueda local para confirmar que no se duplicó Sales, Inventory, Pricing o Catalog
búsqueda local para confirmar que POS no quedó como ERP separado
validación documental conforme a codex-documentation-diff-standard.md
git diff --check
```

Si existen scripts documentales:

```bash
python scripts/validate_frontmatter.py
python scripts/build_master_index.py
validate-docs-rules.sh
```

No declarar validaciones como ejecutadas si no corrieron.

No ejecutar build, lint, Docker ni migraciones si no se modificó código.

## Reporte obligatorio

Actualizar:

```text
Docs/agents/EXECUTION_REPORT.md
```

Registrar:

* agente ejecutado: `AGENTS-005`;
* agente absorbido: `AGENTS-006`;
* rama usada;
* Context Pack usado;
* documentos leídos;
* documentos fuera de alcance;
* cambios realizados;
* archivos creados;
* archivos actualizados;
* APIs reutilizadas;
* APIs no creadas y motivo;
* módulos Core afectados;
* capacidades marcadas como roadmap;
* validaciones ejecutadas;
* resultado de validaciones;
* pendientes reales;
* bloqueos;
* decisiones documentales;
* riesgos de duplicación evitados;
* confirmación de que POS queda como producto sobre JobCron Core, no como ERP separado.

## Criterio de cierre

El agente queda listo solo si:

* conserva toda la decisión arquitectónica vigente;
* no duplica reglas globales;
* tiene lectura mínima;
* tiene alcance claro;
* tiene tareas verificables;
* indica qué queda fuera;
* define validaciones;
* define reporte obligatorio;
* no convierte POS en ERP separado;
* no crea APIs sin contrato;
* no duplica Sales, Inventory, Pricing o Catalog;
* documenta Universal POS como producto comercial sobre JobCron Core;
* registra pendientes reales y bloqueos;
* `AGENTS-006` queda marcado como absorbido/cerrado.
