# Mapa de navegacion JobCron

## Objetivo

Definir la navegacion completa de la web administrativa de JobCron como ERP central del ecosistema.

## Estructura principal

| Grupo | Ruta | Pantalla | Proposito |
|---|---|---|---|
| Centro | `/` | Dashboard | Resumen ejecutivo, salud del sistema y actividad reciente. |
| Centro | `/admision` | Admision | Alta guiada de empresas, proyectos, ambientes y modulos. |
| Centro | `/procesos` | Procesos | Jobs, sincronizaciones, colas, reintentos y ventanas de ejecucion. |
| Operacion ERP | `/empresas` | Empresas | Tenants, razones sociales, unidades operativas y owners. |
| Operacion ERP | `/proyectos` | Proyectos | Portafolio de negocios conectados a JobCron. |
| Operacion ERP | `/modulos` | Modulos | Catalogo de dominios, APIs y responsabilidades ERP. |
| Operacion ERP | `/integraciones` | Integraciones | Conectores con proveedores, gateways y sistemas externos. |
| Comercial | `/catalogo` | Catalogo | Productos, servicios, paquetes y compatibilidad. |
| Comercial | `/pricing` | Pricing | Listas de precio, margenes, impuestos y reglas. |
| Comercial | `/cotizaciones` | Cotizaciones | Pipeline de propuestas, versiones y conversion a venta. |
| Comercial | `/ventas` | Ventas | Ordenes, pagos, estados y seguimiento comercial. |
| Backoffice | `/inventario` | Inventario | Stock, almacenes, movimientos y disponibilidad. |
| Backoffice | `/logistica` | Logistica | Envios, rutas, tracking y excepciones. |
| Backoffice | `/pagos` | Pagos | Anticipos, liquidaciones, conciliacion y metodos. |
| Backoffice | `/facturacion` | Facturacion | Datos fiscales, CFDI, notas y documentos. |
| Control | `/reglas` | Reglas | Motor de decisiones operativo y comercial. |
| Control | `/reportes` | Reportes | KPIs, BI, exportables y tableros por proyecto. |
| Control | `/auditoria` | Auditoria | Bitacoras, evidencia y cambios criticos. |
| Sistema | `/usuarios` | Usuarios | Cuentas, invitaciones, perfiles y estado. |
| Sistema | `/permisos` | Permisos | Roles, politicas, ambitos y restricciones. |
| Sistema | `/seguridad` | Seguridad | Sesion, MFA, secretos, scopes y controles. |
| Sistema | `/configuracion` | Configuracion | Variables, feature flags y preferencias globales. |

## Menu completo

El menu vive como sidebar persistente en la consola. Sus reglas:

- Mostrar grupos funcionales, no solo enlaces sueltos.
- Mantener el dashboard como punto de retorno.
- Mostrar estado por modulo: `Activo`, `Diseno` o `Pendiente`.
- Permitir que rutas en diseno existan con mock data para validar navegacion.
- Evitar menus profundos hasta que un modulo tenga mas de una vista real.

## Rutas futuras por modulo

Cuando un modulo crezca, las rutas hijas recomendadas son:

| Modulo | Rutas hijas sugeridas |
|---|---|
| Empresas | `/empresas/[id]`, `/empresas/[id]/ambientes`, `/empresas/[id]/usuarios` |
| Proyectos | `/proyectos/[id]`, `/proyectos/[id]/modulos`, `/proyectos/[id]/jobs` |
| Procesos | `/procesos/jobs`, `/procesos/reintentos`, `/procesos/calendario` |
| Catalogo | `/catalogo/productos`, `/catalogo/servicios`, `/catalogo/kits` |
| Pricing | `/pricing/listas`, `/pricing/reglas`, `/pricing/vigencias` |
| Reportes | `/reportes/operacion`, `/reportes/ventas`, `/reportes/exportaciones` |
| Seguridad | `/seguridad/sesiones`, `/seguridad/mfa`, `/seguridad/secretos` |

## Estado de implementacion

La maqueta implementa las rutas de primer nivel mediante paginas reales y una ruta dinamica para vistas placeholder.
