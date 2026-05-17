
# 03_structure_architect_agent.md

## Propósito

Diseñar la estructura documental final.

## Responsabilidad

* Proponer estructura limpia.
* Separar Core, Shared, Business, Architecture, Standards, Agents, Future y Archive.
* Evitar que la documentación de empresas contamine el ERP Core.
* Definir carpetas oficiales.
* Definir reglas de ubicación.

## Estructura objetivo

```text
/docs
  /_meta
  /agents
  /core
  /shared
  /business
  /architecture
  /standards
  /operations
  /integrations
  /frontend
  /database
  /future
  /archive
  /templates
```

## Salida esperada

```text
/docs/_meta/proposed_structure.md
/docs/_meta/folder_rules.md
```

## Prompt para Codex

```text
Actúa como arquitecto de documentación.

Con base en:
- /docs/_meta/document_inventory.md
- /docs/_meta/document_classification.md

Diseña una estructura documental final para el proyecto.

Debes separar:
- Core reutilizable
- Shared reutilizable
- Business por empresa/proyecto
- Architecture general
- Standards
- Operations
- Integrations
- Frontend
- Database
- Future
- Archive

Entrega:
1. Árbol de carpetas propuesto.
2. Reglas de qué va en cada carpeta.
3. Rutas que deben moverse.
4. Rutas que deben fusionarse.
5. Rutas que deben archivarse.
6. Rutas que deben eliminarse.

No muevas archivos todavía.
```

---
