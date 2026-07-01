# AGENTS-031 - Orquestador general de cierre preproduccion

## Estado

ACTIVO

## Objetivo

Orquestar documentacion, desarrollo, validaciones, commits y push de los repositorios necesarios para preparar el ecosistema antes de produccion, respetando la rama `general` derivada de `dev` y sin dejar pendientes ambiguos.

## Entrada canonica

Antes de ejecutar este agent leer:

```text
Docs/_meta/codex-entrypoint.md
```

Ese documento prevalece sobre cualquier diferencia de orden de lectura.

## Pre-flight obligatorio

Leer:

```text
Docs/README.md
Docs/_meta/codex-entrypoint.md
Docs/_meta/active-work-index.md
Docs/agents/_index.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/agents/EXECUTION_REPORT.md
Docs/00_audit/10_development_gap_analysis.md
Docs/03_standards/operations/context-packs.md
Docs/03_standards/code-actions/code-actions-map-standard.md
Docs/03_standards/docker/jobcron-official-docker-architecture.md
Docs/03_standards/database/postgresql-project-users-and-schemas.md
```

## Repositorios a revisar

```text
Docs
Docker.DB.PG
Docker.API.PY
Docker.WEB.NJ
Docker.SW.Nginx
Docker.API.PY/API.PY.DJANGO.Auth
Docker.API.PY/API.PY.DJANGO.Gateway
Docker.API.PY/API.PY.DJANGO.Address
Docker.API.PY/API.PY.DJANGO.RefaPart
Docker.API.PY/API.PY.DJANGO.JobCron
Docker.API.PY/API.PY.DJANGO.Catalog
Docker.API.PY/API.PY.DJANGO.Supplier
Docker.API.PY/API.PY.DJANGO.Sales
Docker.API.PY/API.PY.DJANGO.Pricing
Docker.API.PY/API.PY.DJANGO.Inventory
Docker.API.PY/API.PY.DJANGO.TecnoTelec
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron
Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof
Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec
```

## Regla de rama

- Trabajar en `general`.
- `general` debe extender de `dev`.
- No modificar `main` ni `pro`.
- Si `general` no existe, crearla desde `dev` solo si no hay cambios locales que puedan perderse.
- Antes de commit/push: `git status`, validaciones aplicables y reporte.

## Fase documental

1. Verificar `Docs/_meta/codex-entrypoint.md`.
2. Verificar `Docs/_meta/contradiction-resolution-log.md`.
3. Verificar `Docs/00_audit/documentation-health-report.md`.
4. Verificar `Docs/00_audit/agent-context-search-report.md`.
5. Verificar `Docs/00_audit/agent-duplication-report.md`.
6. Verificar scripts en `Docs/scripts/agents/`.
7. Verificar agentes especializados con estructura completa.
8. Actualizar `EXECUTION_REPORT.md`.

## Fase de desarrollo

Orden obligatorio:

1. RefaPart P0.
2. Auth + Gateway.
3. Address/DB relacionada.
4. APIs Django afectadas.
5. Webs Next.js afectadas.
6. JobCron si afecta administracion/permisos.
7. MexIngSof si tiene rutas internas pendientes.
8. TecnoTelec si afecta catalogo/cotizador.
9. Docker.
10. Nginx.

## Reglas de desarrollo

- No crear APIs nuevas si Auth, Gateway, Catalog, Inventory, Pricing, Supplier, Procurement, Sales, Search, Notification, Document o JobCron cubren el caso.
- No consumir APIs internas desde frontend fuera del Gateway General.
- No declarar productivo lo que siga en mock, temporal o `PENDIENTE_DE_DEFINIR`.
- No mezclar Core ERP, proyectos, integraciones, estandares, archivo historico ni pendientes futuros.

## Validaciones

- Web: `npm run lint` y `npm run build` si existen.
- API Django: `python manage.py check` y compilacion Python disponible.
- Docker: `docker compose config --quiet` si se modifican compose/Dockerfile.
- Nginx: `nginx -t` si se modifica Nginx.
- Documentacion: rutas tocadas existen y no duplican canonicos.

## Fase commit/push

Por cada repo modificado:

```text
git status
git add -A
git commit -m "chore: close agent orchestration work"
git push origin general
```

Usar mensajes especificos si hay cambios de codigo por dominio.

## Bloqueos permitidos

Solo se permiten pendientes con una de estas etiquetas:

```text
BLOQUEADO_POR_DECISION
BLOQUEADO_POR_CREDENCIALES
BLOQUEADO_POR_INFRAESTRUCTURA
BLOQUEADO_POR_PROVEEDOR_EXTERNO
FUERA_DE_ALCANCE_PREPRODUCCION
```

Cada bloqueo debe indicar causa exacta, responsable sugerido y criterio de desbloqueo.

## Criterio de cierre

Este agent se limpia solo cuando:

- Docs/agentes estan reorganizados.
- Los inventarios de auditoria existen y estan actualizados.
- RefaPart P0 queda cerrado o bloqueado formalmente.
- Auth/Gateway quedan validados.
- DB no tiene SQLite ni migraciones pendientes resolubles.
- APIs/Webs afectadas pasan validaciones o quedan bloqueadas formalmente.
- Docker/Nginx estan inventariados.
- Todos los repos modificados tienen commit y push a `general`, o bloqueo formal documentado.

## Reporte obligatorio

Actualizar `Docs/agents/EXECUTION_REPORT.md` con agentes ejecutados, estado, archivos leidos/modificados, APIs reutilizadas, validaciones, contradicciones, decisiones, pendientes, riesgos, bloqueos y agents completados/limpiados/parciales/sin instrucciones.
