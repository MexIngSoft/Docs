# Branch Unification Report

Fecha: 2026-06-26

## Objetivo

Ejecutar `AGENTS-014.md` para unificar ramas secundarias hacia `dev` en todos
los repositorios Git del workspace, sin modificar `main`, `pro`, `prod` ni
`production`, y conservando `feature/general-integration-dev` como rama de
integracion.

## Resultado ejecutivo

- Repositorios Git analizados: 36.
- Rama base usada: `dev`.
- Rama de integracion creada o actualizada: `feature/general-integration-dev`.
- Ramas protegidas no modificadas: `main`, `master`, `pro`, `prod`,
  `production`.
- Conflictos: ninguno.
- Ramas remotas eliminadas: ninguna.
- Push force: no usado.
- Ramas secundarias `feature/*`, `fix/*`, `hotfix/*`, `bugfix/*`, `docs/*`,
  `agent/*`, `codex/*` o equivalentes encontradas antes de la corrida: ninguna.
- Cambios locales sin commit encontrados: respaldados en
  `backup/uncommitted-before-general-integration-20260626022609` y fusionados
  hacia `feature/general-integration-dev` y `dev` cuando el repo tenia `dev`.

## Repositorios analizados

| Repositorio | Rama inicial | Estado inicial | Dev | Accion |
|---|---:|---:|---:|---|
| `Docker.API.PY` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `API.PY.DJANGO.Address` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Auth` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `API.PY.DJANGO.Catalog` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Customization` | `main` | clean | si | Cambio a `dev`; integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.DocuCore` | `main` | clean | si | Cambio a `dev`; integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Document` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Fiscal` | `main` | clean | si | Cambio a `dev`; integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Fiscora` | `main` | clean | si | Cambio a `dev`; integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Gateway` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `API.PY.DJANGO.Imagrafity` | `main` | clean | si | Cambio a `dev`; integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Inventory` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.JobCron` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.LeadHunter` | `main` | clean | si | Cambio a `dev`; sin remoto configurado. |
| `API.PY.DJANGO.LexNova` | `main` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `API.PY.DJANGO.Pricing` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Procurement` | `main` | clean | si | Cambio a `dev`; integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.RefaPart` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `API.PY.DJANGO.Sales` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Search` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.Supplier` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `API.PY.DJANGO.TecnoTelec` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `Docker.DB.PG` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `Docker.SW.Nginx` | `dev` | clean | si | Integracion creada sin ramas pendientes. |
| `Docker.WEB.NJ` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `WEB.NJ.NEXT.DocuCore` | `main` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `WEB.NJ.NEXT.Fiscora` | `main` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `WEB.NJ.NEXT.Imagrafity` | `main` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `WEB.NJ.NEXT.JobCron` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `WEB.NJ.NEXT.LeadHunter` | `main` | dirty | si | Backup local + merge a integracion + merge a dev; sin remoto configurado. |
| `WEB.NJ.NEXT.LexNova` | `main` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `WEB.NJ.NEXT.MexIngSof` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `WEB.NJ.NEXT.RefaPart` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `WEB.NJ.NEXT.TecnoTelec` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |
| `Docs` | `dev` | dirty | si | Backup local + merge a integracion + merge a dev. |

## Ramas fusionadas

No existian ramas secundarias remotas o locales con prefijos de trabajo
pendiente antes de la corrida. Se fusionaron las ramas de respaldo creadas para
preservar trabajo local sin commit:

```text
backup/uncommitted-before-general-integration-20260626022609
```

Estas ramas no se eliminaron.

## Ramas excluidas

- `main`
- `master`
- `pro`
- `prod`
- `production`
- `dev`

## Ramas protegidas

`main`, `master`, `pro`, `prod` y `production` no recibieron commits, merges,
pushes ni reescrituras durante esta corrida.

## Conflictos

No hubo conflictos de merge.

## Validaciones ejecutadas

### Webs

Se ejecuto `npm run lint` y `npm run build` en:

- `WEB.NJ.NEXT.DocuCore`: OK.
- `WEB.NJ.NEXT.Fiscora`: OK.
- `WEB.NJ.NEXT.Imagrafity`: OK.
- `WEB.NJ.NEXT.JobCron`: OK.
- `WEB.NJ.NEXT.LeadHunter`: OK.
- `WEB.NJ.NEXT.LexNova`: OK.
- `WEB.NJ.NEXT.MexIngSof`: OK.
- `WEB.NJ.NEXT.RefaPart`: OK.
- `WEB.NJ.NEXT.TecnoTelec`: OK con warnings no bloqueantes por uso de `<img>`.

### APIs Django

Se ejecuto `python manage.py check` via `api-multiproyecto` para:

- `auth`: OK.
- `gateway`: OK.
- `catalog`: OK.
- `inventory`: OK.
- `lexnova`: OK.
- `pricing`: OK.
- `procurement`: OK.
- `sales`: OK.
- `supplier`: OK.
- `tecnotelec`: OK.
- `customization`: OK.
- `document`: OK.
- `docucore`: OK.
- `fiscora`: OK.
- `fiscal`: OK.
- `imagrafity`: OK.
- `jobcron`: OK.
- `leadhunter`: OK.
- `refapart`: OK.
- `address`: OK.
- `search`: OK.

### Docker

- `Docker.API.PY/docker-compose.yml`: `docker compose config --quiet` OK.
- `Docker.WEB.NJ/docker-compose.yml`: `docker compose config --quiet` OK.
- `Docker.DB.PG/docker-compose.yml`: `docker compose config --quiet` OK.

## Errores pendientes

- `API.PY.DJANGO.Address` tiene remoto `origin` apuntando a un repositorio no
  disponible (`Repository not found`), por lo que no se pudo refrescar ni se
  debe asumir publicacion remota hasta corregir URL/permisos.
- `API.PY.DJANGO.LeadHunter` no tiene remoto configurado.
- `WEB.NJ.NEXT.LeadHunter` no tiene remoto configurado.
- `WEB.NJ.NEXT.TecnoTelec` mantiene warnings no bloqueantes de Next por uso de
  `<img>` en componentes existentes.

## Ramas candidatas a eliminacion posterior

No se eliminan ramas automaticamente. Pueden revisarse despues:

- `backup/uncommitted-before-general-integration-20260626022609`, una vez que
  se confirme que los commits ya estan publicados y validados en `dev`.

## Confirmacion de ramas protegidas

`main`, `pro`, `prod` y `production` no fueron modificadas.

## Estado final

- Todos los repositorios analizados quedaron en rama `dev`.
- Todos los repositorios quedaron sin cambios locales pendientes.
- `feature/general-integration-dev` queda como rama local de integracion.
- No se borraron ramas locales ni remotas.
