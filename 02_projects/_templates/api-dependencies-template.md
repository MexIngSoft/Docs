# Dependencias API - <Proyecto>

## Objetivo

Declarar que APIs y versiones consume el proyecto mediante su Gateway/BFF.

## Matriz

| API | Repositorio | Version usada | Contrato | Gateway | Estado |
|---|---|---|---|---|---|
| Auth | `API.PY.DJANGO.Auth` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR |

## Reglas

- El frontend no consume APIs core directamente.
- El Gateway documenta adapters y versiones.
- Cualquier cambio de version debe actualizar
  `Docs/02_projects/_ecosystem/api-version-matrix.md`.

## Riesgos

- PENDIENTE_DE_DEFINIR

## Validaciones

- [ ] Gateway responde healthcheck.
- [ ] Auth version validada.
- [ ] Endpoints criticos probados.
- [ ] Errores normalizados.
