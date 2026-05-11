# Revision de web JobCron y propuesta mejorada

## Objetivo

Cerrar la revision de la actividad solicitada para JobCron: confirmar si el PDF historico fue considerado, si la maqueta web esta documentada y si existe una propuesta mejor para evolucionarla.

## Fuente revisada

Archivo visual historico:

```text
Docs/_archive/image/jobcron/especificaciones cron.pdf
```

Imagen convertida:

```text
Docs/_archive/image/jobcron/converted/jobcron_pdf_page_01.png
```

Documentacion creada previamente:

```text
Docs/02_projects/jobcron/ui/00_jobcron_mockup_analysis.md
Docs/02_projects/jobcron/ui/01_navigation_map.md
Docs/02_projects/jobcron/ui/02_layout_and_design_system.md
Docs/02_projects/jobcron/ui/03_dynamic_content_model.md
```

Maqueta implementada:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron
```

## Estado actual

La actividad esta parcialmente bien encaminada y documentada, pero la conversion del PDF cambia la lectura principal.

La web actual ya funciona como consola administrativa, no como landing page. Eso es correcto para el JobCron Admin, pero no replica la maqueta del PDF.

El PDF muestra una web publica/corporativa con menu, hero, login y seccion de soluciones de negocio. Por lo tanto, JobCron requiere dos superficies separadas: web publica y consola administrativa.

Validacion tecnica ejecutada:

```powershell
npm run build
```

Resultado: build exitoso en `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron`.

## Lo que esta bien

| Area | Revision |
|---|---|
| Uso del PDF | Ya fue convertido a imagen y ahora se entiende como maqueta concreta de web publica. |
| Enfoque de producto | La web se entiende como consola ERP/SaaS operativa. Evita una pantalla de marketing y entra directo al trabajo administrativo. |
| Navegacion | Existe un mapa amplio de modulos con grupos funcionales claros: Centro, Operacion ERP, Comercial, Backoffice, Control y Sistema. |
| Implementacion admin | La maqueta tiene dashboard, sidebar persistente, header, metricas, tabla de jobs, tarjetas de modulos y rutas dinamicas para placeholders. |
| Preparacion para API | El contenido mock esta centralizado en `lib/modules.ts`, lo cual facilita reemplazarlo despues por gateway/BFF. |
| Responsive | El CSS contempla desktop, tablet y mobile con tablas desplazables horizontalmente. |

## Riesgos o huecos

| Riesgo | Impacto | Recomendacion |
|---|---|---|
| Falta la web publica del PDF | La implementacion actual no representa el sitio corporativo mostrado en la maqueta. | Crear una home publica separada o mover admin a `/admin`. |
| JobCron Admin puede sentirse demasiado generico como ERP | La parte de "cron/jobs" queda presente, pero no domina la experiencia. | Hacer que la primera pantalla admin sea mas claramente un centro de control de procesos, automatizaciones y salud operativa. |
| Acciones sin comportamiento | Botones como filtrar, exportar o configurar vista son visuales por ahora. | Documentar contratos minimos de accion antes de conectar backend. |
| Falta estado de error/carga/vacio | La maqueta aun no prueba casos reales de operacion. | Agregar estados por pantalla antes de pasar a integracion. |
| Trazabilidad visual reciente | Ya existe extraccion visual del PDF. | Usar `05_pdf_visual_extraction.md` como referencia para la siguiente iteracion. |
| Sin pruebas visuales automatizadas | El build valida TypeScript/Next, pero no valida layout en navegador. | Agregar revision Playwright cuando la maqueta vaya a aprobarse visualmente. |

## Propuesta mejorada

La mejora recomendada ahora tiene dos capas:

1. Recuperar la web publica del PDF como sitio comercial moderno.
2. Mantener la consola actual como JobCron Admin y especializarla como Command Center operativo.

### Concepto

JobCron Web Publica: sitio para comunicar soluciones de negocio, industrias, servicios y acceso.

JobCron Command Center: consola para operar empresas, modulos y automatizaciones con visibilidad de salud, ejecuciones, errores, permisos y dependencias.

### Primer viewport publico propuesto

| Zona | Contenido |
|---|---|
| Header | Logo JobCron, Inicio, Quienes somos, Productos, Industrias, Servicios, Contacto y acceso. |
| Hero | Imagen real de operacion/negocio, H1 claro, descripcion breve y CTA. |
| Login | Acceso discreto como boton o modal, no como formulario expuesto permanente si no hay sesion segura. |
| Soluciones | Tarjetas de soluciones con icono, descripcion y enlace a detalle. |

### Primer viewport admin propuesto

| Zona | Contenido |
|---|---|
| Header | Marca, busqueda global, ambiente, notificaciones y usuario. |
| Sidebar | Modulos por dominio, manteniendo los grupos actuales. |
| Banda superior | Salud global: Gateway, Auth, Jobs, Colas, Facturacion y Auditoria. |
| Panel principal | Timeline de ejecuciones recientes con estado, duracion, responsable y siguiente corrida. |
| Panel lateral | Incidentes activos, jobs en riesgo y acciones rapidas. |
| Segundo bloque | Empresas/proyectos afectados por procesos pendientes o fallidos. |

### Rutas publicas prioritarias

| Prioridad | Ruta | Motivo |
|---|---|---|
| 1 | `/` | Home comercial basada en el PDF. |
| 2 | `/productos` | Soluciones de negocio. |
| 3 | `/industrias` | Casos por vertical. |
| 4 | `/servicios` | Implementacion, soporte y consultoria. |
| 5 | `/contacto` | Captura comercial. |
| 6 | `/login` | Entrada segura a consola. |

### Rutas admin prioritarias

| Prioridad | Ruta | Motivo |
|---|---|---|
| 1 | `/` | Dashboard de salud y actividad. |
| 2 | `/procesos` | Corazon del producto: jobs, sincronizaciones, reintentos, calendario y bitacora. |
| 3 | `/empresas` | Contexto multi-tenant. |
| 4 | `/proyectos` | Relacion entre negocios y modulos activos. |
| 5 | `/modulos` | Gobierno funcional del ERP. |
| 6 | `/permisos` | Control operativo y seguridad. |
| 7 | `/auditoria` | Evidencia de ejecuciones y cambios. |
| 8 | `/configuracion` | Variables, feature flags y parametros. |

### Datos minimos para que deje de ser maqueta

| Recurso | Datos requeridos |
|---|---|
| Jobs | ID, nombre, modulo, frecuencia, ultimo estado, duracion, ultima ejecucion, proxima ejecucion, reintentos. |
| Incidentes | Severidad, origen, proyecto afectado, mensaje, fecha, owner, estado. |
| Empresas | Tenant, razon social, ambiente, modulos activos, estado operativo. |
| Proyectos | Dominio, empresa, owner, gateway, estado, modulos habilitados. |
| Auditoria | Actor, accion, entidad, antes/despues, fecha, correlacion. |

## Decision recomendada

Mantener la base actual, porque ya compila y esta bien estructurada, pero clasificarla como admin. La siguiente iteracion debe crear o separar la web publica basada en el PDF:

1. Home publica con hero, menu, soluciones y acceso.
2. Admin bajo `/admin` o subdominio equivalente.
3. Dashboard admin mas centrado en jobs, colas, incidentes y dependencias.
4. Pantalla `/procesos` con tabla especializada, filtros reales y detalle de ejecucion.
5. Estados de carga, vacio y error antes de integrar API.
6. Contratos BFF para dashboard, procesos, auditoria y navegacion por permisos.

## Veredicto

La actividad previa esta documentada y la maqueta admin esta en buen estado tecnico, pero el PDF convertido demuestra que falta la web publica historica de JobCron. La propuesta mejor es separar producto publico y admin interno: home comercial basada en el PDF, consola operativa basada en la implementacion actual.
