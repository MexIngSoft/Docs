
# 15_cleanup_archive_agent.md

## Propósito

Limpiar sin perder información histórica.

## Responsabilidad

* Mover documentos obsoletos a Archive.
* Mover ideas futuras a Future.
* Preparar eliminación segura.
* Crear redirects.
* Evitar borrar documentos útiles.

## Reglas

* No eliminar sin respaldo.
* Primero archivar.
* Solo eliminar si es duplicado exacto o basura temporal.
* Crear reporte de eliminación.

## Prompt para Codex

```text
Actúa como agente de limpieza documental segura.

Usa la clasificación documental.

Acciones permitidas:
- mover a /docs/archive
- mover a /docs/future
- crear redirect hacia documento canónico
- marcar para eliminación

No elimines directamente salvo archivos claramente temporales o duplicados exactos.

Genera:
/docs/_meta/cleanup_report.md
/docs/_meta/archive_report.md
/docs/_meta/delete_candidates.md

Por cada archivo indica:
- acción
- razón
- ruta original
- ruta nueva
- documento canónico relacionado
```

---
