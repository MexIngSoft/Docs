# Registro de rutas Gateway

## Objetivo

Evitar que Codex invente rutas, consuma APIs directas desde frontend o salte el
Gateway General.

## Regla principal

Toda ruta consumida por un frontend debe estar registrada aqui o documentada en
el contrato API canonico correspondiente antes de implementarse.

Toda ruta Gateway nueva debe enlazar contrato API o API Decision Record.

No se permite registrar ruta Gateway hacia una API nueva si no existe API
Decision Record aprobado.

## Registro

| Frontend | Ruta Gateway | API destino | Permiso requerido | Request | Response | Estado |
|---|---|---|---|---|---|---|
| `WEB.NJ.NEXT.MexIngSof` | `POST /api/v1/projects/MEXINGSOF/leads` | JobCron API | Publico con anti-abuso; admin via Auth | Lead corporativo | Lead creado con estado inicial | PENDIENTE_DE_IMPLEMENTAR |
| `WEB.NJ.NEXT.MexIngSof` | `GET /api/v1/projects/MEXINGSOF/services` | JobCron API o Catalog | Publico | Filtros publicos | Servicios/paquetes publicados | PENDIENTE_DE_DEFINIR |
| `WEB.NJ.NEXT.RefaPart` | `GET /api/v1/projects/REFAPART/parts/search` | REFAPART API/Search | Publico | Query, vehiculo, categoria, ciudad | Resultados publicables | Parcial |
| `WEB.NJ.NEXT.RefaPart` | `POST /api/v1/projects/REFAPART/requests` | REFAPART API | Publico/Auth opcional | Solicitud de pieza | Solicitud creada | Parcial |
| `WEB.NJ.NEXT.RefaPart` | `POST /api/v1/projects/REFAPART/quotes` | REFAPART API/Sales | Auth requerido para cuenta; publico solo prelead | Solicitud de cotizacion | Cotizacion o caso operativo | Parcial |
| `WEB.NJ.NEXT.TecnoTelec` | `GET /api/v1/projects/TECNOTELEC/solutions` | TecnoTelec API | Publico | Filtros publicos | Soluciones publicadas | Parcial |
| `WEB.NJ.NEXT.TecnoTelec` | `GET /api/v1/projects/TECNOTELEC/catalog` | Catalog/Pricing/Supplier | Publico | Filtros publicos | Productos publicables | Parcial |
| `WEB.NJ.NEXT.TecnoTelec` | `POST /api/v1/projects/TECNOTELEC/quotes` | Sales API | Publico/Auth opcional | Solicitud consultiva | Cotizacion MVP | Parcial |
| `WEB.NJ.NEXT.JobCron` | `GET /api/v1/projects/JOBCRON/admin/overview` | JobCron API | `jobcron.overview.read` | Filtros operativos | Resumen operativo | IMPLEMENTADO_API; pendiente consumo UI dinamico |
| `WEB.NJ.NEXT.JobCron` | `GET /api/v1/projects/JOBCRON/search` | Search API | `jobcron.search.read` | Query y filtros autorizados | Resultados autorizados | PENDIENTE_DE_IMPLEMENTAR |

## Validacion

- El frontend no consume APIs internas directamente.
- La ruta Gateway existe en contrato o queda marcada como `PENDIENTE_DE_DEFINIR`.
- La API destino es reutilizable o especializada solo si aplica.
- El permiso requerido esta documentado.

## No permitido

- Crear rutas Gateway sin contrato.
- Crear rutas duplicadas para la misma responsabilidad.
- Exponer secretos o contratos de proveedor externo al frontend.
