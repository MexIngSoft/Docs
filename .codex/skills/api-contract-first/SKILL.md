---
title: API Contract First Skill
domain: Codex
status: ACTIVE
priority: P1
owner: Equipo plataforma
name: api-contract-first
description: Disena o modifica APIs siguiendo contrato antes de codigo.
---

# API Contract First Skill

## Leer primero

- `Docs/01_core_erp/apis/reusable-api-contracts.md`
- `Docs/03_standards/api/api-contract-first-standard.md`
- `Docs/03_standards/architecture/api-gateway-standard.md`

## Contrato minimo

Toda API debe definir:

- responsabilidad;
- endpoints;
- request;
- response;
- errores;
- permisos;
- modelos;
- migraciones;
- healthcheck;
- ruta Gateway;
- pruebas minimas.

## Prohibido

- Endpoint sin contrato.
- Modelo sin migracion.
- Frontend sin ruta Gateway.
- No usar SQLite.
- API duplicada.

## Salida obligatoria

- Contrato creado o actualizado.
- API reutilizable o especializada justificada.
- Ruta Gateway.
- Validaciones ejecutadas.
- Faltantes con `PENDIENTE_DE_DEFINIR`.
