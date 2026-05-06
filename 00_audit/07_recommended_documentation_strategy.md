# Estrategia recomendada de documentacion

## Decision

La mejor organizacion para este repositorio no es tener todas las carpetas tecnicas al mismo nivel. Eso genera duplicidad entre `architecture`, `database`, `domain`, `operations` y la estructura numerada.

La estructura recomendada queda en cinco bloques:

```text
00_audit
01_core_erp
02_projects
03_standards
04_integrations
_archive
```

## Por que asi

- El ERP debe poder reutilizarse en varios negocios.
- Tecno Telec es un proyecto sobre ese ERP, no todo el ERP.
- Syscom es una integracion, no el modelo interno.
- Los estandares operativos no deben mezclarse con negocio ni dominio.
- Los documentos anteriores deben conservarse, pero no competir con la vista canonica.

## Reglas de ubicacion

| Tipo de informacion | Ubicacion |
|---|---|
| Vision modular reutilizable | `01_core_erp/erp` |
| Arquitectura reutilizable | `01_core_erp/architecture` |
| APIs internas del ERP | `01_core_erp/apis` |
| Modelos de datos del ERP | `01_core_erp/database` |
| Flujos genericos | `01_core_erp/flows` |
| Identidad Tecno Telec | `02_projects/tecnotelec/business` |
| Web Tecno Telec | `02_projects/tecnotelec/frontend` |
| Tareas Tecno Telec | `02_projects/tecnotelec/tasks` |
| Decisiones Tecno Telec | `02_projects/tecnotelec/decisions` |
| Estandares Django/operacion | `03_standards` |
| Syscom y proveedores | `04_integrations` |
| Documentos previos | `_archive` |

## Regla contra duplicados

Un documento activo debe tener un solo dueño. Si un documento viejo dice lo mismo que uno canonico, debe incorporarse al documento canonico y despues eliminarse del archivo historico.

## Siguiente mejora

Crear en cada carpeta principal un `README.md` que explique:

- Proposito.
- Que entra.
- Que no entra.
- Documentos principales.

Esta mejora ya esta aplicada para las carpetas principales.
