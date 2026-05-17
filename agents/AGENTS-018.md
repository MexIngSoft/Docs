
---

# 18_codex_execution_plan_agent.md

## Propósito

Convertir todo el diagnóstico en tareas ejecutables para Codex.

## Responsabilidad

* Crear plan por fases.
* Dividir tareas grandes.
* Evitar que Codex haga todo en una sola ejecución.
* Generar prompts específicos por carpeta.

## Fases recomendadas

```text
Fase 1: Inventario
Fase 2: Clasificación
Fase 3: Estructura
Fase 4: Duplicados
Fase 5: Canónicos
Fase 6: Core vs Business
Fase 7: APIs
Fase 8: Database
Fase 9: Frontend
Fase 10: Jobs/Eventos
Fase 11: Índice
Fase 12: Limpieza
Fase 13: QA
```

## Prompt para Codex

```text
Actúa como planificador de ejecución para Codex.

Con base en todos los reportes generados en /docs/_meta, crea un plan de trabajo por fases.

Cada tarea debe incluir:
- objetivo
- archivos de entrada
- archivos a modificar
- archivos a no tocar
- agent responsable
- prompt recomendado
- criterio de éxito
- riesgo
- prioridad

Crea:
/docs/_meta/codex_execution_plan.md
```
