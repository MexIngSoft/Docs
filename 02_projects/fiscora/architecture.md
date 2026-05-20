# Arquitectura Fiscora

## Diagrama

```text
WEB.NJ.NEXT.Fiscora
        |
        v
API.PY.DJANGO.Fiscora.Gateway
        |
        +--> API.PY.DJANGO.Fiscora
        |       - planes
        |       - creditos
        |       - reglas de uso
        |       - preferencias
        |
        +--> API.PY.DJANGO.Fiscal
        |       - CFDI
        |       - SAT
        |       - XML
        |       - reportes fiscales
        |       - jobs fiscales
        |
        +--> API.PY.DJANGO.Document
                - XML
                - PDF
                - render visual
                - plantillas
                - transformaciones
```

## Reglas

- El frontend consume solo el gateway Fiscora.
- El gateway normaliza errores, sesiones y permisos.
- La API Fiscora administra experiencia comercial, planes, creditos y preferencias.
- La API Fiscal administra CFDI, XML, SAT, jobs fiscales, paquetes, reportes y auditoria.
- Document API procesa archivos, XML, render visual y PDF.
- El XML original nunca se modifica.
- La personalizacion de factura vive en una capa visual separada.

## Fases

| Fase | Alcance |
|---|---|
| 1 | Fiscal API MVP, Fiscora API MVP, gateway y preview visual. |
| 2 | SAT jobs reales, explorador CFDI, reportes y personalizador visual. |
| 3 | Automatizaciones, creditos, alertas inteligentes e IA fiscal. |

## Limites de responsabilidad

| Capa | Responsable | No debe hacer |
|---|---|---|
| `WEB.NJ.NEXT.Fiscora` | Experiencia publica, dashboard y preview visual. | Consumir APIs internas directamente o guardar secretos SAT. |
| `API.PY.DJANGO.Fiscora.Gateway` | BFF, permisos, sesiones, errores, rate limiting y contrato frontend. | Persistir CFDI como fuente oficial o ejecutar logica fuerte SAT. |
| `API.PY.DJANGO.Fiscora` | Producto comercial, planes, creditos, preferencias y reglas de uso. | Parsear XML, descargar SAT o transformar documentos. |
| `API.PY.DJANGO.Fiscal` | CFDI, SAT, XML fiscal, paquetes, jobs, reportes y auditoria. | Definir experiencia comercial o planes SaaS. |
| `API.PY.DJANGO.Document` | Render visual, PDF, plantillas y transformaciones documentales. | Cambiar el XML original o decidir reglas fiscales. |

Decision canonica:

```text
Docs/02_projects/fiscora/decisions/adr_0001_api_boundaries.md
```
