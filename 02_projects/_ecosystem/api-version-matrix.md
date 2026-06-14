# Matriz de versiones API por proyecto

## Objetivo

Registrar que versiones de Auth, Gateway y APIs consume cada proyecto para
evitar migraciones que rompan sistemas activos.

## Matriz actual

| Proyecto | Frontend | Gateway | Auth Version | APIs Core | Estado | Observaciones |
|---|---|---|---|---|---|---|
| LexNova | `WEB.NJ.NEXT.LexNova` | `API.PY.DJANGO.LexNova.Gateway` | Auth v1 | LexNova API, Document API | Activo | Usa login via Gateway; documentacion canonica en `02_projects/lexnova`. |
| DocuCore | `WEB.NJ.NEXT.DocuCore` | `API.PY.DJANGO.DocuCore.Gateway` | PENDIENTE_DE_DEFINIR | Document API, DocuCore API | Activo | Requiere confirmar alcance final de login por proyecto. |
| Fiscora | `WEB.NJ.NEXT.Fiscora` | `API.PY.DJANGO.Fiscora.Gateway` | PENDIENTE_DE_DEFINIR | Fiscal API, Fiscora API | Activo | Migracion Auth no documentada en detalle. |
| Imagrafity | `WEB.NJ.NEXT.Imagrafity` | `API.PY.DJANGO.Imagrafity.Gateway` | PENDIENTE_DE_DEFINIR | Imagrafity API | Activo | Debe declarar version Auth antes de cerrar login productivo. |
| LeadHunter | `WEB.NJ.NEXT.LeadHunter` | `API.PY.DJANGO.LeadHunter.Gateway` | PENDIENTE_DE_DEFINIR | LeadHunter API | Activo | Flujo principal actual es busqueda operacional; Auth pendiente de definicion. |
| TecnoTelec | `WEB.NJ.NEXT.TecnoTelec` | `API.PY.DJANGO.TecnoTelec.Gateway` | PENDIENTE_DE_DEFINIR | Catalog, Pricing, Sales, Supplier, Inventory | Pendiente | Migrar cuando se cierre implementacion Auth del proyecto. |
| REFAPART | `WEB.NJ.NEXT.RefaPart` | `API.PY.DJANGO.Refapart.Gateway` | PENDIENTE_DE_DEFINIR | JobCron / Core ERP futuro | MVP Web | Gateway/API futuros; no prometer Auth productivo hasta crear backend. |
| JobCron | `WEB.NJ.NEXT.JobCron` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | JobCron API, Auth, Core APIs | Activo | Centro operativo; requiere matriz fina por modulo administrativo. |

## Reglas

- Todo proyecto nuevo debe agregarse a esta matriz al crear su documentacion.
- Si un proyecto declara `auth_required: false`, debe indicarlo en
  observaciones.
- Si cambia version de Auth o Gateway, actualizar esta matriz antes de migrar
  codigo productivo.
