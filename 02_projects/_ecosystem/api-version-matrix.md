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
| MexIngSof | `WEB.NJ.NEXT.MexIngSof` | `API.PY.DJANGO.Gateway` | Auth v1 | JobCron API, Sales/CRM PENDIENTE_DE_DEFINIR | Parcial | Web MVP existe; produccion de leads requiere Gateway/JobCron. |
| TecnoTelec | `WEB.NJ.NEXT.TecnoTelec` | `API.PY.DJANGO.Gateway` | Auth v1 | Catalog, Pricing, Sales, Supplier, Inventory | Activo | Proyecto registrado como `TECNOTELEC`. |
| REFAPART | `WEB.NJ.NEXT.RefaPart` | `API.PY.DJANGO.Gateway` | Auth v1 | REFAPART API, Catalog, Supplier, Pricing, Sales, Address, Search, Inventory, Document | Parcial | Login, catalogo, demanda, cotizacion y pedidos por Gateway central; faltan permisos/eventos/cierre operativo. |
| JobCron | `WEB.NJ.NEXT.JobCron` | `API.PY.DJANGO.Gateway` | Auth v1 | JobCron API, Auth, Catalog, Pricing, Sales, Inventory, Document, Search | Parcial | Centro operativo; FeatureAvailability parcial y modulos productivos pendientes. |

## Reglas

- Todo proyecto nuevo debe agregarse a esta matriz al crear su documentacion.
- Si un proyecto declara `auth_required: false`, debe indicarlo en
  observaciones.
- Si cambia version de Auth o Gateway, actualizar esta matriz antes de migrar
  codigo productivo.
