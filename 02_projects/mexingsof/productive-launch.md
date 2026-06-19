# Cierre productivo MexIngSof

## Objetivo

Definir que falta para que MexIngSof pase de web corporativa MVP a entrada
comercial productiva del ecosistema.

## Estado actual

| Area | Estado |
|---|---|
| Web | Implementada en `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof`. |
| Repositorio | `https://github.com/MexIngSoft/WEB.NJ.NEXT.MexIngSof.git`, rama `dev`. |
| Runtime | `Docker.WEB.NJ`, servicio web compartido, puerto `3009`. |
| Datos MVP | Prisma local para productos/leads. |
| Produccion | Parcial; falta Gateway/JobCron/Auth. |

## Arquitectura productiva requerida

```text
WEB.NJ.NEXT.MexIngSof
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.JobCron
  -> Sales/CRM, Document, Search si aplica
```

La web MVP puede conservar rutas Next.js locales durante desarrollo, pero no
son contrato productivo final para leads, admin o servicios publicados.

## Contratos productivos

| Ruta Gateway | Metodo | Destino | Proposito | Estado |
|---|---|---|---|---|
| `/api/v1/projects/MEXINGSOF/leads` | POST | JobCron API | Capturar lead corporativo. | PENDIENTE_DE_IMPLEMENTAR |
| `/api/v1/projects/MEXINGSOF/services` | GET | JobCron API o Catalog | Publicar servicios/paquetes autorizados. | PENDIENTE_DE_DEFINIR |
| `/api/v1/projects/MEXINGSOF/leads/{id}` | GET/PATCH | JobCron API | Seguimiento admin del lead. | PENDIENTE_DE_IMPLEMENTAR |

## Datos minimos

| Entidad | Campos minimos |
|---|---|
| Servicio | codigo, nombre, descripcion, estado, orden, CTA, tags. |
| Paquete comercial | codigo, nombre, alcance, precio visible opcional, vigencia, estado. |
| Lead | nombre, empresa, email, telefono, mensaje, interes, origen, estado. |
| Estado de lead | nuevo, contactado, calificado, propuesta, ganado, perdido. |

## Permisos

| Permiso | Uso |
|---|---|
| `mexingsof.leads.read` | Ver leads en admin. |
| `mexingsof.leads.update` | Cambiar estado, notas y responsable. |
| `mexingsof.services.manage` | Administrar servicios y paquetes publicados. |
| `mexingsof.reports.read` | Ver metricas comerciales. |

## Search

MexIngSof no requiere busqueda publica obligatoria en fase inicial. Si se
habilita Search, solo debe indexar:

- servicios publicados;
- paquetes publicados;
- leads visibles para administradores autorizados.

No se deben indexar mensajes privados de leads en busqueda publica.

## Validaciones necesarias

| Validacion | Estado |
|---|---|
| Build web | Disponible en repositorio web. |
| Lint web | Disponible en repositorio web. |
| Migraciones PostgreSQL | PENDIENTE_DE_DEFINIR por conexion/base oficial. |
| Auth admin | PENDIENTE_DE_IMPLEMENTAR via Gateway/Auth. |
| Endpoint leads productivo | PENDIENTE_DE_IMPLEMENTAR en JobCron API. |

## Pendientes reales

- PENDIENTE_DE_DEFINIR: dominio final de despliegue.
- PENDIENTE_DE_DEFINIR: datos reales de telefono, direccion y horarios.
- PENDIENTE_DE_DEFINIR: si servicios viven en JobCron API o Catalog API.
- PENDIENTE_DE_IMPLEMENTAR: Gateway/JobCron para leads productivos.
- PENDIENTE_DE_IMPLEMENTAR: Auth admin.
