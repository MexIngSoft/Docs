# Inventario operativo por proyecto

## Estado

ACTIVE

## Objetivo

Registrar lo minimo indispensable para trabajar, levantar, apagar, probar y
documentar cada proyecto activo sin inventar APIs, contratos, bases ni schemas.

## Stack oficial

| Elemento | Valor |
|---|---|
| Stack Docker | `comercial_platform` |
| Red Docker | `jobcron_network` |
| DB | `db-postgresql` / `postgres:16.13` |
| APIs | `api-multiproyecto` / `api-multiproyecto:3.10.19-slim-bookworm` |
| Webs | `web-frontend-node` / `web-frontend-node:20.19.0-bookworm-slim` |
| Reverse proxy | `nginx` / `nginx:1.24.0` |
| Scripts | `Docs/03_standards/operations/scripts/docker/projects` |

## Inventario

| Proyecto | Estado | Web | API | Gateway | DB | Scripts | Runbook | Puerto | Bloqueos |
|---|---|---|---|---|---|---|---|---|---|
| DocuCore | LISTO PARA TRABAJAR | `WEB.NJ.NEXT.DocuCore` | `document`, `docucore` | Gateway General | `comercial/Document`, `comercial/DocuCore` | start/stop/status/health documentados | `Docs/02_projects/docucore` sin `local-runbook.md`; usa docs de proyecto | `3004` | Runbook minimo especifico pendiente. |
| Fiscora | LISTO PARA TRABAJAR | `WEB.NJ.NEXT.Fiscora` | `document`, `fiscora`, `fiscal` | Gateway General | `comercial/Fiscora`, `comercial/Fiscal` | start/stop/status/health documentados | `Docs/02_projects/fiscora/local-runbook.md` | `3005` | Sin bloqueo operativo detectado. |
| Imagrafity | LISTO PARA TRABAJAR | `WEB.NJ.NEXT.Imagrafity` | `imagrafity` | Gateway General | `comercial/Imagrafity` | start/stop/status/health documentados | `Docs/02_projects/imagrafity/local-runbook.md` | `3006` | Sin bloqueo operativo detectado. |
| JobCron | LISTO PARA TRABAJAR | `WEB.NJ.NEXT.JobCron` | `jobcron`, `search` | Gateway General | `jobcron/JobCron` | start/stop/status/health documentados | `Docs/02_projects/jobcron/local-runbook.md` | `3000` | Sin bloqueo operativo detectado. |
| LexNova | LISTO PARA TRABAJAR | `WEB.NJ.NEXT.LexNova` | `lexnova`, `document` | Gateway General | `lexnova/*` | start/stop/status/health documentados | `Docs/02_projects/lexnova/local-dependency-runbook.md` | `3002` | Sin bloqueo operativo detectado. |
| MexIngSof | PARCIAL | `WEB.NJ.NEXT.MexIngSof` | Usa `jobcron` y `search` para integracion futura | Gateway General | `PENDIENTE_DE_DEFINIR`; MVP actual conserva Prisma local | start/stop/status/health documentados | `Docs/02_projects/mexingsof/local-runbook.md` | `3009` | Contrato final de leads/CRM/Auth/DB pendiente. |
| REFAPART | LISTO PARA TRABAJAR | `WEB.NJ.NEXT.RefaPart` | `refapart`, `address`, `search` | Gateway General | `comercial/RefaPart`, `Search`, Address `PENDIENTE_DE_DEFINIR` | start/stop/status/health documentados | `Docs/02_projects/refapart/local-runbook.md` | `3008` | Confirmar schema Address si aplica. |
| TecnoTelec | PARCIAL | `WEB.NJ.NEXT.TecnoTelec` | APIs core + `tecnotelec`, `customization`, `search` | Gateway General | `comercial/TecnoTelec`, `TecnoTelecGateway`, `Customization` | start/stop/status/health documentados | `Docs/02_projects/tecnotelec/local-runbook.md` | `3001` | Quote API, Rules Engine, Projects API y ChannelAssortment siguen sin contrato final. |

## Scripts globales

| Script | Estado | Uso |
|---|---|---|
| `start-all.ps1` | ACTIVO | Levanta stack master. |
| `stop-all.ps1` | ACTIVO | Detiene API, Web y Nginx; conserva PostgreSQL. |
| `status-all.ps1` | ACTIVO | Muestra contenedores, imagenes y red. |
| `healthcheck-all.ps1` | ACTIVO | Valida URLs registradas; para pruebas completas se recomienda proyecto por proyecto. |
| `clean-safe.ps1` | ACTIVO | Limpieza segura sin borrar volumenes. |

## Scripts por proyecto

| Proyecto | Start | Stop | Estado |
|---|---|---|---|
| DocuCore | `start-docucore.ps1` | `stop-docucore.ps1` | Existe |
| Fiscora | `start-fiscora.ps1` | `stop-fiscora.ps1` | Existe |
| Imagrafity | `start-imagrafity.ps1` | `stop-imagrafity.ps1` | Existe |
| JobCron | `start-jobcron.ps1` | `stop-jobcron.ps1` | Existe |
| LexNova | `start-lexnova.ps1` | `stop-lexnova.ps1` | Existe |
| MexIngSof | `start-mexingsof.ps1` | `stop-mexingsof.ps1` | Existe |
| REFAPART | `start-refapart.ps1` | `stop-refapart.ps1` | Existe |
| TecnoTelec | `start-tecnotelec.ps1` | `stop-tecnotelec.ps1` | Existe |

## Bloqueos reales

| Proyecto | Bloqueo | Documento faltante | Impacto | Accion necesaria |
|---|---|---|---|---|
| DocuCore | No tiene `local-runbook.md` dedicado | Runbook operativo DocuCore | Menor: existe documentacion funcional, pero no runbook uniforme | Crear runbook minimo cuando se trabaje DocuCore. |
| MexIngSof | Leads/CRM/Auth/DB final pendiente | Contrato leads/CRM/Auth/DB | No se debe implementar persistencia final | Crear contrato canonico antes de cambiar runtime. |
| REFAPART | Schema Address no confirmado | Decision Address DB | Riesgo de asumir schema inexistente | Confirmar uso real de Address. |
| TecnoTelec | APIs futuras sin contrato | Quote/Rules/Projects/ChannelAssortment | No se deben crear APIs nuevas | Cerrar contratos o marcar fuera de MVP. |

## Pruebas operativas registradas

| Proyecto | Web | Gateway | APIs activadas | Resultado |
|---|---|---|---|---|
| DocuCore | `http://127.0.0.1:3004/` HTTP 200 | `http://127.0.0.1:8025/health/` HTTP 200 | `auth gateway document docucore` | OK |
| Fiscora | `http://127.0.0.1:3005/` HTTP 200 | `http://127.0.0.1:8025/health/` HTTP 200 | `auth gateway document fiscora fiscal` | OK |
| Imagrafity | `http://127.0.0.1:3006/` HTTP 200 | `http://127.0.0.1:8025/health/` HTTP 200 | `auth gateway imagrafity` | OK |
| JobCron | `http://127.0.0.1:3000/` HTTP 200 | `http://127.0.0.1:8025/health/` HTTP 200 | `auth gateway jobcron search` | OK |
| LexNova | `http://127.0.0.1:3002/auth/login` HTTP 200 | `http://127.0.0.1:8025/health/` HTTP 200 | `auth gateway lexnova document` | OK |
| MexIngSof | `http://127.0.0.1:3009/` HTTP 200 | `http://127.0.0.1:8025/health/` HTTP 200 | `auth gateway jobcron search` | OK operativo; contrato leads/CRM/DB parcial |
| REFAPART | `http://127.0.0.1:3008/` HTTP 200 | `http://127.0.0.1:8025/health/` HTTP 200 | `auth gateway refapart address search` | OK |
| TecnoTelec | `http://127.0.0.1:3001/` HTTP 200 | `http://127.0.0.1:8025/health/` HTTP 200 | `auth gateway catalog inventory pricing procurement sales supplier tecnotelec customization search` | OK operativo; APIs futuras sin contrato |

## Validacion operativa

Las validaciones de URL locales deben usar `127.0.0.1` para evitar falsos
negativos por resolucion `localhost` en Windows.
