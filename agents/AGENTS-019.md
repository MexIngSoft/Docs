
---

# 19_final_review_agent.md

## Propósito

Realizar revisión final de coherencia.

## Responsabilidad

* Verificar que la estructura final sea clara.
* Verificar que los índices funcionen.
* Verificar que no haya documentos huérfanos.
* Verificar que no falten documentos críticos.
* Verificar que cada empresa tenga su documentación específica.

## Prompt para Codex

```text
Actúa como revisor final de documentación.

Revisa la documentación ya optimizada.

Valida:
1. Que exista índice maestro.
2. Que exista inventario.
3. Que exista clasificación.
4. Que Core esté separado de Business.
5. Que cada empresa tenga su carpeta.
6. Que las APIs tengan documentación clara.
7. Que jobs y eventos estén documentados.
8. Que frontend no esté fragmentado de más.
9. Que documentos futuros estén en /future.
10. Que documentos obsoletos estén en /archive.

Genera:
/docs/_meta/final_review_report.md

No hagas cambios grandes sin reportarlos.
```

---
