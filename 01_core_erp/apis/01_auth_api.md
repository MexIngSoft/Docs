# Auth API

## Responsabilidad

Gestionar usuarios, roles, permisos, autenticacion y validacion de tokens.

## Estado en codigo

Existe como:

```text
API.PY.DJANGO.Auth
```

El codigo actual usa:

- Django.
- Djoser.
- JWT personalizado.
- Apps `user`, `access` y `roles`.

## Endpoints reales detectados

Desde `config/urls.py`:

```text
/admin/
/api/
/api/auth/
/api/access/
```

Desde `user/urls.py`:

```text
POST /api/auth/jwt/create/
POST /api/auth/jwt/refresh/
POST /api/auth/jwt/verify/
POST /api/auth/logout/
GET/POST /api/auth/o/{provider}/
```

Desde `access/urls.py`:

```text
GET /api/access/me/permissions/
```

Rutas Djoser:

```text
/api/users/
/api/users/me/
```

Las rutas exactas de Djoser dependen de la configuracion instalada.

## Modelos reales detectados

Access:

- `Modules`.
- `Actions`.
- `Permissions`.
- `RolePermissions`.
- `UserPermissions`.

Roles:

- `Roles`.
- `UserRoles`.

## Endpoints objetivo faltantes o por confirmar

- `GET /roles`.
- `POST /roles`.
- `PATCH /roles/{id}`.
- `GET /permissions`.
- `POST /permissions`.
- Endpoints administrativos de asignacion rol-usuario.
- Endpoints administrativos de asignacion permiso-rol.

## Contrato minimo de verificacion JWT

Request:

```json
{
  "token": "jwt"
}
```

Response esperada:

```json
{
  "is_valid": true,
  "user_id": "uuid",
  "email": "user@example.com",
  "permissions": []
}
```

El contrato real debe validarse contra `CustomTokenVerifyView` antes de consumirlo desde gateway.

## Relacion con Gateway

`tecnotelec-gateway-api` debe usar Auth para:

- Login.
- Refresh.
- Verify.
- Logout.
- Consulta de usuario actual.
- Consulta de permisos.

Gateway no debe guardar passwords ni emitir tokens por su cuenta.

## Pendiente

Modelo final de permisos por tenant: `PENDIENTE_DE_DEFINIR`.
