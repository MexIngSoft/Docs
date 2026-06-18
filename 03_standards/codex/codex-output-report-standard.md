# Estandar de salida obligatoria Codex

## Objetivo

Unificar el cierre de respuestas Codex para que cada ejecucion deje trazabilidad
minima, especialmente cuando use agents o modifique documentacion canonica.

## Regla principal

Toda salida final de Codex debe declarar que se hizo, que se valido y que queda
pendiente de forma verificable.

## Campos obligatorios

- Context Pack usado.
- Documentos leidos.
- Documentos fuera de alcance.
- APIs reutilizadas.
- APIs no creadas y motivo.
- Archivos modificados.
- Validaciones ejecutadas.
- Resultado de validaciones.
- Pendientes reales con `PENDIENTE_DE_DEFINIR`.
- Agents cerrados, parciales, bloqueados o sin instrucciones, cuando aplique.

## Reglas

- No declarar una validacion como ejecutada si no corrio.
- Si un comando no existe o el entorno lo impide, registrar causa exacta.
- No cerrar como completo un trabajo con bloqueo esencial.
- No sugerir crear APIs si una API reutilizable cubre la responsabilidad.
