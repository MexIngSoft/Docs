Sí. Revisé `Docs` y la decisión correcta es:

**El POS NO debe ser un ERP aparte.**
Debe ser un **producto comercial independiente**, pero montado sobre **JobCron ERP Core**.

La documentación ya dice que el núcleo ERP debe contener lo reutilizable y que “Punto de venta” pertenece al Core ERP . Además, el módulo POS ya existe como modelo base y especifica que controla caja/tickets, pero no reemplaza `Sales` .

## Instrucción completa para Codex

```text
TAREA: Documentar arquitectura y estrategia del POS Universal dentro de Docs

Repositorio:
https://github.com/MexIngSoft/Docs.git

Objetivo:
Documentar correctamente el POS Universal como producto comercial operado sobre JobCron ERP Core, sin convertirlo en un ERP separado ni duplicar módulos existentes.

LECTURA OBLIGATORIA ANTES DE MODIFICAR

1. Leer:
   - README.md
   - _meta/active-work-index.md
   - 01_core_erp/erp/01_modules.md
   - 01_core_erp/erp/08_pos_model.md
   - 02_projects/jobcron/README.md
   - 03_standards/product/product-strategy.md
   - 03_standards/product/module-catalog.md
   - 03_standards/architecture/api-gateway-standard.md
   - 03_standards/gateway/central-gateway-standard.md
   - 03_standards/operations/module-lifecycle-and-feature-flags.md

DECISIÓN ARQUITECTÓNICA

El POS debe quedar documentado así:

- JobCron ERP Core es el cerebro.
- POS Universal es la cara operativa para caja, ventas rápidas, tickets, cortes y operación diaria.
- POS no reemplaza Sales.
- POS no guarda catálogo propio.
- POS no administra proveedores.
- POS no define reglas comerciales por sí solo.
- POS consume APIs del Core ERP: Auth, Catalog, Pricing, Inventory, Sales, Billing, Customers, Branches, Payments, Notifications, Rules Engine.
- POS puede convertirse en producto comercial visible al cliente.
- JobCron puede permanecer como nombre interno/administrativo.
- La cara pública puede ser “JobCron POS”, “Universal POS” o nombre comercial equivalente, pero debe quedar definido como producto consumidor de JobCron Core.

DOCUMENTOS A CREAR O ACTUALIZAR

1. Actualizar:
   01_core_erp/erp/08_pos_model.md

Agregar secciones:
- “POS como capa operativa”
- “Relación POS -> Sales”
- “Relación POS -> Inventory”
- “Relación POS -> Pricing”
- “Relación POS -> Billing”
- “Relación POS -> Customers”
- “Relación POS -> Rules Engine”
- “Relación POS -> Advertising/Loyalty”
- “Relación POS -> Network Rewards / WiFi”
- “Límites del módulo POS”

Debe quedar claro:
- Una venta pagada en POS termina en SalesOrder.
- El ticket POS es comprobante operativo, no reemplaza la orden comercial.
- El POS puede operar rápido, incluso con UI simplificada, pero la fuente formal de ventas es Sales.
- El POS debe soportar caja, sesión de cajero, apertura/cierre, devoluciones, cancelaciones, arqueo y métodos de pago.

2. Crear:
   01_core_erp/erp/25_pos_universal_strategy.md

Contenido requerido:

# POS Universal Strategy

## Objetivo
Crear un punto de venta reutilizable para múltiples giros comerciales:
- tiendas
- restaurantes
- cafeterías
- electrónica
- refaccionarias
- ferreterías
- papelerías
- farmacias
- cyber cafés
- negocios con hotspot
- negocios con recargas

## Decisión principal
El POS no es un ERP separado.
El POS es un producto comercial/operativo que consume JobCron ERP Core.

## Capas
- POS UI: pantalla de caja.
- POS API/BFF: operaciones rápidas para venta física.
- ERP Core APIs: Auth, Catalog, Pricing, Inventory, Sales, Billing, Customers, Payments, Rules.
- Commercial Modules: recargas, publicidad, cupones, lealtad.
- Network Rewards: integración futura con SaTwi/NOC/Hotspot.

## Tipos de negocio
Documentar perfiles activables por feature flags:
- Retail
- Restaurante
- Cafetería
- Cyber Café
- Refaccionaria
- Electrónica
- Servicio técnico
- Multi-sucursal

## MVP POS
Debe incluir:
- login por usuario/cajero
- apertura de caja
- búsqueda de producto
- lector de código de barras
- venta rápida
- descuento autorizado
- pago en efectivo
- pago mixto preparado para futuro
- ticket
- cancelación
- devolución
- corte de caja
- reporte básico diario
- registro en SalesOrder
- descuento de Inventory
- precios desde Pricing

## Fase 2
- mesas/restaurante
- comandas
- cocina
- recargas electrónicas
- pago de servicios
- clientes frecuentes
- puntos
- cupones
- promociones en ticket
- publicidad local
- QR promocional
- WiFi reward básico

## Fase 3
- hotspot integrado
- creación automática de voucher WiFi
- límite por tiempo/MB
- integración MikroTik/Radius/Ubiquiti/OpenWISP si aplica
- marketplace de promociones
- analítica comercial
- campañas por WhatsApp/SMS/email

3. Crear:
   02_projects/universal-pos/README.md

Si la carpeta no existe, crearla.

Contenido:

# Universal POS

## Rol
Producto comercial de punto de venta basado en JobCron ERP Core.

## Cara al cliente
El cliente no debe ver el ERP completo.
El cliente ve una interfaz simple de punto de venta:
- vender
- cobrar
- imprimir ticket
- cortar caja
- consultar inventario básico
- aplicar promociones autorizadas

## Relación con JobCron
JobCron gobierna:
- datos
- permisos
- planes
- feature flags
- reglas
- módulos
- ventas formales
- facturación
- reportes administrativos

Universal POS opera:
- caja
- tickets
- cajero
- venta mostrador
- experiencia rápida

## Diferenciador comercial
Universal POS no debe venderse solo como punto de venta.
Debe venderse como:
- POS + recargas
- POS + promociones
- POS + publicidad local
- POS + fidelización
- POS + WiFi rewards
- POS + módulos por giro

## Modelos de negocio
- Freemium con publicidad opcional
- Suscripción sin publicidad
- Comisión por recargas
- Pago por módulo avanzado
- Plan restaurante
- Plan retail
- Plan cyber/hotspot
- Plan multi-sucursal
- Enterprise si requiere permisos, auditoría o SLA

4. Crear:
   02_projects/universal-pos/architecture.md

Debe documentar:

Frontend:
- Next.js
- UI de caja rápida
- modo responsive/tablet
- navegación mínima

Backend:
- Gateway/BFF obligatorio
- no conectar frontend directo a Core APIs si existe Gateway central
- POS API solo como capa operativa si es necesario

Core APIs consumidas:
- Auth API
- Catalog API
- Pricing API
- Inventory API
- Sales API
- Billing API
- Customers/Addresses API
- Payments API
- Notifications API
- Rules Engine
- FeatureAvailability

Flujo:
1. Cajero inicia sesión.
2. Abre caja.
3. Busca/escanea producto.
4. POS consulta Catalog/Pricing/Inventory.
5. Aplica reglas autorizadas.
6. Registra pago.
7. Crea POSTicket.
8. Crea/actualiza SalesOrder.
9. Descuenta inventario.
10. Genera ticket.
11. Si aplica, genera cupón/recarga/WiFi reward.
12. Se registra evento para reportes.

5. Crear:
   02_projects/universal-pos/api-contracts.md

Debe incluir contratos preliminares:

- POST /pos/sessions/open
- POST /pos/sessions/close
- GET /pos/products/search
- POST /pos/tickets
- POST /pos/tickets/{id}/pay
- POST /pos/tickets/{id}/cancel
- POST /pos/tickets/{id}/refund
- GET /pos/reports/daily-close
- POST /pos/rewards/coupon
- POST /pos/rewards/wifi-voucher
- POST /pos/recharges/create

Aclarar:
- Los endpoints POS no deben duplicar lógica de Sales, Inventory o Pricing.
- Deben orquestar operaciones rápidas usando Core APIs.

6. Crear:
   02_projects/universal-pos/database.md

Debe incluir entidades mínimas:

- CashRegister
- POSSession
- POSTicket
- POSTicketLine
- POSPayment
- POSCashMovement
- POSRefund
- POSPromotionApplied
- POSRewardIssued
- POSRechargeTransaction
- POSWifiVoucher

Regla:
- Documentar tablas públicas en PascalCase estilo SQL Server si se publican.

7. Crear:
   02_projects/universal-pos/monetization.md

Debe documentar:

Planes:
- Gratis con publicidad opcional
- Básico
- Pro
- Restaurante
- Hotspot/Cyber
- Multi-sucursal

Ingresos:
- suscripción
- comisión por recargas
- comisión por pago de servicios
- publicidad local
- cupones patrocinados
- módulos premium
- soporte/instalación

Reglas:
- La publicidad no debe interrumpir el cobro.
- La publicidad recompensada debe ser opcional.
- Los créditos promocionales deben separarse de créditos comprados.
- No depender de publicidad como ingreso principal en MVP.

8. Crear:
   02_projects/universal-pos/wifi-rewards.md

Debe documentar:

Objetivo:
Permitir que un negocio entregue internet como recompensa por compra.

Ejemplos:
- Compra mínima $50 = 30 minutos WiFi.
- Compra mínima $100 = 1 hora WiFi.
- Compra mínima $200 = 1 GB.
- Cliente frecuente = cupón WiFi.

Arquitectura:
POS -> Rewards API -> Network Controller/SaTwi NOC -> MikroTik/Radius/Ubiquiti/OpenWISP

Reglas:
- El POS no administra red directamente.
- POS solicita emisión de voucher.
- Network Controller crea usuario, contraseña, QR, límite de tiempo, límite de datos y velocidad.
- El ticket puede imprimir QR o código.
- Deben existir límites contra abuso.

9. Crear:
   02_projects/universal-pos/tasks/mvp.md

Checklist MVP:
- [ ] Definir nombre comercial final.
- [ ] Definir si se llamará Universal POS o JobCron POS.
- [ ] Documentar UI mínima.
- [ ] Documentar permisos de cajero, supervisor, administrador.
- [ ] Documentar apertura/cierre de caja.
- [ ] Documentar ticket.
- [ ] Documentar integración SalesOrder.
- [ ] Documentar descuento de inventario.
- [ ] Documentar corte diario.
- [ ] Documentar feature flags por giro.
- [ ] Documentar límites de publicidad.
- [ ] Documentar recargas como integración futura.
- [ ] Documentar WiFi rewards como integración futura.
- [ ] Documentar dependencias con JobCron.
- [ ] Documentar dependencias con SaTwi/NOC.

10. Actualizar:
   03_standards/product/module-catalog.md

Agregar módulos:
- POS Universal | Commercial Module / Core ERP consumer | 02_projects/universal-pos | Pendiente/MVP
- POS Core Model | Core ERP | 01_core_erp/erp/08_pos_model.md | Documentado
- WiFi Rewards | Shared/Commercial Module | 02_projects/universal-pos/wifi-rewards.md | Pendiente
- Recharge Engine | Commercial Module / Integration pending | pendiente o 04_integrations cuando se defina proveedor | Pendiente
- Advertising Engine | Shared/Commercial Module | definir owner documental | Pendiente

11. Actualizar:
   _meta/active-work-index.md

Agregar ruta rápida:
Trabajar Universal POS:
- 02_projects/universal-pos/README.md
- architecture.md
- api-contracts.md
- database.md
- monetization.md
- wifi-rewards.md
- tasks/mvp.md
- 01_core_erp/erp/08_pos_model.md
- Core APIs relacionadas

12. Actualizar si aplica:
   02_projects/_ecosystem/api-version-matrix.md
   02_projects/_ecosystem/gateway-matrix.md

Agregar Universal POS como consumidor de Gateway/Core APIs si ya existe matriz vigente.

REGLAS IMPORTANTES

- No duplicar ERP.
- No crear un Sales paralelo.
- No crear inventario paralelo.
- No crear catálogo paralelo.
- No hacer que POS dependa directamente de SaTwi.
- WiFi Rewards debe ser integración desacoplada.
- Recargas deben quedar como módulo comercial/integración pendiente hasta definir proveedor.
- Publicidad debe ser opcional y no bloquear venta.
- Todo acceso debe usar Auth, permisos y FeatureAvailability.
- Todo módulo debe estar preparado para multi-empresa, multi-sucursal y multi-tenant.
- Documentar lo nuevo sin repetir lo que ya existe.

RESULTADO ESPERADO

Al terminar, entregar reporte con:
1. Archivos creados.
2. Archivos actualizados.
3. Decisiones documentadas.
4. APIs involucradas.
5. Módulos Core afectados.
6. Pendientes para desarrollo.
7. Riesgos de duplicación evitados.
8. Confirmación de que POS queda como producto sobre JobCron Core, no como ERP separado.
```

La base ya existe: `POS` está listado como módulo ERP y su responsabilidad actual es “venta física rápida y caja”, sin reemplazar `Sales` . Lo que falta es convertirlo en una documentación completa de producto comercial: **Universal POS / JobCron POS**.
