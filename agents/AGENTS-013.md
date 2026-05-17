
# 13_security_auth_permissions_agent.md

## Propósito

Ordenar la documentación de Auth, seguridad, roles y permisos.

## Responsabilidad

* Separar Auth Core de permisos por empresa.
* Documentar sesiones.
* Documentar dispositivos.
* Documentar JWT.
* Documentar roles.
* Documentar permisos.
* Documentar MFA futuro.
* Documentar auditoría.

## Estructura recomendada

```text
/docs/core/auth
  README.md
  users.md
  roles.md
  permissions.md
  sessions.md
  devices.md
  tokens.md
  security-policies.md

/docs/shared/security
  password-policy.md
  audit-policy.md
  mfa-future.md
```

## Prompt para Codex

```text
Actúa como auditor de Auth, seguridad y permisos.

Revisa toda la documentación relacionada con:
- usuarios
- login
- JWT
- roles
- permisos
- sesiones
- dispositivos conectados
- recuperación de contraseña
- correos de autenticación
- permisos por empresa

Separa:
- Auth Core reutilizable
- reglas compartidas de seguridad
- permisos específicos por empresa

Crea o actualiza:
/docs/core/auth/README.md
/docs/core/auth/roles.md
/docs/core/auth/permissions.md
/docs/core/auth/sessions.md
/docs/core/auth/devices.md
/docs/shared/security/audit-policy.md
/docs/shared/security/password-policy.md
```

---
