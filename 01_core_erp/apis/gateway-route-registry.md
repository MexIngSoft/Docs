# Registro de rutas Gateway

## Objetivo

Evitar que Codex invente rutas, consuma APIs directas desde frontend o salte el
Gateway General.

## Regla principal

Toda ruta consumida por un frontend debe estar registrada aqui o documentada en
el contrato API canonico correspondiente antes de implementarse.

Toda ruta Gateway nueva debe enlazar contrato API o API Decision Record.

## Registro

| Frontend | Ruta Gateway | API destino | Permiso requerido | Request | Response | Estado |
|---|---|---|---|---|---|---|
| PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR |

## Validacion

- El frontend no consume APIs internas directamente.
- La ruta Gateway existe en contrato o queda marcada como `PENDIENTE_DE_DEFINIR`.
- La API destino es reutilizable o especializada solo si aplica.
- El permiso requerido esta documentado.

## No permitido

- Crear rutas Gateway sin contrato.
- Crear rutas duplicadas para la misma responsabilidad.
- Exponer secretos o contratos de proveedor externo al frontend.
