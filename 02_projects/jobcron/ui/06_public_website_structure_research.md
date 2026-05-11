# Investigacion y propuesta de web publica JobCron

## Objetivo

Definir una estructura web mejorada para JobCron a partir de la maqueta historica del PDF convertido y de patrones actuales de sitios B2B/SaaS.

## Referencias revisadas

| Fuente | Hallazgo aplicado |
|---|---|
| W3C WAI - Forms Tutorial: https://www.w3.org/WAI/tutorials/forms/ | Los formularios de login/contacto deben usar labels reales, instrucciones claras y pedir solo lo necesario. |
| W3C WAI - Labeling Controls: https://www.w3.org/WAI/tutorials/forms/labels/ | Los inputs no deben depender solo de placeholders; cada control necesita etiqueta asociada. |
| Salesforce homepage: https://www.salesforce.com/ | Un sitio B2B moderno organiza la propuesta por plataforma, productos, industrias, prueba de valor y CTA. |
| Salesforce pricing/products: https://www.salesforce.com/pricing/ | La navegacion por productos y por industria ayuda a distintos perfiles de compra. |
| Odoo Apps: https://apps.odoo.com/ | Un ERP modular se entiende mejor agrupando aplicaciones por dominios funcionales e industrias. |
| Webstacks B2B IA Guide: https://www.webstacks.com/blog/information-architecture | La arquitectura de informacion B2B debe servir a multiples stakeholders y journeys de compra. |
| Webstacks B2B SaaS site structure: https://www.webstacks.com/blog/website-structure | Las categorias superiores suelen organizarse por producto, caso de uso, industria o rol. |

## Lectura del PDF

La imagen convertida esta en:

```text
Docs/_archive/image/jobcron/converted/jobcron_pdf_page_01.png
```

La maqueta original define una web publica de 1400 px con:

- Header con logo y menu: Inicio, Quienes somos?, Productos, Industrias, Servicios, Contacto.
- Hero fotografico corporativo.
- Formulario de acceso sobre el hero.
- Marca Cron al centro.
- Bloque "Soluciones de negocio".
- Grid de soluciones con icono y texto.
- Footer con redes sociales.

## Problema detectado

La implementacion existente era una consola administrativa. Eso es util para el producto interno, pero no representa la web publica del PDF.

Por eso la estructura correcta debe separar:

| Superficie | Ruta | Rol |
|---|---|---|
| Web publica | `/` | Presentar JobCron, soluciones, industrias, servicios y contacto. |
| Login | `/login` | Acceso seguro hacia consola administrativa. |
| Admin | `/admin` | Operacion ERP interna, jobs, modulos, permisos y auditoria. |

## Estructura recomendada

| Ruta | Proposito |
|---|---|
| `/` | Home publica con propuesta de valor, soluciones, industrias, confianza y CTA. |
| `/quienes-somos` | Identidad, enfoque operativo y promesa de plataforma. |
| `/productos` | Catalogo de soluciones de negocio heredadas del PDF. |
| `/industrias` | Adaptacion por vertical o tipo de operacion. |
| `/servicios` | Implementacion, integraciones, datos, soporte y mejora continua. |
| `/contacto` | Captura comercial simple. |
| `/login` | Login dedicado con labels accesibles. |
| `/admin` | Consola operativa interna. |

## Propuesta de home

| Bloque | Decision |
|---|---|
| Header | Mantener el menu del PDF, modernizado y responsive. |
| Hero | Imagen realista de operacion empresarial, texto claro y CTA. |
| Login | Mantener acceso visible, pero tambien ofrecer pagina dedicada `/login`. |
| Metricas | Mostrar senales rapidas: soluciones, operacion y centro de control. |
| Soluciones | Convertir el grid historico en tarjetas modernas con descripcion breve. |
| Industrias | Explicar casos por tipo de empresa para compradores B2B. |
| Confianza | Arquitectura modular, seguridad por rol y soporte operativo. |
| CTA final | Dirigir a contacto o admin segun intencion. |

## Soluciones mapeadas desde el PDF

| Solucion del PDF | Interpretacion nueva |
|---|---|
| Empresa cliente | CRM/clientes, contactos y actividad comercial. |
| Recursos empresariales | Configuracion operativa y administracion modular. |
| Gestion de proveedores | Integraciones, catalogos, precios y abasto. |
| Recursos humanos | Equipos, roles y responsabilidades. |
| Control de inventarios | Stock, almacenes, apartados y movimientos. |
| Gestion y mantenimiento de activos | Activos, ciclos y mantenimiento preventivo. |
| Planeacion y programacion avanzada | Jobs, calendarios, dependencias y reintentos. |
| Actualizacion de datos | Sincronizaciones, normalizacion y auditoria. |
| Gestion de calidad | Validaciones, aprobaciones y reglas. |
| Gestion de transporte | Rutas, entregas y seguimiento logistico. |
| Gestion de almacenes | Ubicaciones, conteos y transferencias. |
| Ciclo de vida del producto | Alta, publicacion, cambios y retiro. |
| Cadena de suministros | Abasto y continuidad operativa. |
| Inteligencia de negocios | KPIs, reportes y tableros. |
| Comprobante fiscal por internet | Facturacion y documentos fiscales. |
| Punto de venta | Operacion comercial y pagos. |
| Servicio de notificaciones electronicas | Alertas, eventos y comunicacion. |

## Maqueta implementada

Se implemento en:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron
```

Cambios principales:

- `/` ahora es la web publica.
- `/login` es la pantalla dedicada de acceso.
- `/admin` contiene la consola ERP previa.
- `/quienes-somos`, `/productos`, `/industrias`, `/servicios` y `/contacto` se resuelven como paginas publicas.
- `lib/public-site.ts` concentra el contenido publico.
- `public/images/jobcron-hero-operations.png` contiene el hero visual generado para la maqueta.

## Criterio de diseno

La nueva maqueta no copia literalmente el PDF 2017. Conserva su estructura conceptual y la actualiza:

- Menos medidas rigidas y mas responsive.
- Login accesible con labels, no solo placeholders.
- Soluciones con descripcion, no solo icono.
- Separacion entre venta publica y operacion interna.
- Imagen hero limpia sin anotaciones ni guias.
- CTA claros para productos, contacto y admin.

## Validacion

Comando ejecutado:

```powershell
npm run build
```

Resultado: build exitoso.
