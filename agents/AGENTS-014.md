
# 14_navigation_index_agent.md

## Propósito

Crear el índice maestro para que Codex y humanos encuentren el documento correcto.

## Responsabilidad

* Crear índice por dominio.
* Crear índice por empresa.
* Crear índice por tipo de documento.
* Crear relación entre documentos.
* Crear mapa de navegación.

## Archivos esperados

```text
/docs/_meta/master-index.md
/docs/_meta/master-index.yaml
/docs/_meta/document-relations.md
/docs/_meta/navigation-map.md
```

## Prompt para Codex

```text
Actúa como generador de índice maestro.

Usa:
- document_inventory.md
- document_classification.md
- proposed_structure.md
- duplicate_report.md

Crea un índice maestro que permita encontrar rápido cualquier documento.

El índice debe organizarse por:
1. Core
2. Shared
3. Business
4. Architecture
5. Standards
6. Operations
7. Integrations
8. Frontend
9. Database
10. Future
11. Archive
12. Agents

Por cada documento indica:
- ruta
- propósito
- estado
- prioridad
- documento canónico si aplica
- documentos relacionados
- owner sugerido

Crea:
/docs/_meta/master-index.md
/docs/_meta/master-index.yaml
/docs/_meta/document-relations.md
/docs/_meta/navigation-map.md
```

---
