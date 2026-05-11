# Analisis operativo y arquitectura para soluciones cotizables Tecno Telec

> Estado: analisis ejecutado desde `Docs/agents/AGENTS-000.md` y `Docs/agents/AGENTS-001.md`.
> Fecha: 2026-05-10.

## Objetivo

Definir como Tecno Telec debe pasar de una necesidad del cliente a una solucion cotizable, considerando reglas tecnicas, productos, mano de obra, distancia, tamano de proyecto, saldos, anticipos, proveedores, tecnicos, ejecucion y soporte.

Este documento determina:

- Si se requieren APIs nuevas.
- Si se requieren modulos ERP nuevos.
- Donde deben vivir los componentes.
- Si se requieren nuevas bases de datos.
- Que ya existe documentado.
- Que debe implementarse completo.
- Que debe quedar parcial para permitir cotizacion temprana.
- Que informacion debe capturar la web para que el cliente pueda usar el flujo.

## Conclusion ejecutiva

Tecno Telec necesita dos niveles:

1. **MVP cotizable:** permite que el cliente elija una solucion, indique ubicacion, tamano, alcance, si requiere mano de obra, presupuesto o saldo disponible, y genere una solicitud/cotizacion preliminar revisable por asesor.
2. **ERP operativo completo:** convierte una cotizacion aprobada en proyecto, compra componentes, agenda tecnicos, controla evidencia, costos reales, saldos, garantia y soporte.

No conviene intentar automatizar todo desde el inicio. La primera version debe generar una cotizacion preliminar y trazable, no una promesa tecnica final.

## Regla de arquitectura

El flujo debe respetar:

```text
Web Tecno Telec
  -> TecnoTelec Gateway API
  -> TecnoTelec API para configuracion propia
  -> Core APIs necesarias
  -> JobCron/Admin administra, valida y publica
```

Gateway compone respuestas para la web. No debe ser base maestra.

TecnoTelec API guarda configuracion propia del proyecto. No debe duplicar Catalog, Pricing, Inventory, Supplier, Sales, Logistics o Projects.

## Base de datos

### Decision actual

No se requiere crear una base de datos nueva para la primera implementacion.

La base actual recomendada sigue siendo:

```text
Base: comercial
Schemas por modulo: PascalCase
```

Ejemplos:

```text
comercial.TecnoTelec
comercial.Catalog
comercial.Pricing
comercial.Inventory
comercial.Supplier
comercial.Sales
comercial.Projects
comercial.Logistics
comercial.Rules
comercial.Partners
comercial.Documents
```

Cada API debe usar su schema. En produccion puede separarse por base de datos si el costo y la operacion lo justifican, pero el diseno debe quedar listo para esa separacion futura.

### Regla de nombres

Tablas, campos, vistas y objetos publicados deben documentarse con estilo PascalCase tipo SQL Server:

```text
TecnoTelec.Solution
Projects.Project
Sales.Quote
Logistics.ServiceZone
Rules.CompatibilityRule
Partners.Technician
```

## Clasificacion: core ERP vs TecnoTelec

La pregunta clave es:

```text
Esto sirve solo para Tecno Telec o tambien para otras empresas/proyectos?
```

| Capacidad | Donde vive | Motivo |
|---|---|---|
| Presentacion comercial de soluciones Tecno Telec | `TecnoTelec API` | Es marca, contenido, landing y reglas propias del canal. |
| Familias publicas de soluciones Tecno Telec | `TecnoTelec API` | Dependen de la estrategia comercial del proyecto. |
| Preguntas del diagnostico visible | `TecnoTelec API` | Son propias de la experiencia Tecno Telec. |
| Productos, marcas, categorias | `Catalog API` | Reutilizable para cualquier empresa. |
| Proveedor Syscom y datos externos | `Supplier API` | Reutilizable y auditable. |
| Precios, margenes, listas | `Pricing API` | Reutilizable por canales y empresas. |
| Existencia propia | `Inventory API` | Reutilizable. |
| Reglas tecnicas de compatibilidad | `Rules API` o `ProductCompatibility` | Reutilizable para varios proyectos. |
| Cotizaciones, saldos y pagos | `Sales/Quote API` | Libro comercial central. |
| Proyectos aceptados | `Projects API` | Reutilizable para consultoria, obra, instalaciones y servicios. |
| Distancia, viaticos, cobertura | `Logistics API` | Reutilizable. |
| Tecnicos, cuadrillas y subcontratistas | `Partners/Operations API` | Reutilizable para Tecno Telec, Buildora, Nexora u otras empresas. |
| Evidencias, fotos, firmas, archivos | `Documents API` | Reutilizable. |
| Soporte y mantenimiento | `Support API` futuro | Reutilizable. |

## Modulos existentes relacionados

Ya existe documentacion base para:

| Area | Documento |
|---|---|
| Vision ERP | `Docs/01_core_erp/erp/00_erp_vision.md` |
| Modulos ERP | `Docs/01_core_erp/erp/01_modules.md` |
| Rules Engine | `Docs/01_core_erp/erp/02_rules_engine.md` |
| Quote Engine | `Docs/01_core_erp/erp/03_quote_engine.md` |
| Sales | `Docs/01_core_erp/erp/04_sales_model.md` |
| Logistics | `Docs/01_core_erp/erp/06_logistics_model.md` |
| Costos y rentabilidad | `Docs/01_core_erp/erp/11_costs_profitability.md` |
| Bundles/Kits | `Docs/01_core_erp/erp/15_bundles_kits.md` |
| Direcciones y clientes | `Docs/01_core_erp/erp/16_addresses_customers.md` |
| Product Compatibility | `Docs/01_core_erp/erp/21_product_compatibility.md` |
| Pricing futuro | `Docs/01_core_erp/erp/22_pricing_costing_future_map.md` |
| API por proyecto | `Docs/01_core_erp/architecture/07_project_api_pattern.md` |
| Aislamiento de datos | `Docs/01_core_erp/architecture/08_data_isolation_and_reference_tables.md` |
| TecnoTelec Gateway | `Docs/01_core_erp/architecture/09_tecnotelec_gateway_corrected_pattern.md` |

## Documentacion que falta o debe ampliarse

Los agents identifican faltantes reales. Se deben documentar en etapas:

| Falta | Ruta recomendada | Prioridad |
|---|---|---|
| Reglas tecnicas de armado de soluciones | `Docs/01_core_erp/rules/00_rules_engine_architecture.md` | Alta |
| Compatibilidad tecnica por solucion | `Docs/01_core_erp/rules/01_solution_compatibility_rules.md` | Alta |
| Modelo real de cotizacion con snapshot | `Docs/01_core_erp/quotes/01_quote_snapshot_model.md` | Alta |
| Ciclo de vida de cotizacion | `Docs/01_core_erp/quotes/02_quote_lifecycle.md` | Alta |
| Logistica de instalacion por zona/distancia | `Docs/01_core_erp/logistics/01_installation_coverage.md` | Alta |
| Mano de obra y cuadrillas | `Docs/01_core_erp/projects/02_labor_and_crew_model.md` | Alta |
| Subcontratistas y partners | `Docs/01_core_erp/partners/00_partner_strategy.md` | Media |
| Evidencia y entrega | `Docs/01_core_erp/projects/03_project_evidence_and_acceptance.md` | Media |
| Soporte postventa | `Docs/01_core_erp/support/00_support_model.md` | Media |
| Comisiones | `Docs/01_core_erp/commissions/00_commission_model.md` | Media |
| Saldos, anticipos y pagos parciales | `Docs/01_core_erp/sales/01_payment_balance_model.md` | Alta |

No todo debe implementarse de inmediato, pero debe quedar diseñado antes de programar automatizaciones de alto riesgo.

## APIs nuevas o ampliaciones necesarias

### 1. `API.PY.DJANGO.TecnoTelec`

Debe ampliarse.

Responsabilidad:

- Soluciones publicadas.
- Familias de solucion.
- Preguntas de diagnostico.
- Paquetes comerciales.
- Reglas propias de presentacion.
- Relacion de soluciones con categorias o productos.
- Configuracion visible de Tecno Telec.

No debe:

- Calcular precio final.
- Guardar stock.
- Guardar proveedor completo.
- Formalizar ventas.
- Administrar proyectos ya aceptados.

### 2. `API.PY.DJANGO.TecnoTelec.Gateway`

Debe ampliarse.

Responsabilidad:

- `GET /api/public/solutions/`
- `GET /api/public/solutions/{slug}/`
- `GET /api/public/solutions/{slug}/quote-form/`
- `POST /api/public/solutions/{slug}/quote-request/`

Debe componer datos desde:

- TecnoTelec API.
- Catalog API.
- Pricing API.
- Inventory API.
- Supplier API.
- Logistics API cuando exista.
- Sales/Quote API cuando exista.

### 3. `Rules API`

Debe existir como core ERP cuando las reglas sean reutilizables.

Responsabilidad:

- Compatibilidad tecnica.
- Dependencias entre componentes.
- Cantidades minimas.
- Restricciones por distancia, energia, capacidad, puertos, canales, voltaje o consumo.
- Reglas que determinan si requiere revision humana.

Para MVP, algunas reglas pueden vivir documentadas y ejecutarse manualmente. No deben inventarse reglas automaticas sin validacion.

### 4. `Sales/Quote API`

Debe ampliarse o formalizarse.

Responsabilidad:

- Cotizacion.
- Snapshot de productos, servicios, precios, impuestos, mano de obra, viaticos y condiciones.
- Vigencia.
- Versiones.
- Anticipo.
- Saldo pendiente.
- Estado comercial.
- Aprobacion o rechazo.

Para MVP se puede crear `QuoteRequest` preliminar si no existe Quote completo.

### 5. `Logistics API`

Debe existir como core ERP.

Responsabilidad:

- Direccion de instalacion.
- Distancia desde base operativa o tecnico.
- Zona de cobertura.
- Viaticos.
- Costo de traslado.
- Tiempo estimado.
- Reglas de instalacion local, foranea o no cubierta.

Para MVP se puede capturar direccion y municipio, y marcar el costo como `Pendiente de validar`.

### 6. `Projects API`

Debe existir para proyectos aceptados.

Responsabilidad:

- Convertir cotizacion aprobada en proyecto.
- Tareas.
- Hitos.
- Agenda.
- Evidencias.
- Estado de ejecucion.
- Entrega.
- Garantia.

No debe confirmar ventas finales por su cuenta. Sales formaliza la venta.

### 7. `Partners/Operations API`

Puede ser modulo core futuro.

Responsabilidad:

- Tecnicos.
- Instaladores.
- Subcontratistas.
- Cuadrillas.
- Tarifas.
- Disponibilidad.
- Calidad.
- Pagos a terceros.

Si se usa solo internamente al inicio, puede documentarse como parte futura de Projects, pero no debe mezclarse con TecnoTelec API.

## Flujo operativo completo

```text
Lead
  -> Diagnostico
  -> Solucion recomendada
  -> Alcance: solo productos o con mano de obra
  -> Ubicacion de proyecto
  -> Tamano del proyecto
  -> Reglas tecnicas preliminares
  -> Productos y servicios sugeridos
  -> Estimacion de precio
  -> Cotizacion preliminar
  -> Revision humana si aplica
  -> Cotizacion formal
  -> Anticipo / saldo
  -> Aprobacion
  -> Abastecimiento
  -> Agenda
  -> Instalacion
  -> Evidencia
  -> Entrega
  -> Garantia
  -> Soporte / mantenimiento
```

## Informacion que debe capturar la web

Para que el cliente pueda usar el flujo sin construir todo el ERP, el cotizador debe capturar:

| Campo | Uso |
|---|---|
| Tipo de solucion | Seleccionar flujo correcto. |
| Tipo de cliente | Negocio, empresa, escuela, bodega, residencial, gobierno. |
| Ubicacion del proyecto | Estimar cobertura, distancia y mano de obra. |
| Municipio/estado/codigo postal | Calcular zona aproximada. |
| Direccion opcional | Solo si el cliente acepta compartirla. |
| Requiere mano de obra | Separar `solo productos` vs `solucion instalada`. |
| Tamano del proyecto | Chico, mediano, grande o personalizado. |
| Medidas o cantidades estimadas | Numero de camaras, puntos de red, metros, usuarios, area, cargas. |
| Condiciones del sitio | Energia disponible, canalizacion, altura, internet, acceso. |
| Presupuesto estimado | Ayuda a recomendar paquete. |
| Anticipo o saldo disponible | Permite proponer fases o pagos parciales. |
| Urgencia | Normal, pronto, critico. |
| Datos de contacto | Seguimiento comercial. |
| Consentimiento | Contacto y tratamiento de datos. |

## Mano de obra: decision del cliente

La web debe preguntar explicitamente:

```text
Quieres solo productos o una solucion instalada?
```

Opciones:

| Opcion | Implicacion |
|---|---|
| Solo productos | No se cotiza instalacion. Puede sugerirse asesoria. |
| Productos + instalacion | Requiere ubicacion, distancia, agenda y mano de obra. |
| Diagnostico previo | Requiere visita o llamada tecnica antes de cotizar formalmente. |
| No estoy seguro | El sistema lo manda a revision humana. |

## Ubicacion, distancia y logistica

La distancia impacta:

- Costo de traslado.
- Viaticos.
- Tiempo de tecnico.
- Disponibilidad de cuadrilla.
- Cobertura.
- Necesidad de subcontratista.

MVP:

```text
Capturar municipio/estado/codigo postal.
Mostrar: "Costo de instalacion sujeto a validacion por zona".
```

ERP completo:

```text
Direccion normalizada
  -> coordenadas
  -> zona de cobertura
  -> distancia desde base/tecnico
  -> costo logistico
  -> agenda
```

## Tamano del proyecto

Debe afectar recomendacion, componentes y revision humana.

| Tamano | Regla inicial |
|---|---|
| Chico | Puede generar estimacion preliminar. |
| Mediano | Requiere revision si incluye mano de obra. |
| Grande | Requiere diagnostico y asesor. |
| Critico | Requiere proyecto formal. |

Ejemplo CCTV:

| Indicador | Chico | Mediano | Grande |
|---|---|---|---|
| Camaras | 1-4 | 5-16 | 17+ |
| Cableado | Bajo | Medio | Alto |
| Instalacion | 1 tecnico | 1 cuadrilla | Proyecto formal |

## Saldos, anticipos y pagos

El sistema debe contemplar:

- Anticipo requerido.
- Saldo pendiente.
- Pago parcial.
- Vigencia de cotizacion.
- Apartado de productos.
- Cambios de precio si vence la cotizacion.

Para MVP:

```text
La web puede preguntar presupuesto o monto disponible.
Sales/Quote debe registrar si el cliente solicita pago parcial.
No se debe prometer apartado automatico sin Inventory/Sales formal.
```

ERP completo:

```text
Quote aprobado
  -> PaymentPlan
  -> DownPayment
  -> BalanceDue
  -> SalesOrder
  -> Project
```

## Que se implementa completo y que parcial

### Implementar completo en primera etapa

- Documentacion de solucion.
- Modelos TecnoTelec para soluciones.
- Endpoints publicos de soluciones.
- Cotizador basico por solucion.
- Captura de ubicacion aproximada.
- Captura de mano de obra: si/no/no seguro.
- Captura de tamano de proyecto.
- Captura de presupuesto o saldo disponible.
- Creacion de lead o quote request.
- Mensajes claros de revision humana.

### Implementar parcial en primera etapa

- Calculo de mano de obra.
- Calculo de distancia.
- Reglas de compatibilidad.
- Precio total automatico de proyecto.
- Agenda de tecnicos.
- Asignacion de subcontratistas.
- Anticipos y saldos formales.
- Evidencias de instalacion.
- Soporte postventa.

Estos puntos pueden quedar como datos capturados y estados pendientes de revision.

### No implementar aun

- Venta automatica de proyectos grandes.
- Apartado automatico de inventario.
- Precio cerrado con instalacion sin validacion.
- Compatibilidad tecnica completa si no existe Rules API.
- Pagos parciales reales si Sales/Payments no esta listo.

## Estados recomendados

### Solucion

```text
DRAFT
PUBLISHED
PAUSED
INTERNAL
ARCHIVED
```

### Solicitud de solucion

```text
NEW
NEEDS_REVIEW
QUALIFIED
QUOTE_IN_PROGRESS
QUOTE_SENT
WON
LOST
```

### Cotizacion

```text
DRAFT
PENDING_REVIEW
SENT
ACCEPTED
REJECTED
EXPIRED
CANCELLED
```

### Proyecto

```text
APPROVED
SCHEDULED
IN_PROGRESS
INSTALLED
TESTING
DELIVERED
CLOSED
CANCELLED
```

## Reglas de revision humana

La cotizacion debe pasar a revision humana si:

- El cliente requiere instalacion.
- La distancia esta fuera de zona conocida.
- El proyecto es mediano, grande o critico.
- Falta stock o precio.
- Hay productos `QUOTE_ONLY` o `COMPONENT_ONLY`.
- Hay reglas tecnicas no evaluadas.
- El cliente pide pago parcial.
- La solucion requiere diagnostico presencial.
- El monto supera un limite definido.

## Empresas futuras y reutilizacion

Como se plantea crear varias empresas/proyectos, la regla debe ser:

| Si aplica a una sola marca/proyecto | Si aplica a varias empresas |
|---|---|
| TecnoTelec API | Core ERP API |

Ejemplos:

| Caso | Ubicacion |
|---|---|
| Texto comercial de "Videovigilancia para negocio" | TecnoTelec API |
| Reglas de distancia y viaticos | Logistics API |
| Asignacion de tecnicos | Projects/Partners API |
| Cotizacion con anticipo y saldo | Sales/Quote API |
| Evidencias de entrega | Documents/Projects API |
| Comisiones de vendedor | Commissions API |
| Soporte postventa | Support API |

## Propuesta de desarrollo por fases

### Fase 1: Soluciones cotizables manualmente

Objetivo: que el cliente pueda usar la web y generar una solicitud util.

Incluye:

- Soluciones publicadas dinamicas.
- Detalle de solucion.
- Diagnostico basico.
- Ubicacion aproximada.
- Mano de obra si/no.
- Tamano.
- Presupuesto/saldo disponible.
- Lead o quote request.
- Revision humana.

### Fase 2: Cotizacion preliminar asistida

Incluye:

- Reglas simples.
- Productos sugeridos.
- Precio parcial de productos.
- Mano de obra estimada por rango.
- Logistica como pendiente de validar.
- Snapshot preliminar.

### Fase 3: Cotizacion formal

Incluye:

- Sales/Quote completo.
- Vigencia.
- Anticipo.
- Saldo.
- Condiciones.
- Versionado.
- Aprobacion.

### Fase 4: Proyecto operativo

Incluye:

- Projects API.
- Agenda.
- Tecnicos.
- Evidencia.
- Entrega.
- Garantia.

### Fase 5: Automatizacion avanzada

Incluye:

- Rules API completo.
- Compatibilidad tecnica.
- Logistics automatico.
- Partners/subcontratistas.
- Rentabilidad real.
- Soporte recurrente.

## Segunda revision del analisis

Se vuelve a evaluar la decision con las preguntas criticas:

| Pregunta | Respuesta |
|---|---|
| Se necesita base nueva ahora? | No. Usar `comercial` con schemas separados. |
| Se necesitan APIs nuevas? | Si, pero por fases: Rules, Logistics, Projects, Partners/Operations, Support y Commissions. |
| TecnoTelec debe guardar todo? | No. Solo configuracion y contenido propio. |
| Se puede implementar todo completo ahora? | No conviene. Primero MVP cotizable con revision humana. |
| Cliente podra usarlo? | Si, si puede elegir solucion, capturar datos, ubicacion, mano de obra, tamano y contacto. |
| Se puede brindar cotizacion? | Si, como preliminar o formal revisada; no como proyecto automatico cerrado al inicio. |
| Donde vive mano de obra? | Projects/Partners/Logistics, no Catalog. |
| Donde vive distancia? | Logistics. |
| Donde viven saldos y anticipos? | Sales/Quote. |
| Donde vive compatibilidad tecnica? | Rules/ProductCompatibility. |
| Donde vive lo visual/comercial? | TecnoTelec API. |

La conclusion se mantiene: el primer desarrollo debe ser un cotizador consultivo con datos suficientes para que un asesor pueda generar una cotizacion real, mientras se dejan preparados los modulos core que despues automatizaran reglas, logistica, mano de obra, saldos y ejecucion.

## Decision final

Implementar primero el flujo `SolutionRequest` o `QuoteRequest` dentro de TecnoTelec/Gateway conectado a Sales/Quote cuando este disponible.

El flujo debe capturar datos de proyecto, ubicacion, mano de obra, tamano, presupuesto/saldo y necesidades. Debe devolver una confirmacion clara al cliente y dejar el registro listo para revision humana.

Los modulos core se implementan despues por prioridad:

1. Sales/Quote con snapshot, vigencia, anticipo y saldo.
2. Rules/ProductCompatibility para armado tecnico.
3. Logistics para distancia, cobertura y viaticos.
4. Projects para ejecucion.
5. Partners/Operations para tecnicos y subcontratistas.
6. Documents para evidencia.
7. Support y Commissions como crecimiento.
