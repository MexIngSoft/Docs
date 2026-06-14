---
title: Dependencias API de REFAPART
domain: business
project: refapart
status: active
priority: p1
owner: Equipo REFAPART
last_reviewed: 2026-06-14
---

# Dependencias API de REFAPART

| API | Repositorio | Version usada | Contrato | Gateway | Estado |
|---|---|---|---|---|---|
| Auth | `API.PY.DJANGO.Auth` | `v1` compatible sin prefijo | JWT, usuarios, permisos y sesiones | `API.PY.DJANGO.Gateway` | Implementado MVP |
| Gateway central | `API.PY.DJANGO.Gateway` | `v1` | `/api/v1/auth/*` | Es el Gateway principal | Implementado MVP |
| Gateway central | `API.PY.DJANGO.Gateway` | `v1` | `/api/v1/auth/*` | Principal | Activo |
| RefaPart API | `API.PY.DJANGO.RefaPart` | PENDIENTE_DE_DEFINIR | Catalogo, solicitudes, cotizaciones y pedidos | Gateway central | Futuro |
| JobCron | `API.PY.DJANGO.JobCron` | PENDIENTE_DE_DEFINIR | Operacion interna y proveedores | RefaPart API/Gateway | Futuro |

## Compatibilidad

Auth conserva sus endpoints actuales sin prefijo versionado. El Gateway central
publica un contrato estable para la web y sera responsable de seleccionar una
version nueva cuando Auth exponga `/api/v1/auth/*` o una version mayor.
