# Especificacion visual de maqueta Tecno Telec

## Objetivo

Consolidar el analisis visual y la maqueta inicial de la web Tecno Telec usando la documentacion existente, el PDF historico extraido en `Docs/tecnotelec-ui` y la propuesta de interfaz en `09_interface_proposal.md`.

Esta especificacion no inicia implementacion. Define pantallas, reglas visuales, componentes y pendientes para que el frontend `WEB.NJ.NEXT.TecnoTelec` pueda construirse despues sin salirse del alcance actual.

## Analisis visual

Ya existe una fuente visual historica y una propuesta documental:

| Fuente | Estado | Uso |
|---|---|---|
| `Docs/tecnotelec-ui/` | Bocetos extraidos de PDF | Referencia historica, no interfaz final exacta. |
| `04_web_references.md` | Detectado | Mapa de referencias visuales. |
| `05_design_system.md` | Propuesto | Base de color, tipografia y componentes. |
| `09_interface_proposal.md` | Propuesto | Direccion visual canonica. |
| `12_initial_web_blueprint.md` | Propuesto | Layout inicial implementable. |

Conclusion:

Tecno Telec ya tiene maqueta base documentada. La mejora necesaria es cerrar detalles de catalogo, producto, secciones privadas, estados visuales y reglas de imagen sin convertir la web en marketplace generico.

## Principio de diseno

La web debe sentirse como una consultora e integradora de soluciones tecnologicas. El catalogo existe para apoyar cotizacion, diagnostico y proyectos; no debe dominar la experiencia como tienda masiva.

## Estructura general

```text
Topbar contacto rapido
Header principal
Contenido por pagina
CTA consultivo contextual
Contacto / WhatsApp
Footer
```

Reglas:

- El header prioriza soluciones, diagnostico y asesoria.
- El CTA principal es `Comienza tu diagnostico`.
- WhatsApp debe estar disponible en home, soluciones, detalle, cotizador y contacto.
- Carrito y checkout quedan como fase posterior salvo que el alcance MVP cambie.

## Menu principal

Desktop:

```text
Logo
Soluciones
Proyectos
Catalogo
Diagnostico
Asesoria
Contacto
Cuenta
CTA: Comienza tu diagnostico
```

Mobile:

```text
Logo
Menu
CTA compacto: Diagnostico
```

Dentro del menu mobile:

- Soluciones.
- Proyectos.
- Catalogo.
- Diagnostico.
- Contacto.
- Cuenta.
- WhatsApp.

## Home

Distribucion:

1. Hero con imagen realista de casa, empresa, red, energia o seguridad integrada.
2. Soluciones destacadas en grid.
3. Diagnostico guiado resumido.
4. Catalogo consultivo destacado.
5. Proyectos tipo.
6. Beneficios y confianza.
7. Asesoria y contacto.
8. Footer.

Hero:

- Titulo: `Soluciones tecnologicas integradas para tu hogar o empresa`.
- Texto: `Disenamos, instalamos y conectamos sistemas de energia, red, seguridad y automatizacion que trabajan juntos.`
- Acciones: `Explorar soluciones`, `Comienza tu diagnostico`, `Hablar por WhatsApp`.

## Secciones publicas

| Seccion | Objetivo | Pantalla |
|---|---|---|
| Inicio | Presentar marca, soluciones y conversion. | `/` |
| Soluciones | Mostrar oferta por necesidad. | `/soluciones` |
| Detalle solucion | Explicar alcance, beneficios y cotizacion. | `/soluciones/[slug]` |
| Catalogo | Mostrar productos publicables como apoyo consultivo. | `/catalogo` |
| Detalle producto | Informar ficha tecnica y uso dentro de soluciones. | `/catalogo/[slug]` |
| Diagnostico | Capturar necesidades. | `/cotizador` |
| Contacto | Convertir prospectos. | `/contacto` |

## Secciones privadas

Cliente:

```text
Resumen
Cotizaciones
Proyectos
Soporte
Documentos
Perfil
```

Administrador:

```text
Resumen comercial
Leads
Cotizaciones
Proyectos
Catalogo visible
Reglas
Soporte
Licitaciones
Configuracion
```

Reglas:

- El cliente ve seguimiento, documentos y estados.
- El administrador ve operacion y configuracion.
- Toda seccion privada requiere rol y estados de permisos.

## Catalogo de productos

El catalogo debe llamarse y presentarse como catalogo consultivo.

Layout desktop:

```text
Header de catalogo
Filtros laterales
Grid de productos
Panel de ayuda / cotizacion
```

Layout mobile:

```text
Header de catalogo
Filtros en drawer
Grid de 1 columna
CTA fijo de cotizacion
```

Filtros:

- Categoria.
- Marca.
- Tipo de solucion.
- Disponibilidad.
- Rango de precio.
- Uso: `SELLABLE`, `QUOTE_ONLY`, `COMPONENT_ONLY`.

Reglas:

- Productos `BLOCKED` no se muestran.
- Productos `COMPONENT_ONLY` se muestran solo dentro de soluciones o fichas tecnicas relacionadas.
- Productos `QUOTE_ONLY` muestran CTA de cotizacion, no compra directa.
- Productos sin datos suficientes deben mostrar `Requiere validacion tecnica`.

## Tarjeta de producto

Contenido:

- Imagen cuadrada.
- Marca.
- Nombre comercial.
- Modelo o SKU.
- Categoria.
- Uso recomendado.
- Estado de disponibilidad.
- Precio o rango, segun politica.
- CTA principal.
- CTA secundario a WhatsApp o cotizacion.

Estados de CTA:

| Tipo producto | CTA principal |
|---|---|
| `SELLABLE` | `Agregar a cotizacion` |
| `QUOTE_ONLY` | `Cotizar con asesor` |
| `COMPONENT_ONLY` | `Ver solucion compatible` |

La tarjeta no debe parecer una tienda generica con descuento agresivo. Priorizar utilidad tecnica, compatibilidad y asesoria.

## Detalle de producto

Estructura:

```text
Breadcrumb
Galeria / carrusel
Resumen tecnico
Precio o rango
Disponibilidad
Uso dentro de soluciones
Compatibilidades
Ficha tecnica
Productos relacionados
CTA de cotizacion
```

Reglas:

- El precio exacto se muestra solo si Pricing lo permite.
- Si el precio depende de instalacion, ubicacion o volumen, mostrar rango o `Requiere cotizacion`.
- El detalle debe explicar cuando el producto es componente de una solucion.
- Accesorios y relacionados deben apoyar compatibilidad, no venta impulsiva.

## Categorias

Presentacion:

- Categoria principal con imagen banner.
- Descripcion corta orientada a necesidad.
- Soluciones relacionadas.
- Productos destacados.
- CTA de diagnostico.

Categorias iniciales:

- Redes y WiFi.
- Videovigilancia.
- Energia solar.
- Respaldo electrico.
- Control de acceso.
- Telecomunicaciones.
- Cableado estructurado.
- Equipamiento tecnologico.

## Marcas

Presentacion:

- Logo en fondo blanco.
- Nombre.
- Especialidad.
- Categorias asociadas.
- Productos publicados.

Reglas:

- Los logos no deben deformarse.
- Usar escala sobria, sin crear bloques promocionales excesivos.
- Si una marca no tiene logo validado, mostrar placeholder neutro.

## Precios

Formatos permitidos:

| Caso | Presentacion |
|---|---|
| Precio publico confirmado | `Desde $X MXN` o `$X MXN`. |
| Precio por proyecto | `Requiere cotizacion`. |
| Precio sujeto a volumen | `Cotiza precio por volumen`. |
| Precio con instalacion | `Precio final con diagnostico`. |
| Sin contrato Pricing | `No encontrado en la documentacion actual.` |

Reglas:

- No inventar descuentos.
- No mostrar precios si Pricing no confirma lista, impuestos y margen.
- El total preliminar de cotizador debe aclarar que puede cambiar con visita o validacion tecnica.

## Imagenes

Estandares:

| Uso | Tamano | Regla |
|---|---|---|
| Hero desktop | 1920x720 | Imagen realista, sin texto incrustado. |
| Hero mobile | 1080x1350 | Enfoque claro, sin recortes criticos. |
| Card de solucion | 800x600 | Relacion 4:3. |
| Producto principal | 1000x1000 | Fondo blanco o gris claro. |
| Miniatura | 300x300 | Consistente con producto principal. |
| Banner categoria | 1600x500 | Contexto de uso, no collage saturado. |
| Logo marca | SVG o 512x512 | Mantener proporcion. |
| Iconos | 24x24 / 32x32 | Lineales, consistentes. |

## Carrusel de producto

Orden sugerido:

1. Imagen principal del producto.
2. Imagen lateral o detalle.
3. Producto instalado o en contexto.
4. Diagrama o ficha visual si existe.
5. Accesorios o componentes incluidos.

Reglas:

- Miniaturas visibles en desktop.
- Swipe en mobile.
- Zoom o vista ampliada en desktop.
- Placeholder si no hay imagen.
- No bloquear cotizacion si falta una imagen secundaria.

## Colores

| Rol | Color |
|---|---|
| Primario | `#0070de` |
| Texto principal | `#111827` |
| Texto secundario | `#4b5563` |
| Fondo | `#ffffff` |
| Fondo suave | `#f3f6fb` |
| Borde | `#dbe3ef` |
| Acento humano | `#f5b700` |
| Exito | `#15803d` |
| Advertencia | `#b45309` |
| Error | `#b91c1c` |

El amarillo se reserva para contacto humano, WhatsApp contextual o destacados puntuales.

## Tipografia

Fuente recomendada: `Inter` o `Roboto`.

Escala:

| Uso | Tamano recomendado |
|---|---|
| H1 desktop | 44-56 px |
| H1 mobile | 32-38 px |
| H2 | 28-36 px |
| H3 | 20-24 px |
| Texto base | 16 px |
| Texto auxiliar | 14 px |
| Tablas/admin | 13-14 px |

Pendiente: confirmar fuente final de marca.

## Espaciados

| Uso | Valor |
|---|---|
| Max width contenido | 1200-1280 px |
| Padding desktop | 48-64 px |
| Padding tablet | 32 px |
| Padding mobile | 20 px |
| Gap cards | 20-24 px |
| Radio de cards | 8 px |
| Altura boton | 44-48 px |

## Botones

Tipos:

- Primario azul: diagnostico, cotizacion, avanzar.
- Secundario blanco: explorar, ver detalle.
- Acento amarillo: WhatsApp o asesoria humana.
- Ghost: acciones secundarias en dashboard.
- Destructivo: solo admin y confirmaciones.

Reglas:

- Los botones deben tener estados hover, focus, disabled y loading.
- El texto debe ser accion concreta.
- No usar mas de dos CTAs compitiendo en una misma tarjeta.

## Formularios

Componentes:

- Campo de texto.
- Telefono/WhatsApp.
- Correo.
- Select de solucion.
- Textarea de necesidad.
- Checkbox de consentimiento.
- Stepper de diagnostico.

Reglas:

- Validacion por campo.
- Mensajes de error claros.
- Guardar avance de cotizador si el usuario navega dentro del flujo.
- Confirmacion visual despues de enviar.

## Banners

Tipos:

- Hero principal.
- Banner de categoria.
- Banner de solucion.
- CTA de asesoria.
- Aviso informativo.

Reglas:

- No usar banners con texto incrustado en imagen.
- Mantener contraste alto.
- Evitar composiciones promocionales tipo marketplace.

## Servicios

Las secciones de servicios deben organizarse por necesidad:

- Conectividad.
- Seguridad.
- Energia.
- Automatizacion.
- Infraestructura.
- Consultoria.

Cada servicio debe incluir:

- Problema que resuelve.
- Alcance.
- Componentes posibles.
- Tiempo o complejidad estimada si existe.
- CTA a diagnostico.

## Cotizacion

Pantalla principal:

```text
Paso actual
Pregunta principal
Opciones
Ayuda contextual
Resumen
Acciones
```

Pasos:

1. Tipo de espacio.
2. Necesidades.
3. Tamano/capacidad.
4. Ubicacion.
5. Presupuesto estimado.
6. Resultado preliminar.
7. Datos de contacto.

Resultado:

- Solucion recomendada.
- Componentes sugeridos.
- Rango estimado si Pricing lo permite.
- Tiempo estimado.
- Indicador de visita tecnica.

## Contacto

Debe incluir:

- Formulario.
- Telefono.
- WhatsApp.
- Correo.
- Ubicacion.
- Horarios.
- Asunto: cotizacion, asesoria, soporte, proyecto existente o licitacion.

## Responsive

Mobile:

- Header compacto.
- Menu en drawer.
- Cards en una columna.
- Cotizador por pasos.
- CTA WhatsApp visible sin tapar formularios.

Tablet:

- Cards en dos columnas.
- Resumen de cotizador plegable.
- Navegacion simple.

Desktop:

- Grids de 3 o 4 columnas.
- Filtros laterales.
- Dashboard con sidebar.
- Carrusel con miniaturas.

## Estados visuales

| Estado | Regla |
|---|---|
| Cargando | Skeleton con dimensiones estables. |
| Vacio | Mensaje breve + accion siguiente. |
| Error recuperable | Mensaje claro + reintentar. |
| Error de permisos | Explicar acceso requerido. |
| Exito | Confirmacion y siguiente paso. |
| Pendiente de asesor | Mostrar que un asesor revisara la solicitud. |
| Requiere informacion | Indicar campo o dato faltante. |

## Componentes necesarios

- `Topbar`.
- `MainHeader`.
- `MobileMenu`.
- `HeroSolution`.
- `SolutionCard`.
- `SolutionGrid`.
- `CatalogFilters`.
- `ProductCard`.
- `ProductGallery`.
- `ProductDetailSummary`.
- `BrandLogoGrid`.
- `CategoryBanner`.
- `QuoteStepper`.
- `QuoteSummary`.
- `LeadCaptureForm`.
- `ContactPanel`.
- `WhatsAppCTA`.
- `StatusBadge`.
- `DashboardShell`.
- `AdminSidebar`.
- `EmptyState`.
- `ErrorState`.
- `LoadingSkeleton`.

## Pendientes detectados

| Pendiente | Motivo |
|---|---|
| Fuente final de marca | Aun marcada como pendiente en sistema de diseno. |
| Contratos reales de Gateway | Necesarios antes de conectar frontend. |
| Politica final de precios publicos | Depende de Pricing y reglas comerciales. |
| Imagenes finales de productos/categorias | Dependen de proveedor o sesion visual propia. |
| Numero WhatsApp definitivo | Debe configurarse por variable. |
| Aviso de privacidad | Requerido antes de publicar formularios reales. |
| Carrito/checkout | Fase posterior segun MVP actual. |
| Licitaciones | Futuro salvo cambio de alcance. |

## Recomendaciones futuras

- Crear wireframes de baja fidelidad por ruta antes de programar.
- Definir contratos JSON del `tecnotelec-gateway-api`.
- Validar 5 a 8 productos reales para probar catalogo, detalle y cotizador.
- Preparar un set de imagenes reales o generadas para hero, categorias y servicios.
- Convertir esta especificacion en tickets de componentes cuando inicie `WEB.NJ.NEXT.TecnoTelec`.
