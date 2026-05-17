
# 20_documentation_maintenance_agent.md

## Propósito

Definir cómo se mantendrá la documentación después de optimizarla.

## Responsabilidad

* Crear reglas para nuevos documentos.
* Crear reglas para actualizar documentos.
* Crear periodicidad de revisión.
* Crear owner por carpeta.
* Crear política de archivo.
* Crear política de eliminación.

## Prompt para Codex

```text
Actúa como responsable de mantenimiento documental.

Crea una política para mantener la documentación limpia después de la optimización.

Debe incluir:
- cuándo crear un documento nuevo
- cuándo actualizar uno existente
- cuándo fusionar
- cuándo archivar
- cuándo eliminar
- cómo nombrar archivos
- cómo asignar owner
- cómo actualizar el índice maestro
- cada cuánto revisar documentación
- checklist para pull requests de documentación

Crea:
/docs/standards/documentation-maintenance-policy.md
/docs/standards/documentation-pr-checklist.md
/docs/_meta/owners.md
```

---

# Archivos base que deben existir al final

```text
/docs/_meta/document_inventory.md
/docs/_meta/document_classification.md
/docs/_meta/proposed_structure.md
/docs/_meta/duplicate_report.md
/docs/_meta/core_vs_business_report.md
/docs/_meta/master-index.md
/docs/_meta/master-index.yaml
/docs/_meta/document-relations.md
/docs/_meta/navigation-map.md
/docs/_meta/cleanup_report.md
/docs/_meta/quality_gate_report.md
/docs/_meta/codex_execution_plan.md
/docs/_meta/final_review_report.md
/docs/_meta/owners.md
```

---

# Reglas globales para todos los agents

## 1. No inventar documentación técnica

Si algo no se puede confirmar en los documentos existentes, marcarlo como:

```text
PENDIENTE_DE_VALIDACION
```

## 2. No eliminar primero

Antes de eliminar:

1. clasificar,
2. fusionar,
3. archivar,
4. crear redirect,
5. validar,
6. solo después eliminar si aplica.

## 3. Una fuente de verdad por tema

Cada tema importante debe tener un solo documento canónico.

## 4. Core no debe tener reglas de empresa

Core debe ser reutilizable.

## 5. Business no debe copiar Core

Business debe enlazar a Core y documentar solo sus diferencias.

## 6. Future no debe estar en navegación principal

Las ideas futuras no deben confundirse con documentación vigente.

## 7. Archive no debe bloquear desarrollo

Archive conserva historia, no guía implementación actual.

## 8. Todo documento debe tener propósito

Si no se puede explicar para qué sirve, debe fusionarse, moverse, archivarse o eliminarse.

---

# Front matter obligatorio recomendado

Todos los documentos nuevos deberían iniciar así:

```yaml
---
title: ""
doc_id: ""
domain: ""
layer: "core|shared|business|architecture|operations|integration|future|archive"
company: "global|tecnotelec|lexnova|satportal|jobcron"
type: "overview|reference|how-to|adr|runbook|api|database|etl|frontend|business"
status: "draft|current|deprecated|archived|future"
priority: "P0|P1|P2|P3"
owner: ""
source_of_truth: true
canonical_path: ""
related_docs: []
last_reviewed: "YYYY-MM-DD"
---
```

---

# Estructura final recomendada para empresas

```text
/docs/business
  /tecnotelec
    README.md
    identity.md
    business-model.md
    modules-used.md
    unique-rules.md
    workflows.md
    frontend.md
    integrations.md
    roadmap.md

  /lexnova
    README.md
    identity.md
    business-model.md
    modules-used.md
    unique-rules.md
    workflows.md
    frontend.md
    integrations.md
    roadmap.md

  /satportal
    README.md
    identity.md
    business-model.md
    modules-used.md
    unique-rules.md
    workflows.md
    frontend.md
    integrations.md
    roadmap.md

  /jobcron
    README.md
    identity.md
    business-model.md
    modules-used.md
    unique-rules.md
    workflows.md
    frontend.md
    integrations.md
    roadmap.md
```

---

# Prompts rápidos por fase

## Fase 1

```text
Ejecuta 01_zip_inventory_agent.md y genera inventario completo sin modificar documentos.
```

## Fase 2

```text
Ejecuta 02_document_classifier_agent.md usando el inventario generado.
```

## Fase 3

```text
Ejecuta 03_structure_architect_agent.md y propone estructura final sin mover archivos todavía.
```

## Fase 4

```text
Ejecuta 04_duplicate_detector_agent.md y genera clusters de duplicados.
```

## Fase 5

```text
Ejecuta 05_canonical_document_agent.md para fusionar duplicados y crear documentos canónicos.
```

## Fase 6

```text
Ejecuta 06_core_vs_business_agent.md para separar Core, Shared y Business.
```

## Fase 7

```text
Ejecuta 07_business_documentation_agent.md para crear documentación única por empresa.
```

## Fase 8

```text
Ejecuta 14_navigation_index_agent.md para crear índice maestro y mapa de navegación.
```

## Fase 9

```text
Ejecuta 17_quality_gate_agent.md para validar la documentación final.
```

---

# Resultado esperado final

Después de ejecutar estos agents, el proyecto debe quedar con:

* documentación más corta,
* menos repetición,
* índice maestro,
* documentos canónicos,
* Core separado de empresas,
* documentación única por empresa,
* APIs mejor ordenadas,
* frontend menos fragmentado,
* jobs y eventos documentados,
* documentos futuros fuera del MVP,
* documentos obsoletos archivados,
* reglas claras para Codex,
* mantenimiento documental sostenible.
