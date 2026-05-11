# Estrategia de armado y presentacion de soluciones Tecno Telec

> Estado: propuesta para revision.

## Objetivo

Definir como Tecno Telec debe armar, publicar y presentar soluciones tecnologicas en la web sin convertir la experiencia en un catalogo generico ni en una lista tecnica de APIs.

Una solucion no es un producto aislado. Una solucion es una oferta consultiva que combina necesidad del cliente, diagnostico, productos, servicios, instalacion, configuracion, soporte, garantia, precio estimado y cotizacion final.

## Regla principal

La web debe vender primero soluciones y despues permitir comprar o cotizar productos.

```text
Cliente
  -> necesidad o problema
  -> familia de solucion
  -> diagnostico guiado
  -> paquete recomendado
  -> productos, servicios y alcance
  -> cotizacion
  -> proyecto o venta
```

El catalogo de productos existe para apoyar la decision. No debe dominar la experiencia cuando el usuario esta buscando una solucion completa.

## Diferencia entre solucion, paquete y producto

| Concepto | Definicion | Ejemplo | Fuente |
|---|---|---|---|
| Solucion | Oferta completa orientada a una necesidad. | Videovigilancia para negocio. | TecnoTelec API |
| Paquete | Variante armable de una solucion. | Esencial, Profesional, Empresarial. | TecnoTelec API / Catalog |
| Producto | SKU publicable o componente tecnico. | Camara IP, NVR, switch PoE. | Catalog / Supplier |
| Servicio | Trabajo necesario para entregar la solucion. | Instalacion, configuracion, soporte. | TecnoTelec API / Projects |
| Cotizacion | Snapshot comercial validado. | Propuesta para 8 camaras instaladas. | Sales / Quote |

## Familias iniciales de soluciones

Estas familias deben ser la base comercial inicial. Pueden crecer, pero no deben publicarse nuevas familias sin documentar alcance, preguntas, componentes y reglas.

| Familia | Necesidad del cliente | Ejemplos de soluciones |
|---|---|---|
| Videovigilancia y CCTV | Seguridad, monitoreo, evidencia. | Camaras para negocio, camaras para bodega, monitoreo remoto. |
| Redes, WiFi y conectividad | Internet estable, cobertura, rendimiento. | WiFi empresarial, red para oficina, enlaces punto a punto. |
| Energia solar, UPS y respaldo | Ahorro, continuidad electrica, proteccion. | Respaldo para camaras, UPS para oficina, energia solar comercial. |
| Cableado estructurado y fibra | Infraestructura confiable. | Cableado para oficina, fibra interna, rack y organizacion. |
| Control de acceso e interfonia | Control de entradas, asistencia y comunicacion. | Acceso con biometrico, chapa electrica, videoportero. |
| Automatizacion y soporte empresarial | Operacion, monitoreo y mantenimiento. | Soporte preventivo, monitoreo, automatizacion basica. |

## Modelo documental de una solucion

Cada solucion publicada debe tener como minimo:

| Campo | Uso |
|---|---|
| `Slug` | Identificador estable para URL y Gateway. |
| `Title` | Nombre visible para el cliente. |
| `ShortPitch` | Descripcion breve enfocada en beneficio. |
| `ProblemStatement` | Problema que resuelve. |
| `IdealCustomer` | Tipo de cliente recomendado. |
| `Vertical` | Familia comercial. |
| `UseCases` | Escenarios donde aplica. |
| `CoverImage` | Imagen comercial real o curada. |
| `Questionnaire` | Preguntas para diagnostico. |
| `Packages` | Variantes de alcance. |
| `ComponentGroups` | Productos y servicios requeridos u opcionales. |
| `Deliverables` | Que recibe el cliente. |
| `Exclusions` | Que no incluye. |
| `CommercialAvailability` | Publicada, cotizable, pausada o interna. |
| `PrimaryCTA` | Comenzar diagnostico, cotizar o hablar con asesor. |

## Paquetes recomendados

Cada solucion puede tener tres niveles comerciales. Los nombres deben ser claros para el usuario final:

| Paquete | Enfoque | Cuando usarlo |
|---|---|---|
| Esencial | Resolver la necesidad minima viable. | Negocios pequenos o presupuesto ajustado. |
| Profesional | Balance entre alcance, calidad y crecimiento. | Oficinas, comercios y operaciones con uso constante. |
| Empresarial | Proyecto robusto, escalable y con soporte. | Bodegas, escuelas, empresas o sitios criticos. |

Los paquetes no deben mostrar precio fijo si faltan reglas de calculo, instalacion, envio, compatibilidad o margen. En ese caso se debe mostrar:

```text
Cotizacion con diagnostico
```

Si existe regla completa y validada, se permite mostrar:

```text
Desde $X
```

## Como se arma una solucion

El armado debe seguir este flujo antes de publicarse:

1. Definir la necesidad principal.
2. Definir el segmento recomendado.
3. Definir alcance incluido y excluido.
4. Definir preguntas de diagnostico.
5. Definir paquetes comerciales.
6. Vincular categorias, marcas o productos elegibles.
7. Definir componentes requeridos, opcionales y servicios.
8. Validar disponibilidad con Inventory y Supplier.
9. Validar precios con Pricing.
10. Generar cotizacion por Sales/Quote.
11. Publicar solo si JobCron/Admin aprueba el contenido.

## Grupos de componentes

Las soluciones no deben mezclar todo en una sola lista. Deben agrupar componentes para que el cliente entienda el alcance.

| Grupo | Ejemplo | Visibilidad |
|---|---|---|
| Equipo principal | Camaras, NVR, panel solar, access point. | Visible |
| Infraestructura | Cable, conectores, rack, canalizacion. | Visible como resumen |
| Energia | UPS, fuente, proteccion. | Visible si aplica |
| Servicios | Instalacion, configuracion, puesta en marcha. | Visible |
| Opcionales | Monitoreo, mantenimiento, garantia extendida. | Visible |
| Internos | Costos, proveedor, margen, reglas privadas. | No visible |

## Presentacion en la web

### Pagina `/soluciones`

Debe funcionar como centro de decision, no como catalogo de cards sin contexto.

Debe mostrar:

- Busqueda por necesidad.
- Filtro por familia.
- Filtro por tipo de cliente o escenario.
- Cards de solucion con problema, beneficio y CTA.
- Salida rapida a productos si el usuario quiere comprar directo.
- Mensaje `Sin soluciones publicadas por el momento` si no hay datos reales.

Cada card debe responder rapidamente:

```text
Que problema resuelve?
Para quien es?
Que resultado obtiene el cliente?
Que hago despues?
```

### Pagina `/soluciones/[slug]`

Debe explicar alcance y convertir a diagnostico o contacto.

Secciones recomendadas:

1. Hero con nombre de solucion, beneficio y CTA.
2. Problemas que resuelve.
3. Para quien aplica.
4. Paquetes Esencial, Profesional y Empresarial.
5. Que incluye.
6. Productos compatibles o componentes relacionados.
7. Proceso de diagnostico y cotizacion.
8. Preguntas frecuentes.
9. CTA final a diagnostico, WhatsApp o contacto.

Los productos dentro de esta pagina deben verse como parte de la solucion, no como una tienda separada.

### Pagina `/catalogo`

El catalogo sigue existiendo para usuarios que ya saben que producto buscan.

Debe permitir:

- Buscar productos.
- Filtrar por multiples marcas.
- Filtrar por multiples categorias.
- Filtrar por precio.
- Ordenar por nombre o precio automaticamente.
- Cambiar cantidad por pagina automaticamente.
- Ver imagen, marca, categoria, precio y disponibilidad.

Desde el producto se puede sugerir:

```text
Este producto puede formar parte de estas soluciones.
```

## Arquitectura

La responsabilidad debe respetar el patron actual:

```text
Web Tecno Telec
  -> TecnoTelec Gateway API
  -> TecnoTelec API para reglas propias de solucion
  -> Core APIs para datos principales
  -> JobCron/Admin para publicacion y sincronizacion
```

| Capa | Responsabilidad |
|---|---|
| Web Tecno Telec | Experiencia visual, navegacion, diagnostico y conversion. |
| Gateway | Componer datos para la web, sin volverse base maestra. |
| TecnoTelec API | Soluciones, paquetes, textos, reglas propias y publicacion. |
| Catalog API | Productos, categorias, marcas, bundles reutilizables. |
| Pricing API | Precio comercial, listas y reglas de precio. |
| Inventory API | Disponibilidad propia o calculada. |
| Supplier API | Catalogo y disponibilidad de proveedor. |
| Sales/Quote | Cotizacion final y snapshot comercial. |
| JobCron/Admin | Sincronizacion, aprobacion y tareas programadas. |

## Reglas para no inventar datos

- No mostrar soluciones falsas si TecnoTelec API no devuelve soluciones publicadas.
- No mostrar productos inventados dentro de una solucion.
- No afirmar compatibilidad tecnica sin regla documentada.
- No mostrar precio cerrado si faltan reglas de instalacion, envio, margen o disponibilidad.
- No convertir Gateway en base maestra.
- No usar lenguaje de APIs en la web publica.
- Si una seccion depende de datos dinamicos y no hay datos, mostrar `Sin datos por el momento`.

## Reglas de experiencia

- El usuario debe poder elegir entre `Necesito una solucion` y `Quiero ver productos`.
- Cada pagina publica debe tener al menos una salida clara hacia diagnostico, cotizacion, productos o contacto.
- La solucion debe explicar beneficios antes que componentes.
- Los productos se muestran con lenguaje comercial: imagen, precio, existencia y uso recomendado.
- La interfaz movil debe priorizar busqueda, filtros simples, CTA y lectura rapida.
- Las transiciones visuales pueden usarse para mejorar claridad, pero no deben ocultar informacion ni volver lenta la navegacion.

## MVP recomendado

Para la primera etapa se recomienda:

1. Crear familias de soluciones con contenido editorial aprobado.
2. Crear paquetes Esencial, Profesional y Empresarial sin precio fijo cuando falten reglas.
3. Vincular cada solucion con categorias reales del catalogo.
4. Mostrar productos relacionados solo cuando existan datos reales.
5. Crear diagnostico basico por solucion.
6. Generar lead o cotizacion inicial para revision humana.
7. Dejar automatizacion avanzada para una etapa posterior.

## Pendientes para desarrollo

| Pendiente | Proyecto responsable | Motivo |
|---|---|---|
| Modelo `Solution` | TecnoTelec API | Fuente de verdad de soluciones publicadas. |
| Modelo `SolutionPackage` | TecnoTelec API / Catalog | Variantes comerciales por alcance. |
| Modelo `SolutionQuestion` | TecnoTelec API | Diagnostico por necesidad. |
| Endpoint publico de soluciones | Gateway | Consumo desde la web. |
| Relacion solucion-producto | TecnoTelec API / Catalog | Mostrar componentes reales. |
| Administracion de publicacion | JobCron/Admin | Aprobar contenido antes de publicarlo. |
| Reglas de compatibilidad | Rules/Catalog | Evitar recomendaciones incorrectas. |
| Cotizador guiado | Gateway / Sales / Quote | Convertir diagnostico en cotizacion. |

## Orden sugerido para leer y analizar

1. Este documento.
2. `01_dynamic_solution_technical_design.md`
3. `../business/00_tecnotelec_identity.md`
4. `../frontend/15_site_navigation_map.md`
5. `../frontend/17_user_navigation_experience_review.md`
6. `../../../01_core_erp/erp/15_bundles_kits.md`
7. `../../../01_core_erp/erp/20_channel_assortment.md`
8. `../catalog/00_public_catalog_process.md`
9. `../quotes/00_quote_process.md`

## Propuesta de decision

Tecno Telec debe presentar soluciones como rutas comerciales guiadas por necesidad. Cada solucion debe ser una ficha viva compuesta por contenido editorial, paquetes, diagnostico, componentes reales y cotizacion. El catalogo debe permanecer como camino alterno para usuarios que ya conocen el producto que buscan.

Esta estrategia permite avanzar por etapas sin inventar datos:

- Primero contenido y experiencia.
- Despues relaciones con categorias y productos reales.
- Despues paquetes y diagnostico.
- Finalmente cotizacion automatizada con reglas completas.
