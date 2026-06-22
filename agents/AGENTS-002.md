Trabaja únicamente en la rama `dev`.

Optimiza exclusivamente:

`Docs/agents/AGENTS-002.md`

No ejecutes este agent.
No ejecutes otros agents.
No modifiques otros `AGENTS-*.md`.
No borres, muevas ni renombres `Docs/agents/AGENTS-002.md`.
No limpies el contenido del agent; esta tarea solo consiste en optimizar su instrucción conservando toda la información vigente.

# AGENTS-002 — Arquitectura Payments, POS, Sales y Fiscal

## Objetivo

Reescribir `Docs/agents/AGENTS-002.md` para que documente de forma más clara, concisa y ejecutable la separación futura entre Sales, Payments, POS, Fiscal/Billing, Accounting e integraciones de pago, sin perder ninguna decisión ya contenida en el agent actual.

El resultado debe mantener toda la intención original: evitar que Sales, POS, Refapart, DocuCore, LexNova, Fiscora, JobCron o saTwi integren directamente proveedores de pago.

## Alcance

Puedes modificar únicamente:

* `Docs/agents/AGENTS-002.md`
* `Docs/agents/EXECUTION_REPORT.md`, solo para registrar esta optimización

Debes revisar:

* La documentación base obligatoria
* El agent actual completo
* El índice activo
* La documentación canónica relacionada con Core ERP, POS, Sales, Fiscal/Billing e integraciones

Debes dejar:

* Un `AGENTS-002.md` más corto, ordenado, ejecutable y verificable
* Una instrucción que conserve todas las decisiones actuales
* Un reporte en `EXECUTION_REPORT.md` con documentos leídos, cambios, validaciones, pendientes y bloqueos

## Lectura mínima obligatoria

Leer antes de editar:

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/operations/standard-request-prompts.md`
* `Docs/03_standards/codex/codex-minimal-reading-standard.md`
* `Docs/03_standards/codex/codex-change-budget-standard.md`
* `Docs/03_standards/codex/codex-documentation-diff-standard.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`

Después, por tratarse de arquitectura de pagos, POS, Sales, Fiscal/Billing e integraciones, leer solo estos documentos canónicos:

* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/01_core_erp/apis/11_pos_api.md`
* `Docs/01_core_erp/erp/08_pos_model.md`
* `Docs/01_core_erp/erp/12_billing_returns.md`
* `Docs/04_integrations/README.md`

No leer todo `Docs`.

## Context Pack

Usar el Context Pack mínimo correspondiente a:

* Core ERP
* APIs reutilizables
* POS
* Sales
* Fiscal/Billing
* Integraciones externas
* Agents

Si se requiere leer otro documento, justificarlo en `EXECUTION_REPORT.md` antes de usarlo como fuente.

## Fuera de alcance

No ejecutar `AGENTS-002.md`.

No ejecutar otros agents.

No implementar código.

No crear APIs reales.

No crear repositorios.

No crear migraciones.

No crear modelos productivos.

No crear schemas ejecutables.

No activar `Payments API`.

No declarar `POS API` o `Billing API independiente` como activas si siguen sin contrato, persistencia, seguridad, compose y pruebas.

No modificar `main` ni `pro`.

No usar `_archive/` ni `agents/_archive/` como fuente vigente, salvo trazabilidad explícita.

No tocar proyectos no relacionados.

No duplicar reglas globales ya definidas en `AGENT_GLOBAL_RULES.md`.

## Decisión arquitectónica que debe conservarse

Mantener explícitamente esta separación:

* `Sales`: verdad comercial.
* `Payments`: verdad técnica y financiera del cobro.
* `POS`: operación física de caja, tickets, sesiones y cortes.
* `Fiscal/Billing`: verdad fiscal, CFDI, cancelaciones, notas de crédito y datos fiscales.
* `Accounting`: contabilidad futura.
* `Integrations`: proveedores externos, credenciales, endpoints, webhooks, límites y mapeos.

Regla principal:

Ningún proyecto debe cobrar directamente contra Openpay, Mercado Pago, Clip, Stripe, BBVA, Banorte o Santander.

Todo proyecto debe solicitar cobros mediante un contrato interno futuro de `Payments`.

## Estado obligatorio de Payments

Documentar `Payments API` como:

`PENDIENTE_DE_DISEÑO_PRIORITARIO`

No marcarla como ACTIVA hasta que exista:

1. Repositorio ejecutable.
2. Contrato OpenAPI o equivalente.
3. Persistencia/migraciones.
4. Seguridad.
5. Compose.
6. Pruebas aprobadas.
7. Webhooks validados.

## Tareas

1. Reescribir el agent para que abra con objetivo, alcance, lectura mínima, fuera de alcance, tareas, validaciones, reporte y criterio de cierre.

2. Conservar todas las decisiones actuales del agent, pero reorganizadas y sin repetir reglas globales.

3. Mantener la creación documental futura de:

   * `Docs/01_core_erp/architecture/adr-payments-provider-strategy.md`
   * `Docs/01_core_erp/apis/payments_api_future.md`
   * `Docs/04_integrations/openpay/README.md`
   * `Docs/04_integrations/mercado-pago-point/README.md`
   * `Docs/04_integrations/clip/README.md`
   * `Docs/04_integrations/stripe-terminal/README.md`
   * `Docs/04_integrations/bbva-terminal-futuro/README.md`

4. Mantener la actualización futura de:

   * `Docs/01_core_erp/apis/00_api_index.md`
   * `Docs/01_core_erp/apis/11_pos_api.md`
   * `Docs/01_core_erp/erp/08_pos_model.md`
   * `Docs/01_core_erp/erp/12_billing_returns.md`
   * `Docs/04_integrations/README.md`

5. Reordenar el contenido por responsabilidades:

   * Sales
   * Payments
   * POS
   * Fiscal/Billing
   * Integrations
   * Proyectos consumidores
   * Reglas de no duplicación
   * Validaciones
   * Cierre

6. Convertir instrucciones largas en tareas verificables.

7. Marcar como diseño futuro todo lo que no tenga contrato real.

8. Evitar que el agent ordene implementación directa de proveedores.

9. Evitar que el agent cree APIs activas ficticias.

10. Preservar los proyectos afectados y sus reglas:

* Refapart usa Payments para pagos web; no Openpay directo.
* Universal POS usa Payments para terminal física; no Mercado Pago Point directo desde POS.
* DocuCore usa Payments para pagos web y suscripciones futuras.
* LexNova usa Payments para pagos web y suscripciones futuras.
* Fiscora/Fiscal no cobra; solo factura o genera procesos fiscales.
* JobCron administra configuración futura de proveedores, disponibilidad por proyecto y feature flags.
* saTwi usa Payments para pagos recurrentes, terminales o links futuros.

## Contenido mínimo que debe quedar en el agent

El agent optimizado debe conservar estas reglas:

### Sales

Sales solo puede guardar resumen comercial:

* `payment_status`
* `total_paid`
* `balance_due`
* `payment_summary`
* `last_payment_at`

Sales no debe guardar detalle técnico del adquirente.

### Payments

Payments debe guardar:

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

### POS

POS no decide proveedor de pago.

POS no guarda webhooks crudos.

POS no guarda respuestas técnicas completas del adquirente.

POS crea ticket, solicita cobro y espera confirmación.

POS conserva caja, ticket, sesión y corte.

### Fiscal/Billing

Fiscal/Billing no cobra.

Fiscal/Billing factura solo con datos fiscales completos.

Un cobro aprobado no equivale automáticamente a CFDI emitido.

Si existe reembolso con CFDI emitido, documentar cancelación, nota de crédito o procedimiento fiscal aplicable.

### Integrations

Las integraciones externas viven en `Docs/04_integrations`.

Las integraciones documentan proveedor externo, credenciales, endpoints, webhooks, límites y mapeos.

Las integraciones no definen el modelo interno del ERP.

Si falta información real del proveedor, usar `PENDIENTE_DE_DEFINIR`.

## Entidades futuras de Payments que deben conservarse

Mantener en `payments_api_future.md` como diseño futuro:

* `PaymentProvider`
* `PaymentIntent`
* `PaymentTransaction`
* `PaymentTerminal`
* `PaymentWebhook`
* `PaymentRefund`
* `PaymentReconciliation`

Estados estándar:

* `PAYMENT_CREATED`
* `PAYMENT_PENDING`
* `PAYMENT_REQUIRES_ACTION`
* `PAYMENT_APPROVED`
* `PAYMENT_REJECTED`
* `PAYMENT_CANCELLED`
* `PAYMENT_EXPIRED`
* `PAYMENT_REFUNDED`
* `PAYMENT_PARTIALLY_REFUNDED`
* `PAYMENT_CHARGEBACK`
* `PAYMENT_RECONCILED`

## Reglas de no duplicación

Mantener estas reglas:

1. No crear pagos por proyecto.
2. No meter lógica de Openpay dentro de Refapart.
3. No meter lógica de Mercado Pago Point dentro de POS.
4. No meter reembolsos técnicos dentro de Sales.
5. No meter webhooks dentro de POS.
6. No meter CFDI dentro de Payments.
7. No declarar Payments API como ACTIVA.
8. No duplicar responsabilidades existentes de Sales, POS o Fiscal.
9. No crear documentación paralela si ya existe documento canónico.
10. Si un documento ya contiene el tema, actualizarlo en lugar de crear otro.

## Validaciones

Validar:

* Que `AGENTS-002.md` conserva toda la información vigente.
* Que no duplica reglas globales de `AGENT_GLOBAL_RULES.md`.
* Que no ordena ejecutar otros agents.
* Que no ordena leer todo `Docs`.
* Que no usa `_archive/` como fuente vigente.
* Que no declara APIs pendientes como activas.
* Que las rutas documentales indicadas existen o quedan claramente como documentos a crear.
* Que las decisiones de pagos quedan clasificadas en Core ERP o Integrations según corresponda.
* Que las referencias a proyectos afectados no se eliminan.
* Que `EXECUTION_REPORT.md` queda actualizado.

Si existen scripts documentales disponibles, ejecutar el check correspondiente.

Si no se pueden ejecutar validaciones, registrar la causa exacta.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Registrar:

* agent revisado: `AGENTS-002.md`
* documentos leídos
* Context Pack usado
* cambios realizados
* validaciones ejecutadas
* resultado de validaciones
* pendientes reales
* bloqueos
* decisiones documentales
* documentos fuera de alcance
* APIs reutilizadas
* APIs no creadas y motivo

## Criterio de cierre

El agent queda listo solo si:

* conserva todas las decisiones actuales
* queda más conciso
* no duplica reglas globales
* tiene lectura mínima
* tiene alcance claro
* tiene tareas verificables
* separa Core ERP de Integrations
* no activa APIs ficticias
* mantiene Payments como diseño futuro prioritario
* define validaciones
* define reporte obligatorio
* deja claro qué queda fuera de alcance

## Reglas finales

Si el agent estuviera vacío, no inventar tareas; dejarlo como `Sin instrucciones`.

Si el agent ya fue ejecutado y no hay cambios nuevos, documentar que está cerrado.

Si falta información esencial, marcar `Bloqueado` y dejar preguntas concretas.

No eliminar, mover ni renombrar `Docs/agents/AGENTS-002.md`.

No limpiar el contenido del agent, porque esta tarea es solo optimizar su instrucción, no ejecutarlo.
