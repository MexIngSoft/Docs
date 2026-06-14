---
title: Retiro de Gateways legacy 2026-06-14
domain: standards
status: completed
priority: p1
owner: Equipo de plataforma
last_reviewed: 2026-06-14
---

# Retiro de Gateways legacy 2026-06-14

## Decision

La arquitectura vigente usa un unico `API.PY.DJANGO.Gateway` en el puerto
`8025`. Se autoriza retirar del arbol operativo los Gateways dedicados de
TecnoTelec, DocuCore, Fiscora, LexNova, Imagrafity, LeadHunter y RefaPart.

## Cambios operativos

- Los compose, Dockerfiles y `start.sh` dejan de montar o iniciar Gateways por
  proyecto.
- Los frontends usan el Gateway central y su `application_code`.
- Fiscora y LeadHunter se incorporan a `config/project_registry.yaml`.
- Los puertos `8008`, `8013`, `8014`, `8017`, `8018`, `8020` y `8023` quedan
  libres.
- Los runbooks y scripts validan `API.PY.DJANGO.Gateway` en `8025`.

## Preservacion

Los repositorios legacy con historial Git conservan su recuperacion en sus
remotos. `LeadHunter.Gateway` y `RefaPart.Gateway` no tenian commits; antes de
retirarlos se genero un respaldo local en
`_retired/legacy-gateways/2026-06-14/` con manifiesto SHA-256.

| Archivo | SHA-256 |
|---|---|
| `API.PY.DJANGO.LeadHunter.Gateway.zip` | `404582D2E5A9D990AFD0F2ACCA8D00E3B438BD1E4054AC280E172BF47C36E2AD` |
| `API.PY.DJANGO.RefaPart.Gateway.zip` | `004EAD1D3E92FF9C245F5C1D8259EFF1D20FDC951746EEAEE1E758AE1965E21D` |

Los respaldos excluyen `.git` y `.runtime`; ambos directorios solo contenian
metadatos sin commits y archivos de ejecucion local.

## Rollback

La recuperacion exige restaurar el repositorio remoto o el respaldo local,
reincorporar sus montajes y puerto, y revertir de forma explicita el frontend
afectado. No se permite reactivar un Gateway legacy como dependencia silenciosa.

## Validacion ejecutada

- `docker compose config --quiet`: compose base API, todos los overlays API,
  compose base web y overlay RefaPart correctos.
- `python manage.py check`: correcto en el Gateway central.
- `python manage.py test`: 15 pruebas correctas, incluida carga multipart,
  prefijo de rutas de proyecto y overrides hacia Auth central.
- `npx tsc --noEmit`: correcto en LexNova, DocuCore, Imagrafity, LeadHunter,
  RefaPart y TecnoTelec.
- `bash -n Docker.API.PY/start.sh`: correcto con Git Bash.
- `GET http://127.0.0.1:8025/health/`: HTTP 200 despues de reiniciar el
  proceso central con el codigo actualizado.
- Ruta Fiscora por el Gateway central: HTTP 502 `UPSTREAM_UNAVAILABLE`, resultado
  esperado porque la API Fiscora estaba detenida; confirma que el codigo
  `FISCORA` ya esta registrado y no depende del Gateway retirado.
- Busqueda operativa: sin montajes, variables, carpetas ni puertos legacy en
  Docker, webs, Nginx o scripts activos.
