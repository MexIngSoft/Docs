Confirmo lectura de la documentación del repo `MexIngSoft/Docs` en rama `general`.

La documentación ya reconoce que JobCron es el **ERP central del ecosistema** y que debe orquestar ventas, inventario, logística, pagos, analítica, reglas y operación . También confirma que las APIs compartidas actuales son Auth, Gateway, Catalog, Inventory, Pricing, Procurement, Sales, Supplier, Document, Fiscal y Address . El problema real es que faltan varios módulos base para que el ERP sea cotidiano y comercialmente usable.

## Diagnóstico principal

Sí faltan módulos indispensables. La propia auditoría de JobCron ya detecta como faltantes: **Customer API, CRM/Lead, Quote, Payment, Billing, Notification, Logistics, Rules Engine, Projects, Subscription/Credit, Observability y Event API** .

Además, la documentación advierte un riesgo muy importante: no se deben resolver clientes, pagos, facturación, notificaciones o logística dentro de APIs de proyecto como Refapart o TecnoTelec, porque eso duplicaría datos y rompería el ERP .

# Módulos ERP faltantes por prioridad

## Corto plazo: indispensables para vender y operar

### 1. Customer / Clientes / CRM base

**Debe ser API propia:** `API.PY.DJANGO.Customer`

No debe vivir dentro de Sales. Sales puede usar clientes, pero no debe ser dueño de clientes.

**Qué hace**

* Registro de clientes personas físicas.
* Registro de empresas.
* Contactos por cliente.
* Teléfonos, correos y WhatsApp.
* Direcciones conectadas a Address API.
* Datos fiscales conectados a Fiscal/Billing.
* Historial de compras, cotizaciones y solicitudes.
* Segmentos: cliente final, empresa, proveedor-cliente, prospecto.
* Estado comercial: lead, prospecto, cliente activo, inactivo, bloqueado.

**Por qué es indispensable**
Refapart necesita saber quién solicita piezas. TecnoTelec necesita clientes para cotizaciones. POS necesita clientes para tickets/facturas. Billing necesita receptor. Support necesita historial del cliente.

**Base de datos recomendada**
Base: `comercial`
Schema: `Customer`
Usuario: `comercial_user`

Esto respeta la regla actual: las APIs comerciales compartidas viven en la base `comercial` con usuario `comercial_user` .

**Tablas iniciales**

* `Customer.Customers`
* `Customer.CustomerContacts`
* `Customer.CustomerAddresses`
* `Customer.CustomerFiscalProfiles`
* `Customer.CustomerSegments`
* `Customer.CustomerNotes`
* `Customer.CustomerMergeHistory`
* `Customer.CustomerSourceLinks`

**Depende de**

* Auth: quién creó o modificó.
* Address: direcciones.
* Fiscal/Billing: datos fiscales.
* Sales: ventas y cotizaciones.
* Notification: avisos.
* Search: búsqueda de clientes.

---

### 2. Company / Tenant / Branches

**Debe ser módulo core del ERP, probablemente dentro de JobCron o API propia:** `Organization API`

**Qué hace**

* Empresas internas del ecosistema.
* Sucursales.
* Marcas/proyectos.
* Unidades de negocio.
* Configuración por empresa.
* Relación empresa → módulos habilitados.
* Relación empresa → usuarios/empleados.
* Relación empresa → almacenes/cajas/facturación.

**Por qué es indispensable**
Sin esto no hay multiempresa real. La documentación marca multiempresa/multiproyecto como necesidad básica de JobCron .

**Base recomendada**
Base: `jobcron` si se usa como configuración administrativa central.
Schema: `Organization` o `JobCron`.

**Tablas**

* `Organization.Companies`
* `Organization.Branches`
* `Organization.BusinessUnits`
* `Organization.Applications`
* `Organization.CompanyModules`
* `Organization.CompanyUsers`
* `Organization.CompanySettings`

**Depende de**

* Auth.
* FeatureAvailability.
* Gateway.
* Todas las APIs comerciales.

---

### 3. Payment / Pagos

**Debe ser API propia:** `API.PY.DJANGO.Payment`

No debe quedar dentro de Sales. La auditoría dice explícitamente que Sales no debe sustituir Payment .

**Qué hace**

* Registro de transacciones.
* Pagos en efectivo.
* Transferencias.
* Tarjeta.
* Mercado Pago / BBVA / pasarela futura.
* Reembolsos.
* Conciliación.
* Estados: pendiente, autorizado, pagado, rechazado, cancelado, reembolsado.
* Relación con órdenes, facturas, POS y checkout.

**Base**
Base: `comercial`
Schema: `Payment`

**Tablas**

* `Payment.PaymentIntents`
* `Payment.PaymentTransactions`
* `Payment.PaymentMethods`
* `Payment.PaymentProviders`
* `Payment.Refunds`
* `Payment.PaymentAllocations`
* `Payment.PaymentWebhookEvents`
* `Payment.ReconciliationBatches`

**Depende de**

* Sales: orden a pagar.
* Billing: factura/cargo.
* Customer: quién paga.
* Notification: confirmaciones.
* Gateway: pago desde frontend.
* Event API: webhooks y eventos.

---

### 4. Billing / Facturación comercial

**Debe ser API propia:** `API.PY.DJANGO.Billing`

No debe confundirse con Fiscal. La auditoría dice que Fiscal no sustituye Billing .

**Qué hace**

* Cargos comerciales.
* Facturas internas.
* Notas de crédito.
* Relación factura ↔ venta ↔ pago.
* Estados de cobro.
* Timbrado vía Fiscal cuando aplique.
* CFDI comercial cuando se conecte a Fiscal.
* Facturación recurrente para SaaS.

**Base**
Base: `comercial`
Schema: `Billing`

**Tablas**

* `Billing.Invoices`
* `Billing.InvoiceLines`
* `Billing.Charges`
* `Billing.CreditNotes`
* `Billing.BillingProfiles`
* `Billing.InvoicePaymentLinks`
* `Billing.BillingEvents`

**Depende de**

* Customer.
* Sales.
* Payment.
* Fiscal.
* Document.
* Notification.

---

### 5. Notification / Notificaciones

**Debe ser API propia:** `API.PY.DJANGO.Notification`

**Qué hace**

* Correos.
* WhatsApp futuro.
* SMS futuro.
* Plantillas.
* Logs de envío.
* Reintentos.
* Notificaciones internas.
* Notificaciones por evento: pedido creado, pago recibido, cotización enviada, cuenta activada.

**Base**
Base: `comercial` o base propia si crece mucho. Para MVP: `comercial`.
Schema: `Notification`

**Tablas**

* `Notification.Templates`
* `Notification.Messages`
* `Notification.MessageDeliveries`
* `Notification.NotificationPreferences`
* `Notification.NotificationEvents`
* `Notification.DeliveryAttempts`

**Depende de**

* Event API.
* Auth.
* Customer.
* Sales.
* Billing.
* Refapart/TecnoTelec/LexNova/Fiscora.

---

### 6. Event API / Eventos internos

**Debe ser API o módulo transversal:** `API.PY.DJANGO.Event`

**Qué hace**

* Publicar eventos entre APIs.
* Reintentos.
* Idempotencia.
* Backfill.
* Sincronización con Search.
* Webhooks internos.
* Auditoría de eventos.

**Por qué es importante**
La documentación dice que Search debe tratarse como índice derivado y reconstruible, no fuente primaria .

**Base**
Base: `comercial` para eventos comerciales o `jobcron` si será orquestación central. Recomiendo empezar en `jobcron`.
Schema: `Event`

**Tablas**

* `Event.OutboxEvents`
* `Event.InboxEvents`
* `Event.EventConsumers`
* `Event.EventFailures`
* `Event.EventRetries`
* `Event.WebhookSubscriptions`

---

## Mediano plazo: operación empresarial real

### 7. HR / Employees / Empleados

**Debe ser API propia:** `API.PY.DJANGO.HR`

No debe ir en Auth. Auth identifica usuarios, pero HR administra empleados. Tampoco debe ir en Billing.

**Qué hace**

* Expediente de empleados.
* Puestos.
* Departamentos.
* Sucursales.
* Contratos laborales.
* Documentos laborales.
* Contactos de emergencia.
* Estado: activo, baja, suspendido, temporal.
* Relación empleado ↔ usuario Auth.

**Base**
Recomendación: base `jobcron`, porque es operación interna del ERP.
Schema: `HR`

**Tablas**

* `HR.Employees`
* `HR.EmployeeProfiles`
* `HR.Departments`
* `HR.Positions`
* `HR.EmployeeContracts`
* `HR.EmployeeDocuments`
* `HR.EmployeeEmergencyContacts`
* `HR.EmployeeBranchAssignments`
* `HR.EmployeeUserLinks`

**Depende de**

* Auth.
* Organization.
* Document.
* Payroll.
* Attendance.
* Permissions.

---

### 8. Payroll / Nómina

**Debe ser API propia o submódulo fuerte de HR:** `API.PY.DJANGO.Payroll`

Mi recomendación: API propia cuando empiece CFDI nómina o cálculos reales. Para MVP puede documentarse como módulo futuro dependiente de HR.

**No debe ir en Billing.** Billing factura ventas/cobros. Nómina paga empleados. Fiscal puede timbrar CFDI de nómina, pero no calcula nómina.

**Qué hace**

* Periodos de nómina.
* Sueldos.
* Percepciones.
* Deducciones.
* Incidencias.
* Préstamos.
* Recibos.
* CFDI nómina vía Fiscal.
* Historial de pagos.

**Base**
Base: `jobcron`
Schema: `Payroll`

**Tablas**

* `Payroll.PayrollPeriods`
* `Payroll.EmployeeSalaries`
* `Payroll.PayrollRuns`
* `Payroll.PayrollRunItems`
* `Payroll.Earnings`
* `Payroll.Deductions`
* `Payroll.PayrollReceipts`
* `Payroll.PayrollCfdiLinks`
* `Payroll.EmployeeLoans`

**Depende de**

* HR.
* Fiscal.
* Payment o Cash/Banking.
* Document.
* Notification.

---

### 9. Attendance / Asistencia

**Puede ser submódulo de HR al inicio.**

**Qué hace**

* Entradas/salidas.
* Retardos.
* Faltas.
* Horarios.
* Turnos.
* Incidencias.
* Vacaciones.
* Permisos.

**Base**
Base: `jobcron`
Schema: `HR` o `Attendance`

**Tablas**

* `HR.AttendanceLogs`
* `HR.WorkSchedules`
* `HR.Shifts`
* `HR.LeaveRequests`
* `HR.Absences`
* `HR.Incidents`

---

### 10. Accounting / Contabilidad

**Debe ser API propia:** `API.PY.DJANGO.Accounting`

**Qué hace**

* Catálogo de cuentas.
* Pólizas.
* Asientos contables.
* Centros de costo.
* Cuentas por cobrar.
* Cuentas por pagar.
* Cierre contable.
* Reportes financieros.

**Base**
Base: `comercial` si será contabilidad comercial multiempresa.
Schema: `Accounting`

**Tablas**

* `Accounting.ChartOfAccounts`
* `Accounting.JournalEntries`
* `Accounting.JournalEntryLines`
* `Accounting.CostCenters`
* `Accounting.AccountingPeriods`
* `Accounting.AccountsReceivable`
* `Accounting.AccountsPayable`

**Depende de**

* Billing.
* Payment.
* Payroll.
* Procurement.
* Sales.
* Fiscal.

---

### 11. Cash / Banking / Caja y bancos

**Debe ser API propia o módulo de Payment al inicio.**

**Qué hace**

* Cajas.
* Cortes.
* Bancos.
* Movimientos.
* Conciliación.
* Depósitos.
* Retiros.
* Flujo de efectivo.

**Base**
Base: `comercial`
Schema: `Cash`

**Tablas**

* `Cash.CashRegisters`
* `Cash.CashSessions`
* `Cash.CashMovements`
* `Cash.BankAccounts`
* `Cash.BankMovements`
* `Cash.Reconciliations`

**Depende de**

* Payment.
* POS.
* Accounting.
* Billing.

---

### 12. Support / Tickets

**Debe ser API propia:** `API.PY.DJANGO.Support`

**Qué hace**

* Tickets de soporte.
* Garantías.
* Seguimiento postventa.
* Incidencias internas.
* SLA.
* Comentarios.
* Adjuntos.
* Relación con cliente, venta, producto o pedido.

**Base**
Base: `comercial`
Schema: `Support`

**Tablas**

* `Support.Tickets`
* `Support.TicketMessages`
* `Support.TicketAttachments`
* `Support.TicketStatuses`
* `Support.ServiceLevelAgreements`
* `Support.WarrantyClaims`

**Depende de**

* Customer.
* Sales.
* Document.
* Notification.
* HR/Employee para asignación interna.

---

## Largo plazo: madurez ERP

### 13. Assets / Activos fijos

**API propia futura:** `API.PY.DJANGO.Asset`

**Qué hace**

* Equipos de la empresa.
* Herramientas.
* Vehículos.
* Asignación a empleados.
* Depreciación.
* Mantenimiento.
* Historial.

**Base**
Base: `jobcron`
Schema: `Asset`

---

### 14. Work Orders / Ordenes de trabajo

**Puede ser Projects API o API propia según alcance.**

La documentación ya marca `Projects API` como faltante de alta prioridad para TecnoTelec y servicios consultivos .

**Qué hace**

* Servicios.
* Instalaciones.
* Reparaciones.
* Tareas técnicas.
* Mano de obra.
* Materiales usados.
* Evidencia.
* Cierre y firma.

**Base**
Base: `comercial`
Schema: `Projects` o `WorkOrder`

---

### 15. POS / Punto de venta

La documentación lo tiene como pendiente de baja prioridad en Core ERP , pero para Universal POS debe subir a prioridad media/alta.

**Qué hace**

* Venta mostrador.
* Ticket.
* Caja.
* Corte.
* Devoluciones.
* Cliente opcional.
* Facturación posterior.
* Inventario en tiempo real.

**Base**
Base: `comercial`
Schema: `POS`

**Depende de**

* Catalog.
* Inventory.
* Pricing.
* Sales.
* Payment.
* Cash.
* Billing.
* Customer.

---

# Bases de datos recomendadas

La documentación actual permite estas bases oficiales: `auth`, `comercial`, `jobcron`, `lexnova` y `postgres`; además prohíbe crear bases, usuarios o schemas definitivos sin contrato canónico .

## Distribución recomendada

| Base        | Uso                                                                                                             |
| ----------- | --------------------------------------------------------------------------------------------------------------- |
| `auth`      | Auth, usuarios, roles, permisos, sesiones.                                                                      |
| `comercial` | Customer, Sales, Billing, Payment, Catalog, Inventory, Supplier, Procurement, Pricing, POS, Support, Logistics. |
| `jobcron`   | JobCron, Organization, HR, Payroll, FeatureAvailability, Event, Observability.                                  |
| `lexnova`   | Solo dominio legal LexNova.                                                                                     |
| `postgres`  | Solo administración local, no negocio.                                                                          |

# APIs que hay que crear

## Crear en corto plazo

1. `API.PY.DJANGO.Customer`
2. `API.PY.DJANGO.Payment`
3. `API.PY.DJANGO.Billing`
4. `API.PY.DJANGO.Notification`
5. `API.PY.DJANGO.Event`
6. `API.PY.DJANGO.Organization` o módulo dentro de JobCron

## Crear en mediano plazo

7. `API.PY.DJANGO.HR`
8. `API.PY.DJANGO.Payroll`
9. `API.PY.DJANGO.Accounting`
10. `API.PY.DJANGO.Cash`
11. `API.PY.DJANGO.Support`
12. `API.PY.DJANGO.Logistics`
13. `API.PY.DJANGO.Rules`

## Crear en largo plazo

14. `API.PY.DJANGO.Asset`
15. `API.PY.DJANGO.WorkOrder` o `API.PY.DJANGO.Projects`
16. `API.PY.DJANGO.POS`
17. `API.PY.DJANGO.Reporting`

# Qué depende del ERP y qué puede ser proyecto nuevo

## Debe ser Core ERP / Shared API

Estos no deben ser proyectos independientes comerciales al inicio:

* Customer
* Payment
* Billing
* Notification
* Event
* HR
* Payroll
* Accounting
* Cash
* Logistics
* Rules
* POS
* Support

Porque son capacidades reutilizables por varias marcas.

## Puede ser proyecto/producto nuevo

Solo si tiene marca, UI, monetización y flujo propio:

* JobCron como SaaS ERP.
* Universal POS como producto comercial, pero usando POS API core.
* Fiscora como producto fiscal, usando Fiscal/Billing/Document.
* DocuCore como producto documental, usando Document API.
* Refapart como marketplace/refacciones, usando Customer/Sales/Payment/Billing/Logistics.
* TecnoTelec como proyecto comercial, usando Customer/Quote/Projects/Sales.

# Orden de implementación recomendado

## Fase 1: cerrar base comercial mínima

1. Customer API.
2. Organization/Tenant.
3. Payment API.
4. Billing API.
5. Notification API.
6. Event API básico.
7. Gateway routes para esas APIs.
8. Permisos Auth por módulo.
9. Matriz UI endpoint.

## Fase 2: operación interna

1. HR API.
2. Employees.
3. Attendance básico.
4. Payroll documental.
5. Payroll cálculo MVP.
6. Fiscal CFDI nómina después.

## Fase 3: finanzas y control

1. Accounting.
2. Cash/Banking.
3. Conciliación.
4. Reportes.
5. Observability.

## Fase 4: operación avanzada

1. Support.
2. Work Orders.
3. Assets.
4. POS.
5. Logistics completo.
6. Rules Engine avanzado.

# Documentos que deben modificarse

1. `03_standards/product/module-catalog.md`
   Agregar todos los módulos faltantes.

2. `01_core_erp/apis/00_api_index.md`
   Mover Customer, Payment, Billing, Notification, Event, HR, Payroll y Accounting a pendientes formales o compartidas si se crean.

3. `01_core_erp/apis/reusable-api-contracts.md`
   Agregar responsabilidades y fronteras.

4. `00_audit/reusable-api-map.md`
   Separar Customer de Sales.

5. `01_core_erp/apis/api-decision-matrix.md`
   Agregar reglas:

   * Clientes → Customer API.
   * Empleados → HR API.
   * Nómina → Payroll API.
   * Facturación comercial → Billing API.
   * CFDI/SAT → Fiscal API.
   * Pagos → Payment API.
   * Caja → Cash API.

6. `03_standards/database/postgresql-project-users-and-schemas.md`
   Agregar schemas propuestos sin crearlos todavía como definitivos.

7. Crear nuevos documentos:

   * `01_core_erp/erp/25_customer_crm.md`
   * `01_core_erp/erp/26_payment.md`
   * `01_core_erp/erp/27_billing.md`
   * `01_core_erp/erp/28_hr_employees.md`
   * `01_core_erp/erp/29_payroll.md`
   * `01_core_erp/erp/30_accounting.md`
   * `01_core_erp/erp/31_cash_banking.md`
   * `01_core_erp/erp/32_support.md`
   * `01_core_erp/erp/33_event_bus.md`

# Decisión final

Tu intuición es correcta: **Customer, Employees y Payroll son módulos indispensables**.

La separación correcta sería:

* **Customer**: API propia.
* **Employees**: HR API propia.
* **Payroll/Nómina**: API propia o submódulo de HR al inicio, pero separada de Billing.
* **Billing**: facturación comercial.
* **Fiscal**: SAT/CFDI/timbrado/catálogos fiscales.
* **Payment**: transacciones y pasarelas.
* **Sales**: ventas, órdenes y cotizaciones, no clientes ni pagos completos.

Esto convierte JobCron en un ERP real y evita que Refapart, TecnoTelec, POS o Fiscora inventen datos duplicados.
