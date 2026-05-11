# Extraccion visual del PDF JobCron

## Conversion

PDF original:

```text
Docs/_archive/image/jobcron/especificaciones cron.pdf
```

Imagen generada:

```text
Docs/_archive/image/jobcron/converted/jobcron_pdf_page_01.png
```

Comando usado:

```powershell
python -c "import fitz, pathlib; pdf=pathlib.Path(r'Docs\_archive\image\jobcron\especificaciones cron.pdf'); out=pdf.parent/'converted'; out.mkdir(exist_ok=True); doc=fitz.open(pdf); [doc.load_page(i).get_pixmap(matrix=fitz.Matrix(2,2), alpha=False).save(out/f'jobcron_pdf_page_{i+1:02d}.png') for i in range(doc.page_count)]"
```

Dependencia usada:

```text
PyMuPDF
```

## Hallazgo principal

El PDF no representa una consola administrativa. Representa la pagina inicial de una web publica/corporativa para Cron/JobCron.

La implementacion actual en `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron` es una consola ERP administrativa. Esa implementacion puede ser valida para el producto interno, pero no replica la maqueta historica del PDF.

## Composicion visible

| Bloque | Descripcion |
|---|---|
| Header | Logo Cron a la izquierda y menu horizontal: Inicio, Quienes somos?, Productos, Industrias, Servicios, Contacto. |
| Hero | Imagen corporativa full width de oficina/negocios, con altura aproximada de 893 px en la referencia. |
| Login | Caja semitransparente de 315 x 205 px aproximadamente, alineada al area derecha del hero. |
| Marca central | Imagotipo Cron grande centrado debajo del hero superior. |
| Soluciones | Titulo "Soluciones de negocio" y grid de tarjetas/botones. |
| Footer | Imagen de fondo, overlay azul, texto "Siguenos en" e iconos sociales. |

## Soluciones de negocio detectadas

- Empresa cliente.
- Recursos empresariales.
- Gestion de proveedores.
- Recursos humanos.
- Control de inventarios.
- Gestion y mantenimiento de activos.
- Planeacion y programacion avanzada.
- Actualizacion de datos.
- Gestion de calidad.
- Gestion de transporte.
- Gestion de almacenes.
- Ciclo de vida del producto.
- Cadena de suministros.
- Inteligencia de negocios.
- Comprobante fiscal por internet.
- Punto de venta.
- Servicio de notificaciones electronicas.

## Implicacion para el proyecto

JobCron deberia dividirse en dos experiencias:

| Experiencia | Ruta sugerida | Objetivo |
|---|---|---|
| Sitio publico | `/` o dominio publico `jobcron.com` | Presentar soluciones, industrias, servicios y acceso. |
| Admin ERP | `/admin` o subdominio `admin.jobcron.com` | Operar empresas, proyectos, modulos, jobs, permisos y auditoria. |

## Propuesta visual mejorada

La mejor propuesta es no copiar literalmente la maqueta 2017, sino modernizar su intencion:

1. Mantener una home publica con hero fotografico real, marca visible y acceso claro.
2. Reemplazar el grid rigido de iconos por tarjetas de soluciones con descripcion breve y CTA.
3. Conservar el concepto de "Soluciones de negocio" como catalogo comercial.
4. Llevar el login a una experiencia segura: modal o panel dedicado, con recuperacion y validaciones.
5. Separar completamente el admin interno para que no compita visualmente con la web comercial.

## Decision recomendada

La consola administrativa actual no debe desecharse. Debe moverse conceptualmente a la experiencia `Admin`.

La maqueta del PDF debe originar una nueva web publica JobCron, con rutas comerciales:

```text
/
/quienes-somos
/productos
/industrias
/servicios
/contacto
/login
```

La ruta `/login` debe conectar hacia la consola administrativa cuando exista autenticacion real.
