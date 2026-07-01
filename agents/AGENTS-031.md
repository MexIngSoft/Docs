# AGENTS-031 - Orquestador general de cierre preproduccion

## Estado

ACTIVO

## Objetivo

Orquestar documentacion, desarrollo, validaciones, commits y push de los
repositorios necesarios para preparar el ecosistema antes de produccion,
respetando la rama `general` derivada de `dev` y sin dejar pendientes ambiguos.

## Pre-flight obligatorio

Leer:

```text
Docs/README.md
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
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron
Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof
Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec
```

## Regla de rama

- Trabajar en `general`.
- `general` debe extender de `dev`.
- No modificar `main` ni `pro`.
- Si `general` no existe, crearla desde `dev` solo si no hay cambios locales
  que puedan perderse.
- Antes de commit/push: `git status`, validaciones aplicables y reporte.

## Orden maestro

1. Docs/agentes/clasificacion.
2. Auditoria documental de codigo.
3. RefaPart P0.
4. Auth + Gateway.
5. DB/PostgreSQL.
6. APIs Django afectadas.
7. Webs Next.js afectadas.
8. Docker.
9. Nginx.
10. Commits y push por repo.

## Bloqueos permitidos

Solo se permiten pendientes con una de estas etiquetas:

```text
BLOQUEADO_POR_DECISION
BLOQUEADO_POR_CREDENCIALES
BLOQUEADO_POR_INFRAESTRUCTURA
BLOQUEADO_POR_PROVEEDOR_EXTERNO
FUERA_DE_ALCANCE_PREPRODUCCION
```

Cada bloqueo debe indicar causa exacta, responsable sugerido y criterio de
desbloqueo.

## Criterio de cierre

Este agent se limpia solo cuando:

- Docs/agentes estan reorganizados.
- Los inventarios de auditoria existen y estan actualizados.
- RefaPart P0 queda cerrado o bloqueado formalmente.
- Auth/Gateway quedan validados.
- DB no tiene SQLite ni migraciones pendientes resolubles.
- APIs/Webs afectadas pasan validaciones o quedan bloqueadas formalmente.
- Docker/Nginx estan inventariados.
- Todos los repos modificados tienen commit y push a `general`, o bloqueo
  formal documentado.
