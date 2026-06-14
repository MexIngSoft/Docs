---
title: Estandar de routing del Gateway
domain: standards
status: active
priority: p1
owner: Equipo de plataforma
last_reviewed: 2026-06-14
---

# Estandar de routing del Gateway

## Registro

El archivo canonico de runtime es `config/project_registry.yaml` dentro de
`API.PY.DJANGO.Gateway`. Solo se enrutan aplicaciones habilitadas.

## Headers

- `X-Application-Code`: obligatorio fuera de health.
- `X-Request-ID`: se conserva o genera.
- `X-Correlation-ID`: se conserva o deriva del request ID.

Si falta application code se responde `APPLICATION_CODE_REQUIRED`. Si no esta
registrado, se responde `APPLICATION_NOT_REGISTERED`.

Las rutas estables usan `/api/v1`. Una API Core solo puede consumirse si
aparece permitida para el proyecto en el registro.

Cada entrada registra tambien `project_api_version`, `auth_version` y la
version de cada API Core. El router consulta el registro y delega la llamada a
un cliente especializado; no contiene contratos internos del dominio.
