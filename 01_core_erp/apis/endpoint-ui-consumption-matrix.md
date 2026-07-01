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
| REFAPART | Auth login | `/login` | `/auth/login/`, `/auth/me/`, `/auth/me/permissions/` | Auth API via Gateway General | Implementado | Vigente |
| REFAPART | Cuenta cliente | `/cuenta`, `/dashboard` | `GET /api/v1/projects/REFAPART/customer/dashboard` | REFAPART API + Auth + Sales/Requests | Implementado con `MOCK_TEMPORAL`: resumen visual hasta cerrar endpoint dashboard | PENDIENTE_DE_IMPLEMENTAR |
| REFAPART | Direcciones | `/cuenta/direcciones`, `/checkout` | `/core/address/api/address/suggest?postalCode=`, `/core/address/api/address/addresses` | Address API via Gateway General | Implementado | Vigente |
| REFAPART | Busqueda de piezas | `/`, `/resultados` | `/projects/REFAPART/search` | REFAPART API/Search via Gateway General | Implementado | Vigente parcial |
| REFAPART | Solicitud de pieza | `/publicar-busqueda` | `/projects/REFAPART/requests` | REFAPART API via Gateway General | Implementado | Vigente parcial |

## Validacion

- Si existe API real, no usar mock como fuente principal.
- Si no existe API real, documentar bloqueo y estado visible.
- La pantalla debe consumir Gateway General.
- La API reutilizable debe revisarse antes de justificar una API especializada.
