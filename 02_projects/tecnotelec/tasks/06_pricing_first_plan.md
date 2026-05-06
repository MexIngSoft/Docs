# Plan Pricing First

## Objetivo

Iniciar el desarrollo por listas de precios para que Tecno Telec pueda mostrar y cotizar precios publicos y precios para compradores especiales.

La primera etapa debe resolver:

- Precio publico.
- Precio especial por tipo de comprador.
- Margen.
- Impuestos.
- Vigencia.
- Fuente de costo.
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

## APIs involucradas

| API | Rol en precios | Debe hacer | No debe hacer |
| --- | --- | --- | --- |
| `supplier-api` | Fuente de costo proveedor. | Guardar costo, moneda, stock proveedor y RawData. | Calcular precio final. |
| `catalog-api` | Producto interno vendible. | Exponer producto, categoria, marca y atributos. | Guardar listas de precios. |
| `pricing-api` | Owner de precio final. | Calcular precio publico/especial, margen, impuesto y vigencia. | Descargar proveedor o mostrar pantallas. |
| `tecnotelec-api` | Configuracion propia del proyecto. | Definir politicas propias de Tecno Telec si no son reutilizables. | Calcular precios core. |
| `tecnotelec-gateway-api` | BFF del frontend. | Pedir producto/precio a APIs internas y adaptar respuesta. | Guardar reglas de precio permanentes. |
| `auth-api` | Identidad minima. | Identificar comprador publico/especial/admin. | Calcular descuentos. |
| `rules-engine-api` | Fase posterior. | Evaluar reglas complejas. | Ser lista de precios. |
| `quote-api` o `sales-api` | Snapshot comercial. | Congelar precio usado en cotizacion. | Recalcular historico sin snapshot. |

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
| `TaxRule` | IVA u otros impuestos aplicables. | Si |
| `CurrencyRate` | Tipo de cambio usado si hay moneda externa. | Si, basico |
| `PriceCalculationLog` | Evidencia de calculo para auditoria. | Recomendado |
| `PriceSnapshot` | Precio congelado para cotizacion/venta. | Puede vivir en Quote/Sales |

## Tablas relacionadas en otras APIs

| API | Tabla | Relacion con Pricing |
| --- | --- | --- |
| `supplier-api` | `SupplierPrice` | Costo proveedor base. |
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
  "include_tax": true
}
```

## Response minimo de calculo

```json
{
  "product_id": "uuid",
  "quantity": 1,
  "price_list_code": "PUBLIC",
  "currency": "MXN",
  "unit_price": "1499.00",
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
| Vigencia | Definir vigencia por lista y por proveedor. |
| Costo fuente | Definir prioridad: SupplierPrice, costo manual, costo promedio. |
| Excepciones | Definir productos sin precio, sin stock o con precio por proyecto. |
| Permisos | Definir quien ve costo, margen y precio especial. |
| Snapshot | Definir si cotizacion vive en `quote-api` o inicial en `sales-api`. |
| Carga inicial | Definir si se genera desde proveedor o carga manual CSV/admin. |

## Criterio para iniciar desarrollo

Se puede iniciar `pricing-api` cuando existan:

- Producto interno identificable en `catalog-api`.
- Costo proveedor o costo manual.
- Lista `PUBLIC`.
- Lista `SPECIAL_BUYER`.
- Regla basica de margen.
- Regla basica de IVA.
- Endpoint `POST /pricing/calculate`.

## Criterio de cierre Pricing MVP

Pricing MVP queda listo cuando:

- Puede calcular precio publico.
- Puede calcular precio especial.
- Puede explicar costo, margen, impuesto y total.
- Puede ocultar costo a usuarios no autorizados.
- Puede devolver precio al Gateway.
- Puede guardar o entregar datos suficientes para snapshot de cotizacion.
- Puede regenerar precios cuando cambian costos proveedor.
