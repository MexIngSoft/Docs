# Analisis de implementacion para cotizaciones Tecno Telec

> Estado: propuesta para implementar cotizacion MVP y preparar cotizacion formal.
> Fecha: 2026-05-10.

## Objetivo

Definir que debe contener la cotizacion de Tecno Telec, que se puede reutilizar del flujo de productos, como debe tratarse la mano de obra, que datos necesita la web y que modulos deben participar para convertir una solicitud en cotizacion preliminar o formal.

## Pregunta principal

Se puede usar el mismo flujo de cotizacion de producto y agregar la mano de obra como un producto nuevo?

## Respuesta corta

Si se puede reutilizar el flujo de producto, pero la mano de obra no debe ser un producto fisico normal.

La mano de obra debe cotizarse como una partida vendible de tipo `SERVICE` o `LABOR`, no como un SKU de inventario.

```text
Producto fisico = requiere Catalog, Pricing, Inventory/Supplier.
Servicio/mano de obra = requiere Catalog/Service, Pricing, Logistics/Projects/Partners.
```

La cotizacion puede mezclar ambos tipos de partida:

```text
Quote
  -> ProductLine
  -> ServiceLine
  -> LaborLine
  -> LogisticsLine
  -> DiscountLine
  -> TaxLine
```

## Decision propuesta

Para el MVP:

- Reutilizar el flujo actual de producto para productos fisicos.
- Agregar partidas de servicio/mano de obra como lineas de cotizacion.
- No meter mano de obra a Inventory.
- No consultar Supplier para mano de obra.
- Permitir que Pricing calcule o reciba precio sugerido de servicio.
- Marcar instalacion, distancia y viaticos como `PENDING_REVIEW` si no hay Logistics completo.

Para etapa formal:

- Crear catalogo de servicios o tipo `SERVICE` en Catalog.
- Crear reglas de mano de obra en Projects/Partners/Logistics.
- Hacer que Sales/Quote guarde snapshot de producto, servicio, costo, precio y condiciones.

## Por que no conviene tratar mano de obra como producto normal

| Riesgo | Consecuencia |
|---|---|
| Inventory intentaria validar stock. | La mano de obra no tiene existencia fisica. |
| Supplier podria aparecer como origen. | Un tecnico no es proveedor de producto Syscom. |
| El costo no depende solo de lista. | Depende de tiempo, distancia, dificultad, zona y tecnico. |
| No hay garantia igual que un producto. | Servicio tiene condiciones y evidencia. |
| Puede requerir agenda. | Producto se entrega; mano de obra se programa. |
| Puede requerir subcontratista. | Necesita Partners/Operations. |

## Como si debe modelarse

### Opcion recomendada: `Catalog.Service` o `CatalogItem` con tipo `SERVICE`

El ERP puede tener una entidad vendible comun, pero diferenciada por tipo.

```text
Catalog.Item
  ItemType = PRODUCT | SERVICE | LABOR | BUNDLE | KIT
```

Si se mantiene `Catalog.Product`, entonces debe tener campo conceptual:

```text
ProductType = PHYSICAL | DIGITAL | SERVICE | LABOR
```

Para Tecno Telec, mano de obra debe ser:

```text
ItemType = LABOR
RequiresInventory = false
RequiresSupplier = false
RequiresSchedule = true
RequiresLocation = true
QuoteOnly = true
```

## Tipos de lineas de cotizacion

| Tipo | Ejemplo | Modulos usados |
|---|---|---|
| `PRODUCT` | Camara IP, NVR, switch PoE. | Catalog, Pricing, Inventory, Supplier. |
| `MATERIAL` | Cable, conectores, canaleta. | Catalog, Pricing, Inventory/Supplier. |
| `SERVICE` | Configuracion, diagnostico remoto. | Catalog/Service, Pricing. |
| `LABOR` | Instalacion por punto, jornada tecnica. | Projects, Logistics, Partners, Pricing. |
| `LOGISTICS` | Traslado, viaticos, envio. | Logistics, Pricing/Sales. |
| `DISCOUNT` | Descuento comercial. | Pricing/Sales. |
| `TAX` | IVA u otro impuesto. | Pricing/Sales. |

## Que debe contener una cotizacion

### Encabezado

| Campo | Uso |
|---|---|
| `QuoteId` | Identificador. |
| `QuoteNumber` | Folio visible. |
| `Source` | Web, WhatsApp, asesor, admin. |
| `CustomerName` | Cliente o contacto. |
| `CustomerType` | Publico, empresa, escuela, gobierno. |
| `ContactPhone` | Seguimiento. |
| `ContactEmail` | Envio de propuesta. |
| `SolutionSlug` | Solucion origen si aplica. |
| `Status` | Estado. |
| `ValidUntil` | Vigencia. |
| `CurrencyCode` | MXN, USD si aplica. |
| `PriceListCode` | Lista usada. |
| `RequiresHumanReview` | Si necesita asesor. |
| `ReviewReason` | Motivo de revision. |

### Datos del proyecto

| Campo | Uso |
|---|---|
| `ProjectLocationState` | Estado. |
| `ProjectLocationCity` | Municipio/ciudad. |
| `ProjectPostalCode` | Estimacion de zona. |
| `ProjectAddress` | Direccion si el cliente la comparte. |
| `ProjectSize` | Chico, mediano, grande, critico. |
| `NeedsInstallation` | Si requiere mano de obra. |
| `NeedsSiteVisit` | Si requiere visita. |
| `Urgency` | Normal, pronto, critico. |
| `BudgetRange` | Rango de presupuesto. |
| `AvailableBalance` | Monto disponible o anticipo posible. |
| `SiteConditions` | Energia, canalizacion, internet, altura, acceso. |

### Lineas

| Campo | Uso |
|---|---|
| `QuoteLineId` | Identificador. |
| `LineType` | `PRODUCT`, `SERVICE`, `LABOR`, `LOGISTICS`, etc. |
| `ItemReferenceType` | Catalog, Service, Manual, Rule. |
| `ItemReferenceId` | ID origen si existe. |
| `DisplayName` | Nombre visible. |
| `Description` | Descripcion comercial. |
| `Quantity` | Cantidad. |
| `UnitPrice` | Precio unitario. |
| `UnitCost` | Costo unitario si el usuario tiene permiso. |
| `Subtotal` | Cantidad por precio. |
| `TaxAmount` | Impuestos. |
| `Total` | Total de linea. |
| `RequiresReview` | Si la linea no esta cerrada. |
| `Snapshot` | JSON con datos congelados. |

### Totales

| Campo | Uso |
|---|---|
| `ProductSubtotal` | Total de productos. |
| `ServiceSubtotal` | Total de servicios/mano de obra. |
| `LogisticsSubtotal` | Traslado/envio/viaticos. |
| `DiscountTotal` | Descuentos. |
| `TaxTotal` | Impuestos. |
| `GrandTotal` | Total cotizado. |
| `DownPaymentRequired` | Anticipo requerido. |
| `BalanceDue` | Saldo pendiente. |

## Flujo reutilizando producto

Para productos actuales:

```text
Web selecciona producto o solucion
  -> Gateway
  -> Catalog valida producto
  -> Pricing calcula precio
  -> Inventory/Supplier valida disponibilidad
  -> Sales/Quote crea linea PRODUCT
```

Para mano de obra:

```text
Web indica que quiere instalacion
  -> Gateway
  -> TecnoTelec API obtiene preguntas/reglas de solucion
  -> Logistics estima o marca pendiente por zona
  -> Projects/Partners estima mano de obra o marca pendiente
  -> Pricing aplica tarifa si existe
  -> Sales/Quote crea linea LABOR o SERVICE
```

Si Logistics/Projects/Partners no existen todavia:

```text
Sales/Quote crea linea LABOR con status PENDING_REVIEW
```

## Mano de obra como partida

### Formas de cobrar mano de obra

| Metodo | Ejemplo | Uso |
|---|---|---|
| Por punto | Instalacion de camara por punto. | CCTV, red, acceso. |
| Por jornada | Tecnico por dia. | Proyectos medianos. |
| Por paquete | Instalacion basica 4 camaras. | MVP y paquetes simples. |
| Por hora | Diagnostico remoto o soporte. | Soporte tecnico. |
| Por proyecto | Mano de obra estimada total. | Proyectos grandes. |

### Campos recomendados

| Campo | Uso |
|---|---|
| `LaborType` | Punto, jornada, hora, paquete, proyecto. |
| `EstimatedHours` | Tiempo estimado. |
| `CrewSize` | Numero de tecnicos. |
| `RequiresTravel` | Si requiere traslado. |
| `DifficultyLevel` | Baja, media, alta. |
| `LocationStatus` | Local, foraneo, pendiente. |
| `ReviewRequired` | Si asesor debe validar. |

## Cotizacion MVP

La primera version debe soportar:

- Producto directo.
- Solucion seleccionada.
- Productos relacionados por reglas simples.
- Mano de obra como `LABOR` pendiente o estimada.
- Ubicacion aproximada.
- Tamano del proyecto.
- Presupuesto o saldo disponible.
- Datos de contacto.
- Snapshot basico.
- Estado `PENDING_REVIEW` cuando haya instalacion o incertidumbre.

No debe prometer:

- Precio final cerrado de instalacion compleja.
- Disponibilidad garantizada.
- Agenda confirmada.
- Apartado automatico.
- Compatibilidad tecnica completa.

## Cotizacion formal futura

La cotizacion formal debe agregar:

- Reglas de compatibilidad.
- Calculo de cantidades.
- Logistica por zona/distancia.
- Mano de obra con cuadrilla.
- Viaticos.
- Anticipo requerido.
- Saldo.
- Versionado.
- Vigencia.
- Aprobacion interna.
- Firma o aceptacion.
- Conversion a proyecto.

## Estados recomendados

```text
DRAFT
PENDING_REVIEW
CALCULATED
SENT
ACCEPTED
REJECTED
EXPIRED
CONVERTED_TO_ORDER
CANCELLED
```

## Reglas para revision humana

La cotizacion debe requerir revision humana si:

- Incluye mano de obra.
- Incluye distancia no validada.
- El cliente pide pago parcial.
- El proyecto es mediano, grande o critico.
- Hay productos sin precio.
- Hay productos sin stock.
- Hay componentes `QUOTE_ONLY`.
- Hay reglas tecnicas pendientes.
- El cliente solicita condiciones especiales.

## Implementacion recomendada

### Primera etapa

1. Ampliar formulario de cotizacion.
2. Guardar `SolutionRequest` o `QuoteRequest`.
3. Crear lineas `PRODUCT` para productos seleccionados.
4. Crear linea `LABOR` si el cliente quiere instalacion.
5. Marcar `RequiresHumanReview = true` cuando aplique.
6. Mostrar confirmacion clara al cliente.

### Segunda etapa

1. Crear servicios cotizables en Catalog o Service catalog.
2. Conectar Pricing para tarifas de servicio.
3. Agregar reglas simples por tamano.
4. Agregar Logistics por zona.

### Tercera etapa

1. Quote/Sales formal con snapshot completo.
2. Anticipo y saldo.
3. Conversion a orden/proyecto.
4. Agenda y evidencia.

## Decision final

No se recomienda meter mano de obra como producto fisico normal.

Si se desea reutilizar el mismo flujo de producto, la forma correcta es crear partidas vendibles con `LineType` y/o `ItemType`.

```text
PRODUCT = articulo fisico con inventario.
SERVICE = servicio cotizable sin inventario.
LABOR = mano de obra cotizable con ubicacion, tiempo y revision.
LOGISTICS = traslado, envio o viaticos.
```

Asi se reutiliza el motor de cotizacion, precios, totales y snapshot, pero sin contaminar inventario ni proveedor.
