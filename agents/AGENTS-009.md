Sí, ese objetivo está correcto: **EscogeTuPC no debe ser una tienda normal**, debe ser un **motor de armado inteligente basado en inventario real**.

La arquitectura debe quedar así:

# 1. El usuario puede iniciar por cualquier componente

Ejemplos:

* “Quiero 8 GB de RAM”
* “Quiero Ryzen 5”
* “Quiero tarjeta madre AM5”
* “Quiero una PC barata”
* “Quiero una PC gamer”
* “Quiero SSD de 1 TB”

Entonces el sistema no arma desde una plantilla fija, sino desde una **restricción inicial**.

```text
Usuario elige condición inicial
↓
Motor busca componentes compatibles
↓
Valida stock real
↓
Calcula precio por proveedor
↓
Elige mejor combinación
↓
Ofrece sustitutos si algo se agota
```

# 2. Cada producto debe tener 3 capas de datos

## A) Datos comerciales

```text
Proveedor
SKU proveedor
Precio
Stock
Moneda
Costo de envío
Tiempo de entrega
Garantía
```

## B) Datos técnicos normalizados

```text
Socket
Tipo de RAM
Capacidad RAM
Factor de forma
Potencia
Conectores
Compatibilidades
Consumo
Dimensiones
```

## C) Datos de relación

```text
Este procesador usa este socket
Esta tarjeta madre acepta esta RAM
Este gabinete acepta esta motherboard
Esta fuente soporta esta GPU
Este disipador soporta este socket
```

# 3. No debes pensar en “productos”, sino en “opciones compatibles”

Ejemplo:

El usuario dice:

> Quiero 8 GB de RAM.

El sistema debe buscar:

```text
RAM DDR4 8GB
RAM DDR5 8GB
```

Pero todavía no puede decidir hasta saber con qué motherboard y procesador va.

Entonces debe generar rutas:

```text
Ruta 1:
RAM DDR4 8GB
Motherboard DDR4
Procesador compatible
Fuente compatible
Gabinete compatible

Ruta 2:
RAM DDR5 8GB
Motherboard DDR5
Procesador compatible
Fuente compatible
Gabinete compatible
```

Luego compara precio, stock y disponibilidad.

# 4. Debe existir un motor de sustitución

Si una tarjeta madre se agota:

```text
Producto agotado:
ASUS B550M-K

Buscar sustituto:
- Misma categoría: motherboard
- Mismo socket: AM4
- Mismo tipo RAM: DDR4
- Factor compatible: micro ATX o ATX
- Precio similar
- Stock disponible
```

Y el sistema reemplaza sin romper la PC.

# 5. Tabla clave: inventario por proveedor

```text
supplier_inventory
```

| producto interno | proveedor | sku proveedor | precio | stock | envío | entrega |
| ---------------- | --------- | ------------- | ------ | ----- | ----- | ------- |
| Ryzen 5 5600G    | Syscom    | X1            | 1850   | 5     | 120   | 2 días  |
| Ryzen 5 5600G    | CT        | Y2            | 1790   | 2     | 180   | 3 días  |
| Ryzen 5 5600G    | DC        | Z3            | 1900   | 10    | 90    | 1 día   |

Así puedes decidir de dónde conviene traer cada pieza.

# 6. Cálculo real del equipo

El precio final no debe ser solo suma de productos.

Debe calcular:

```text
Costo componentes
+ Envío por proveedor
+ Comisión pago
+ Margen de ganancia
+ IVA si aplica
+ Empaque
+ Mano de obra armado
+ Garantía/soporte
= Precio final
```

# 7. Arquitectura recomendada

```text
API Products
Guarda productos base

API Suppliers
Guarda Syscom, CT, DC

API Specs
Normaliza fichas técnicas

API Inventory
Actualiza precios y stock

API Compatibility
Valida si las piezas pueden trabajar juntas

API Build Engine
Arma la PC

API Pricing
Calcula costo total

API Substitution
Busca reemplazos cuando algo se agota
```

# 8. Lo más importante

La base de datos debe tener un **producto interno único**, aunque venga de varios proveedores.

Ejemplo:

```text
Producto interno:
AMD Ryzen 5 5600G

Proveedor Syscom:
SKU 123

Proveedor CT:
SKU 987

Proveedor DC:
SKU ABC
```

Así el sistema sabe que es el mismo producto aunque cada proveedor lo escriba diferente.

# 9. Flujo ideal

```text
Usuario pide: PC con 8 GB de RAM
↓
El sistema genera posibles configuraciones
↓
Valida compatibilidad
↓
Valida stock en Syscom, CT y DC
↓
Calcula costo por proveedor
↓
Elige la combinación más conveniente
↓
Muestra:
- Opción económica
- Opción equilibrada
- Opción recomendada
- Opción con mejor entrega
```

# 10. Conclusión

Sí: necesitas una arquitectura tipo **configurador inteligente de hardware**, no solo catálogo.

La pieza central debe ser:

```text
Motor de compatibilidad + motor de inventario + motor de sustitución + motor de precios
```

Eso permitirá que el cliente empiece por cualquier componente y el sistema complete el equipo sin equivocarse.



Sí, Hugo. Revisé la documentación y la arquitectura correcta es esta:

# Decisión principal

**EscogeTuPC / Buildora no debe guardar todo en una sola tabla.**
Debe apoyarse en las APIs reutilizables ya existentes: **Catalog, Supplier, Inventory, Pricing, Sales, Address, Gateway y Rules/ProductCompatibility**. La documentación confirma que Catalog, Inventory, Pricing, Supplier, Sales, Document, Fiscal y Address ya están como APIs compartidas activas.

La regla de tus Docs es clara: **no crear una API nueva si una API compartida ya cubre la responsabilidad**.

# Dónde debe vivir cada cosa

| Información                        | Dónde vive                                               |
| ---------------------------------- | -------------------------------------------------------- |
| Producto interno normalizado       | `Catalog`                                                |
| Categoría, marca, modelo           | `Catalog`                                                |
| Ficha técnica estructurada         | `Catalog.ProductAttributes`                              |
| Datos crudos de Syscom, CT y DC    | `Supplier.RawData`                                       |
| SKU, precio y stock por proveedor  | `Supplier`                                               |
| Stock propio si compras inventario | `Inventory`                                              |
| Precio final al cliente            | `Pricing`                                                |
| Cotización congelada               | `Sales / Quote`                                          |
| Compatibilidad técnica             | `Catalog.ProductCompatibilityRules` o futura `Rules API` |
| Armador de PC                      | API especializada `Buildora/EscogeTuPC`                  |
| Entrada desde la web               | `Gateway General`                                        |

# Tablas base que ya están documentadas

## Catalog

Ya existe como responsable de productos internos, categorías, marcas e imágenes.

Debe ampliarse con:

```text
Catalog.Product
Catalog.Category
Catalog.Brand
Catalog.ProductImage
Catalog.ProductAttribute
Catalog.ProductAttributeDefinitions
Catalog.ProductCompatibilityRules
Catalog.ProductCompatibilityChecks
```

La documentación ya confirma estas tablas para compatibilidad:

## Supplier

Ya contempla:

```text
Supplier
SupplierProvider
SupplierProduct
SupplierCategory
SupplierBrand
SupplierStock
SupplierPrice
SupplierSyncLog
RawData
```

Esto sirve para guardar Syscom, CT Internacional y DC Mayorista sin contaminar el catálogo interno.

## Pricing

Pricing debe calcular precio final, margen, impuestos, tipo de cambio y snapshot auditable.

## Compatibilidad

La documentación ya menciona explícitamente Escoge tu PC / Buildora y dice que la compatibilidad no debe vivir como texto libre, sino como atributos y reglas consultables.

# Tablas nuevas que hacen falta

Estas son las que yo agregaría:

```text
Catalog.ProductAttributeDefinition
Catalog.ProductAttributeValue
Catalog.ProductAttributeUnit
Catalog.ProductAttributeOption
Catalog.ProductCompatibilityRule
Catalog.ProductCompatibilityCheck
Catalog.ProductSubstitutionRule
Catalog.ProductEquivalence
Catalog.ProductNormalizationCandidate
Supplier.SupplierRawData
Supplier.SupplierProductMapping
Supplier.SupplierDatasheet
Supplier.SupplierSyncLog
Pricing.BuildPriceSimulation
Sales.BuildQuoteSnapshot
Buildora.BuildIntent
Buildora.BuildSession
Buildora.BuildRequirement
Buildora.BuildCandidate
Buildora.BuildCandidateItem
Buildora.BuildValidationResult
```

# API nueva necesaria

Sí necesitas una API especializada, pero **solo para la lógica exclusiva del armado de PC**:

```text
API.PY.DJANGO.Buildora
```

Responsabilidad:

```text
- Recibir intención del usuario.
- Armar combinaciones compatibles.
- Pedir productos a Catalog.
- Pedir stock/costo a Supplier.
- Pedir precio final a Pricing.
- Validar reglas de compatibilidad.
- Sustituir componentes agotados.
- Generar propuesta final.
```

No debe guardar catálogo, precios, stock ni proveedores.

# Proveedores existentes

Tus Docs ya reconocen estos proveedores:

```text
syscom
ct-internacional
dc-mayorista
```

También indican que cada integración debe documentar mapper, sync, seguridad y errores, y que si falta información real se use `PENDIENTE_DE_DEFINIR`, no inventar endpoints ni credenciales.

# Flujo correcto de datos

```text
Syscom / CT / DC
↓
Supplier.RawData
↓
SupplierProduct / SupplierPrice / SupplierStock
↓
Mapper normaliza
↓
Catalog.Product + ProductAttributes
↓
CompatibilityRules
↓
Buildora arma PC
↓
Pricing calcula precio final
↓
Sales guarda cotización
```

El flujo de proveedor ya está documentado así: sync descarga, guarda RawData y logs; publish transforma hacia Catalog/Pricing.

# Lo más importante

Para que no se equivoque, cada producto debe tener estado de calidad:

```text
READY_FOR_AUTO_BUILD
REQUIRES_REVIEW
INCOMPLETE_DATASHEET
CONFLICT_BETWEEN_SUPPLIERS
NOT_COMPATIBLE
```

La documentación ya marca esta regla: si faltan atributos suficientes, no debe venderse como compatible automáticamente; debe quedar como `REQUIRES_REVIEW`.

# Conclusión

La arquitectura correcta es:

```text
Frontend EscogeTuPC
↓
Gateway General
↓
Buildora API
↓
Catalog + Supplier + Pricing + Inventory + Sales + Rules
↓
PostgreSQL schema por módulo
```

No necesitas rehacer todo. Necesitas **ampliar Catalog, Supplier, Pricing y ProductCompatibility**, y crear solo una API especializada para el configurador inteligente.
