# Clasificador de agents

## Objetivo

Determinar dominio, proyecto y agent especializado antes de modificar
documentacion o codigo.

## Clasificacion primaria

| Si la tarea menciona | Clasificar como | Leer |
|---|---|---|
| login, registro, reset, sesion, roles, permisos | Auth | `specialized/auth.md` |
| Gateway, rutas `/api/v1`, proxy, CORS | Gateway | `specialized/gateway.md` |
| PostgreSQL, migraciones, schemas, SQLite | Database | `specialized/database.md` |
| Next.js, UI, dashboard, formularios, responsive | Frontend | `specialized/frontend.md` |
| Django, serializers, views, endpoints | Backend/API | `specialized/backend-api.md` |
| compose, contenedores, imagenes, scripts start/stop | Docker | `specialized/docker.md` |
| nginx, upstreams, proxy_pass | Nginx | `specialized/nginx.md` |
| RefaPart | RefaPart | `specialized/refapart.md` |
| JobCron, permisos admin, FeatureAvailability | JobCron | `specialized/jobcron.md` |
| agentes, indices, limpieza documental | Documentation cleanup | `specialized/documentation-cleanup.md` |
| inventarios, duplicados, rutas sin doc | Code audit | `specialized/code-audit.md` |

## Clasificacion secundaria

Si toca mas de un dominio, seleccionar uno principal y registrar secundarios en
`EXECUTION_REPORT.md`.

## Cierre temprano

Si ya esta cubierto por documentacion canonica, no modificar codigo. Registrar
`CONCLUIDO SIN CAMBIOS`.
