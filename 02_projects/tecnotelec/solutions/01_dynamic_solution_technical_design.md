# Diseno tecnico dinamico de soluciones Tecno Telec

> Estado: propuesta tecnica para implementar.

## Objetivo

Definir en que base de datos vive la configuracion de soluciones, que informacion se toma de cada API, como se relaciona con catalogo, precios, existencia y proveedor, y como la Web Tecno Telec puede mostrar soluciones dinamicas sin datos inventados.

## Decision tecnica principal

Las soluciones deben vivir en la base comercial del proyecto, dentro del esquema propio de Tecno Telec:

```text
Base de datos: comercial
Schema: TecnoTelec
Responsable: API.PY.DJANGO.TecnoTelec
```

Esta base no debe copiar catalogo completo, precios oficiales ni stock. Solo guarda contenido comercial, reglas de armado, relacion de soluciones con categorias/productos y configuracion propia del proyecto.

## Regla de nombres de base de datos

Aunque Django use nombres Python en `snake_case`, las tablas y columnas publicadas en base de datos deben seguir el estilo definido para el proyecto:

```text
Schema PascalCase: TecnoTelec
Tabla PascalCase: Solution
Campo PascalCase: SolutionId, DisplayName, IsPublished
```

En Django se debe usar `db_table` y, cuando aplique, `db_column` para mantener la base compatible con el estilo SQL Server definido para produccion.

Ejemplo conceptual:

```python
class Solution(models.Model):
    solution_id = models.BigAutoField(primary_key=True, db_column="SolutionId")

    class Meta:
        db_table = '"TecnoTelec"."Solution"'
```

## Propiedad de datos

| Informacion | Donde vive | Por que |
|---|---|---|
| Nombre comercial de solucion | `TecnoTelec.Solution` | Es contenido propio de Tecno Telec. |
| Descripcion, beneficios, CTA | `TecnoTelec.Solution` | No pertenece al proveedor ni al catalogo global. |
| Familias de soluciones | `TecnoTelec.SolutionFamily` | Son agrupaciones comerciales propias. |
| Paquetes Esencial/Profesional/Empresarial | `TecnoTelec.SolutionPackage` | Son ofertas armadas por Tecno Telec. |
| Preguntas del diagnostico | `TecnoTelec.SolutionQuestion` | Dependen de la solucion y del flujo comercial. |
| Detalle visible de solucion | `TecnoTelec.SolutionDetailSection` | Define lo que incluye, excluye, proceso, garantia y FAQs. |
| Reglas para elegir productos | `TecnoTelec.SolutionComponentRule` | Relacionan solucion con Catalog sin copiar productos. |
| Productos base | `Catalog.Product` | Producto limpio y normalizado. |
| Categorias y marcas | `Catalog.Category`, `Catalog.Brand` | Fuente real del catalogo publicado. |
| Imagenes y ficha tecnica | `Catalog` / `Supplier` normalizado | Vienen de proveedor y catalogo. |
| Costo proveedor y stock proveedor | `Supplier` | Dato externo auditado. |
| Precio publico | `Pricing` | Pricing gobierna precio final. |
| Stock propio | `Inventory` | Inventory gobierna existencia fisica propia. |
| Cotizacion final | `Sales` / `Quote` | Debe ser snapshot comercial. |

## Tablas propuestas en `TecnoTelec`

### `TecnoTelec.SolutionFamily`

Agrupa soluciones por necesidad comercial.

| Campo | Tipo conceptual | Uso |
|---|---|---|
| `SolutionFamilyId` | bigint | Identificador. |
| `Slug` | varchar | URL y referencia estable. |
| `DisplayName` | varchar | Nombre visible. |
| `Summary` | text | Descripcion corta. |
| `DisplayOrder` | int | Orden visual. |
| `IsActive` | bit/bool | Disponible para publicacion. |

### `TecnoTelec.Solution`

Fuente de verdad de cada solucion publicada.

| Campo | Tipo conceptual | Uso |
|---|---|---|
| `SolutionId` | bigint | Identificador. |
| `SolutionFamilyId` | bigint | Familia comercial. |
| `Slug` | varchar | URL `/soluciones/[slug]`. |
| `DisplayName` | varchar | Nombre visible. |
| `ShortPitch` | text | Mensaje breve. |
| `ProblemStatement` | text | Problema que resuelve. |
| `IdealCustomer` | text | Cliente recomendado. |
| `HeroImageUrl` | varchar | Imagen principal. |
| `PrimaryCtaLabel` | varchar | Texto del CTA principal. |
| `PrimaryCtaHref` | varchar | Ruta del CTA. |
| `CommercialStatus` | varchar | `DRAFT`, `PUBLISHED`, `PAUSED`, `INTERNAL`. |
| `IsPublished` | bit/bool | Visible en web. |
| `DisplayOrder` | int | Orden visual. |
| `Metadata` | json | Campos futuros no criticos. |

### `TecnoTelec.SolutionUseCase`

Describe escenarios concretos.

| Campo | Uso |
|---|---|
| `SolutionUseCaseId` | Identificador. |
| `SolutionId` | Solucion relacionada. |
| `Title` | Caso de uso visible. |
| `Description` | Explicacion comercial. |
| `Segment` | Negocio, oficina, bodega, escuela, residencial, etc. |

### `TecnoTelec.SolutionPackage`

Define los paquetes comerciales.

| Campo | Uso |
|---|---|
| `SolutionPackageId` | Identificador. |
| `SolutionId` | Solucion relacionada. |
| `PackageCode` | `ESSENTIAL`, `PROFESSIONAL`, `ENTERPRISE`. |
| `DisplayName` | Esencial, Profesional, Empresarial. |
| `Summary` | Alcance del paquete. |
| `PriceMode` | `QUOTE_REQUIRED`, `FROM_PRICE`, `FIXED_PRICE`. |
| `FromPrice` | Precio desde, solo si existe regla completa. |
| `IsActive` | Disponible. |

### `TecnoTelec.SolutionComponentGroup`

Agrupa componentes de una solucion.

| Campo | Uso |
|---|---|
| `SolutionComponentGroupId` | Identificador. |
| `SolutionId` | Solucion relacionada. |
| `DisplayName` | Equipo principal, infraestructura, energia, servicios, opcionales. |
| `GroupType` | `PRODUCT`, `SERVICE`, `INFRASTRUCTURE`, `OPTIONAL`, `INTERNAL`. |
| `IsVisible` | Si se muestra al cliente. |

### `TecnoTelec.SolutionComponentRule`

Regla dinamica para traer productos desde Catalog sin copiarlos.

| Campo | Uso |
|---|---|
| `SolutionComponentRuleId` | Identificador. |
| `SolutionComponentGroupId` | Grupo relacionado. |
| `RuleType` | `CATEGORY`, `BRAND`, `PRODUCT`, `SEARCH`, `MANUAL_SERVICE`. |
| `CatalogCategorySlug` | Categoria de Catalog cuando aplica. |
| `CatalogBrandSlug` | Marca de Catalog cuando aplica. |
| `CatalogProductId` | Producto especifico cuando aplica. |
| `SearchText` | Texto para busqueda controlada cuando aplica. |
| `MinQuantity` | Cantidad minima sugerida. |
| `MaxQuantity` | Cantidad maxima sugerida. |
| `IsRequired` | Requerido u opcional. |
| `DisplayOrder` | Orden visual. |

### `TecnoTelec.SolutionQuestion`

Preguntas del diagnostico.

| Campo | Uso |
|---|---|
| `SolutionQuestionId` | Identificador. |
| `SolutionId` | Solucion relacionada. |
| `QuestionText` | Pregunta visible. |
| `AnswerType` | `TEXT`, `NUMBER`, `SINGLE_CHOICE`, `MULTIPLE_CHOICE`, `BOOLEAN`. |
| `IsRequired` | Obligatoria. |
| `DisplayOrder` | Orden. |

### `TecnoTelec.SolutionDetailSection`

Define bloques visibles en la pagina de detalle de cada solucion. La web no debe quemar estos textos; debe consumirlos desde Gateway.

| Campo | Uso |
|---|---|
| `SolutionDetailSectionId` | Identificador. |
| `SolutionId` | Solucion relacionada. |
| `SectionType` | `DELIVERABLE`, `EXCLUSION`, `PROCESS_STEP`, `FAQ`, `WARRANTY`, `REQUIREMENT`. |
| `Title` | Titulo visible del punto. |
| `Body` | Explicacion para cliente final. |
| `DisplayOrder` | Orden dentro del tipo de seccion. |
| `IsVisible` | Si se muestra al cliente. |
| `Metadata` | Configuracion futura no critica. |

Uso obligatorio por experiencia:

- `DELIVERABLE`: lo que recibe el cliente.
- `EXCLUSION`: lo que no esta incluido o requiere revision.
- `PROCESS_STEP`: pasos desde diagnostico hasta cotizacion.
- `WARRANTY`: reglas generales de garantia y soporte.
- `FAQ`: preguntas frecuentes para reducir friccion.

Si una solucion no tiene datos en una seccion, la web debe mostrar `Sin datos por el momento`.

### `TecnoTelec.SolutionQuestionOption`

Opciones para preguntas cerradas.

| Campo | Uso |
|---|---|
| `SolutionQuestionOptionId` | Identificador. |
| `SolutionQuestionId` | Pregunta relacionada. |
| `DisplayText` | Texto visible. |
| `ValueCode` | Valor interno. |
| `DisplayOrder` | Orden. |

### `TecnoTelec.SolutionProductOverride`

Permite ajustar como se muestra un producto dentro de una solucion sin modificar Catalog.

| Campo | Uso |
|---|---|
| `SolutionProductOverrideId` | Identificador. |
| `SolutionId` | Solucion relacionada. |
| `CatalogProductId` | Producto de Catalog. |
| `CommercialLabel` | Texto comercial alterno. |
| `UsageNote` | Nota de uso dentro de la solucion. |
| `IsFeatured` | Destacado dentro de la solucion. |

## Informacion que se toma de cada fuente

### Desde `TecnoTelec API`

Se toma:

- Soluciones publicadas.
- Familias.
- Paquetes.
- Preguntas.
- Reglas de componentes.
- Textos comerciales.
- Orden visual.
- Estado de publicacion.

No se toma:

- Stock real.
- Precio oficial.
- Catalogo completo.
- Costo proveedor.

### Desde `Catalog API`

Se toma:

- Productos normalizados.
- Categorias reales.
- Marcas reales.
- Imagen principal.
- Galeria cuando exista.
- Descripcion limpia.
- Modelo.
- Ficha tecnica.
- Estado publicable del producto.

Catalog se consulta usando reglas de `TecnoTelec.SolutionComponentRule`.

Ejemplos:

```text
RuleType = CATEGORY
CatalogCategorySlug = camaras-ip
```

```text
RuleType = BRAND
CatalogBrandSlug = hikvision
```

```text
RuleType = PRODUCT
CatalogProductId = 12345
```

### Desde `Pricing API`

Se toma:

- Precio visible por producto.
- Estado de precio.
- Lista de precio aplicada.
- Vigencia.
- Etiqueta comercial: precio, desde, cotizar.

Pricing decide si un producto tiene precio publicable. TecnoTelec API no debe calcularlo.

### Desde `Inventory API`

Se toma:

- Stock propio disponible.
- Estado comercial de disponibilidad.
- Cantidad local disponible.
- Posible reserva futura.

Inventory no debe confundirse con existencia de proveedor.

### Desde `Supplier API`

Se toma:

- Existencia proveedor cuando aplique.
- Origen proveedor.
- SKU externo.
- Ultima fecha de sincronizacion.
- RawData solo para auditoria interna, no para web publica.

La web no debe consumir Supplier directamente. El Gateway decide que datos son visibles.

### Desde `Sales/Quote`

Se toma o se genera:

- Lead de diagnostico.
- Cotizacion inicial.
- Snapshot de productos, servicios, precio y condiciones.
- Estado de seguimiento comercial.

## Flujo dinamico para `/soluciones`

```text
Web /soluciones
  -> TecnoTelec Gateway GET /api/public/solutions/
    -> TecnoTelec API: soluciones publicadas
    -> Catalog API: conteo/resumen de productos relacionados
    -> Pricing API: precio minimo si existe regla completa
    -> Inventory/Supplier: disponibilidad resumida si aplica
  <- lista lista para frontend
```

Respuesta conceptual:

```json
{
  "data": [
    {
      "slug": "videovigilancia-para-negocio",
      "displayName": "Videovigilancia para negocio",
      "family": "Videovigilancia y CCTV",
      "shortPitch": "Monitorea tu negocio con camaras, grabacion y acceso remoto.",
      "priceMode": "QUOTE_REQUIRED",
      "productPreviewCount": 24,
      "primaryCta": {
        "label": "Comenzar diagnostico",
        "href": "/cotizador/videovigilancia-para-negocio"
      }
    }
  ]
}
```

## Flujo dinamico para `/soluciones/[slug]`

```text
Web /soluciones/[slug]
  -> TecnoTelec Gateway GET /api/public/solutions/{slug}/
    -> TecnoTelec API: solucion, paquetes, preguntas y reglas
    -> Catalog API: productos que cumplen reglas
    -> Pricing API: precios visibles de productos relacionados
    -> Inventory API: disponibilidad propia
    -> Supplier API: disponibilidad proveedor resumida
  <- detalle listo para frontend
```

La pagina debe mostrar productos reales si existen. Si una regla no devuelve productos, debe mostrar:

```text
Sin productos relacionados por el momento.
```

## Flujo dinamico para cotizador

```text
Web /cotizador/[solution]
  -> Gateway obtiene preguntas desde TecnoTelec API
  -> Cliente responde diagnostico
  -> Gateway crea Lead/Cotizacion inicial
  -> Sales/Quote guarda snapshot
```

El cotizador no debe prometer una configuracion tecnica final si todavia no existen reglas completas de compatibilidad.

## Como se vuelve dinamico

La dinamica no debe depender de arreglos locales en la web. Debe depender de:

1. Soluciones publicadas en `TecnoTelec.Solution`.
2. Reglas de armado en `TecnoTelec.SolutionComponentRule`.
3. Productos reales en `Catalog`.
4. Precios reales en `Pricing`.
5. Disponibilidad real en `Inventory` y `Supplier`.
6. Aprobacion o ejecucion administrada por JobCron/Admin.

Si se cambia una regla, la web cambia sin desplegar codigo.

Ejemplo:

```text
Se agrega categoria "switches-poe" a la solucion "videovigilancia".
  -> TecnoTelec.SolutionComponentRule cambia.
  -> Gateway resuelve nuevos productos desde Catalog.
  -> Web muestra componentes relacionados actualizados.
```

## Papel de JobCron/Admin

JobCron/Admin debe permitir:

- Crear y editar soluciones.
- Publicar o pausar soluciones.
- Revisar reglas sin productos encontrados.
- Detectar productos sin imagen, sin precio o sin disponibilidad.
- Ejecutar validacion de soluciones publicadas.
- Generar reporte de salud de soluciones.
- Sincronizar cache si se decide usar cache.

JobCron no debe crear productos maestros. Solo administra publicacion, sincronizacion y validacion.

## Cache recomendado

Para mejorar velocidad, el Gateway puede usar cache de lectura, pero nunca como fuente maestra.

| Cache | TTL sugerido | Fuente |
|---|---|---|
| Lista de soluciones | 5 a 15 min | TecnoTelec API |
| Detalle de solucion | 5 a 15 min | TecnoTelec API + Core APIs |
| Productos relacionados | 5 a 15 min | Catalog/Pricing/Inventory |
| Filtros de solucion | 15 a 30 min | TecnoTelec API |

Cuando JobCron publique o pause una solucion, debe invalidar cache si existe.

## Compatibilidad con modelo actual

Actualmente `API.PY.DJANGO.TecnoTelec` tiene `ServiceConfig`, `LeadForm` y `ProjectCase`.

Propuesta:

- `ServiceConfig` puede mantenerse temporalmente como compatibilidad.
- `Solution` debe reemplazar gradualmente a `ServiceConfig` para soluciones publicas.
- `LeadForm` puede seguir capturando leads basicos.
- El flujo futuro debe mover cotizaciones formales a `Sales/Quote`.

No se debe forzar `ServiceConfig` para todo, porque una solucion necesita paquetes, preguntas, reglas, componentes y estado de publicacion.

## Etapas de implementacion

### Etapa 1: Modelo TecnoTelec

- Crear tablas `SolutionFamily`, `Solution`, `SolutionPackage`, `SolutionComponentGroup`, `SolutionComponentRule`, `SolutionDetailSection`, `SolutionQuestion`, `SolutionQuestionOption`.
- Mantener nombres PascalCase en base.
- Crear endpoints internos/publicos de TecnoTelec API.

### Etapa 2: Gateway

- Crear `GET /api/public/solutions/`.
- Crear `GET /api/public/solutions/{slug}/`.
- Resolver reglas contra Catalog.
- Enriquecer productos con Pricing e Inventory.
- Ocultar datos internos.

### Etapa 3: Web

- Cambiar `/soluciones` para consumir Gateway.
- Cambiar `/soluciones/[slug]` para detalle dinamico.
- Mostrar estados vacios cuando no haya datos.
- Conectar CTA a `/cotizador/[solution]`.

### Etapa 4: Diagnostico

- Renderizar preguntas desde `SolutionQuestion`.
- Guardar respuestas como lead inicial.
- Preparar payload para Sales/Quote.

### Etapa 5: Administracion

- JobCron/Admin valida soluciones.
- Reporta reglas sin productos.
- Reporta productos sin precio o imagen.
- Publica/pausa soluciones.

## Riesgos y controles

| Riesgo | Control |
|---|---|
| Mostrar soluciones con productos incorrectos. | No publicar sin reglas revisadas. |
| Mostrar precio cerrado sin datos completos. | Usar `QUOTE_REQUIRED`. |
| Copiar catalogo en TecnoTelec. | Guardar solo referencias y reglas. |
| Gateway como base maestra. | Gateway solo compone y cachea temporalmente. |
| Web lenta por muchas llamadas. | Gateway agrega datos y usa cache controlado. |
| Datos falsos en web. | Estados vacios obligatorios. |

## Criterio de listo para implementar

Se puede implementar cuando esten aprobados:

1. Tablas propuestas.
2. Campos minimos.
3. Endpoints publicos.
4. Primeras familias de solucion.
5. Regla para mostrar precio: `QUOTE_REQUIRED`, `FROM_PRICE` o `FIXED_PRICE`.
6. Criterio de publicacion desde JobCron/Admin.

## Decision propuesta

Implementar soluciones como entidades propias de `TecnoTelec API` en la base `comercial`, schema `TecnoTelec`, con tablas PascalCase. Las soluciones deben guardar contenido comercial y reglas de seleccion, mientras que productos, marcas, categorias, precios, disponibilidad y proveedor se toman dinamicamente desde los Core APIs por medio del Gateway.
