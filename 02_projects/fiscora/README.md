# Fiscora

Fiscora es una plataforma SaaS para descargar, organizar, visualizar, transformar y automatizar CFDI del SAT.

## Propuesta

Fiscora no debe percibirse como un descargador de XML. Debe sentirse como una plataforma fiscal moderna que convierte CFDI tecnicos en informacion clara, visual y accionable.

## Proyectos previstos

| Proyecto | Rol | Estado |
|---|---|---|
| `API.PY.DJANGO.Gateway` | Entrada central, seguridad, sesiones, rate limiting y routing `FISCORA`. | Activo |
| `API.PY.DJANGO.Fiscora` | Producto comercial, planes, creditos, preferencias y reglas de uso. | MVP creado |
| `API.PY.DJANGO.Fiscal` | Nucleo fiscal ERP para CFDI, SAT, XML, solicitudes, paquetes, reportes y auditoria. | MVP creado |
| `API.PY.DJANGO.Document` | XML, PDF, render visual, plantillas y transformaciones documentales. | Existente |
| `WEB.NJ.NEXT.Fiscora` | Portal publico, dashboard, explorador CFDI, animaciones y UX fiscal. | MVP preview creado |

## Estado documental

Fiscora queda clasificado como producto SaaS fiscal independiente dentro del
ecosistema, apoyado por modulos reutilizables de JobCron cuando aplique.

La fase actual es cierre de definicion MVP:

- Usar `API.PY.DJANGO.Fiscal` como nucleo reutilizable de CFDI/SAT.
- Usar `API.PY.DJANGO.Fiscora` para producto comercial, planes, creditos y
  preferencias.
- Usar `API.PY.DJANGO.Gateway` como unica entrada del frontend.
- Usar `API.PY.DJANGO.Document` para render visual, XML, PDF y plantillas.
- Mantener `WEB.NJ.NEXT.Fiscora` como preview visual hasta conectar datos reales
  del gateway.

## Modulos

- Portal publico.
- Dashboard cliente.
- Centro CFDI.
- Motor SAT.
- Motor visual CFDI.
- Transformacion documental.
- Reportes.
- Automatizaciones.
- Alertas inteligentes.
- Multiempresa.
- Billing y creditos.
- Administracion.

## Documentos

- `platform-overview.md`
- `architecture.md`
- `api-contracts.md`
- `repositories.md`
- `security.md`
- `database/cfdi-data-model.md`
- `animations/animation-guidelines.md`
- `frontend/animation-preview.md`
- `tasks/00_mvp_scope.md`
- `tasks/01_pending_tasks.md`
- `tasks/02_cfdi_multiversion_implementation.md`
- `decisions/adr_0001_api_boundaries.md`
