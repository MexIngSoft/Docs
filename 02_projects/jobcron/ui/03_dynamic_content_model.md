# Modelo de contenido dinamico JobCron

## Objetivo

Preparar la maqueta para conectarse despues al Gateway General sin reescribir la navegacion ni la estructura de pantallas.

## Fuente actual de datos

Archivo:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/lib/modules.ts
```

Contenido:

- `navigationGroups`: grupos e items del menu.
- `adminModules`: lista plana de modulos.
- `quickMetrics`: metricas del dashboard.
- `executionRows`: tabla mock de procesos.
- `admissionStages`: etapas del flujo de admision.
- `screenSpecs`: plantilla por ruta/modulo.
- `healthSignals`: senales de salud del sistema.

## Contrato futuro por pantalla

Cada pantalla debe poder recibir:

| Campo | Tipo esperado | Uso |
|---|---|---|
| `title` | string | Titulo visible. |
| `description` | string | Contexto operativo. |
| `status` | enum | Activo, Diseno, Pendiente o Bloqueado. |
| `actions` | array | Botones disponibles por permisos. |
| `metrics` | array | KPIs propios del modulo. |
| `columns` | array | Columnas de tabla. |
| `rows` | array | Registros paginados. |
| `filters` | array | Filtros visibles. |
| `permissions` | array | Acciones habilitadas para el usuario. |

## API sugerida

El frontend debe consumir solo el Gateway General:

```text
Frontend JobCron -> Gateway General -> Core ERP APIs
```

Endpoints sugeridos:

| Endpoint | Proposito |
|---|---|
| `GET /api/jobcron/navigation` | Menu y permisos visibles. |
| `GET /api/jobcron/dashboard` | Metricas, salud y actividad reciente. |
| `GET /api/jobcron/screens/{slug}` | Configuracion y datos de una pantalla. |
| `GET /api/jobcron/processes` | Jobs, sincronizaciones y reintentos. |
| `GET /api/jobcron/audit/events` | Eventos auditados. |

## Placeholders actuales

Los placeholders se clasifican asi:

| Tipo | Uso |
|---|---|
| Mock data | Permite navegar y validar layout antes de API. |
| Estado de modulo | Distingue lo activo de lo que aun esta en diseno. |
| Tabla generica | Sirve para validar densidad y responsive. |
| Toolbar generica | Anticipa acciones reales por permisos. |

## Criterio para reemplazar mock data

Un placeholder se puede reemplazar cuando exista:

- Contrato de API documentado.
- Estado de carga.
- Estado vacio.
- Estado de error.
- Permisos por accion.
- Prueba visual basica en desktop y mobile.
