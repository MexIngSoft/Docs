# Codex Documentation Diff Standard

## Objetivo

Evitar que Codex reescriba documentos completos cuando solo necesita cambiar
reglas puntuales.

## Regla principal

Codex debe preferir cambios minimos y trazables.

## Antes de modificar

Debe identificar:

- texto exacto actual;
- texto exacto nuevo;
- motivo;
- documento canonico relacionado;
- impacto en otros documentos.

## Prohibido

- reescribir documentos completos sin necesidad;
- cambiar titulos o estructura si no aporta valor;
- borrar contexto vigente;
- conservar reglas contradictorias activas;
- duplicar la misma regla en multiples documentos sin referencia canonica;
- modificar documentos fuera del alcance.

## Formato obligatorio por archivo

Para cada archivo:

- Archivo:
- Texto actual:
- Texto nuevo:
- Motivo:
- Validacion:

## Criterio de cierre

Un cambio documental queda completo si:

- no deja contradicciones activas;
- actualiza indices si aplica;
- actualiza el mapa `code-actions-map.md` si se agregan, cambian o eliminan
  acciones funcionales;
- actualiza `EXECUTION_REPORT.md` si viene de agent;
- pasa `validate-docs-rules.sh` o registra por que no pudo ejecutarse.
