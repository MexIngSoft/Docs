

# 06_core_vs_business_agent.md

## Propósito

Separar lo reutilizable del ERP de lo específico de cada empresa.

## Responsabilidad

Detectar documentación que mezcla:

* ERP Core,
* Tecno Telec,
* LexNova,
* SAT Portal,
* JobCron,
* otras empresas futuras.

## Regla central

El Core no debe contener reglas específicas de una empresa.

## Ejemplo

### Incorrecto

```text
/core/catalog/productos-tecnotelec.md
```

### Correcto

```text
/core/catalog/product-model.md
/business/tecnotelec/catalog/product-publication-rules.md
```

## Salida esperada

```text
/docs/_meta/core_vs_business_report.md
```

## Prompt para Codex

```text
Actúa como validador Core vs Business.

Revisa toda la documentación y separa:
- qué pertenece al ERP Core reutilizable
- qué pertenece a Shared
- qué pertenece a una empresa específica
- qué pertenece a Future
- qué pertenece a Archive

Empresas/proyectos conocidos:
- Tecno Telec
- LexNova
- SAT Portal
- JobCron

Reglas:
- Core no debe mencionar procesos únicos de Tecno Telec, LexNova o SAT salvo como ejemplo breve.
- Business sí puede usar Core, pero debe documentar sus reglas únicas.
- Shared contiene componentes comunes entre empresas.

Entrega:
- documentos mal ubicados
- ruta actual
- ruta sugerida
- razón
- prioridad
```

---
