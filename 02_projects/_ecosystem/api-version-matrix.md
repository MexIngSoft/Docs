# Matriz de versiones API por proyecto

## Objetivo

Registrar que versiones de Auth, Gateway y APIs consume cada proyecto para
evitar migraciones que rompan sistemas activos.

## Matriz actual

| Proyecto | Frontend | Gateway | Auth Version | APIs Core | Estado | Observaciones |
|---|---|---|---|---|---|---|
| LexNova | `WEB.NJ.NEXT.LexNova` | `API.PY.DJANGO.Gateway` | Auth v1 | LexNova API, Document API | Activo | Proyecto registrado como `LEXNOVA`. |
| DocuCore | `WEB.NJ.NEXT.DocuCore` | `API.PY.DJANGO.Gateway` | Auth v1 | Document API, DocuCore API | Activo | Proyecto registrado como `DOCUCORE`. |
| Fiscora | `WEB.NJ.NEXT.Fiscora` | `API.PY.DJANGO.Gateway` | Auth v1 | Fiscal API, Fiscora API | Activo | Proyecto registrado como `FISCORA`. |
| Imagrafity | `WEB.NJ.NEXT.Imagrafity` | `API.PY.DJANGO.Gateway` | Auth v1 | Imagrafity API | Activo | Proyecto registrado como `IMAGRAFITY`. |
| LeadHunter | `WEB.NJ.NEXT.LeadHunter` | `API.PY.DJANGO.Gateway` | Auth v1 | LeadHunter API | Activo | Proyecto registrado como `LEADHUNTER`. |
| TecnoTelec | `WEB.NJ.NEXT.TecnoTelec` | `API.PY.DJANGO.Gateway` | Auth v1 | Catalog, Pricing, Sales, Supplier, Inventory | Activo | Proyecto registrado como `TECNOTELEC`. |
| REFAPART | `WEB.NJ.NEXT.RefaPart` | `API.PY.DJANGO.Gateway` | Auth v1 | Auth; API comercial pendiente | Activo | Login, registro, refresh, me y permisos por Gateway central. |
| JobCron | `WEB.NJ.NEXT.JobCron` | `API.PY.DJANGO.Gateway` | Auth v1 | JobCron API, Auth, Core APIs | Activo | Centro operativo; requiere matriz fina por modulo administrativo. |

## Reglas

- Todo proyecto nuevo debe agregarse a esta matriz al crear su documentacion.
- Si un proyecto declara `auth_required: false`, debe indicarlo en
  observaciones.
- Si cambia version de Auth o Gateway, actualizar esta matriz antes de migrar
  codigo productivo.
