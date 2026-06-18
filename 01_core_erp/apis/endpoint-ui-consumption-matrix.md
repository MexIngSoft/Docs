# Matriz endpoint a modulo UI

## Objetivo

Evitar mocks persistentes, pantallas desconectadas y endpoints sin consumidor
real.

## Regla principal

Toda pantalla que consuma datos debe declarar que endpoint Gateway usa. Si la
API real aun no existe, debe quedar como `PENDIENTE_DE_DEFINIR` y no mostrarse
como funcional completa.

Toda pantalla funcional debe enlazar ruta Gateway registrada. Si no existe ruta
Gateway, la pantalla no puede marcarse como funcional completa.

Si una pantalla usa mock, debe decir explicitamente:

```text
MOCK_TEMPORAL: motivo y API pendiente.
```

## Matriz

| Proyecto | Modulo UI | Pantalla o ruta | Ruta Gateway | API reutilizable | Estado UI | Estado contrato |
|---|---|---|---|---|---|---|
| PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR |

## Validacion

- Si existe API real, no usar mock como fuente principal.
- Si no existe API real, documentar bloqueo y estado visible.
- La pantalla debe consumir Gateway General.
- La API reutilizable debe revisarse antes de justificar una API especializada.
