# Fiscora

Fiscora es una plataforma SaaS para descargar, organizar, visualizar, transformar y automatizar CFDI del SAT.

## Propuesta

Fiscora no debe percibirse como un descargador de XML. Debe sentirse como una plataforma fiscal moderna que convierte CFDI tecnicos en informacion clara, visual y accionable.

## Proyectos previstos

| Proyecto | Rol | Estado |
|---|---|---|
| `API.PY.DJANGO.Fiscora.Gateway` | BFF, seguridad, sesiones, rate limiting y contrato frontend-backend. | MVP creado |
| `API.PY.DJANGO.Fiscora` | Producto comercial, planes, creditos, preferencias y reglas de uso. | MVP creado |
| `API.PY.DJANGO.Fiscal` | Nucleo fiscal ERP para CFDI, SAT, XML, solicitudes, paquetes, reportes y auditoria. | MVP creado |
| `API.PY.DJANGO.Document` | XML, PDF, render visual, plantillas y transformaciones documentales. | Existente |
| `WEB.NJ.NEXT.Fiscora` | Portal publico, dashboard, explorador CFDI, animaciones y UX fiscal. | MVP preview creado |

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
