Trabaja en la rama dev.

Objetivo:
Optimizar únicamente el archivo:

Docs/agents/AGENTS-005.md

No ejecutes el agent.
No ejecutes otros agents.
No modifiques otros AGENTS-*.md.
No elimines, muevas ni renombres Docs/agents/AGENTS-005.md.
No pierdas información del agente actual: conserva, ordena, compacta, actualiza y amplía solo cuando sea necesario.

Contexto confirmado del agent:
AGENTS-005 trata sobre UniversalPOS como plataforma POS vertical configurable por industria.
UniversalPOS NO debe documentarse como POS tradicional ni como módulo aislado.
Debe documentarse como capa operativa especializada que reutiliza Core ERP.
UniversalPOS debe orquestar APIs existentes y no duplicar responsabilidades.

Pre-flight obligatorio:
Lee solo:

Docs/README.md
Docs/_meta/active-work-index.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/agents/EXECUTION_REPORT.md
Docs/03_standards/operations/standard-request-prompts.md
Docs/03_standards/codex/codex-minimal-reading-standard.md
Docs/03_standards/codex/codex-change-budget-standard.md
Docs/03_standards/codex/codex-documentation-diff-standard.md
Docs/03_standards/codex/codex-output-report-standard.md

Después abre:

Docs/agents/AGENTS-005.md

Detecta:
- Proyecto afectado: UniversalPOS.
- Dominio afectado: Core ERP / POS / ventas físicas / caja / tickets / cortes.
- APIs relacionadas: Auth, Gateway, Catalog, Inventory, Pricing, Sales, Supplier, Procurement, Fiscal, Address, Document.
- Capacidades roadmap relacionadas: POS API, Payments API, Customer API, Cash Management API, Loyalty API, Advertising API, Reporting API y Rules Engine.

Context Pack mínimo:
Selecciona el Context Pack mínimo desde:

Docs/_meta/active-work-index.md
Docs/00_audit/codex-context-map.md

Lee únicamente documentación canónica relacionada con Core ERP, APIs reutilizables, producto y POS.
No leas todo el repositorio.
No uses _archive/ ni agents/_archive/ como fuente vigente, salvo trazabilidad.

Lectura canónica específica sugerida:
Docs/01_core_erp/apis/00_api_index.md
Docs/01_core_erp/apis/reusable-api-contracts.md
Docs/01_core_erp/apis/api-decision-matrix.md
Docs/03_standards/api/api-decision-record-standard.md
Docs/03_standards/api/api-contract-first-standard.md
Docs/03_standards/architecture/api-gateway-standard.md
Docs/03_standards/product/product-strategy.md
Docs/03_standards/product/module-catalog.md

Si existe documentación POS, leerla también.
Si no existe, documentar la ausencia sin inventar estado operativo.

Tarea:
Reescribe únicamente Docs/agents/AGENTS-005.md con esta estructura:

# AGENTS-005 — UniversalPOS Core Gap

## Objetivo

Optimizar y ejecutar la documentación faltante para UniversalPOS como plataforma POS multivertical reutilizable, alineada al Core ERP, sin duplicar APIs existentes ni crear implementación sin contrato.

## Alcance

Puede revisar y documentar:
- UniversalPOS como módulo Core ERP.
- POS como capa operativa de venta física rápida.
- Caja, tickets, cortes, pagos, hardware, recompensas, publicidad, reportes y configuración por vertical.
- Integración documental con APIs reutilizables existentes.
- Roadmap de capacidades pendientes sin marcarlas como activas.

Puede crear o actualizar, solo si corresponde:
- Docs/01_core_erp/pos/
- Docs/01_core_erp/apis/00_api_index.md
- Documentos de arquitectura Core ERP relacionados.
- Documentos de producto si UniversalPOS se clasifica como Commercial Module o producto posterior a Refapart.

Debe dejar:
- Documentación POS clara, modular y reutilizable.
- Fronteras explícitas entre POS y Sales.
- Lista de APIs reutilizadas.
- Capacidades pendientes marcadas como PLANNED o PENDIENTE_DE_DEFINIR según aplique.
- Reporte en Docs/agents/EXECUTION_REPORT.md.

## Lectura mínima obligatoria

Docs/README.md
Docs/_meta/active-work-index.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/agents/EXECUTION_REPORT.md
Docs/01_core_erp/apis/00_api_index.md
Docs/01_core_erp/apis/reusable-api-contracts.md
Docs/01_core_erp/apis/api-decision-matrix.md
Docs/03_standards/api/api-decision-record-standard.md
Docs/03_standards/api/api-contract-first-standard.md
Docs/03_standards/architecture/api-gateway-standard.md
Docs/03_standards/product/product-strategy.md
Docs/03_standards/product/module-catalog.md

## Fuera de alcance

No ejecutar otros agents.
No modificar otros AGENTS-*.md.
No crear APIs nuevas sin contrato.
No crear schemas, modelos ni migraciones.
No crear POS API activa si solo está en roadmap.
No crear Restaurant API.
No crear Internet API.
No crear Reporting API activa.
No duplicar Sales, Inventory, Pricing, Fiscal, Catalog, Address, Document, Supplier, Procurement ni Auth.
No modificar main/pro.
No leer todo Docs.
No tocar proyectos no relacionados.
No usar _archive como fuente vigente.
No implementar código runtime.

## Tareas

1. Auditar AGENTS-005.md y conservar toda su información útil, eliminando solo duplicidad, desorden o instrucciones no ejecutables.

2. Documentar UniversalPOS como plataforma POS multivertical configurable por BusinessType, usando como valores mínimos:
   - RETAIL
   - RESTAURANT
   - CAFE
   - CAFE_INTERNET
   - BOOKSTORE
   - ELECTRONICS
   - AUTOPARTS
   - PHARMACY
   - SERVICE_CENTER
   - CONVENIENCE_STORE

3. Documentar que UniversalPOS NO reemplaza Sales:
   - Toda venta final termina en Sales.
   - Toda afectación de stock termina en Inventory.
   - Toda facturación termina en Fiscal/Billing.
   - Toda dirección termina en Address.
   - Todo archivo/evidencia termina en Document.
   - Todo producto/catálogo termina en Catalog.
   - Todo precio/promoción base termina en Pricing.

4. Crear o actualizar Docs/01_core_erp/pos/ solo si no existe documentación equivalente.
   Estructura objetivo:
   - 00_universal_pos_vision.md
   - 01_pos_architecture.md
   - 02_pos_entities.md
   - 03_pos_vertical_configuration.md
   - 04_cash_management.md
   - 05_payments_processing.md
   - 06_loyalty_rewards.md
   - 07_advertising_engine.md
   - 08_pos_hardware.md
   - 09_restaurant_extension.md
   - 10_cafe_internet_extension.md
   - 11_retail_extension.md
   - 12_library_extension.md
   - 13_service_business_extension.md
   - 14_pos_reporting.md
   - 15_pos_api_contract.md

5. Actualizar Docs/01_core_erp/apis/00_api_index.md solo si el estado actual lo permite:
   - POS API: PLANNED o PENDIENTE_DE_DEFINIR.
   - Payments API: roadmap, no activa.
   - Customer API: roadmap, no activa.
   - Cash Management API: roadmap, no activa.
   - Loyalty API: roadmap, no activa.
   - Advertising API: roadmap, no activa.
   - Reporting API: roadmap, no activa.

6. Documentar fronteras de capacidades:
   - Customer API: clientes, historial, segmentación, RFC y lealtad; no direcciones.
   - Payments API: efectivo, tarjeta, transferencia, pago mixto, crédito interno y vales; no genera ventas ni modifica inventario.
   - Cash Management API: aperturas, cierres, arqueos, movimientos, retiros y fondos.
   - Loyalty API: puntos, monedero, cupones y recompensas.
   - Advertising API: publicidad en POS, ticket, portal cliente, pantallas secundarias y campañas por sucursal.
   - Reporting: métricas POS; no API activa sin contrato.

7. Documentar extensiones sin crear APIs nuevas:
   - Restaurante: mesas, comandas, cocina, meseros, propinas y división de cuentas.
   - Café internet: equipos, estaciones, tiempo, minutos, paquetes, bloqueo automático e internet promocional.
   - Librería: ISBN, autor, editorial, género y colección como extensión de Catalog.
   - Refacciones: compatibilidades, VIN, aplicaciones y equivalencias consumiendo ProductCompatibility o contrato equivalente.

8. Documentar sistema de recompensas mediante Rules Engine:
   - Internet gratis por compra.
   - Cupones.
   - Cashback.
   - Puntos.
   - Monedero.
   No debe quedar embebido directamente dentro de POS.

9. Documentar motor de publicidad:
   - Pantalla POS.
   - Ticket.
   - Portal cliente.
   - Pantallas secundarias.
   - Campañas por sucursal.
   Integraciones previstas: Loyalty, Notifications y Rules Engine.

10. Documentar hardware soportado:
   - Escáner de código de barras.
   - Impresoras térmicas.
   - Cajón de dinero.
   - Pantalla cliente.
   - Balanza.
   - Terminal bancaria.
   - Lectores QR.
   - NFC.

11. Documentar la decisión estratégica:
   UniversalPOS queda como producto comercial prioritario después de Refapart si la documentación de producto lo respalda, porque reutiliza Core ERP y puede venderse como módulo configurable.
   Si falta evidencia documental, marcarlo como PENDIENTE_DE_DEFINIR y registrar pregunta concreta.

## Validaciones

Validar:
- Que no se duplicaron responsabilidades de APIs core.
- Que ninguna API roadmap quedó marcada como activa sin contrato.
- Que las rutas y enlaces creados existen.
- Que los documentos nuevos respetan estructura canónica.
- Que no se leyó todo Docs.
- Que no se modificaron proyectos no relacionados.
- Que no se modificaron main/pro.
- Que AGENTS-005.md sigue existiendo en Docs/agents/.

Si solo hay documentación:
- Ejecutar validación documental disponible.
- Validar enlaces/rutas con búsqueda local.
- Ejecutar git diff --check si está disponible.

No ejecutar build, lint, Docker ni migraciones si no se modificó código.

## Reporte obligatorio

Actualizar:

Docs/agents/EXECUTION_REPORT.md

Registrar:
- agent revisado: AGENTS-005.md;
- rama usada: dev;
- documentos leídos;
- Context Pack utilizado;
- documentos creados;
- documentos modificados;
- APIs reutilizadas;
- capacidades marcadas como roadmap;
- validaciones ejecutadas;
- pendientes reales;
- bloqueos;
- decisiones documentales;
- confirmación de que no se ejecutaron otros agents.

## Criterio de cierre

AGENTS-005 queda listo solo si:
- conserva la información original útil;
- es más corto y ejecutable;
- no duplica reglas globales;
- tiene lectura mínima;
- tiene alcance claro;
- tiene tareas verificables;
- separa Core ERP, proyecto, producto y estándares;
- no crea APIs sin contrato;
- define validaciones;
- define reporte obligatorio;
- deja bloqueos con preguntas concretas si falta información.

Reglas finales:
Si AGENTS-005 está vacío, no inventes tareas; déjalo como “Sin instrucciones”.
Si ya fue ejecutado y no hay cambios nuevos, documenta que está cerrado.
Si falta información esencial, marca “Bloqueado”.
No limpies el contenido del agent después de optimizarlo.
Esta tarea es optimizar su instrucción, no ejecutar UniversalPOS.