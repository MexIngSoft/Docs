# Estructura documental propuesta

## Decision

La estructura final debe respetar la organizacion canonica ya definida en `Docs/README.md`.

No se recomienda crear una carpeta paralela `/docs/core`, `/docs/business` o `/docs/standards`, porque el repositorio ya usa:

```text
Docs/01_core_erp
Docs/02_projects
Docs/03_standards
Docs/04_integrations
Docs/_archive
Docs/agents
Docs/_meta
```

## Equivalencias con los agents

| Agent propone | Ruta canonica del repo |
|---|---|
| `/docs/core` | `Docs/01_core_erp` |
| `/docs/business` | `Docs/02_projects` |
| `/docs/standards` | `Docs/03_standards` |
| `/docs/integrations` | `Docs/04_integrations` |
| `/docs/archive` | `Docs/_archive` |
| `/docs/future` | `Docs/pendientes` |
| `/docs/templates` | `Docs/templates` |
| `/docs/_meta` | `Docs/_meta` |

## Acciones propuestas

- Mantener estructura actual.
- Usar `Docs/_meta/active-work-index.md` como entrada rapida operativa.
- Usar `Docs/_meta` para inventarios, reportes e indices.
- Usar `Docs/templates` para plantillas.
- No mover archivos de negocio a una nueva carpeta `business`.
- No duplicar `03_standards` con una carpeta `standards`.
