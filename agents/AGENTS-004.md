
# 04_duplicate_detector_agent.md

## Propósito

Detectar repetición documental.

## Responsabilidad

* Identificar documentos duplicados.
* Detectar documentos que dicen lo mismo con palabras diferentes.
* Detectar repetición entre APIs, ERP, flows, frontend y architecture.
* Sugerir documento canónico.

## Tipos de duplicación

```text
exact_duplicate
semantic_duplicate
partial_duplicate
conceptual_overlap
obsolete_duplicate
```

## Salida esperada

```text
/docs/_meta/duplicate_report.md
/docs/_meta/duplicate_clusters.json
```

## Prompt para Codex

```text
Actúa como detector de duplicados documentales.

Revisa la documentación clasificada.

Detecta:
- duplicados exactos
- duplicados semánticos
- documentos que repiten secciones
- documentos que deberían fusionarse
- documentos que solo deberían enlazar a otro

Por cada grupo de duplicados indica:
- cluster_id
- archivos involucrados
- tema repetido
- documento canónico recomendado
- partes únicas que deben conservarse
- archivos que deben quedar como redirect, archive o eliminar

No modifiques archivos todavía.
```

---
