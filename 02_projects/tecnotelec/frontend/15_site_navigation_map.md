# Mapa de navegacion Tecno Telec

## Objetivo

Documentar la navegacion completa de Tecno Telec aunque algunas paginas sigan como placeholder. Este mapa guia el frontend sin inventar integraciones fuera de la arquitectura.

## Arbol general

```txt
/
  /soluciones
    /soluciones/[slug]
  /catalogo
    /catalogo/[slug]
  /cotizador
    /cotizador/[solution] pendiente
  /contacto
  /login
  /portal
    /portal/cotizaciones pendiente
    /portal/proyectos pendiente
    /portal/soporte pendiente
    /portal/documentos pendiente
  /admin
    /admin/leads pendiente
    /admin/cotizaciones pendiente
    /admin/catalogo-visible pendiente
    /admin/reglas pendiente
    /admin/configuracion pendiente
  /carrito pendiente
  /checkout pendiente
  /licitaciones futuro
```

## Clasificacion por pagina

| Ruta | Tipo | Objetivo | Dependencias | Estado |
|---|---|---|---|---|
| `/` | Publica / Comercial | Presentar marca, soluciones y conversion. | Gateway | Implementada |
| `/soluciones` | Publica / Comercial | Mostrar oferta por necesidad. | Gateway | Implementada |
| `/soluciones/[slug]` | Publica / Comercial | Explicar alcance y llevar a diagnostico. | Gateway | Implementada |
| `/catalogo` | Publica / Catalogo consultivo | Mostrar productos publicables. | Gateway, Catalog, Pricing via Gateway | Implementada |
| `/catalogo/[slug]` | Publica / Catalogo consultivo | Ficha tecnica, precio permitido y cotizacion. | Gateway | Implementada |
| `/cotizador` | Publica / Cotizacion | Capturar necesidad inicial. | Gateway, Sales | Implementada |
| `/cotizador/[solution]` | Publica / Cotizacion | Flujo guiado por solucion. | Gateway, reglas | Pendiente |
| `/contacto` | Publica / Soporte comercial | Convertir prospectos y soporte inicial. | Gateway | Implementada |
| `/login` | Publica / Auth | Ingreso a cuenta. | Auth via Gateway | Implementada |
| `/portal` | Privada / Cliente | Resumen de cotizaciones, proyectos y soporte. | Auth, Sales via Gateway | Parcial |
| `/admin` | Administrativa | Operacion interna de Tecno Telec. | Auth, Gateway, JobCron | Placeholder |
| `/carrito` | Ecommerce | Intencion de compra/cotizacion. | Gateway, futuro Cart | Pendiente |
| `/checkout` | Ecommerce | Confirmacion de datos, pago/envio si aplica. | Gateway, Sales | Pendiente |
| `/licitaciones` | Comercial / Futuro | Gestionar oportunidades gobierno/empresa. | Futuro modulo | Futuro |

## Flujo visitante

```txt
Inicio
  -> Soluciones
  -> Detalle solucion
  -> Cotizador
  -> Contacto o Lead
```

Flujo alterno:

```txt
Inicio
  -> Catalogo
  -> Detalle producto
  -> Agregar a cotizacion
  -> Cotizador
```

## Flujo cliente autenticado

```txt
Portal
  -> Mis cotizaciones
  -> Proyecto
  -> Soporte
  -> Documentos
```

## Flujo administrativo

```txt
Admin
  -> Leads
  -> Cotizaciones
  -> Proyectos
  -> Catalogo visible
  -> Reglas
  -> Configuracion
```

## Arbol ecommerce

```txt
Catalogo
  -> Categoria
  -> Detalle producto
  -> Agregar a cotizacion
  -> Carrito pendiente
  -> Checkout pendiente
```

El ecommerce no debe adelantarse a Pricing, Sales y politica comercial. Mientras no exista checkout real, el CTA principal es cotizacion.

## Arbol ERP

```txt
JobCron
  -> Auth
  -> Catalog
  -> Pricing
  -> Inventory
  -> Supplier
  -> Sales
  -> TecnoTelec Gateway
  -> TecnoTelec API
```

Tecno Telec no administra datos maestros directamente. Los datos maestros viven en Core APIs y se exponen al sitio por Gateway.

## Navegacion mobile

- Header compacto con logo, menu y CTA de diagnostico.
- Drawer con rutas publicas y estado pendiente.
- Acciones de contacto y WhatsApp siempre disponibles en paginas comerciales.
- Filtros de catalogo en drawer, no en columna fija.
- Cotizador por pasos de una sola columna.

## SEO

- Mantener URLs en espanol y legibles.
- Usar `/soluciones/[slug]` para necesidades y servicios.
- Usar `/catalogo/[slug]` para productos publicables.
- Breadcrumb obligatorio en detalle de solucion y producto.
- No indexar rutas privadas, admin, carrito ni checkout incompleto.

## Supuestos temporales

- `/portal` concentra cuenta de usuario hasta crear subrutas reales.
- `/admin` queda como placeholder hasta que JobCron defina permisos y vistas.
- `/carrito` y `/checkout` se documentan, pero no se priorizan para MVP consultivo.

## Contradicciones detectadas

No hay contradiccion critica. La estructura minima de los agentes incluye blog y nosotros, pero la documentacion vigente prioriza soluciones, catalogo, cotizacion, contacto, portal y admin. Blog y nosotros quedan fuera del MVP hasta que se documenten como estrategia comercial.

## Pendientes

- Definir subrutas reales de portal cliente.
- Definir permisos de admin desde Auth/JobCron.
- Definir si carrito sera carrito de compra o carrito de cotizacion.
- Crear contrato de busqueda global desde Gateway.
