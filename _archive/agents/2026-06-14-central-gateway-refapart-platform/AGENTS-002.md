# PROMPT CODEX — IMPLEMENTACIÓN ESTÁNDAR AUTH EN PROYECTOS EXISTENTES

## Objetivo

Implementar gradualmente el sistema centralizado de autenticación `API.PY.DJANGO.Auth` en proyectos existentes sin afectar operación actual, sin romper compatibilidad y permitiendo una migración controlada.

La implementación debe respetar la arquitectura oficial:

```text
Frontend
    ↓
Project Gateway / BFF
    ↓
Auth API
    ↓
Core APIs
```

Nunca:

```text
Frontend
    ↓
Auth API
```

---

# FASE 1 — AUDITORÍA DEL PROYECTO

Antes de modificar código:

Analizar completamente el proyecto.

Identificar:

```text
Login actual
Registro actual
Recuperación de contraseña
Sesiones
Cookies
JWT
Roles
Permisos
Middleware
Protección de rutas
Usuarios
```

Generar documento:

```text
02_projects/<proyecto>/security/auth-migration.md
```

Debe contener:

```text
Estado actual
Dependencias actuales
Flujos actuales
Riesgos
Componentes afectados
Endpoints afectados
Plan de migración
Plan de rollback
```

No modificar nada todavía.

---

# FASE 2 — MATRIZ DE DEPENDENCIAS

Crear o actualizar:

```text
02_projects/<proyecto>/architecture/api-dependencies.md
```

Registrar:

```text
Auth API
Gateway API
Project API
Core APIs
Versiones utilizadas
```

Ejemplo:

```text
Auth v1
Catalog v1
Inventory v1
Pricing v1
```

---

# FASE 3 — VARIABLES DE ENTORNO

Agregar:

```env
NEXT_PUBLIC_APP_NAME=
NEXT_PUBLIC_APPLICATION_CODE=
NEXT_PUBLIC_GATEWAY_BASE_URL=
NEXT_PUBLIC_ENVIRONMENT=
```

No eliminar variables existentes.

Mantener compatibilidad.

---

# FASE 4 — REGISTRO EN AUTH

Verificar que exista una aplicación en Auth.

Ejemplo:

```text
LEXNOVA
TECNOTELEC
DOCUCORE
REFAPART
IMAGRAFITY
```

Si no existe:

crear registro.

Documentar:

```text
ApplicationCode
ApplicationName
RedirectUrls
AllowedOrigins
```

---

# FASE 5 — ESTRUCTURA AUTH DEL FRONTEND

Crear si no existe:

```text
features/auth/
```

Con:

```text
components/
hooks/
services/
store/
types/
```

Crear:

```text
useAuth()
useSession()
usePermissions()
logout()
refreshSession()
```

---

# FASE 6 — GATEWAY

Implementar endpoints estándar:

```text
POST /auth/login
POST /auth/logout
POST /auth/refresh
GET  /auth/me
GET  /auth/me/permissions
POST /auth/register
POST /auth/password/reset
POST /auth/password/reset/confirm
```

El Gateway debe comunicarse con Auth.

No exponer Auth directamente.

---

# FASE 7 — APPLICATION CODE

Toda petición relacionada con autenticación debe enviar:

```http
X-Application-Code: <APPLICATION_CODE>
```

Ejemplo:

```http
X-Application-Code: LEXNOVA
```

No hardcodear valores.

Leer desde variables de entorno.

---

# FASE 8 — LOGIN NUEVO

Crear nuevo flujo paralelo.

No reemplazar todavía el login existente.

Implementar:

```text
Login Auth
```

y mantener:

```text
Login Actual
```

durante la migración.

Permitir pruebas.

---

# FASE 9 — PERFIL DE USUARIO

Implementar:

```text
GET /auth/me
```

para obtener:

```text
Usuario
Roles
Permisos
Aplicación
```

Eliminar dependencias locales innecesarias.

---

# FASE 10 — PERMISOS

Implementar:

```text
GET /auth/me/permissions
```

Los permisos deben provenir de Auth.

No duplicar permisos en frontend.

No duplicar permisos en Gateway.

No duplicar permisos en Project API.

Auth es la fuente oficial.

---

# FASE 11 — PROTECCIÓN DE RUTAS

Implementar:

```text
requireAuth()
requirePermission()
```

Comportamiento:

```text
Sin sesión → login
Sin permiso → 403
Token vencido → refresh
Refresh inválido → logout
```

---

# FASE 12 — REFRESH TOKEN

Implementar renovación automática.

Evitar cerrar sesión innecesariamente.

Registrar eventos de error.

---

# FASE 13 — LOGOUT

Implementar:

```text
logout()
```

Debe:

```text
Cerrar sesión en frontend
Cerrar sesión en Auth
Limpiar cache
Eliminar tokens
```

---

# FASE 14 — RECUPERACIÓN DE CONTRASEÑA

Integrar con Auth.

No crear sistema propio.

Usar:

```text
PASSWORD_RESET
PASSWORD_CHANGED
VERIFY_ACCOUNT
```

según configuración de Auth.

---

# FASE 15 — CORREOS

Usar plantillas de Auth.

No implementar correos duplicados.

Cada proyecto debe configurar:

```text
ApplicationEmailSettings
```

---

# FASE 16 — AUDITORÍA

Registrar:

```text
Login exitoso
Login fallido
Logout
Cambio contraseña
Refresh token
Acceso denegado
```

Usar sistema de auditoría de Auth.

---

# FASE 17 — COMPATIBILIDAD

Mientras exista login anterior:

Mantener:

```text
Modo Legacy
Modo Auth
```

Documentar cuál está activo.

---

# FASE 18 — PRUEBAS

Validar:

```text
Login correcto
Login incorrecto
Logout
Refresh
Permisos
Roles
Cambio contraseña
Recuperación contraseña
Cuenta bloqueada
```

---

# FASE 19 — RETIRO DEL LOGIN ANTERIOR

Solo eliminar cuando:

```text
100% pruebas aprobadas
Sin usuarios afectados
Rollback documentado
```

---

# FASE 20 — ACTUALIZACIÓN DOCUMENTAL

Actualizar:

```text
api-dependencies.md
auth-migration.md
README.md
```

Registrar:

```text
Fecha
Versión Auth
Responsable
Estado
```

---

# RESULTADO ESPERADO

Al finalizar:

```text
Proyecto integrado con Auth
Frontend → Gateway → Auth
Permisos centralizados
Roles centralizados
Sesiones centralizadas
Correos centralizados
Auditoría centralizada
Compatibilidad preservada
Sin romper usuarios actuales
```

No realizar cambios destructivos.

No eliminar login existente hasta concluir migración.

Priorizar compatibilidad y continuidad operativa.

Además, yo agregaría una regla global para Docs:

```text
Los proyectos existentes NO están obligados a migrar inmediatamente a Auth.

La migración se realizará únicamente cuando se trabaje activamente en ese proyecto.

Todo proyecto nuevo sí debe crearse con Auth desde el inicio.
```

Esa regla evita tener que detener el desarrollo para migrar todos los sistemas al mismo tiempo.
