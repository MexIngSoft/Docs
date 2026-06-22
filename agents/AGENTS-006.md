# AGENTS-006 — Universal POS sobre JobCron Core

## Objetivo

Optimizar la documentación de Universal POS como producto comercial de punto de venta montado sobre JobCron ERP Core, sin convertirlo en ERP separado ni duplicar módulos Core existentes.

Debe conservar la decisión central: POS opera caja, tickets y venta física rápida; Sales sigue siendo el libro comercial final.

## Alcance

Puede tocar únicamente documentación relacionada con:

* POS Universal / JobCron POS.
* JobCron ERP Core como backend rector.
* Modelo POS Core.
* Gateway central.
* APIs Core consumidas por POS.
* Monetización POS.
* WiFi Rewards.
* Recargas como integración futura.
* Publicidad, promociones, cupones y fidelización POS.
* Feature flags por giro comercial.

Debe revisar:

* relación POS -> Sales;
* relación POS -> Inventory;
* relación POS -> Pricing;
* relación POS -> Billing;
* relación POS -> Customers / Addresses;
* relación POS -> Payments;
* relación POS -> Notifications;
* relación POS -> Rules Engine;
* relación POS -> FeatureAvailability;
* relación POS -> Rewards / WiFi / SaTwi NOC;
* relación POS -> Recargas;
* relación POS -> Advertising / Loyalty.

Debe entregar:

* documentos POS actualizados o creados;
* contratos preliminares documentados;
* entidades mínimas documentadas;
* dependencias Core aclaradas;
* riesgos de duplicación eliminados;
* actualización de `Docs/agents/EXECUTION_REPORT.md`.

## Lectura mínima obligatoria

Antes de modificar:

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/operations/standard-request-prompts.md`
* `Docs/03_standards/codex/codex-minimal-reading-standard.md`
* `Docs/03_standards/codex/codex-change-budget-standard.md`
* `Docs/03_standards/codex/codex-documentation-diff-standard.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`

Documentación canónica específica:

* `Docs/01_core_erp/erp/01_modules.md`
* `Docs/01_core_erp/erp/08_pos_model.md`
* `Docs/02_projects/jobcron/README.md`
* `Docs/03_standards/product/product-strategy.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/03_standards/architecture/api-gateway-standard.md`
* `Docs/03_standards/gateway/central-gateway-standard.md`
* `Docs/03_standards/operations/module-lifecycle-and-feature-flags.md`
* `Docs/02_projects/_ecosystem/api-version-matrix.md`
* `Docs/02_projects/_ecosystem/gateway-matrix.md`

No leer todo `Docs`.

No usar `_archive/` ni `agents/_archive/` como fuente vigente salvo trazabilidad.

## Fuera de alcance

* No ejecutar otros agents.
* No implementar código.
* No crear APIs nuevas sin contrato.
* No crear Gateway/BFF por proyecto.
* No crear Auth por proyecto.
* No crear Docker por proyecto.
* No crear schemas, modelos o migraciones sin decisión documentada.
* No modificar `main` ni `pro`.
* No leer todo el repositorio.
* No tocar proyectos no relacionados.
* No convertir POS en ERP separado.
* No crear Sales paralelo.
* No crear Inventory paralelo.
* No crear Pricing paralelo.
* No crear Catalog paralelo.
* No hacer que POS administre proveedores.
* No hacer que POS administre red directamente.
* No hacer que publicidad interrumpa el cobro.
* No declarar recargas como activas si no existe proveedor definido.
* No declarar WiFi Rewards como productivo si no existe contrato con Network Controller / SaTwi NOC.

## Decisión arquitectónica obligatoria

Documentar y conservar:

* JobCron ERP Core es el cerebro.
* Universal POS / JobCron POS es la cara operativa para caja, ventas rápidas, tickets, cortes y operación diaria.
* POS no reemplaza Sales.
* POS no guarda catálogo propio.
* POS no administra proveedores.
* POS no define reglas comerciales por sí solo.
* POS consume Core APIs mediante Gateway central.
* POS puede venderse como producto comercial visible al cliente.
* JobCron puede permanecer como nombre interno/administrativo.
* La marca pública puede ser `Universal POS`, `JobCron POS` o nombre comercial equivalente, pero debe quedar documentado como producto consumidor de JobCron Core.
* Una venta pagada en POS debe terminar registrada en `SalesOrder`.
* El ticket POS es comprobante operativo, no reemplaza la orden comercial.
* POS debe soportar caja, sesión de cajero, apertura/cierre, devoluciones, cancelaciones, arqueo y métodos de pago.
* Todo módulo debe quedar preparado para multi-empresa, multi-sucursal y multi-tenant.

## Tareas

1. Actualizar `Docs/01_core_erp/erp/08_pos_model.md`.

   Debe agregar o reforzar:

   * POS como capa operativa.
   * Relación POS -> Sales.
   * Relación POS -> Inventory.
   * Relación POS -> Pricing.
   * Relación POS -> Billing.
   * Relación POS -> Customers / Addresses.
   * Relación POS -> Payments.
   * Relación POS -> Notifications.
   * Relación POS -> Rules Engine.
   * Relación POS -> Advertising / Loyalty.
   * Relación POS -> Network Rewards / WiFi.
   * Límites del módulo POS.

2. Crear o actualizar `Docs/01_core_erp/erp/25_pos_universal_strategy.md`.

   Debe documentar:

   * objetivo del POS reutilizable;
   * POS como producto comercial/operativo;
   * POS UI;
   * POS API/BFF solo si aplica;
   * consumo de ERP Core APIs;
   * módulos comerciales;
   * integración futura Network Rewards;
   * tipos de negocio activables por feature flags:

     * retail;
     * restaurante;
     * cafetería;
     * cyber café;
     * refaccionaria;
     * electrónica;
     * servicio técnico;
     * multi-sucursal.

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
   * creación automática de voucher WiFi;
   * límite por tiempo/MB;
   * integración MikroTik / Radius / Ubiquiti / OpenWISP si aplica;
   * marketplace de promociones;
   * analítica comercial;
   * campañas WhatsApp / SMS / email.

3. Crear o actualizar `Docs/02_projects/universal-pos/README.md`.

   Debe documentar:

   * rol del producto;
   * cara al cliente;
   * relación con JobCron;
   * qué gobierna JobCron;
   * qué opera Universal POS;
   * diferenciador comercial;
   * modelos de negocio:

     * freemium con publicidad opcional;
     * suscripción sin publicidad;
     * comisión por recargas;
     * pago por módulo avanzado;
     * plan restaurante;
     * plan retail;
     * plan cyber/hotspot;
     * plan multi-sucursal;
     * enterprise con permisos, auditoría o SLA.

4. Crear o actualizar `Docs/02_projects/universal-pos/architecture.md`.

   Debe documentar:

   Frontend:

   * Next.js;
   * UI de caja rápida;
   * modo responsive/tablet;
   * navegación mínima.

   Backend:

   * Gateway central obligatorio;
   * no conectar frontend directo a Core APIs;
   * POS API solo como capa operativa si existe lógica exclusiva.

   Core APIs consumidas:

   * Auth API;
   * Catalog API;
   * Pricing API;
   * Inventory API;
   * Sales API;
   * Billing API;
   * Customers / Addresses API;
   * Payments API;
   * Notifications API;
   * Rules Engine;
   * FeatureAvailability.

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

5. Crear o actualizar `Docs/02_projects/universal-pos/api-contracts.md`.

   Debe incluir contratos preliminares:

   * `POST /pos/sessions/open`
   * `POST /pos/sessions/close`
   * `GET /pos/products/search`
   * `POST /pos/tickets`
   * `POST /pos/tickets/{id}/pay`
   * `POST /pos/tickets/{id}/cancel`
   * `POST /pos/tickets/{id}/refund`
   * `GET /pos/reports/daily-close`
   * `POST /pos/rewards/coupon`
   * `POST /pos/rewards/wifi-voucher`
   * `POST /pos/recharges/create`

   Aclarar:

   * estos endpoints no duplican Sales, Inventory ni Pricing;
   * solo orquestan operación rápida usando Core APIs;
   * cualquier API especializada requiere contrato y decisión documentada.

6. Crear o actualizar `Docs/02_projects/universal-pos/database.md`.

   Entidades mínimas:

   * `CashRegister`
   * `POSSession`
   * `POSTicket`
   * `POSTicketLine`
   * `POSPayment`
   * `POSCashMovement`
   * `POSRefund`
   * `POSPromotionApplied`
   * `POSRewardIssued`
   * `POSRechargeTransaction`
   * `POSWifiVoucher`

   Regla:

   * documentar tablas públicas en PascalCase estilo SQL Server si se publican.

7. Crear o actualizar `Docs/02_projects/universal-pos/monetization.md`.

   Debe documentar:

   Planes:

   * gratis con publicidad opcional;
   * básico;
   * pro;
   * restaurante;
   * hotspot/cyber;
   * multi-sucursal.

   Ingresos:

   * suscripción;
   * comisión por recargas;
   * comisión por pago de servicios;
   * publicidad local;
   * cupones patrocinados;
   * módulos premium;
   * soporte / instalación.

   Reglas:

   * la publicidad no debe interrumpir el cobro;
   * la publicidad recompensada debe ser opcional;
   * los créditos promocionales deben separarse de créditos comprados;
   * no depender de publicidad como ingreso principal en MVP.

8. Crear o actualizar `Docs/02_projects/universal-pos/wifi-rewards.md`.

   Debe documentar:

   Objetivo:

   * permitir que un negocio entregue internet como recompensa por compra.

   Ejemplos:

   * compra mínima $50 = 30 minutos WiFi;
   * compra mínima $100 = 1 hora WiFi;
   * compra mínima $200 = 1 GB;
   * cliente frecuente = cupón WiFi.

   Arquitectura:

   `POS -> Rewards API -> Network Controller / SaTwi NOC -> MikroTik / Radius / Ubiquiti / OpenWISP`

   Reglas:

   * POS no administra red directamente;
   * POS solicita emisión de voucher;
   * Network Controller crea usuario, contraseña, QR, límite de tiempo, límite de datos y velocidad;
   * el ticket puede imprimir QR o código;
   * deben existir límites contra abuso.

9. Crear o actualizar `Docs/02_projects/universal-pos/tasks/mvp.md`.

   Checklist obligatorio:

   * [ ] Definir nombre comercial final.
   * [ ] Definir si se llamará Universal POS o JobCron POS.
   * [ ] Documentar UI mínima.
   * [ ] Documentar permisos de cajero, supervisor y administrador.
   * [ ] Documentar apertura/cierre de caja.
   * [ ] Documentar ticket.
   * [ ] Documentar integración SalesOrder.
   * [ ] Documentar descuento de inventario.
   * [ ] Documentar corte diario.
   * [ ] Documentar feature flags por giro.
   * [ ] Documentar límites de publicidad.
   * [ ] Documentar recargas como integración futura.
   * [ ] Documentar WiFi rewards como integración futura.
   * [ ] Documentar dependencias con JobCron.
   * [ ] Documentar dependencias con SaTwi/NOC.

10. Actualizar `Docs/03_standards/product/module-catalog.md`.

Agregar o ajustar módulos:

* POS Universal | Commercial Module / Core ERP consumer | `02_projects/universal-pos` | Pendiente/MVP
* POS Core Model | Core ERP | `01_core_erp/erp/08_pos_model.md` | Documentado
* WiFi Rewards | Shared/Commercial Module | `02_projects/universal-pos/wifi-rewards.md` | Pendiente
* Recharge Engine | Commercial Module / Integration pending | `04_integrations` cuando se defina proveedor | Pendiente
* Advertising Engine | Shared/Commercial Module | owner documental pendiente | Pendiente

11. Actualizar `Docs/_meta/active-work-index.md`.

Agregar ruta rápida para trabajar Universal POS:

* `02_projects/universal-pos/README.md`
* `02_projects/universal-pos/architecture.md`
* `02_projects/universal-pos/api-contracts.md`
* `02_projects/universal-pos/database.md`
* `02_projects/universal-pos/monetization.md`
* `02_projects/universal-pos/wifi-rewards.md`
* `02_projects/universal-pos/tasks/mvp.md`
* `01_core_erp/erp/08_pos_model.md`
* Core APIs relacionadas.

12. Actualizar solo si aplica:

* `Docs/02_projects/_ecosystem/api-version-matrix.md`
* `Docs/02_projects/_ecosystem/gateway-matrix.md`

Agregar Universal POS como consumidor de Gateway/Core APIs solo si ya queda documentado como proyecto activo o MVP.

## Validaciones

Ejecutar o registrar por qué no se pudo ejecutar:

* validación de rutas y enlaces modificados;
* validación de documentos creados;
* búsqueda local para confirmar que no se duplicó Sales, Inventory, Pricing o Catalog;
* búsqueda local para confirmar que POS no quedó como ERP separado;
* validación documental conforme a `codex-documentation-diff-standard.md`;
* `git diff --check`;
* script documental disponible si existe, por ejemplo:

  * `python scripts/validate_frontmatter.py`
  * `python scripts/build_master_index.py`
  * `validate-docs-rules.sh`

No declarar validaciones como ejecutadas si no corrieron.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Debe registrar:

* agent revisado;
* Context Pack usado;
* documentos leídos;
* documentos fuera de alcance;
* cambios realizados;
* archivos creados;
* archivos actualizados;
* APIs reutilizadas;
* APIs no creadas y motivo;
* módulos Core afectados;
* validaciones ejecutadas;
* resultado de validaciones;
* pendientes reales;
* bloqueos;
* decisiones documentales;
* riesgos de duplicación evitados;
* confirmación de que POS queda como producto sobre JobCron Core, no como ERP separado.

## Criterio de cierre

El agent queda listo solo si:

* la instrucción es ejecutable;
* no duplica reglas globales;
* tiene lectura mínima;
* tiene alcance claro;
* tiene tareas verificables;
* indica qué queda fuera;
* define validaciones;
* define dónde reportar;
* conserva toda la decisión arquitectónica del POS;
* no convierte POS en ERP separado;
* no crea APIs sin contrato;
* no deja Sales, Inventory, Pricing o Catalog duplicados;
* documenta Universal POS como producto comercial sobre JobCron Core;
* registra pendientes reales y bloqueos.

## Reglas finales

Si falta información esencial, marcar `Bloqueado` y dejar preguntas concretas.

No eliminar, mover ni renombrar `Docs/agents/AGENTS-006.md`.

No vaciar el agent como parte de esta tarea.

No ejecutar el agent.

No ejecutar otros agents.

No limpiar contenido histórico sin conservar la información vigente.

Esta tarea es solo optimizar la instrucción de `AGENTS-006.md`, no implementar el POS.
