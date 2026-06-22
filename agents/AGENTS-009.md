# INSTRUCCIÓN PARA CODEX — OPTIMIZAR AGENTS-009

Trabaja únicamente en la rama `dev`.

No ejecutes todos los agents.

No implementes código.

No modifiques otros archivos `AGENTS-*.md`.

Optimiza únicamente:

`Docs/agents/AGENTS-009.md`

---

# Resumen del agente actual

`AGENTS-009.md` documenta **EscogeTuPC / Buildora**.

El producto no debe ser una tienda normal, sino un **motor inteligente de armado de PCs** basado en:

* intención inicial del usuario;
* inventario real;
* compatibilidad técnica;
* comparación de proveedores;
* sustitución de piezas agotadas;
* cálculo real de precio final;
* cotización auditable.

El usuario puede iniciar desde cualquier restricción:

* RAM;
* procesador;
* motherboard;
* SSD;
* presupuesto;
* uso gamer;
* PC económica;
* componente específico.

El sistema debe completar la configuración compatible sin romper reglas técnicas.

---

# AGENTS-009 — Buildora / EscogeTuPC

## Objetivo

Optimizar la instrucción documental de Buildora / EscogeTuPC como configurador inteligente de PCs basado en inventario real, compatibilidad técnica, proveedores y precio final calculado, sin duplicar APIs reutilizables.

## Alcance

Puede tocar:

* `Docs/agents/AGENTS-009.md`

Debe revisar:

* APIs reutilizables vigentes;
* frontera Gateway;
* catálogo de módulos;
* reglas de producto;
* inventario/proveedores/precios;
* compatibilidad técnica;
* reporte de ejecución.

Debe dejar:

* instrucción optimizada;
* alcance claro;
* tareas verificables;
* validaciones;
* criterio de cierre;
* reporte en `Docs/agents/EXECUTION_REPORT.md`.

## Lectura mínima obligatoria

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/architecture/api-gateway-standard.md`
* `Docs/03_standards/product/product-strategy.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/01_core_erp/apis/reusable-api-contracts.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`
* `Docs/agents/AGENTS-009.md`

## Fuera de alcance

* No ejecutar otros agents.
* No implementar software.
* No crear APIs nuevas sin contrato.
* No crear schemas, modelos ni migraciones sin decisión documentada.
* No modificar `main` ni `pro`.
* No leer todo `Docs`.
* No tocar proyectos no relacionados.
* No duplicar `Catalog`, `Supplier`, `Inventory`, `Pricing`, `Sales`, `Address` ni `Gateway`.
* No guardar catálogo, precios, stock o proveedores dentro de Buildora.
* No marcar `API.PY.DJANGO.Buildora` como activa sin contrato, repo, migraciones, compose, seguridad y pruebas.

## Clasificación documental obligatoria

Clasificar así:

```text
EscogeTuPC / Buildora = Independent Product / Configurador inteligente de hardware
Build Engine = API especializada solo si aplica
Compatibility Rules = Catalog.ProductCompatibilityRules o futura Rules API
Catalog = productos internos normalizados
Supplier = proveedores, SKU externo, precio, stock externo, RawData
Inventory = stock propio
Pricing = precio final, margen, impuestos y snapshots
Sales = cotización congelada
Gateway = entrada única desde frontend
```

## Tareas

1. Reescribir `AGENTS-009.md` preservando toda la intención actual:

   * armado inteligente;
   * inicio desde cualquier componente;
   * inventario real;
   * proveedores Syscom, CT Internacional y DC Mayorista;
   * producto interno único;
   * normalización técnica;
   * compatibilidad;
   * sustitución;
   * precio final;
   * cotización.

2. Definir el flujo correcto:

```text
Usuario indica restricción inicial
↓
Gateway recibe solicitud
↓
Buildora interpreta intención
↓
Catalog entrega producto interno y atributos
↓
Supplier entrega SKU, precio y stock por proveedor
↓
Inventory entrega stock propio si existe
↓
Compatibility valida reglas técnicas
↓
Pricing calcula precio final
↓
Sales guarda cotización congelada
↓
Buildora entrega opciones recomendadas
```

3. Documentar que cada producto requiere tres capas:

```text
Datos comerciales:
- proveedor
- SKU proveedor
- precio
- stock
- moneda
- envío
- entrega
- garantía

Datos técnicos normalizados:
- socket
- tipo RAM
- capacidad RAM
- factor de forma
- potencia
- conectores
- compatibilidades
- consumo
- dimensiones

Datos de relación:
- CPU compatible con socket
- motherboard compatible con RAM
- gabinete compatible con motherboard
- fuente compatible con GPU
- disipador compatible con socket
```

4. Documentar APIs reutilizadas:

```text
Catalog:
- producto interno
- categoría
- marca
- modelo
- imágenes
- atributos técnicos
- reglas de compatibilidad
- equivalencias

Supplier:
- proveedor
- SKU externo
- precio externo
- stock externo
- RawData
- sync logs
- mappers

Inventory:
- stock propio
- almacenes
- movimientos

Pricing:
- margen
- impuestos
- comisiones
- envío
- mano de obra
- garantía
- snapshot de precio final

Sales:
- cotización
- vigencia
- estado comercial
- congelamiento de propuesta

Address:
- dirección del cliente
- entrega

Gateway:
- entrada única desde frontend
```

5. Definir que la única API especializada posible es:

```text
API.PY.DJANGO.Buildora
```

Responsabilidad exclusiva:

```text
- recibir intención del usuario;
- generar rutas de armado;
- consultar APIs reutilizables;
- validar compatibilidad;
- comparar proveedores;
- sustituir piezas agotadas;
- generar opciones finales;
- explicar por qué una configuración es válida;
- entregar cotización preliminar a Sales.
```

No debe guardar:

```text
- catálogo;
- proveedores;
- precios;
- stock;
- direcciones;
- ventas;
- pagos;
- facturación.
```

6. Documentar estados mínimos de calidad:

```text
READY_FOR_AUTO_BUILD
REQUIRES_REVIEW
INCOMPLETE_DATASHEET
CONFLICT_BETWEEN_SUPPLIERS
NOT_COMPATIBLE
OUT_OF_STOCK
PRICE_CHANGED
```

Si faltan atributos técnicos suficientes, el producto no puede usarse en armado automático y debe quedar como `REQUIRES_REVIEW`.

7. Documentar tablas conceptuales sin crear migraciones:

```text
Buildora.BuildIntent
Buildora.BuildSession
Buildora.BuildRequirement
Buildora.BuildCandidate
Buildora.BuildCandidateItem
Buildora.BuildValidationResult
Buildora.BuildRecommendation
Buildora.BuildExplanation
Buildora.BuildQuoteRequest
Buildora.BuildSubstitutionLog
```

Tablas que deben vivir fuera de Buildora:

```text
Catalog.Product
Catalog.Category
Catalog.Brand
Catalog.ProductImage
Catalog.ProductAttribute
Catalog.ProductAttributeDefinition
Catalog.ProductCompatibilityRule
Catalog.ProductCompatibilityCheck
Catalog.ProductSubstitutionRule
Catalog.ProductEquivalence
Catalog.ProductNormalizationCandidate

Supplier.SupplierProvider
Supplier.SupplierProduct
Supplier.SupplierStock
Supplier.SupplierPrice
Supplier.SupplierRawData
Supplier.SupplierProductMapping
Supplier.SupplierDatasheet
Supplier.SupplierSyncLog

Pricing.BuildPriceSimulation
Sales.BuildQuoteSnapshot
```

8. Documentar endpoints conceptuales sin marcarlos como activos:

```text
POST /buildora/intents
POST /buildora/sessions
POST /buildora/builds/generate
POST /buildora/builds/validate
POST /buildora/builds/substitute
POST /buildora/builds/price
POST /buildora/builds/quote
GET /buildora/builds/{id}
GET /buildora/builds/{id}/explanation
```

9. Definir validaciones de compatibilidad:

```text
CPU ↔ Motherboard socket
Motherboard ↔ RAM type
Motherboard ↔ Form factor
Motherboard ↔ Storage interface
GPU ↔ PSU watts
GPU ↔ Case dimensions
Cooler ↔ CPU socket
Cooler ↔ Case clearance
PSU ↔ Connectors
Case ↔ Motherboard form factor
Case ↔ GPU length
```

10. Definir cálculo de precio final:

```text
Costo componentes
+ envío por proveedor
+ comisión de pago
+ margen
+ IVA si aplica
+ empaque
+ mano de obra de armado
+ garantía / soporte
= precio final
```

11. Definir salidas del configurador:

```text
Opción económica
Opción equilibrada
Opción recomendada
Opción mejor entrega
Opción mejor upgrade futuro
Opción requiere revisión
```

12. Actualizar `Docs/agents/EXECUTION_REPORT.md` registrando:

* agent revisado;
* documentos leídos;
* Context Pack usado;
* cambios realizados;
* validaciones;
* pendientes reales;
* bloqueos;
* decisiones documentales;
* APIs reutilizadas;
* APIs no creadas y motivo.

## Validaciones

Ejecutar solo validaciones documentales aplicables:

* validar que solo se modificó `Docs/agents/AGENTS-009.md`;
* validar que no se modificaron otros agents;
* validar que no se creó API nueva;
* validar que no se crearon migraciones;
* validar que Buildora no duplica Catalog/Supplier/Inventory/Pricing/Sales/Address/Gateway;
* validar que todo frontend pasa por Gateway;
* validar que `API.PY.DJANGO.Buildora` queda como conceptual si no existe contrato real;
* validar que las tablas son conceptuales y no migraciones;
* validar rutas y enlaces modificados;
* registrar documentos leídos;
* ejecutar `git diff --check` si el entorno lo permite.

No declarar validaciones no ejecutadas.

Si una validación no puede ejecutarse, registrar causa exacta.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Debe registrar:

* `AGENTS-009.md`;
* documentos leídos;
* Context Pack elegido;
* documentos fuera de alcance;
* cambios realizados;
* APIs reutilizadas;
* APIs no creadas y motivo;
* validaciones ejecutadas;
* resultado de validaciones;
* pendientes reales con `PENDIENTE_DE_DEFINIR`;
* bloqueos;
* decisiones documentales;
* estado final del agent.

## Criterio de cierre

El agent queda listo solo si:

* la instrucción es más clara y ejecutable;
* no pierde ninguna decisión del agente actual;
* conserva EscogeTuPC / Buildora como configurador inteligente;
* no lo convierte en tienda genérica;
* no duplica APIs reutilizables;
* mantiene producto interno único;
* mantiene inventario por proveedor;
* mantiene compatibilidad técnica;
* mantiene sustitución automática;
* mantiene cálculo real de precio final;
* define lectura mínima;
* define alcance;
* define fuera de alcance;
* define tareas verificables;
* define validaciones;
* define dónde reportar.

## Reglas finales

Si `AGENTS-009.md` está vacío, no inventar tareas; dejarlo como `Sin instrucciones`.

Si el agent ya fue ejecutado y no hay cambios nuevos, documentar que está cerrado.

Si falta información esencial, marcar `Bloqueado` y dejar preguntas concretas.

No eliminar, mover ni renombrar `Docs/agents/AGENTS-009.md`.

No limpiar el contenido del agent.

Esta tarea solo optimiza la instrucción del agent; no ejecuta Buildora ni crea su implementación.
