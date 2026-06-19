# MexIngSof MVP Gap Report

## Estado

PARTIAL

## Implementado

| Area | Estado |
|---|---|
| Landing corporativa | IMPLEMENTADO |
| Header/menu/CTA | IMPLEMENTADO |
| Hero visual | IMPLEMENTADO |
| Barra de valor | IMPLEMENTADO |
| Tarjetas de soluciones desde Prisma | IMPLEMENTADO |
| Tecnologia/cobertura | IMPLEMENTADO |
| Contacto rapido | IMPLEMENTADO |
| Footer | IMPLEMENTADO |
| Modelo `Product` | IMPLEMENTADO |
| Modelo `ContactLead` | IMPLEMENTADO |
| Seed inicial | IMPLEMENTADO |
| API productos | IMPLEMENTADO |
| API contacto | IMPLEMENTADO |
| Admin productos | IMPLEMENTADO_SIN_AUTH |
| Admin leads | IMPLEMENTADO_SIN_AUTH |

## Pendientes reales

| Pendiente | Por que no avanza |
|---|---|
| Repositorio web oficial | IMPLEMENTADO: `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof` publicado en `https://github.com/MexIngSoft/WEB.NJ.NEXT.MexIngSof.git` rama `dev`. |
| Migracion Prisma real | PENDIENTE_DE_DEFINIR: falta PostgreSQL local/oficial `mexingsof`. |
| Seed real ejecutado | Depende de migracion/base PostgreSQL disponible. |
| Auth admin | PENDIENTE_DE_DEFINIR: debe integrarse via Gateway General/Auth, no Auth local. |
| Datos reales de contacto | PENDIENTE_DE_DEFINIR: telefono, ubicacion y horario final. |
| Despliegue Docker | PARCIAL: definido en `Docker.WEB.NJ` con puerto `3009`; falta prueba de arranque end-to-end con DB/Auth/Gateway cuando existan dependencias. |

## Riesgos

- Los paneles admin no deben publicarse sin Auth.
- El remoto GitHub de MexIngSof solo tiene `dev` por instruccion vigente; no se
  publicaron `pro` ni `main`.
- `npm audit` reporta 2 vulnerabilidades moderadas; no se aplico
  `npm audit fix --force` porque podria introducir cambios incompatibles.
- La maqueta esta implementada como aproximacion visual; la verificacion
  pixel-perfect requiere revision humana contra la imagen de referencia.
