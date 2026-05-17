# Reporte Core vs Business

## Decision

El repositorio ya separa Core y Business:

- Core: `Docs/01_core_erp`
- Business: `Docs/02_projects`

## Hallazgos

| Caso | Estado | Recomendacion |
|---|---|---|
| Tecno Telec | Correcto en `02_projects/tecnotelec` | Mantener reglas unicas ahi y enlazar Core. |
| LexNova | Correcto en `02_projects/lexnova` | Mantener dominio legal fuera del Core. |
| JobCron | Correcto en `02_projects/jobcron` | Separar web publica y admin segun docs existentes. |
| DocuCore | Correcto en `02_projects/docucore` | Mantener producto documental como proyecto. |
| ERP reusable | Correcto en `01_core_erp` | Evitar ejemplos extensos de empresas. |

## Riesgo

Algunos documentos de proyecto pueden mencionar APIs Core. Eso es aceptable si enlazan y no duplican contratos.
