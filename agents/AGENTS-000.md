# Agents para Optimizar la Documentación del Proyecto

## Objetivo

Crear un conjunto de agents especializados para que Codex pueda revisar, ordenar, depurar, fusionar, mover, eliminar y completar la documentación del proyecto sin perder contexto.

La meta no es que Codex lea todo el repositorio cada vez.

La meta es que trabaje con:

* índice maestro,
* clasificación documental,
* documentos canónicos,
* estructura por dominio,
* separación entre Core, Shared, Business, Future y Archive,
* reglas claras de edición,
* validaciones antes de modificar.

---

# Estructura recomendada de carpeta

```text
/docs
  /agents
    00_master_router_agent.md
    01_zip_inventory_agent.md
    02_document_classifier_agent.md
    03_structure_architect_agent.md
    04_duplicate_detector_agent.md
    05_canonical_document_agent.md
    06_core_vs_business_agent.md
    07_business_documentation_agent.md
    08_api_documentation_agent.md
    09_database_documentation_agent.md
    10_frontend_documentation_agent.md
    11_etl_jobs_documentation_agent.md
    12_events_scheduler_agent.md
    13_security_auth_permissions_agent.md
    14_navigation_index_agent.md
    15_cleanup_archive_agent.md
    16_template_standardizer_agent.md
    17_quality_gate_agent.md
    18_codex_execution_plan_agent.md
    19_final_review_agent.md
    20_documentation_maintenance_agent.md
```

---

# Orden correcto de ejecución

```text
00 → 01 → 02 → 03 → 04 → 05 → 06 → 07 → 08 → 09 → 10 → 11 → 12 → 13 → 14 → 15 → 16 → 17 → 18 → 19 → 20
```

Codex debe ejecutar los agents en orden ascendente.

Ningún agent debe modificar documentación si antes no existe:

* inventario,
* clasificación,
* índice maestro,
* propuesta de estructura,
* reglas de canonicidad.

---

# 00_master_router_agent.md

## Propósito

Coordinar todos los agents de documentación.

Este agent decide qué agent debe trabajar, en qué orden y sobre qué carpetas.

## Responsabilidad

* Leer la estructura general.
* Detectar si existen índices.
* Verificar si hay clasificación documental previa.
* Definir qué agents deben ejecutarse.
* Evitar que Codex edite archivos sin contexto.
* Controlar el flujo completo de optimización.

## Entrada

* Carpeta `/docs`.
* Archivo ZIP descomprimido.
* Documentación existente.
* Comentarios previos del usuario.

## Salida esperada

* Plan de ejecución.
* Lista de agents requeridos.
* Orden de ejecución.
* Rutas que sí se deben analizar.
* Rutas que se deben ignorar temporalmente.

## Reglas

* No modificar documentos directamente.
* Solo coordinar.
* Si falta inventario, ejecutar primero `01_zip_inventory_agent.md`.
* Si falta índice, ejecutar `14_navigation_index_agent.md` después de clasificar.
* Si encuentra documentos de empresas mezclados con Core, delegar a `06_core_vs_business_agent.md`.

## Prompt para Codex

```text
Actúa como router principal de documentación.

Tu tarea es coordinar la optimización documental del proyecto.

Antes de editar cualquier archivo:
1. Revisa si existe /docs/_meta/master-index.md o master-index.yaml.
2. Revisa si existe clasificación documental previa.
3. Revisa si existe estructura separada entre core, shared, business, future y archive.
4. Define qué agents deben ejecutarse y en qué orden.
5. No modifiques contenido técnico todavía.
6. Entrega un plan de ejecución con rutas específicas.

Resultado esperado:
- estado actual de la documentación
- agents necesarios
- orden de ejecución
- carpetas a analizar
- riesgos detectados
- siguiente acción recomendada
```

---
