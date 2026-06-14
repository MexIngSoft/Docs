---
title: Estandar de migracion al Gateway central
domain: standards
status: active
priority: p1
owner: Equipo de plataforma
last_reviewed: 2026-06-14
---

# Estandar de migracion al Gateway central

## Fases

1. Registrar el proyecto en `config/project_registry.yaml`.
2. Validar rutas Auth y health con el Gateway central.
3. Cambiar `NEXT_PUBLIC_GATEWAY_BASE_URL` en el frontend.
4. Conservar el Gateway anterior como fallback.
5. Probar el proyecto completo.
6. Marcar el Gateway anterior `deprecated`.
7. Marcarlo `disabled` solo despues de evidencia integrada.
8. Archivar cuando ninguna ruta, compose o frontend lo use.

Cada proyecto documenta riesgos, rollback, variables, APIs y version Auth en
`02_projects/<proyecto>/architecture/gateway-migration.md`.

No se permite borrar o deshabilitar un Gateway legacy durante la primera
migracion.

Una retirada final puede agrupar los estados `deprecated`, `disabled` y
`archived` solo cuando exista autorizacion explicita del responsable de la
arquitectura, auditoria de consumidores, respaldo de cambios no versionados y
un registro fechado de la ejecucion. Esta excepcion no aplica a una primera
migracion ni sustituye las pruebas integradas.
