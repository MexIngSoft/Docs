---
title: Estandar de Gateway central
domain: standards
status: active
priority: p1
owner: Equipo de plataforma
last_reviewed: 2026-06-14
---

# Estandar de Gateway central

## Regla

`API.PY.DJANGO.Gateway` es la entrada estandar para todo frontend nuevo:

```text
Web -> API.PY.DJANGO.Gateway -> API de proyecto opcional -> APIs Core
```

El frontend envia `X-Application-Code`. El Gateway valida el proyecto,
propaga request/correlation IDs, normaliza errores y enruta por version.

## Responsabilidades

- Auth, logout, refresh, `/me` y permisos.
- Routing versionado de proyectos y APIs Core registradas.
- Validacion de application code, headers, origen y timeout.
- Logs tecnicos, health checks y errores sin trazas internas.
- Compatibilidad temporal con rutas legacy.

No contiene reglas de negocio, tablas de proyecto, precios, inventario, ventas,
ETLs ni logica de proveedores.

## Contrato base

```text
GET  /health/
GET  /api/health/
GET  /api/health/auth/
GET  /api/health/projects/
POST /api/v1/auth/login/
ANY  /api/v1/projects/<application_code>/*
ANY  /api/v1/core/<api_name>/*
```

Las rutas sin `/v1` son compatibilidad y no deben usarse en proyectos nuevos.

## Estructura interna obligatoria

```text
apps/gateway_core     contexto, errores y respuestas uniformes
apps/auth_proxy       endpoints y adaptacion de Auth
apps/project_router   routing de APIs de proyecto y Core
apps/api_registry     configuracion aislada por ApplicationCode
apps/versioning       version por proyecto y API
apps/observability    logs, IDs y duracion
apps/rate_limit       limite por IP, aplicacion, usuario y endpoint
clients               clientes separados por tipo de upstream
adapters              compatibilidad de payload por API/version
tests                  contratos comunes y por proyecto
```

No se permite concentrar estas responsabilidades en una vista o cliente
unico. El registro de un proyecto no debe modificar el comportamiento de otro.

## Protecciones contra regresion

- Registro y versiones independientes por `ApplicationCode`.
- Cliente Auth separado de clientes Project/Core.
- Adapters versionados cuando cambie un contrato upstream.
- Tests de contrato por proyecto antes de cambiar routing o versiones.
- Rate limit configurable; el backend local `LocMemCache` es solo para
  desarrollo y debe sustituirse por cache compartido antes de escalar replicas.
