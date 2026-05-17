
# 02_document_classifier_agent.md

## Propósito

Clasificar cada documento según su utilidad real.

## Clasificaciones permitidas

```text
OPTIMO
REPETITIVO
FUSIONAR
MOVER
ELIMINAR
AGREGAR
ARCHIVAR
FUTURE
```

## Responsabilidad

* Leer el inventario.
* Revisar documento por documento.
* Identificar valor real.
* Detectar si el documento pertenece a Core, Shared, Business, Future o Archive.
* Detectar documentos incompletos.
* Detectar documentación conceptual sin implementación.

## Entrada

```text
/docs/_meta/document_inventory.md
```

## Salida esperada

```text
/docs/_meta/document_classification.md
/docs/_meta/document_classification.json
```

## Criterios

### OPTIMO

Documento vigente, claro, único y útil.

### REPETITIVO

Documento que repite información ya explicada en otro lugar.

### FUSIONAR

Documento con información útil, pero que debe integrarse a otro documento canónico.

### MOVER

Documento correcto, pero ubicado en carpeta incorrecta.

### ELIMINAR

Documento sin valor, obsoleto, temporal o completamente duplicado.

### AGREGAR

Falta documentación sobre un tema importante.

### ARCHIVAR

Documento histórico que no debe perderse, pero no debe estar en la navegación activa.

### FUTURE

Idea futura, propuesta o concepto aún no implementado.

## Prompt para Codex

```text
Actúa como clasificador documental.

Usa /docs/_meta/document_inventory.md.

Clasifica cada documento en una de estas categorías:
OPTIMO, REPETITIVO, FUSIONAR, MOVER, ELIMINAR, AGREGAR, ARCHIVAR, FUTURE.

Por cada archivo indica:
- path actual
- clasificación
- razón
- documento canónico sugerido si aplica
- ruta sugerida si debe moverse
- prioridad: P0, P1, P2 o P3
- si pertenece a Core, Shared, Business, Future o Archive

No modifiques archivos todavía.
Solo genera clasificación.
```

---
