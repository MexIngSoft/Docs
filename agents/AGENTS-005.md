
# 05_canonical_document_agent.md

## Propósito

Crear documentos canónicos.

Un documento canónico es la fuente oficial de un tema.

## Responsabilidad

* Fusionar documentos repetidos.
* Conservar solo información útil.
* Eliminar redundancia.
* Crear una sola fuente de verdad.
* Crear stubs o redirects desde documentos antiguos.

## Entrada

```text
/docs/_meta/duplicate_report.md
/docs/_meta/duplicate_clusters.json
```

## Salida esperada

* Documentos fusionados.
* Documentos canónicos limpios.
* Archivos obsoletos marcados para archivo.

## Reglas

* No borrar información única.
* No repetir contexto innecesario.
* No mezclar documentación de negocio con documentación técnica sin estructura.
* Si hay decisiones arquitectónicas, moverlas a ADR.
* Si hay pasos operativos, moverlos a runbook.

## Prompt para Codex

```text
Actúa como creador de documentos canónicos.

Usa el reporte de duplicados.

Por cada cluster:
1. Elige el documento canónico.
2. Fusiona información útil.
3. Elimina texto repetido.
4. Conserva decisiones importantes.
5. Mueve pasos operativos a runbooks si aplica.
6. Mueve decisiones a ADR si aplica.
7. Crea referencia desde documentos antiguos hacia el canónico.

No elimines archivos directamente.
Si un archivo queda obsoleto, márcalo para archive o redirect.
```

---