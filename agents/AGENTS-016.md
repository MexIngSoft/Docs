
# 16_template_standardizer_agent.md

## Propósito

Crear plantillas para que toda la documentación nueva mantenga la misma estructura.

## Plantillas necesarias

```text
overview-template.md
api-template.md
database-template.md
business-template.md
runbook-template.md
adr-template.md
etl-template.md
frontend-template.md
event-template.md
```

## Prompt para Codex

```text
Actúa como estandarizador de plantillas documentales.

Crea plantillas Markdown en /docs/templates.

Cada plantilla debe incluir:
- front matter
- propósito
- alcance
- audiencia
- owner
- estado
- prioridad
- documentos relacionados
- secciones obligatorias
- checklist de completitud

Plantillas requeridas:
- overview
- api
- database
- business
- runbook
- adr
- etl
- frontend
- event

No modifiques documentos existentes.
Solo crea plantillas.
```

---
