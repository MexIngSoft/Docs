# Plan Pricing First

## Objetivo

Iniciar el desarrollo por listas de precios para que Tecno Telec pueda mostrar y cotizar precios publicos y precios para compradores especiales.

La primera etapa debe resolver:

- Precio publico.
- Precio especial por tipo de comprador.
- Precio fijo manual cuando aplique.
- Ajustes fijos sobre costo.
- Descuentos por volumen.
- Redondeo comercial.
- Colchon de riesgo operativo.
- Margen.
- Impuestos.
- Vigencia.
- Fuente de costo.
- Tipo de cambio proveedor cuando el costo venga en USD.
- Snapshot para cotizacion futura.

## Decision principal

La logica de precios no debe vivir en el Gateway.

El Gateway debe orquestar y adaptar respuestas para el frontend, pero el calculo de precio debe vivir en:

```txt
Pricing API
```

Cuando existan reglas condicionales mas avanzadas, Pricing podra consultar:

```txt
Rules Engine API
```

Este plan es `Pricing First`: no intenta implementar todo Costing, RMA, promociones, marketplace, impuestos complejos ni rentabilidad avanzada desde el inicio.

La vision completa queda documentada en:

```txt
Docs/01_core_erp/erp/22_pricing_costing_future_map.md
```

## APIs involucradas

| API | Rol en precios | Debe hacer | No debe hacer |
| --- | --- | --- | --- |
| `supplier-api` | Fuente de costo proveedor. | Guardar costo, moneda, stock proveedor y RawData. | Calcular precio final. |
| `catalog-api` | Producto interno vendible. | Exponer producto, categoria, marca y atributos. | Guardar listas de precios. |
| `pricing-api` | Owner de precio final. | Calcular precio publico/especial, margen, impuesto y vigencia. | Descargar proveedor o mostrar pantallas. |
| `cost-api` | Futuro motor de costos. | Calcular costo real/estimado, gastos asignados, financieros y marketplace. | Decidir precio comercial. |
| `tecnotelec-api` | Configuracion propia del proyecto. | Definir politicas propias de Tecno Telec si no son reutilizables. | Calcular precios core. |
| `tecnotelec-gateway-api` | BFF del frontend. | Pedir producto/precio a APIs internas y adaptar respuesta. | Guardar reglas de precio permanentes. |
| `auth-api` | Identidad minima. | Identificar comprador publico/especial/admin. | Calcular descuentos. |
| `rules-engine-api` | Fase posterior. | Evaluar reglas complejas. | Ser lista de precios. |
| `logistics-api` | Costo de envio y entrega. | Cotizar envio, retorno o entrega cuando aplique. | Definir margen comercial. |
| `quote-api` o `sales-api` | Snapshot comercial. | Congelar precio usado en cotizacion y registrar resultado real. | Recalcular historico sin snapshot. |

## Flujo recomendado

### Consulta publica de producto

```txt
Frontend
  -> tecnotelec-gateway-api
  -> catalog-api
  -> pricing-api
  -> tecnotelec-gateway-api
  -> Frontend
```

El Gateway arma una respuesta de pantalla:

```json
{
  "product": {
    "id": "uuid",
    "name": "Camara IP",
    "brand": "Marca"
  },
  "price": {
    "amount": "1499.00",
    "currency": "MXN",
    "price_list": "PUBLIC",
    "tax_included": true,
    "valid_until": "2026-06-30"
  }
}
```

### Consulta de comprador especial

```txt
Frontend
  -> tecnotelec-gateway-api
  -> auth-api identifica comprador
  -> pricing-api calcula con price_list especial
  -> Frontend
```

Si no hay usuario o comprador identificado:

```txt
Usar lista PUBLIC.
```

Si hay comprador especial:

```txt
Usar lista SPECIAL_BUYER o la lista asignada al cliente.
```

### Cotizacion

```txt
Frontend cotizador
  -> tecnotelec-gateway-api
  -> pricing-api /calculate
  -> quote-api o sales-api guarda snapshot
```

La cotizacion no debe depender de recalcular el precio historico. Debe guardar snapshot.

## Tablas Pricing MVP

Estas tablas viven en `pricing-api`.

| Tabla | Proposito | MVP |
| --- | --- | --- |
| `PriceList` | Lista de precios: publico, comprador especial, distribuidor, etc. | Si |
| `PriceListAssignment` | Asignar lista a tipo de comprador, cliente o canal. | Si |
| `ProductPrice` | Precio final por producto y lista. | Si |
| `PriceRule` | Regla simple de margen/descuento. | Si |
| `PriceRoundingRule` | Reglas de redondeo comercial. | Si |
| `VolumeDiscountRule` | Descuentos por cantidad. | Si |
| `OperationalRiskRule` | Colchon estimado por devoluciones, errores o atencion. | Recomendado |
| `TaxRule` | IVA u otros impuestos aplicables. | Si |
| `CurrencyRate` | Tipo de cambio usado si hay moneda externa. | Si, basico |
| `PriceCalculationLog` | Evidencia de calculo para auditoria. | Recomendado |
| `PriceSnapshot` | Precio congelado para cotizacion/venta. | Puede vivir en Quote/Sales |

## Tablas relacionadas en otras APIs

| API | Tabla | Relacion con Pricing |
| --- | --- | --- |
| `supplier-api` | `SupplierPrice` | Costo proveedor base. |
| `supplier-api` | `SupplierExchangeRate` | Tipo de cambio proveedor, por ejemplo SYSCOM. |
| `supplier-api` | `SupplierProduct` | Producto externo origen. |
| `catalog-api` | `Product` | Producto interno que recibe precio. |
| `catalog-api` | `Brand`, `Category` | Segmentacion para reglas de margen. |
| `auth-api` | `User`, `Customer`, `BuyerType` | Determina lista permitida. |
| `tecnotelec-api` | `TecnoTelecLead`, `TecnoTelecServiceConfig` | Contexto de cotizacion propia. |
| `quote-api` o `sales-api` | `Quote`, `QuoteItem` | Guarda snapshot de precio. |

## Listas iniciales

| Codigo | Nombre | Uso |
| --- | --- | --- |
| `PUBLIC` | Precio publico | Visitantes y compradores no identificados. |
| `SPECIAL_BUYER` | Comprador especial | Clientes autorizados o frecuentes. |
| `INTERNAL_COST` | Costo interno | Solo usuarios internos con permiso. |

Futuras:

- `DISTRIBUTOR`
- `PROJECT`
- `PROMOTION`
- `CLEARANCE`

## Tipos de regla de precio

Pricing debe soportar varios metodos de calculo, porque no todos los productos se venden igual.

| Tipo | Ejemplo | Uso recomendado |
| --- | --- | --- |
| `PERCENT_MARGIN` | Costo `750` + `25%` = `937.50`. | Regla general por lista, categoria o marca. |
| `FIXED_MARKUP` | Costo `750` + `$49` = `799`. | Accesorios, productos de bajo costo o reglas comerciales simples. |
| `FIXED_PRICE` | Precio final manual `$799`. | Promocion, liquidacion, proyecto o decision comercial puntual. |
| `VOLUME_DISCOUNT` | 5 piezas = `-3%`, 10 piezas = `-6%`. | Compradores especiales, mayoreo o proyectos. |
| `COMMERCIAL_ROUNDING` | `750` puede terminar en `799`; `1234` puede terminar en `1249` o `1299`. | Presentacion comercial del precio. |
| `MINIMUM_MARGIN_GUARD` | No permitir margen menor a `x%` o `$y`. | Evitar vender por debajo de margen autorizado. |

## Orden sugerido de calculo

El calculo debe ser explicable y auditable.

```txt
1. Obtener costo base.
2. Convertir moneda si aplica usando snapshot vigente de tipo de cambio.
3. Aplicar margen porcentual o aumento fijo.
4. Aplicar colchon de riesgo operativo si la lista lo define.
5. Aplicar descuentos por volumen permitidos.
6. Validar margen minimo.
7. Aplicar redondeo comercial.
8. Calcular impuestos.
9. Devolver precio final y desglose permitido por permisos.
```

## Redondeo comercial

El redondeo no debe ser un `round()` tecnico simple. Debe ser una regla comercial.

Ejemplos:

| Precio calculado | Regla | Precio mostrado |
| --- | --- | --- |
| `750.00` | Terminar en `799` cuando el rango sea `700-799`. | `799.00` |
| `936.25` | Terminar en `949`. | `949.00` |
| `1205.00` | Terminar en `1299`. | `1299.00` |
| `99.10` | Terminar en `.00` o `.90` segun lista. | `99.00` o `99.90` |

La regla debe poder configurarse por:

- Lista de precios.
- Categoria.
- Marca.
- Rango de precio.
- Canal.

## Descuentos por volumen

Los descuentos por volumen pertenecen a Pricing cuando son reglas comerciales de precio.

Ejemplo:

| Cantidad minima | Descuento |
| --- | --- |
| 5 | `3%` |
| 10 | `6%` |
| 25 | `10%` |

Reglas:

- El descuento debe respetar margen minimo.
- Puede aplicar solo a listas especiales.
- Puede requerir autorizacion si rompe margen.
- Debe quedar registrado en `PriceCalculationLog`.

## Riesgo operativo y perdidas estimadas

Hay costos que no son parte del producto, pero pueden afectar la utilidad:

- Producto devuelto por arrepentimiento.
- Producto enviado incorrectamente.
- Paquete regresado por direccion incorrecta o ausencia.
- Reenvio.
- Guia de retorno.
- Tiempo de personal atendiendo aclaraciones.
- Producto abierto, dañado o no revendible como nuevo.

Estos conceptos no deben mezclarse sin control dentro del costo proveedor.

Para MVP se propone manejarlos como `OperationalRiskRule` dentro de Pricing solo si se usan como colchon estimado para formar precio.

Ejemplos:

| Tipo | Ejemplo | Donde vive |
| --- | --- | --- |
| Colchon preventivo | Agregar `1.5%` a precio publico por riesgo promedio de devoluciones. | Pricing |
| Costo de envio inicial | Guia de envio al cliente. | Logistics |
| Costo real de retorno | Guia de devolucion usada realmente. | Logistics/Sales |
| Perdida real por devolucion | Producto danado, abierto o no recuperable. | Sales/Returns/Profitability |
| Error operativo | Producto incorrecto enviado, costo de reenvio y personal. | Sales/Returns/Profitability |

La perdida real no debe modificar precios historicos ya vendidos. Debe registrarse en Sales/Returns y alimentar reportes de utilidad para ajustar reglas futuras.

## Frontera entre precio, costo y utilidad

Pricing responde:

- Cuanto se debe cobrar.
- Que lista se uso.
- Que margen/descuento/redondeo se aplico.
- Si el precio requiere autorizacion.

Pricing no debe ser el unico modulo de rentabilidad real.

La utilidad real requiere:

- Costo proveedor final.
- Costo logistico real.
- Mano de obra real si aplica.
- Comisiones.
- Devoluciones.
- Reenvios.
- Mermas.
- Reembolsos.

Ese analisis pertenece a Sales/Profitability, usando snapshots de Quote/Sales y eventos reales de operacion.

## Reglas minimas

Para establecer listas de precios se debe definir:

1. Moneda base: `MXN`.
2. Si el precio mostrado incluye IVA.
3. Margen minimo global.
4. Margen por categoria o marca.
5. Redondeo: centavos, pesos completos o terminacion comercial.
6. Vigencia de precios.
7. Que hacer si no hay costo proveedor.
8. Que hacer si el proveedor cambia precio.
9. Quien puede ver costo interno.
10. Quien puede ver precio especial.
11. Si se permite precio fijo manual.
12. Si se permite aumento fijo sobre costo.
13. Escalones de descuento por volumen.
14. Politica de margen minimo despues de descuentos.
15. Politica de redondeo comercial.
16. Si se agrega colchon de riesgo operativo.
17. Que eventos reales alimentan reportes de utilidad.
18. Que tipo de cambio SYSCOM usar: `normal`, `preferencial`, `un_dia`, `una_semana`, etc.
19. Vigencia maxima del tipo de cambio antes de bloquear o marcar revision.

## Tipo de cambio SYSCOM

SYSCOM expone:

```txt
GET https://developers.syscom.mx/api/v1/tipocambio
```

Respuesta documentada:

```json
{
  "normal": "17.85",
  "preferencial": "17.85",
  "un_dia": "17.90",
  "una_semana": "17.95",
  "dos_semanas": "18.00",
  "tres_semanas": "18.05",
  "un_mes": "18.10"
}
```

Regla:

- `supplier-api` sincroniza y guarda el tipo de cambio como historico.
- `pricing-api` usa el snapshot vigente para convertir costo proveedor antes de calcular precio.
- La cotizacion o venta debe guardar el tipo de cambio usado.
- Si el tipo de cambio esta vencido, el precio debe marcarse como `requires_review` o refrescarse antes de recalcular.

Documento fuente:

```txt
Docs/04_integrations/syscom/api_reference/syscom-exchange-rate.md
```

## Endpoints Pricing MVP

```txt
GET /price-lists
POST /price-lists
POST /price-lists/{id}/assignments
GET /products/{product_id}/prices
POST /pricing/calculate
POST /pricing/rebuild-product-price
POST /pricing/rebuild-price-list
GET /pricing/calculations/{id}
```

## Request minimo de calculo

```json
{
  "product_id": "uuid",
  "quantity": 1,
  "buyer_type": "PUBLIC",
  "price_list_code": "PUBLIC",
  "channel": "TECNOTELEC_WEB",
  "include_tax": true,
  "include_operational_risk": true
}
```

## Response minimo de calculo

```json
{
  "product_id": "uuid",
  "quantity": 1,
  "price_list_code": "PUBLIC",
  "currency": "MXN",
  "source_currency": "USD",
  "exchange_rate": "17.85",
  "exchange_rate_type": "normal",
  "exchange_rate_captured_at": "2026-05-06T10:00:00-06:00",
  "unit_price": "1499.00",
  "base_cost": "1000.00",
  "margin_amount": "250.00",
  "operational_risk_amount": "15.00",
  "discount_total": "0.00",
  "rounding_adjustment": "34.16",
  "subtotal": "1499.00",
  "tax_total": "239.84",
  "total": "1499.00",
  "tax_included": true,
  "valid_until": "2026-06-30",
  "requires_review": false
}
```

## Que falta para establecer la lista de precios

| Falta | Decision requerida |
| --- | --- |
| Politica de margen | Margen global y margenes por categoria/marca. |
| Impuestos | Confirmar IVA incluido o separado. |
| Redondeo | Definir formato comercial. |
| Comprador especial | Definir criterio: manual, por cliente, por volumen o por aprobacion. |
| Precio fijo | Definir cuando un precio manual tiene prioridad sobre formula. |
| Aumento fijo | Definir reglas tipo costo + `$49`, costo + `$99`, etc. |
| Descuento por volumen | Definir escalones, listas aplicables y margen minimo. |
| Riesgo operativo | Definir si se agrega colchon preventivo y con que porcentaje/monto. |
| Perdidas reales | Definir como Sales/Returns reporta devoluciones, reenvios, errores y mermas. |
| Vigencia | Definir vigencia por lista y por proveedor. |
| Costo fuente | Definir prioridad: SupplierPrice, costo manual, costo promedio. |
| Tipo de cambio | Definir proveedor, rate type, vigencia y fallback si no esta actualizado. |
| Excepciones | Definir productos sin precio, sin stock o con precio por proyecto. |
| Permisos | Definir quien ve costo, margen y precio especial. |
| Snapshot | Definir si cotizacion vive en `quote-api` o inicial en `sales-api`. |
| Carga inicial | Definir si se genera desde proveedor o carga manual CSV/admin. |

## Criterio para iniciar desarrollo

Se puede iniciar `pricing-api` cuando existan:

- Producto interno identificable en `catalog-api`.
- Costo proveedor o costo manual.
- Tipo de cambio vigente cuando el costo fuente sea USD.
- Lista `PUBLIC`.
- Lista `SPECIAL_BUYER`.
- Regla basica de margen.
- Regla basica de IVA.
- Regla basica de redondeo.
- Decision sobre descuentos por volumen.
- Endpoint `POST /pricing/calculate`.

No es necesario tener implementado `cost-api`, `promotion-engine`, `return/rma-engine`, `tax-engine` avanzado ni `dynamic-pricing` para iniciar el MVP.

## Criterio de cierre Pricing MVP

Pricing MVP queda listo cuando:

- Puede calcular precio publico.
- Puede calcular precio especial.
- Puede explicar costo, margen, impuesto y total.
- Puede explicar moneda origen y tipo de cambio usado.
- Puede ocultar costo a usuarios no autorizados.
- Puede devolver precio al Gateway.
- Puede guardar o entregar datos suficientes para snapshot de cotizacion.
- Puede regenerar precios cuando cambian costos proveedor.
