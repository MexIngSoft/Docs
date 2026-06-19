# Registro local de puertos

## Objetivo

Evitar conflictos al levantar el workspace local `Workspace.Comercial` en
Windows, Docker Desktop y proyectos ejecutados directo con `npm` o `manage.py`.

Este documento es el registro canonico de puertos locales. Los proyectos deben
usar estos puertos antes de crear nuevos rangos.

## Decision de repositorio

El script operativo queda versionado temporalmente en `Docs` porque no existe
todavia un repositorio transversal de operaciones. No debe crearse un repositorio
nuevo solo por este script.

Si aparecen mas scripts compartidos, jobs locales, instaladores o tareas
programadas, se debe crear un repositorio separado de operaciones, por ejemplo:

```text
Workspace.Operations
```

Hasta entonces:

- `Docs` documenta el estandar y aloja scripts operativos pequenos.
- `Docker.API.PY`, `Docker.WEB.NJ`, `Docker.DB.PG` y `Docker.SW.Nginx` conservan
  solo su orquestacion propia.

## Rangos reservados

| Rango | Uso | Regla |
|---:|---|---|
| `80` | Nginx local | Entrada recomendada para navegador. |
| `443` | Nginx local HTTPS futuro | Reservado; no publicado todavia. |
| `5432` | PostgreSQL local | Solo `Docker.DB.PG`. |
| `3000-3050` | Webs Next.js | Un puerto por frontend o diagnostico temporal. |
| `8000-8050` | APIs Django/Gateway | Un puerto por API o Gateway General. |

## Puertos Web

| Puerto | Proyecto | Ruta local | Estado |
|---:|---|---|---|
| `3000` | JobCron | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron` | Activo |
| `3001` | TecnoTelec | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec` | Activo |
| `3002` | LexNova | `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Activo |
| `3003` | PhoneShop o alterno LexNova dev | `Docker.WEB.NJ/WEB.NJ.NEXT.PhoneShop` o dev local | Reservado |
| `3004` | DocuCore | `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore` | Activo |
| `3005` | Fiscora | `Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora` | Activo |
| `3006` | Imagrafity | `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity` | Activo |
| `3007` | LeadHunter | `Docker.WEB.NJ/WEB.NJ.NEXT.LeadHunter` | Activo |
| `3008` | REFAPART | `Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart` | Activo |
| `3009` | MexIngSof | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof` | Activo; web publicada en `dev` |
| `3010-3050` | Futuras webs | PENDIENTE_DE_DEFINIR | Reservado |

## Puertos API y Gateway

| Puerto | Proyecto | Ruta local | Estado |
|---:|---|---|---|
| `8000` | Auth API | `Docker.API.PY/API.PY.DJANGO.Auth` | Activo |
| `8001` | Catalog API | `Docker.API.PY/API.PY.DJANGO.Catalog` | Activo |
| `8002` | Inventory API | `Docker.API.PY/API.PY.DJANGO.Inventory` | Activo |
| `8003` | LexNova API | `Docker.API.PY/API.PY.DJANGO.LexNova` | Activo |
| `8004` | Pricing API | `Docker.API.PY/API.PY.DJANGO.Pricing` | Activo |
| `8005` | Procurement API | `Docker.API.PY/API.PY.DJANGO.Procurement` | Activo |
| `8006` | Sales API | `Docker.API.PY/API.PY.DJANGO.Sales` | Activo |
| `8007` | Supplier API | `Docker.API.PY/API.PY.DJANGO.Supplier` | Activo |
| `8008` | Libre | Gateway TecnoTelec retirado | Disponible |
| `8009` | TecnoTelec API | `Docker.API.PY/API.PY.DJANGO.TecnoTelec` | Activo |
| `8010` | Customization API | `Docker.API.PY/API.PY.DJANGO.Customization` | Activo |
| `8011` | Document API | `Docker.API.PY/API.PY.DJANGO.Document` | Activo |
| `8012` | DocuCore API | `Docker.API.PY/API.PY.DJANGO.DocuCore` | Activo |
| `8013` | Libre | Gateway DocuCore retirado | Disponible |
| `8014` | Libre | Gateway Fiscora retirado | Disponible |
| `8015` | Fiscora API | `Docker.API.PY/API.PY.DJANGO.Fiscora` | Activo |
| `8016` | Fiscal API | `Docker.API.PY/API.PY.DJANGO.Fiscal` | Activo |
| `8017` | Libre | Gateway LexNova retirado | Disponible |
| `8018` | Libre | Gateway Imagrafity retirado | Disponible |
| `8019` | Imagrafity API | `Docker.API.PY/API.PY.DJANGO.Imagrafity` | Activo |
| `8020` | Libre | Gateway LeadHunter retirado | Disponible |
| `8021` | LeadHunter API | `Docker.API.PY/API.PY.DJANGO.LeadHunter` | Activo |
| `8022` | JobCron API | `Docker.API.PY/API.PY.DJANGO.JobCron` | Activo |
| `8023` | Libre | Gateway RefaPart retirado | Disponible |
| `8024` | REFAPART API | `Docker.API.PY/API.PY.DJANGO.Refapart` | PENDIENTE_DE_DEFINIR |
| `8025` | Gateway central | `Docker.API.PY/API.PY.DJANGO.Gateway` | Activo; entrada estandar versionada |
| `8026-8050` | Futuras APIs/Gateways | PENDIENTE_DE_DEFINIR | Reservado |

## Script Windows

Script:

```text
Docs/03_standards/operations/scripts/Reserve-WorkspacePorts.ps1
```

El script no ocupa los puertos. Su funcion es detectar y, si se solicita,
detener procesos que esten escuchando en puertos reservados antes de levantar
Docker o servidores locales.

Diagnostico:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Reserve-WorkspacePorts.ps1 -DryRun
```

Liberar puertos no Docker:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Reserve-WorkspacePorts.ps1 -KillConflicts
```

Registrar ejecucion automatica al iniciar sesion:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Reserve-WorkspacePorts.ps1 -RegisterScheduledTask
```

Eliminar tarea automatica:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Reserve-WorkspacePorts.ps1 -UnregisterScheduledTask
```

## Reglas de seguridad

- El modo por defecto no mata procesos.
- `-KillConflicts` no detiene procesos Docker salvo que se use
  `-IncludeDockerProcesses`.
- Registrar la tarea programada requiere PowerShell como Administrador.
- No usar reservas Windows con `netsh excludedportrange` para estos rangos,
  porque puede impedir que Docker, Node o Django publiquen puertos de desarrollo.
- Si un puerto esta tomado por una herramienta externa importante, cerrar esa
  herramienta manualmente y documentar el conflicto antes de automatizarlo.

## Script de reparacion CSS Next.js

Script:

```text
Docs/03_standards/operations/scripts/Repair-NextCss.ps1
```

Este script valida que una web Next.js responda HTML y que sus archivos CSS de
`/_next/static/` existan. Si el CSS falta o responde mal, puede limpiar
cache `.next` y reiniciar el contenedor web o detener el servidor local.

Diagnostico LexNova en Docker:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Repair-NextCss.ps1 -Project lexnova -Url http://localhost:3002
```

Reparacion LexNova en Docker:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Repair-NextCss.ps1 -Project lexnova -Url http://localhost:3002 -Repair -Docker
```

Diagnostico de servidor local alterno:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Repair-NextCss.ps1 -Project lexnova -Url http://localhost:3003 -Local
```

Regla: antes de borrar cache manualmente, correr este script para dejar
evidencia de si la falla era pagina, CSS o servidor.

## Script de arranque limpio Next.js local

Script:

```text
Docs/03_standards/operations/scripts/Start-NextLocalWeb.ps1
```

Este script ejecuta el protocolo local para webs Next.js cuando despues de un
cambio la pagina queda sin estilos, responde `500`, conserva cache vieja o se
atora el dev server. Ejecuta lint/build, detiene solo el puerto del proyecto,
limpia `.next` si se pide y levanta `npm run dev` en el puerto canonico.

DocuCore con limpieza de cache:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-NextLocalWeb.ps1 -Project docucore -CleanCache
```

DocuCore sin limpiar cache:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-NextLocalWeb.ps1 -Project docucore
```

Regla: cuando una web Next.js se vea mal despues de cambios, usar este script
antes de reinicios manuales repetidos.

## Script unificado de arranque Docker

Script:

```text
Docs/03_standards/operations/scripts/Start-WorkspaceDocker.ps1
```

Este es el punto recomendado para levantar el workspace completo. Arranca los
compose en orden, espera estabilizacion, valida contenedores, verifica que las
APIs Django esten escuchando en `8000-8022`, valida rutas HTTP conocidas y
comprueba las webs publicadas en `3000`, `3001`, `3002`, `3004`, `3005`,
`3006`, `3007`, `3008` y `3009`.

El tiempo de espera por defecto es de `150` segundos porque Fiscora construye
su export estatico fuera de Docker y el contenedor necesita margen para que las
webs Next.js de desarrollo compilen sus primeras rutas.

Arranque normal:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1
```

Arranque liberando conflictos de puertos antes de Docker:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -ReleasePorts
```

Arranque y reparacion automatica de CSS de LexNova:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -RepairCss
```

Arranque con checks Django de proyectos criticos:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -RunDjangoChecks
```

Arranque completo con diagnostico agresivo:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-WorkspaceDocker.ps1 -ReleasePorts -RepairCss -RunDjangoChecks
```

Regla: una API puede responder `404` en `/` y estar correctamente cargada. Para
validar disponibilidad se debe revisar proceso, puerto TCP y una ruta propia del
servicio cuando exista.

## Orden operativo recomendado

1. Ejecutar `Start-WorkspaceDocker.ps1`.
2. Si hay conflictos, repetir con `-ReleasePorts`.
3. Si la web carga sin estilos, repetir con `-RepairCss`.
4. Si se modificaron APIs criticas, repetir con `-RunDjangoChecks`.
5. Validar la cadena del proyecto afectado.

Comandos manuales equivalentes, solo para diagnostico o recuperacion puntual:

```powershell
docker compose -f Docker.DB.PG\docker-compose.yml up -d
docker compose -f Docker.API.PY\docker-compose.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.yml up -d --build
docker compose -f Docker.SW.Nginx\docker-compose.yml up -d --build
```

## Script focalizado LexNova + Fiscora

Script:

```text
Docs/03_standards/operations/scripts/Start-LexNovaFiscora.ps1
```

Este script levanta solo lo necesario para ejecutar LexNova y Fiscora en local:

- `Docker.DB.PG`
- APIs: Auth, Gateway central, LexNova, Document, Fiscora y Fiscal.
- Webs: LexNova y Fiscora.

No levanta JobCron, TecnoTelec, DocuCore, Catalog, Supplier, Pricing, Inventory,
Sales, Procurement, Customization ni el worker SYSCOM.

Arranque sin rebuild:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-LexNovaFiscora.ps1
```

Arranque reconstruyendo imagenes:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-LexNovaFiscora.ps1 -Build
```

Arranque con checks:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-LexNovaFiscora.ps1 -Build -RunChecks
```

## Script focalizado DocuCore

Script:

```text
Docs/03_standards/operations/scripts/Start-DocuCore.ps1
```

Este script baja los compose completos de APIs/Web y levanta solo lo necesario
para probar DocuCore:

- `Docker.DB.PG`
- APIs: Gateway central (`8025`), `Document` (`8011`) y `DocuCore` (`8012`).
- Web: `WEB.NJ.NEXT.DocuCore` (`3004`).

No levanta JobCron, TecnoTelec, LexNova, Fiscora, Imagrafity, Catalog,
Supplier, Pricing, Inventory, Sales, Procurement, Customization ni el worker
SYSCOM.

Arranque sin rebuild:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-DocuCore.ps1
```

Arranque reconstruyendo imagenes:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-DocuCore.ps1 -Build
```

Arranque con checks:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-DocuCore.ps1 -Build -RunChecks
```
