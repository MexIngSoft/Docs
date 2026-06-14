---
title: Ciclo de vida de modulos y feature flags
domain: standards
status: active
priority: p1
owner: Equipo de plataforma
last_reviewed: 2026-06-14
---

# Ciclo de vida de modulos y feature flags

## Objetivo

Unificar el seguimiento de desarrollo y la visibilidad de funciones sin
confundir disponibilidad visual con autorizacion de backend.

## Estados de desarrollo

| Estado | Uso |
|---|---|
| `not_started` | Alcance documentado sin implementacion. |
| `analysis` | Requisitos, arquitectura o contratos en definicion. |
| `development` | Implementacion activa, no publica. |
| `testing` | Implementada y bajo validacion. |
| `production` | Disponible con backend, permisos y operacion validados. |
| `obsolete` | Retirada o reemplazada; conserva trazabilidad. |

Los estados visibles de FeatureAvailability (`disabled`, `development`,
`internal`, `beta`, `released`) traducen disponibilidad de producto, no
reemplazan el estado de desarrollo.

## Alcance de reglas

Una feature puede habilitarse por:

- proyecto;
- cliente o tenant;
- pais;
- region;
- entorno;
- rol o permiso, validado nuevamente por backend.

La ausencia de regla usa cierre seguro: `disabled`.

## Responsabilidades

- JobCron mantiene la fuente central de FeatureAvailability.
- Cada proyecto documenta sus `FeatureKey`, fallback y dependencia.
- El frontend decide mostrar, ocultar o marcar estados incompletos.
- Gateway y API vuelven a validar permisos y disponibilidad antes de ejecutar.
- Ninguna feature flag concede acceso por si sola.

## Registro minimo

Cada modulo o feature debe declarar:

- `ProjectKey`, `ModuleKey` y `FeatureKey`;
- owner;
- estado de desarrollo;
- estado de disponibilidad;
- frontend/backend/documentacion listos;
- dependencias;
- paises, regiones, tenants o entornos aplicables;
- version y fecha de revision;
- criterio de rollback.

## Referencias

- `Docs/02_projects/jobcron/feature-availability.md`
- `Docs/03_standards/product/module-catalog.md`
- `Docs/03_standards/security/audit-policy.md`
