# Migracion Auth - <Proyecto>

## Estado

```text
PENDIENTE_DE_DEFINIR
```

Estados permitidos:

```text
sin_auth
login_viejo
login_nuevo
mixto_temporal
migrado
bloqueado
```

## Login actual

- Frontend:
- Gateway:
- Auth/API consumida:
- Rutas visibles:
- Cookies/tokens:

## Login objetivo

- Gateway objetivo:
- Auth version:
- `ApplicationCode`:
- Rutas nuevas:
- Permisos iniciales:

## Pantallas afectadas

| Pantalla | Estado actual | Cambio requerido |
|---|---|---|
| `/login` | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR |

## Endpoints

| Endpoint actual | Endpoint objetivo | Estado |
|---|---|---|
| PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR |

## Riesgos

- PENDIENTE_DE_DEFINIR

## Plan de migracion

1. Auditar login actual.
2. Agregar variables de entorno.
3. Crear `features/auth`.
4. Conectar login contra Gateway.
5. Conectar Gateway contra Auth.
6. Validar `/me` y permisos.
7. Desactivar flujo viejo solo con validacion completa.

## Rollback

PENDIENTE_DE_DEFINIR

## Validaciones

- [ ] Login correcto.
- [ ] Login invalido.
- [ ] Refresh.
- [ ] Logout.
- [ ] `/me`.
- [ ] `/me/permissions`.
- [ ] `/403`.
