# Analisis de fuente visual JobCron

## Fuente localizada

Archivo encontrado:

```text
Docs/_archive/image/jobcron/especificaciones cron.pdf
```

Metadatos relevantes observados en el PDF:

| Campo | Valor |
|---|---|
| Titulo | especificaciones cron |
| Origen | Adobe Illustrator CS6 |
| Fecha de creacion | 2017-10-21 |
| Asset embebido | Imagotipo cron.png |
| Tipo de referencia | Boceto grafico / especificacion visual historica |

## Imagen convertida

El PDF fue convertido a PNG para revisar la maqueta completa:

```text
Docs/_archive/image/jobcron/converted/jobcron_pdf_page_01.png
```

El archivo contiene una sola pagina de especificacion visual. La maqueta visible corresponde a un sitio web publico/corporativo de 1400 px de ancho, no a una consola ERP administrativa.

## Lectura tecnica

El PDF funciona como especificacion grafica de una pagina inicial publica. Incluye medidas, reglas de hover, espacios entre bloques y notas de alineacion, pero no define arquitectura funcional interna ni contratos de datos.

La maqueta historica debe tratarse como referencia concreta para identidad visual, home publica y login, no como base directa de la consola administrativa actual.

## Elementos visibles en la maqueta

| Zona | Elementos |
|---|---|
| Header | Logo Cron, menu superior: Inicio, Quienes somos?, Productos, Industrias, Servicios, Contacto. |
| Hero | Imagen corporativa de oficina/negocios con composicion full width. |
| Login | Recuadro gris translucido con usuario, correo electronico, contrasena, recordar contrasena, olvide contrasena e iniciar sesion. |
| Marca central | Imagotipo Cron grande sobre la imagen. |
| Seccion principal | Titulo "Soluciones de negocio". |
| Grid de soluciones | Botones de 215 x 215 con texto e icono centrados. |
| Soluciones listadas | Empresa cliente, recursos empresariales, gestion de proveedores, recursos humanos, control de inventarios, gestion y mantenimiento de activos, planeacion y programacion avanzada, actualizacion de datos, gestion de calidad, gestion de transporte, gestion de almacenes, ciclo de vida del producto, cadena de suministros, inteligencia de negocios, comprobante fiscal por internet, punto de venta, servicio de notificaciones electronicas. |
| Footer | Fondo fotografico con overlay azul, redes sociales y texto "Siguenos en". |

## Decision de interpretacion actualizada

JobCron necesita separar dos superficies:

| Superficie | Proposito |
|---|---|
| Web publica JobCron | Presentacion de soluciones de negocio, acceso/login y comunicacion comercial. Esta es la superficie representada por el PDF. |
| Consola JobCron Admin | ERP central del ecosistema: empresas, proyectos, modulos, jobs, reglas, permisos, auditoria y backoffice. Esta es la maqueta implementada actualmente. |

## Elementos a conservar del boceto historico

| Elemento | Aplicacion en nueva web |
|---|---|
| Nombre/imagotipo Cron | Marca principal de la web publica y referencia visual para JobCron. |
| Hero fotografico | Puede inspirar una home publica moderna, no la consola interna. |
| Menu publico | Sirve como mapa inicial de sitio corporativo. |
| Login visible | Debe conservarse como acceso a la consola administrativa. |
| Soluciones de negocio | Deben mapearse a modulos/verticales de producto. |
| Footer social | Puede mantenerse solo si JobCron opera como marca publica. |

## Elementos a actualizar

| Elemento anterior | Nuevo criterio |
|---|---|
| Home estatica 2017 | Home publica responsive con contenido administrable. |
| Login incrustado sobre hero | Acceso claro con seguridad moderna, validaciones y estados. |
| Iconos estaticos | Catalogo de soluciones conectado a modulos reales. |
| Medidas fijas de 1400 px | Layout responsive con max-width y breakpoints. |
| Redes sociales heredadas | Footer actualizado segun canales reales. |
| Estilo visual antiguo | Identidad mas sobria, profesional y compatible con SaaS actual. |

## Salida creada

La nueva maqueta vive en:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron
```

Documentos complementarios:

```text
Docs/02_projects/jobcron/ui/01_navigation_map.md
Docs/02_projects/jobcron/ui/02_layout_and_design_system.md
Docs/02_projects/jobcron/ui/03_dynamic_content_model.md
```
