# Roadmap operativo productivo JobCron

## Objetivo

Definir el cierre necesario para que JobCron administre MexIngSof, REFAPART y
Tecno Telec sin duplicar responsabilidades de las APIs de proyecto ni del Core
ERP.

## Arquitectura

```text
WEB.NJ.NEXT.JobCron
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.JobCron
  -> Auth, Catalog, Pricing, Sales, Inventory, Document, Search
```

JobCron administra operacion, permisos, reportes, feature flags, jobs y
seguimiento. No reemplaza Gateway, Search ni las APIs de proyecto.

## Modulos productivos minimos

| Modulo | Proyectos | Estado |
|---|---|---|
| Leads comerciales | MexIngSof | PENDIENTE_DE_IMPLEMENTAR |
| Solicitudes y cotizaciones | REFAPART, Tecno Telec | PENDIENTE_DE_IMPLEMENTAR |
| Catalogo publicable | REFAPART, Tecno Telec | PENDIENTE_DE_IMPLEMENTAR |
| Proveedores | REFAPART, Tecno Telec | PENDIENTE_DE_IMPLEMENTAR |
| FeatureAvailability | Todos | Parcial |
| Auditoria | Todos | PENDIENTE_DE_IMPLEMENTAR |
| Search admin | Todos | PENDIENTE_DE_IMPLEMENTAR |

## Contratos Gateway

| Ruta Gateway | Metodo | Destino | Proposito | Estado |
|---|---|---|---|---|
| `/api/v1/projects/JOBCRON/admin/overview` | GET | JobCron API | Salud operativa general. | IMPLEMENTADO_API; pendiente consumo UI dinamico |
| `/api/v1/projects/JOBCRON/admin/leads` | GET/PATCH | JobCron API/Sales | Operar leads MexIngSof. | PENDIENTE_DE_IMPLEMENTAR |
| `/api/v1/projects/JOBCRON/admin/refapart/requests` | GET/PATCH | REFAPART API | Operar solicitudes REFAPART. | PENDIENTE_DE_IMPLEMENTAR |
| `/api/v1/projects/JOBCRON/admin/tecnotelec/quotes` | GET/PATCH | Sales/TecnoTelec API | Operar cotizaciones Tecno Telec. | PENDIENTE_DE_IMPLEMENTAR |
| `/api/v1/projects/JOBCRON/search` | GET | Search API | Busqueda administrativa autorizada. | PENDIENTE_DE_IMPLEMENTAR |

## Permisos

| Permiso | Uso |
|---|---|
| `jobcron.overview.read` | Ver tablero operativo. |
| `jobcron.features.manage` | Administrar FeatureAvailability. |
| `jobcron.audit.read` | Leer auditoria. |
| `jobcron.search.read` | Buscar entidades autorizadas. |
| `jobcron.projects.operate` | Operar casos inter-proyecto. |

## Pendientes reales

- PENDIENTE_DE_DEFINIR: si JobCron sera SaaS publico, ERP interno o ambos.
- PENDIENTE_DE_IMPLEMENTAR: Auth real en pantallas administrativas.
- PENDIENTE_DE_IMPLEMENTAR: dashboard operativo por proyecto.
- PENDIENTE_DE_IMPLEMENTAR: busqueda administrativa con permisos finos.
- PENDIENTE_DE_IMPLEMENTAR: auditoria de cambios operativos.
