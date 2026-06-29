# Mapa de repositorios Git

> Estado: base vigente.

## Objetivo

Definir que `Workspace.Comercial` es solo una carpeta local de trabajo y no un repositorio Git unico. Cada proyecto debe publicarse desde su propio repositorio para evitar mezclar Docker, APIs, webs y documentacion en un solo historial.

## Regla principal

Los commits y pushes se hacen por repositorio y por responsabilidad. No se debe inicializar ni publicar `Workspace.Comercial` como un monorepo mientras la arquitectura siga separada por proyectos.

## Ramas vivas oficiales

Las ramas persistentes del workspace son:

| Rama | Uso |
|---|---|
| `main` | Version estable/canonica publicada. |
| `pro` | Preparacion y control previo a produccion. |
| `dev` | Base de desarrollo validada. |
| `general` | Rama operativa diaria que extiende de `dev` para integracion general. |

Reglas:

- `general` debe crearse desde `dev` y mantenerse alineada con `dev`.
- `general` es la rama operativa por defecto para trabajo diario cuando el repo la tenga habilitada en GitHub.
- La rama default en GitHub requiere permiso administrativo; si no se puede cambiar desde terminal, se registra como `PENDIENTE_DE_DEFINIR`.
- No usar `feature/general-integration-dev` como rama viva. Ese nombre queda reemplazado por `general`.

## Repositorios detectados

| Capa | Ruta local | Repositorio remoto | Estado de publicacion |
|---|---|---|---|
| Docker APIs | `Docker.API.PY` | `https://github.com/MexIngSoft/Docker.API.PY.git` | Separado |
| API Address | `Docker.API.PY/API.PY.DJANGO.Address` | `https://github.com/MexIngSoft/API.PY.DJANGO.Address.git` | Requiere crear repo o habilitar acceso; GitHub responde `Repository not found` |
| API Auth | `Docker.API.PY/API.PY.DJANGO.Auth` | `https://github.com/MexIngSoft/API.PY.DJANGO.Auth.git` | Separado |
| API Catalog | `Docker.API.PY/API.PY.DJANGO.Catalog` | `https://github.com/MexIngSoft/API.PY.DJANGO.Catalog.git` | Separado |
| API Customization | `Docker.API.PY/API.PY.DJANGO.Customization` | `https://github.com/MexIngSoft/API.PY.DJANGO.Customization.git` | Separado |
| API Inventory | `Docker.API.PY/API.PY.DJANGO.Inventory` | `https://github.com/MexIngSoft/API.PY.DJANGO.Inventory.git` | Separado |
| API LexNova | `Docker.API.PY/API.PY.DJANGO.LexNova` | `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.git` | Separado |
| API Pricing | `Docker.API.PY/API.PY.DJANGO.Pricing` | `https://github.com/MexIngSoft/API.PY.DJANGO.Pricing.git` | Separado |
| API Gateway central | `Docker.API.PY/API.PY.DJANGO.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.Gateway.git` | Separado |
| API Procurement | `Docker.API.PY/API.PY.DJANGO.Procurement` | `https://github.com/MexIngSoft/API.PY.DJANGO.Procurement.git` | Separado |
| API Sales | `Docker.API.PY/API.PY.DJANGO.Sales` | `https://github.com/MexIngSoft/API.PY.DJANGO.Sales.git` | Separado |
| API Supplier | `Docker.API.PY/API.PY.DJANGO.Supplier` | `https://github.com/MexIngSoft/API.PY.DJANGO.Supplier.git` | Separado |
| API TecnoTelec | `Docker.API.PY/API.PY.DJANGO.TecnoTelec` | `https://github.com/MexIngSoft/API.PY.DJANGO.TecnoTelec.git` | Separado |
| API Document | `Docker.API.PY/API.PY.DJANGO.Document` | `https://github.com/MexIngSoft/API.PY.DJANGO.Document.git` | Separado |
| API DocuCore | `Docker.API.PY/API.PY.DJANGO.DocuCore` | `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.git` | Separado |
| API Fiscal | `Docker.API.PY/API.PY.DJANGO.Fiscal` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscal.git` | Separado |
| API Fiscora | `Docker.API.PY/API.PY.DJANGO.Fiscora` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.git` | Separado |
| API JobCron | `Docker.API.PY/API.PY.DJANGO.JobCron` | `https://github.com/MexIngSoft/API.PY.DJANGO.JobCron.git` | Publicado en `dev`, `pro` y `main` |
| API Imagrafity | `Docker.API.PY/API.PY.DJANGO.Imagrafity` | `https://github.com/MexIngSoft/API.PY.DJANGO.Imagrafity.git` | Publicado en `dev`, `pro` y `main` |
| API LeadHunter | Retirado | No aplica | Proyecto eliminado del workspace; documentacion historica en `Docs/_archive/projects/2026-06-26-leadhunter-retired`. |
| API RefaPart | `Docker.API.PY/API.PY.DJANGO.RefaPart` | `https://github.com/MexIngSoft/API.PY.DJANGO.RefaPart.git` | Separado |
| API Search | `Docker.API.PY/API.PY.DJANGO.Search` | `https://github.com/MexIngSoft/API.PY.DJANGO.Search.git` | Repo remoto asignado; publicar cambios en `dev` por instruccion vigente |
| Docker PostgreSQL | `Docker.DB.PG` | `https://github.com/MexIngSoft/Docker.DB.PG.git` | Separado |
| Docker Nginx | `Docker.SW.Nginx` | `https://github.com/1CASH1/Docker.SW.Nginx` | Separado |
| Docker Web | `Docker.WEB.NJ` | `https://github.com/MexIngSoft/Docker.WEB.NJ.git` | Separado, requiere validar propiedad local |
| Web DocuCore | `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.DocuCore.git` | Separado |
| Web Fiscora | `Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.Fiscora.git` | Separado |
| Web Imagrafity | `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.Imagrafity.git` | Publicado en `dev`, `pro` y `main` |
| Web JobCron | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.JobCron.git` | Separado |
| Web LeadHunter | Retirado | No aplica | Proyecto eliminado del workspace; documentacion historica en `Docs/_archive/projects/2026-06-26-leadhunter-retired`. |
| Web LexNova | `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.LexNova.git` | Separado |
| Web MexIngSof | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.MexIngSof.git` | Publicado en `dev`; `pro` y `main` no publicados por instruccion vigente |
| Web TecnoTelec | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.TecnoTelec.git` | Separado |
| Documentacion | `Docs` | `https://github.com/MexIngSoft/Docs.git` | Separado |

## Webs dentro de Docker.WEB.NJ

Se detectaron estas carpetas web:

| Proyecto web | Ruta local | Estado Git detectado |
|---|---|---|
| DocuCore | `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore` | Repo propio asignado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.DocuCore.git` |
| Fiscora | `Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora` | Repo propio asignado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.Fiscora.git` |
| Imagrafity | `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity` | Repo propio asignado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.Imagrafity.git` |
| JobCron | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron` | Repo propio detectado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.JobCron.git` |
| LexNova | `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Repo propio detectado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.LexNova.git` |
| MexIngSof | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof` | Repo propio detectado y publicado en `dev`: `https://github.com/MexIngSoft/WEB.NJ.NEXT.MexIngSof.git` |
| TecnoTelec | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec` | Repo propio detectado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.TecnoTelec.git` |

Si una web no tiene repo Git propio, antes de subirla como proyecto separado se debe restaurar o crear su `.git` propio y asignar su remoto. Mientras no exista `.git` por web, sus cambios viven dentro del repo contenedor que la incluya.

## Orden recomendado de subida

1. `Docs`: documentacion base, decisiones y reglas de publicacion.
2. APIs de dominio: cambios propios por API.
3. `API.PY.DJANGO.Gateway`: entrada central y registro de proyectos.
4. `Docker.DB.PG`: schemas, scripts de inicializacion y reglas de base de datos.
5. `Docker.API.PY`: compose, Dockerfile, `start.sh`, workers y variables por proyecto.
6. `Docker.WEB.NJ`: frontend compartido o webs contenidas en ese repo.
7. `Docker.SW.Nginx`: rutas de publicacion cuando existan cambios.

Para cambios de una web con repo propio, subir primero el repo de la web y despues, solo si cambio el orquestador, subir `Docker.WEB.NJ`.

Este orden evita publicar infraestructura que dependa de contratos todavia no versionados.

## Reglas de commit

Los mensajes de commit deben escribirse en ingles, ser cortos y describir la responsabilidad del cambio.

Ejemplos:

| Repositorio | Ejemplo de commit |
|---|---|
| `Docs` | `Document separated repository publishing flow` |
| `Docker.API.PY` | `Configure isolated project environments` |
| `Docker.DB.PG` | `Add PascalCase project schemas` |
| `API.PY.DJANGO.Supplier` | `Add Syscom catalog sync endpoints` |
| `API.PY.DJANGO.Document` | `Add document processing MVP` |
| `API.PY.DJANGO.DocuCore` | `Add DocuCore tool catalog MVP` |
| `API.PY.DJANGO.Fiscal` | `Add fiscal core MVP` |
| `API.PY.DJANGO.Fiscora` | `Add Fiscora product API MVP` |
| `API.PY.DJANGO.Gateway` | `Register project routes in central gateway` |
| `Docker.WEB.NJ` | `Update TecnoTelec catalog mockup` |
| `WEB.NJ.NEXT.DocuCore` | `Add DocuCore dashboard MVP` |
| `WEB.NJ.NEXT.Fiscora` | `Add Fiscora animation preview` |
| `WEB.NJ.NEXT.TecnoTelec` | `Improve public user experience` |
| `WEB.NJ.NEXT.JobCron` | `Update JobCron dashboard experience` |
| `WEB.NJ.NEXT.MexIngSof` | `Add MexIngSof corporate web MVP` |

## Reglas de seguridad

- No subir `.env`, `.env.local`, tokens, secrets ni credenciales reales.
- Mantener `.env.example` y `.env.local.example` como plantillas sin secretos.
- Revisar `git status --short` dentro de cada repo antes de hacer commit.
- Usar `git add` con rutas explicitas cuando haya cambios mezclados.
- No usar `git add -A` desde `Workspace.Comercial` porque no es repo y porque podria mezclar responsabilidades si se ejecuta desde un repo padre futuro.

## Identidad Git obligatoria

Para los proyectos dentro de `Workspace.Comercial`, la identidad de commits debe
corresponder al owner GitHub `1CASH1`.

Configuracion vigente esperada:

```bash
git config --global user.name "1CASH1"
git config --global user.email "7905831+1CASH1@users.noreply.github.com"
git config --global credential.https://github.com.username "1CASH1"
```

Reglas:

- No usar nombres de autor que no correspondan al owner GitHub activo.
- No usar correos personales sin confirmar que esten verificados en la cuenta
  GitHub correcta.
- Si GitHub muestra otro usuario en commits nuevos, revisar primero
  `git config --global user.name`, `git config --global user.email` y la
  credencial HTTPS activa.
- Los commits ya publicados con una identidad anterior no deben reescribirse
  sin decision explicita del owner, porque eso cambia historiales compartidos.

### Correccion historica autorizada

Si el owner solicita explicitamente que toda la historia publicada muestre una
sola identidad, se permite reescribir la historia Git de los repositorios
afectados.

Reglas para esa correccion:

- Reescribir autor y committer a `1CASH1`.
- Usar el correo noreply verificado de GitHub:
  `7905831+1CASH1@users.noreply.github.com`.
- Ejecutar la correccion por repositorio, no desde `Workspace.Comercial` como
  monorepo.
- Empujar solo las ramas oficiales `dev`, `pro` y `main`.
- Usar `--force-with-lease` para publicar la historia reescrita.
- Registrar repos sin remoto o con remoto inaccesible como
  `PENDIENTE_DE_DEFINIR`.
- Validar despues con `git log --all` que no queden autores o committers fuera
  de la identidad oficial.

## Publicacion por repositorio

Para cada repo:

```bash
cd <ruta-del-repo>
git status --short
git add <archivos-del-cambio>
git commit -m "<English commit message>"
git push origin <rama>
```

La rama publicada debe ser una de las ramas vigentes del workspace:

- `main`
- `pro`
- `dev`
- `general`

No deben quedar ramas persistentes adicionales en local ni remoto. Si una tarea
necesita una rama temporal local, se debe integrar y eliminar antes del cierre.

Antes de publicar `Docker.WEB.NJ`, si Git marca propiedad dudosa en Windows, se debe registrar la carpeta como segura para el usuario actual:

```bash
git config --global --add safe.directory C:/Users/cash1/source/repos/Workspace.Comercial/Docker.WEB.NJ
```

## Limpieza de ramas Auth 2026-06-27

Repositorio:

```text
Docker.API.PY/API.PY.DJANGO.Auth
```

Validacion:

- `origin/feature/general-integration-dev` era ancestro de `origin/general`;
- no habia commits pendientes de esa rama por fusionar a `general`;
- `origin/general` conserva el trabajo integrado.

Decision:

```text
git push origin --delete feature/general-integration-dev
```

Estado remoto final esperado:

```text
origin/dev
origin/general
origin/main
origin/pro
```

Regla:

No recrear `feature/general-integration-dev`. La rama operativa diaria es
`general`, creada desde `dev` y alineada con el flujo vigente.

## Pendientes

- Confirmar si `WEB.NJ.NEXT.JobCron`, `WEB.NJ.NEXT.LexNova` y `WEB.NJ.NEXT.TecnoTelec` deben mantenerse como repos Git separados y si tambien deben referenciarse desde el repo contenedor.
- Instalar o habilitar GitHub CLI (`gh`) si se quiere crear pull requests desde terminal.
- PENDIENTE_DE_DEFINIR: confirmar si todos los repos tendran protecciones
  obligatorias de GitHub sobre `dev`, `pro` y `main`.

## Revision de ramas 2026-06-29

Tarea solicitada: publicar cambios pendientes en `general` y conservar solo las
ramas persistentes oficiales:

```text
main
pro
dev
general
```

Resultado:

| Resultado | Detalle |
|---|---|
| Repos con cambios publicados | `Docs`, `Docker.API.PY`, `API.PY.DJANGO.Auth`, `API.PY.DJANGO.Gateway`, `API.PY.DJANGO.JobCron`, `Docker.DB.PG`, `Docker.WEB.NJ`, `WEB.NJ.NEXT.RefaPart`. |
| Rama usada | `general`. |
| Relacion `general` -> `dev` | OK en repos con cambios: `dev` es ancestro de `general`. |
| Ramas remotas eliminadas | `feature/general-integration-dev` eliminada de los repos detectados que aun la tenian viva. |
| Ramas remotas permitidas finales | `main`, `pro`, `dev`, `general`. |
| Bloqueo restante | `WEB.NJ.NEXT.TecnoTelec` conserva `origin/master` porque GitHub rechazo la eliminacion: `refusing to delete the current branch: refs/heads/master`. |
| Accion requerida | Cambiar la default branch de `MexIngSoft/WEB.NJ.NEXT.TecnoTelec` a `general`, `dev`, `pro` o `main` desde GitHub; despues ejecutar `git push origin --delete master`. |
| Herramienta local | `gh` no esta instalado en el entorno, por eso no se pudo cambiar default branch desde terminal. |

Mientras `master` siga siendo default branch en GitHub, no se puede eliminar
por push aunque `general` ya exista publicado.

## Revision de repositorios 2026-06-19

Revision ejecutada con `git ls-remote` sobre las carpetas canonicas de
`Docker.API.PY`, `Docker.WEB.NJ`, `Docker.DB.PG`, `Docker.SW.Nginx` y `Docs`.

### Repos que requieren crear repo o habilitar acceso

| Proyecto | Ruta local | Remoto esperado | Motivo |
|---|---|---|---|
| API Address | `Docker.API.PY/API.PY.DJANGO.Address` | `https://github.com/MexIngSoft/API.PY.DJANGO.Address.git` | GitHub responde `Repository not found`. |
| API Gateway central | `Docker.API.PY/API.PY.DJANGO.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.Gateway.git` | Resuelto: repo separado disponible. |

### Repos locales historicos sin publicacion activa

| Proyecto | Ruta local | Accion pendiente |
|---|---|---|
| API LeadHunter | Retirado | No crear repo activo; proyecto eliminado del workspace. |
| Web LeadHunter | Retirado | No crear repo activo; proyecto eliminado del workspace. |

### Repos existentes que no requieren creacion

| Proyecto | Ruta local | Estado |
|---|---|---|
| Web MexIngSof | `Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof` | Repo existe y `dev` fue publicado; `pro` y `main` quedan pendientes por instruccion vigente de subir solo a `dev`. |
| API Search | `Docker.API.PY/API.PY.DJANGO.Search` | Repo existe: `https://github.com/MexIngSoft/API.PY.DJANGO.Search.git`; publicar cambios en `dev` por instruccion vigente. |
| API RefaPart | `Docker.API.PY/API.PY.DJANGO.RefaPart` | Repo existe, pero no tiene ramas; initial push queda bloqueado hasta revisar el cambio local no commiteado en `config/settings.py`. |
| Web TecnoTelec | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec` | Repo existe; conserva rama remota adicional `master` porque GitHub la mantiene como HEAD/default. |

## Ejecucion historica de unificacion de ramas 2026-06-18

> Referencia historica. La politica vigente desde 2026-06-26 reemplaza el
> modelo de tres ramas por `main`, `pro`, `dev` y `general`.

Tarea solicitada: unificar ramas para que cada repositorio conserve solo
`dev`, `pro` y `main`.

Documentacion leida antes de ejecutar:

- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/03_standards/operations/git-environments-and-release-flow.md`
- `Docs/03_standards/operations/github-branch-governance.md`
- `Docs/03_standards/operations/git-repository-map.md`

Documentacion actualizada:

- `Docs/03_standards/operations/git-environments-and-release-flow.md`
- `Docs/03_standards/operations/github-branch-governance.md`
- `Docs/03_standards/operations/git-repository-map.md`
- `Docs/03_standards/operations/codex-working-rules.md`

Decision documentada:

- Las unicas ramas persistentes permitidas son `dev`, `pro` y `main`.
- Las ramas temporales no deben quedar publicadas ni vivas al cerrar tareas.
- La comunicacion canonica queda: `dev -> pro -> main`.

Resultado de ejecucion:

| Resultado | Cantidad | Detalle |
|---|---:|---|
| Remotos normalizados | 28 | Quedaron con ramas remotas `dev`, `main`, `pro`. |
| Repos locales historicos sin remoto | 2 | `API.PY.DJANGO.LeadHunter`, `WEB.NJ.NEXT.LeadHunter`. Desde 2026-06-26 quedaron retirados y eliminados del workspace activo. |
| Remotos inaccesibles | 3 | `API.PY.DJANGO.Address`, `API.PY.DJANGO.Gateway`, `API.PY.DJANGO.RefaPart`. |
| Remotos con bloqueo pendiente | 1 | `WEB.NJ.NEXT.TecnoTelec` conserva `master` remoto porque GitHub reporta `master` como HEAD/default branch. |

Validaciones ejecutadas:

| Validacion | Resultado |
|---|---|
| `rg` sobre estandares operativos para referencias activas a ramas no permitidas | OK: no quedaron referencias activas en los documentos editados. |
| `git -C Docs diff --check` | OK. |
| Inventario de repos `.git` del workspace | OK: 34 repos detectados. |
| `git status --short` por repo antes de unificar | OK: 34 repos limpios. |
| Creacion/actualizacion local de `dev`, `pro`, `main` por repo | OK: 34 repos locales quedaron en `dev`, `main`, `pro`. |
| Push de `dev`, `pro`, `main` a remotos accesibles | OK en 28 remotos accesibles; 2 usaron `--force-with-lease` por historial remoto no fast-forward (`WEB.NJ.NEXT.JobCron`, `Docs`). |
| Eliminacion de ramas remotas no permitidas | OK salvo `WEB.NJ.NEXT.TecnoTelec/master`. |
| `git status --short` final por repo | OK: 34 repos limpios. |

Faltantes reales:

- PENDIENTE_DE_DEFINIR: crear o corregir acceso remoto para
  `API.PY.DJANGO.Address`, `API.PY.DJANGO.Gateway` y `API.PY.DJANGO.RefaPart`.
- PENDIENTE_DE_DEFINIR: asignar `main`, `dev` o `pro` como default branch de
  `WEB.NJ.NEXT.TecnoTelec` en GitHub y despues eliminar `master`.
- Resuelto por decision 2026-06-26: `API.PY.DJANGO.LeadHunter` y
  `WEB.NJ.NEXT.LeadHunter` quedaron retirados y eliminados del workspace activo.

Contradicciones detectadas y resueltas:

- Los documentos operativos previos recomendaban ramas adicionales como parte
  del flujo vivo. Se reemplazaron por el estandar unico `dev`, `pro`, `main`.

## Ejecucion de correccion historica de identidad Git 2026-06-18

Tarea solicitada: corregir la historia publicada para que los commits del
workspace aparezcan con la identidad oficial `1CASH1`.

Documentacion leida antes de ejecutar:

- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/03_standards/operations/standard-request-prompts.md`
- `Docs/03_standards/operations/git-environments-and-release-flow.md`
- `Docs/03_standards/operations/github-branch-governance.md`
- `Docs/03_standards/operations/git-repository-map.md`

Decision documentada:

- Por instruccion explicita del owner, se reescribio la historia Git de los
  repositorios del workspace para normalizar autor y committer como `1CASH1`.
- La identidad oficial usada fue
  `1CASH1 <7905831+1CASH1@users.noreply.github.com>`.
- La correccion aplica a historia local y a los remotos accesibles.

Resultado de ejecucion:

| Resultado | Cantidad | Detalle |
|---|---:|---|
| Repos detectados | 34 | Todos dentro de `Workspace.Comercial`. |
| Repos limpios antes de reescribir | 34 | No habia cambios sin commit. |
| Repos reescritos localmente | 34 | Autor y committer quedaron en la identidad oficial. |
| Remotos actualizados con force push | 28 | Ramas `dev`, `pro` y `main` publicadas con historia reescrita. |
| Repos locales historicos sin remoto | 2 | `API.PY.DJANGO.LeadHunter`, `WEB.NJ.NEXT.LeadHunter`. Desde 2026-06-26 quedaron retirados y eliminados del workspace activo. |
| Remotos inaccesibles | 3 | `API.PY.DJANGO.Address`, `API.PY.DJANGO.Gateway`, `API.PY.DJANGO.RefaPart`. |
| Ramas remotas adicionales | 1 | `WEB.NJ.NEXT.TecnoTelec/master` se reescribio con identidad oficial; GitHub no permitio borrarla porque sigue protegida/default. |

Validaciones ejecutadas:

| Validacion | Resultado |
|---|---|
| `git log --all` por repo para autor y committer | OK local en 34 repos. |
| Push forzado de `dev`, `pro`, `main` | OK en 28 remotos accesibles. |
| Revision de ramas remotas accesibles con `git log FETCH_HEAD` | OK: ramas remotas accesibles quedan con identidad oficial. |
| Limpieza de ramas locales no permitidas | OK: ramas locales finales `dev`, `pro`, `main`. |

Faltantes reales:

- PENDIENTE_DE_DEFINIR: corregir acceso o crear remotos para
  `API.PY.DJANGO.Address`, `API.PY.DJANGO.Gateway` y `API.PY.DJANGO.RefaPart`
  para poder publicar tambien su historia reescrita.
- PENDIENTE_DE_DEFINIR: asignar `main`, `dev` o `pro` como default branch de
  `WEB.NJ.NEXT.TecnoTelec` en GitHub y despues eliminar `master`.
- Resuelto por decision 2026-06-26: `API.PY.DJANGO.LeadHunter` y
  `WEB.NJ.NEXT.LeadHunter` quedaron retirados y eliminados del workspace activo.
