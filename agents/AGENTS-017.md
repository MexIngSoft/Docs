
# 17_quality_gate_agent.md

## Propósito

Validar calidad antes de aceptar cambios.

## Responsabilidad

* Revisar links rotos.
* Revisar títulos duplicados.
* Revisar documentos sin owner.
* Revisar documentos sin estado.
* Revisar documentos sin propósito.
* Revisar documentos sin relación.
* Revisar archivos canónicos.
* Revisar que no haya documentos mezclados.

## Checklist

```text
[ ] Tiene título claro
[ ] Tiene propósito
[ ] Tiene owner
[ ] Tiene estado
[ ] Tiene prioridad
[ ] Tiene ubicación correcta
[ ] Tiene documentos relacionados
[ ] No duplica otro documento
[ ] No mezcla Core con Business
[ ] No está vacío
[ ] No contradice documento canónico
```

## Prompt para Codex

```text
Actúa como quality gate documental.

Valida toda la documentación modificada.

Revisa:
- títulos
- propósito
- owner
- estado
- prioridad
- links internos
- duplicación
- ubicación correcta
- mezcla Core/Business
- documentos vacíos
- documentos canónicos
- documentos sin navegación

Entrega:
/docs/_meta/quality_gate_report.md

Clasifica errores como:
- BLOCKER
- WARNING
- SUGGESTION

No hagas cambios grandes.
Solo corrige errores menores si son evidentes.
```
