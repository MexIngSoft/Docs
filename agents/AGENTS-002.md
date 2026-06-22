Sí. La instrucción completa para Codex debe quedar así:

TAREA PARA CODEX — ESTANDARIZAR ARQUITECTURA DE PAGOS, POS, SALES Y FISCAL

REPOSITORIO:
[https://github.com/MexIngSoft/Docs.git](https://github.com/MexIngSoft/Docs.git)

OBJETIVO:
Documentar correctamente la arquitectura futura de pagos del ecosistema MexIngSof, evitando que Sales absorba responsabilidades técnicas de cobro que después obliguen a migraciones costosas.

LECTURA OBLIGATORIA:

1. Docs/README.md
2. Docs/_meta/active-work-index.md
3. Docs/03_standards/documentation-first-workflow.md
4. Docs/04_integrations/README.md
5. Docs/01_core_erp/apis/00_api_index.md
6. Docs/01_core_erp/apis/11_pos_api.md
7. Docs/01_core_erp/erp/08_pos_model.md
8. Docs/01_core_erp/erp/12_billing_returns.md

CONTEXTO DOCUMENTAL ACTUAL:

* Sales está ACTIVA y hoy contiene “cotización MVP, órdenes, pagos y estado comercial”.
* POS API está PENDIENTE_DE_DEFINIR.
* Billing API independiente está PENDIENTE_DE_DEFINIR.
* El índice indica que una API solo existe si tiene repositorio ejecutable, migraciones y contrato.
* Las integraciones externas no pertenecen al núcleo ERP; el núcleo define contratos internos y la integración transforma datos externos hacia esos contratos.

DECISIÓN ARQUITECTÓNICA:
Separar responsabilidades así:

Sales = verdad comercial.
Payments = verdad técnica y financiera del cobro.
POS = operación física de caja, tickets, sesiones y cortes.
Fiscal/Billing = verdad fiscal, CFDI, cancelaciones, notas de crédito y datos fiscales.
Accounting = contabilidad futura.

REGLA PRINCIPAL:
Ningún proyecto debe cobrar directamente contra Openpay, Mercado Pago, Clip, Stripe, BBVA, Banorte o Santander.

Todos deben solicitar cobros mediante contrato interno de Payments.

Payments API debe documentarse como:
PENDIENTE_DE_DISEÑO_PRIORITARIO

No marcar Payments API como ACTIVA hasta que exista:

1. Repositorio ejecutable.
2. Contrato OpenAPI o equivalente.
3. Persistencia/migraciones.
4. Seguridad.
5. Compose.
6. Pruebas aprobadas.
7. Webhooks validados.

DOCUMENTO NUEVO A CREAR:
Docs/01_core_erp/architecture/adr-payments-provider-strategy.md

CONTENIDO DEL ADR:

1. Sales no debe conservar el detalle técnico de pagos.
2. Sales solo puede conservar resumen comercial:

   * payment_status
   * total_paid
   * balance_due
   * payment_summary
   * last_payment_at
3. Payments debe conservar:

   * intentos de pago
   * transacciones
   * proveedor
   * terminal
   * autorizaciones
   * MSI
   * webhooks
   * reembolsos
   * conciliación
   * contracargos
4. POS no decide proveedor de pago.
5. POS no debe guardar webhooks crudos ni datos técnicos del adquirente.
6. POS crea ticket, solicita cobro y espera confirmación.
7. Billing/Fiscal no cobra.
8. Billing/Fiscal factura solo cuando existan datos fiscales completos.
9. Cobro aprobado no equivale automáticamente a CFDI emitido.
10. Integraciones externas viven en Docs/04_integrations.

ACTUALIZAR:
Docs/01_core_erp/apis/00_api_index.md

Agregar en capacidades derivadas:

Payments API | PENDIENTE_DE_DISEÑO_PRIORITARIO | Orquestación futura de pagos, proveedores, terminales, webhooks, MSI, reembolsos, contracargos y conciliación.

Agregar nota:
Sales conserva pagos solo como resumen comercial mientras Payments API no exista como servicio activo. No debe crecer como procesador técnico de pagos.

ACTUALIZAR:
Docs/01_core_erp/apis/11_pos_api.md

Modificar responsabilidad actual “Registrar pagos de mostrador” para aclarar:

* POS registra la intención operativa de pago.
* POS solicita cobro a Payments.
* POS marca ticket como pagado solo después de confirmación.
* POS conserva caja, ticket, sesión y corte.
* POS no integra proveedores externos directamente.

Endpoints sugeridos futuros:
POST /api/pos/tickets/{ticket_id}/payment-intents
POST /api/pos/tickets/{ticket_id}/confirm-payment
GET /api/pos/tickets/{ticket_id}/payment-status

No implementar si POS API aún no existe. Solo documentar como diseño futuro.

ACTUALIZAR:
Docs/01_core_erp/erp/08_pos_model.md

Agregar regla:
Una venta POS pagada debe terminar registrada en SalesOrder, pero el detalle técnico del cobro debe vivir en Payments.

Actualizar POSTicket:

* Id
* POSSessionId
* SalesOrderId
* TicketNumber
* Total
* PaymentStatus
* PaymentSummary
* Status

No agregar aquí:

* ProviderTransactionId
* AuthorizationCode
* TerminalId
* WebhookPayload
* RawProviderResponse
* ConciliationBatch

Eso pertenece a Payments.

Agregar flujo canónico POS:

1. Abrir sesión de caja.
2. Crear ticket.
3. Agregar productos.
4. Calcular precios con Pricing.
5. Validar inventario con Inventory.
6. Crear SalesOrder preliminar o vinculación comercial.
7. Solicitar PaymentIntent a Payments.
8. Payments envía cobro a proveedor/terminal.
9. Payments recibe webhook o consulta estado.
10. POS recibe confirmación.
11. POS marca ticket pagado.
12. Sales actualiza estado comercial.
13. Billing/Fiscal factura solo si aplica.

CREAR DISEÑO FUTURO:
Docs/01_core_erp/apis/payments_api_future.md

Estado:
PENDIENTE_DE_DISEÑO_PRIORITARIO

Responsabilidades:

1. Crear PaymentIntent.
2. Registrar PaymentTransaction.
3. Administrar proveedores.
4. Administrar terminales.
5. Recibir webhooks.
6. Normalizar estados.
7. Procesar reembolsos.
8. Registrar MSI.
9. Registrar contracargos.
10. Conciliar pagos.
11. Exponer resumen hacia Sales y POS.

Entidades:
PaymentProvider

* Id
* Code
* Name
* Type: WEB | TERMINAL | SPEI | QR | CASH | LINK
* Status
* SandboxEnabled
* CreatedAt

PaymentIntent

* Id
* SourceType: POS | WEB | LINK | QR | SPEI | SUBSCRIPTION
* SourceId
* CustomerId
* SalesOrderId
* Amount
* Currency
* ProviderCode
* ProviderOrderId
* Status
* RequestedAt
* ExpiresAt
* PaidAt
* CancelledAt
* FailureReason

PaymentTransaction

* Id
* PaymentIntentId
* ProviderTransactionId
* AuthorizationCode
* Amount
* Currency
* CardBrand
* Last4
* Installments
* MsiApplied
* Status
* RawProviderStatus
* CreatedAt

PaymentTerminal

* Id
* ProviderCode
* ExternalTerminalId
* BranchId
* CashRegisterId
* Status
* LastSyncAt

PaymentWebhook

* Id
* ProviderCode
* EventType
* ExternalEventId
* PaymentIntentId
* ReceivedAt
* ProcessedAt
* Status
* ErrorMessage
* PayloadHash

PaymentRefund

* Id
* PaymentTransactionId
* SalesOrderId
* Amount
* Reason
* ProviderRefundId
* Status
* RequestedAt
* CompletedAt

PaymentReconciliation

* Id
* ProviderCode
* PeriodStart
* PeriodEnd
* ExpectedAmount
* SettledAmount
* Difference
* Status

Estados estándar:
PAYMENT_CREATED
PAYMENT_PENDING
PAYMENT_REQUIRES_ACTION
PAYMENT_APPROVED
PAYMENT_REJECTED
PAYMENT_CANCELLED
PAYMENT_EXPIRED
PAYMENT_REFUNDED
PAYMENT_PARTIALLY_REFUNDED
PAYMENT_CHARGEBACK
PAYMENT_RECONCILED

ACTUALIZAR:
Docs/01_core_erp/erp/12_billing_returns.md

Agregar:

1. Un pago aprobado no equivale automáticamente a factura.
2. Billing/Fiscal requiere RFC, razón social, régimen fiscal, uso CFDI, código postal fiscal, método de pago y forma de pago.
3. Si hay reembolso con CFDI emitido, debe contemplarse cancelación, nota de crédito o procedimiento fiscal aplicable.
4. Devolución no debe modificar precio histórico de la venta.
5. Sales conserva relación comercial de devolución.
6. Payments conserva reembolso técnico.
7. Billing/Fiscal conserva efecto fiscal.

ACTUALIZAR:
Docs/04_integrations/README.md

Agregar:

* openpay
* mercado-pago-point
* clip
* stripe-terminal
* bbva-terminal-futuro

Regla:
La integración documenta proveedor externo, credenciales, endpoints, webhooks, límites y mapeos. No define el modelo interno del ERP.

CREAR:
Docs/04_integrations/openpay/README.md

Contenido:

* Proveedor recomendado inicial para pagos web.
* Uso: e-commerce, SaaS, MSI, tarjeta, SPEI, checkout profesional.
* No debe integrarse directamente en Refapart, DocuCore, LexNova, Fiscora, POS o ERP.
* Debe conectarse mediante Payments.
* Estado: PROVEEDOR_WEB_RECOMENDADO.
* Cuotas, comisiones y condiciones deben verificarse antes de producción.

CREAR:
Docs/04_integrations/mercado-pago-point/README.md

Contenido:

* Proveedor inicial recomendado para terminal física.
* Uso: Universal POS.
* Flujo:
  POS → Payments → Mercado Pago Point → terminal → confirmación → POS/Sales.
* Advertencia:
  La terminal conserva marca Mercado Pago. No es terminal personalizada MexIngSof.
* Deben probarse:
  aprobación, rechazo, cancelación, expiración, reembolso, pérdida de conexión y duplicidad de webhook.
* Estado: PROVEEDOR_TERMINAL_INICIAL.

CREAR:
Docs/04_integrations/clip/README.md

Contenido:

* Proveedor presencial futuro.
* No implementar hasta validar contrato, SDK/API, webhooks y compatibilidad con Universal POS.
* Estado: FUTURO_VALIDAR.

CREAR:
Docs/04_integrations/stripe-terminal/README.md

Contenido:

* Proveedor técnicamente fuerte para POS.
* No implementar hasta confirmar disponibilidad real de lectores físicos en México y condiciones comerciales.
* Estado: FUTURO_VALIDAR.

CREAR:
Docs/04_integrations/bbva-terminal-futuro/README.md

Contenido:

* No asumir integración abierta de terminal BBVA tradicional.
* Openpay puede cubrir pagos web, pero no garantiza terminal física personalizada.
* Terminal directa BBVA queda sujeta a contrato empresarial/adquirente.
* Estado: FUTURO_NEGOCIACION.

PROYECTOS AFECTADOS:
Refapart:

* Debe usar Payments para pagos web.
* No integrar Openpay directo.

Universal POS:

* Debe usar Payments para terminal física.
* No integrar Mercado Pago Point directo desde POS.

DocuCore:

* Debe usar Payments para pagos web y suscripciones futuras.

LexNova:

* Debe usar Payments para pagos web y suscripciones futuras.

Fiscora/Fiscal:

* No cobra.
* Solo factura o genera procesos fiscales.

JobCron:

* Debe administrar configuración futura de proveedores, disponibilidad por proyecto y feature flags.

saTwi:

* Debe usar Payments para pagos recurrentes, terminal o links futuros.

REGLAS DE NO DUPLICACIÓN:

1. No crear pagos por proyecto.
2. No meter lógica de Openpay dentro de Refapart.
3. No meter lógica de Mercado Pago Point dentro de POS.
4. No meter reembolsos técnicos dentro de Sales.
5. No meter webhooks dentro de POS.
6. No meter CFDI dentro de Payments.
7. No declarar Payments API como ACTIVA.
8. No duplicar responsabilidades ya existentes de Sales, POS o Fiscal.
9. No crear documentación paralela si ya existe documento canónico.
10. Si un documento ya contiene el tema, actualizarlo en lugar de crear otro.

CRITERIO DE CIERRE:

1. ADR creado.
2. Payments API Future creado.
3. API index actualizado.
4. POS API actualizado.
5. POS model actualizado.
6. Billing/returns actualizado.
7. Integrations README actualizado.
8. Integraciones de proveedores creadas.
9. Sin APIs activas ficticias.
10. Sin duplicación documental.
11. Reportar documentos revisados.
12. Reportar documentos modificados.
13. Reportar decisiones tomadas.
14. Reportar pendientes reales.
15. Dejar git status limpio si se hacen cambios.

La parte más importante es esta: **Sales puede guardar el resumen del pago, pero Payments debe nacer como frontera técnica desde el diseño**. Eso respeta el índice actual, donde Sales está activa pero las APIs nuevas solo deben activarse cuando tengan contrato, persistencia, seguridad, compose y pruebas aprobadas. ([raw.githubusercontent.com][1])

[1]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/apis/00_api_index.md "raw.githubusercontent.com"
