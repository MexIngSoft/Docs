# Alcance MVP Fiscora

## Objetivo

Cerrar el alcance minimo para convertir el preview y las APIs MVP en una
primera experiencia usable de Fiscora.

## Entra en MVP

| Area | Alcance |
|---|---|
| Portal publico | Hero, demo visual, CTA, explicacion SAT -> XML -> PDF. |
| Dashboard | Resumen de CFDI, creditos, estado SAT y actividad reciente. |
| Centro CFDI | Listado, busqueda, detalle y estados base. |
| XML | Carga manual, conservacion de XML original y metadatos. |
| SAT | Modelo de jobs y estados; integracion real puede quedar detras de bandera. |
| PDF visual | Generacion desde capa Document sin modificar XML original. |
| Planes | Plan gratis con limites y creditos para operaciones premium. |
| Seguridad | Cifrado de secretos si hay SAT, auditoria y aislamiento multiempresa. |

## Fuera del MVP

- Cancelacion fiscal.
- Declaraciones, calculos oficiales o cumplimiento fiscal automatico.
- IA fiscal normativa.
- Integraciones contables/bancarias.
- Marketplace de plantillas.
- Facturacion emitida por Fiscora como PAC.

## Validacion minima

- `npm run build` en `WEB.NJ.NEXT.Fiscora`.
- `python manage.py check` en `API.PY.DJANGO.Fiscal`.
- `python manage.py check` en `API.PY.DJANGO.Fiscora`.
- `python manage.py check` en `API.PY.DJANGO.Gateway`.
- `docker compose config` en `Docker.API.PY` y `Docker.WEB.NJ`.

## Arranque local focalizado

Para ejecutar Fiscora junto con LexNova sin levantar todo el ecosistema:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-LexNovaFiscora.ps1 -Build
```

Este modo levanta solo Auth, LexNova, LexNova Gateway, Document, Fiscora
Gateway, Fiscora, Fiscal, LexNova Web y Fiscora Web.
