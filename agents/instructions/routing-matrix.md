# Matriz de enrutamiento de agents

| Dominio | Agent especializado | Context Pack | Validaciones minimas |
|---|---|---|---|
| Auth | `specialized/auth.md` | Auth/Gateway/Security | `python manage.py check` Auth, pruebas de endpoint si Docker esta arriba |
| Gateway | `specialized/gateway.md` | Gateway/API | `python manage.py check` Gateway, endpoint proxy |
| Database | `specialized/database.md` | Database/Django/Docker | migraciones, `manage.py check`, escaneo SQLite |
| Frontend | `specialized/frontend.md` | Frontend/Auth si aplica | `npm run lint`, `npm run build` |
| Backend/API | `specialized/backend-api.md` | Django/API | `manage.py check`, compilacion Python |
| Docker | `specialized/docker.md` | Docker/Operations | `docker compose config --quiet` |
| Nginx | `specialized/nginx.md` | Nginx/Operations | `nginx -t` o validacion de config |
| RefaPart | `specialized/refapart.md` | RefaPart/Auth/Gateway | web build, APIs usadas, endpoints clave |
| JobCron | `specialized/jobcron.md` | JobCron/Auth/Gateway | web build, Auth/Gateway checks |
| Docs | `specialized/documentation-cleanup.md` | Documentation | rutas existentes, no duplicidad |
| Auditoria | `specialized/code-audit.md` | Audit | inventarios actualizados |

## Regla de seguridad

Si un agent pide borrar, mover o reemplazar `AGENTS-*.md`, prevalece la regla
global: conservar archivo y vaciar contenido solo si esta completado.
