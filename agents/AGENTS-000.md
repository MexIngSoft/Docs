Sí. Yo la separaría así:

## 1. API Auth — solo identidad, acceso y seguridad

Debe encargarse de:

* Usuarios.
* Login / logout.
* Passwords.
* Roles.
* Permisos.
* Sesiones.
* Dispositivos conectados.
* Tokens.
* Recuperación de cuenta.
* MFA / doble factor.
* Auditoría de accesos.
* Bloqueos por intentos fallidos.
* Políticas de seguridad por app.
* Validación de si el usuario está activo, bloqueado o eliminado.
* Saber si el usuario está en línea o cuándo fue su última actividad.

Esto coincide con buenas prácticas de OWASP ASVS, que recomienda verificar autenticación, manejo de sesiones y control de acceso como controles separados y comprobables. ([OWASP Foundation][1])

## 2. Lo que NO pondría en Auth

No pondría aquí:

* Datos fiscales.
* Datos comerciales del cliente.
* Dirección.
* Teléfono de negocio.
* Razón social.
* Sucursales.
* Almacenes.
* Datos de empresa.
* Configuración comercial.
* Preferencias del cliente por proyecto.

Eso debe ir en una API separada, por ejemplo:

```text
Customer API
Client API
Tenant API
Organization API
```

Mi recomendación: **Customer API** si piensas en clientes comerciales, o **Tenant API** si cada empresa tendrá sus propias apps, usuarios y configuración.

## 3. Esquemas recomendados

```text
Auth
Customer
Security
Audit
```

O más simple:

```text
Auth
Customer
Audit
```

Dentro de `Auth`:

```text
Auth.Users
Auth.Roles
Auth.Permissions
Auth.UserRoles
Auth.RolePermissions
Auth.Applications
Auth.ApplicationRoles
Auth.ApplicationPermissions
Auth.UserSessions
Auth.UserDevices
Auth.RefreshTokens
Auth.PasswordHistory
Auth.LoginAttempts
Auth.MfaMethods
Auth.RecoveryCodes
```

Dentro de `Customer`:

```text
Customer.Customers
Customer.CustomerUsers
Customer.Organizations
Customer.Branches
Customer.Addresses
Customer.Contacts
Customer.FiscalProfiles
Customer.Preferences
```

## 4. Punto importante: multi-app

Auth debe saber a qué sistema intenta entrar el usuario:

```text
ApplicationCode
```

Ejemplos:

```text
TECNOTELEC
LEXNOVA
JOBCRON
IMAGRAFITY
SAT_PORTAL
ERP_ADMIN
```

Así un mismo usuario puede existir una sola vez, pero tener permisos diferentes por aplicación.

Ejemplo:

```text
Usuario Hugo
- TECNOTELEC: Administrador
- LEXNOVA: Analista Jurídico
- JOBCRON: Operador
```

## 5. Dispositivos conectados

Tabla sugerida:

```text
Auth.UserDevices
```

Campos:

```text
Id
IdUser
DeviceName
DeviceType
OperatingSystem
Browser
IpAddress
UserAgent
FingerprintHash
IsTrusted
IsActive
LastSeenAt
CreatedAt
RevokedAt
RevokedReason
```

Con esto puedes mostrar:

```text
Samsung S24 Ultra — Chrome — Pachuca — Activo ahora
Windows PC — Edge — Último acceso hace 2 días
```

Y permitir:

```text
Cerrar esta sesión
Cerrar todas las sesiones
Cerrar todos menos este dispositivo
```

## 6. Sesiones y tokens

Tabla:

```text
Auth.UserSessions
```

Campos:

```text
Id
IdUser
IdDevice
AccessTokenJti
RefreshTokenHash
StartedAt
LastActivityAt
ExpiresAt
RevokedAt
RevokedReason
IsOnline
```

Recomendación fuerte: no guardar refresh tokens en texto plano. Guardarlos como hash. OAuth 2.0 es el estándar base para autorización con tokens, y el manejo seguro de sesiones/tokens debe tratarse como parte crítica del diseño. ([OAuth][2])

## 7. Cuando cambia la contraseña

Cuando el usuario cambia contraseña:

```text
Revocar todas las sesiones
Revocar todos los refresh tokens
Marcar dispositivos como no confiables
Forzar nuevo login
Guardar evento en auditoría
Enviar notificación
```

## 8. Seguridad adicional que sí agregaría

Agregaría:

```text
MFA / doble factor
Códigos de recuperación
Historial de contraseñas
Bloqueo por intentos fallidos
Rate limit por IP y usuario
Auditoría completa
Alertas por nuevo dispositivo
Alertas por ubicación/IP inusual
Permisos por aplicación
Permisos por módulo
Permisos por acción
Sesiones por dispositivo
Revocación de sesiones
Reautenticación para acciones sensibles
```

NIST SP 800-63B trata la autenticación remota, niveles de seguridad de autenticadores y ciclo de vida de credenciales; para una API reutilizable conviene tomarlo como referencia, sobre todo en MFA, recuperación y revocación. ([NIST Pages][3])

## 9. Estructura ideal de permisos

Yo usaría este modelo:

```text
Application → Module → Permission → Action
```

Ejemplo:

```text
TECNOTELEC
  Catalog
    Product.View
    Product.Create
    Product.Update
    Product.Delete

LEXNOVA
  Cases
    Case.View
    Case.Create
    Case.Assign
    Case.Close
```

Así no amarras los permisos a una sola app.

## 10. Mi propuesta final

La arquitectura quedaría así:

```text
Auth API
- Identidad
- Login
- Tokens
- Roles
- Permisos
- Sesiones
- Dispositivos
- MFA
- Auditoría de acceso

Customer API
- Cliente
- Empresa
- Sucursales
- Contactos
- Datos fiscales
- Relación usuario-cliente

Application Registry
- Apps disponibles
- Módulos
- Permisos base
- Configuración por sistema
```

La idea correcta sería:

```text
Auth no debe saber “quién es comercialmente el cliente”.
Auth solo debe saber “quién eres, cómo entras y qué puedes hacer”.
```

Y Customer debe saber:

```text
A qué empresa perteneces, qué datos tiene esa empresa y cómo se relaciona contigo.
```

[1]: https://owasp.org/www-project-application-security-verification-standard/?utm_source=chatgpt.com "OWASP Application Security Verification Standard (ASVS)"
[2]: https://oauth.net/2/?utm_source=chatgpt.com "OAuth 2.0 — OAuth"
[3]: https://pages.nist.gov/800-63-4/sp800-63b.html?utm_source=chatgpt.com "NIST Special Publication 800-63B"
