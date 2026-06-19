---
title: Matriz de Gateways
domain: ecosystem
status: active
priority: p1
owner: Equipo de plataforma
last_reviewed: 2026-06-14
---

# Matriz de Gateways

| Proyecto | Frontend | Gateway vigente | Gateway retirado | Estado | Fecha | Observaciones |
|---|---|---|---|---|---|---|
| RefaPart | `WEB.NJ.NEXT.RefaPart` | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.RefaPart.Gateway` | retired | 2026-06-14 | Auth v1 opera por el Gateway central. |
| LexNova | `WEB.NJ.NEXT.LexNova` | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.LexNova.Gateway` | retired | 2026-06-14 | Enrutamiento de proyecto registrado como `LEXNOVA`. |
| TecnoTelec | `WEB.NJ.NEXT.TecnoTelec` | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.TecnoTelec.Gateway` | retired | 2026-06-14 | Core APIs declaradas en el registro central. |
| DocuCore | `WEB.NJ.NEXT.DocuCore` | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.DocuCore.Gateway` | retired | 2026-06-14 | DocuCore y Document se consumen por rutas centralizadas. |
| Fiscora | `WEB.NJ.NEXT.Fiscora` | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.Fiscora.Gateway` | retired | 2026-06-14 | Fiscora y Fiscal quedaron registrados en el central. |
| Imagrafity | `WEB.NJ.NEXT.Imagrafity` | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.Imagrafity.Gateway` | retired | 2026-06-14 | Enrutamiento de proyecto registrado como `IMAGRAFITY`. |
| LeadHunter | `WEB.NJ.NEXT.LeadHunter` | `API.PY.DJANGO.Gateway` | `API.PY.DJANGO.LeadHunter.Gateway` | retired | 2026-06-14 | Enrutamiento de proyecto registrado como `LEADHUNTER`. |
| MexIngSof | `WEB.NJ.NEXT.MexIngSof` | `API.PY.DJANGO.Gateway` | Ninguno | partial | 2026-06-19 | Web MVP usa rutas Next.js locales; produccion de leads debe migrar a Gateway/JobCron. |
| JobCron | `WEB.NJ.NEXT.JobCron` | `API.PY.DJANGO.Gateway` | Ninguno | active | 2026-06-14 | JobCron no asume responsabilidades de Gateway. |

El retiro operativo y sus validaciones se registran en
`Docs/03_standards/gateway/legacy-gateway-retirement-2026-06-14.md`.
