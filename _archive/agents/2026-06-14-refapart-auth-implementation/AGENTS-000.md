Sí. Esto es lo que voy a definir:

1. Login estándar obligatorio para todo proyecto web nuevo.
2. Excepción documentada cuando un proyecto no lleve login.
3. Flujo de Auth usando Gateway/BFF, no directo desde frontend.
4. Registro de cada proyecto como `Application` en Auth.
5. Uso obligatorio de `ApplicationCode` / `X-Application-Code`.
6. Variables `.env.local.example` mínimas para Auth.
7. Rutas públicas, auth, privadas y admin.
8. Migración de proyectos viejos al login estándar.
9. Versionado de Auth y demás APIs.
10. Matriz proyecto → API → versión.
11. Compatibilidad entre login viejo y login nuevo.
12. Política para no romper proyectos ya activos.
13. Documentos nuevos que Codex debe crear en `Docs`.
14. Checklist de cierre para validar implementación.

Base documental: Docs ya exige separar núcleo, proyectos, estándares e integraciones ; el frontend debe consumir su Gateway/BFF y no APIs core directamente ; el estándar Next.js ya pide rutas públicas/privadas y sesión contra gateway/auth ; Auth ya soporta aplicaciones, roles, permisos, sesiones, tokens, auditoría y permisos por aplicación mediante `application_code` o `X-Application-Code` .

Aquí tienes las instrucciones para Codex:

# INSTRUCCIONES CODEX — ESTANDARIZAR LOGIN AUTH EN TODOS LOS PROYECTOS WEB

## Objetivo principal

Estandarizar la implementación de login en todos los proyectos web del ecosistema MexIngSoft.

A partir de ahora, todo proyecto web nuevo debe crearse con integración Auth obligatoria, salvo que la documentación del proyecto indique explícitamente que no debe llevar login.

El estándar debe basarse en:

* `MexIngSoft/Docs`
* `MexIngSoft/API.PY.DJANGO.Auth`
* `MexIngSoft/WEB.NJ.NEXT.LexNova`

---

# 1. REGLA PRINCIPAL

Todo proyecto web nuevo debe incluir sistema de autenticación estándar.

Debe aplicarse a:

```text
WEB.NJ.NEXT.<NombreProyecto>
```

Ejemplos:

```text
WEB.NJ.NEXT.LexNova
WEB.NJ.NEXT.TecnoTelec
WEB.NJ.NEXT.DocuCore
WEB.NJ.NEXT.Refapart
WEB.NJ.NEXT.Imagrafity
```

La única excepción válida es que el documento del proyecto declare:

```text
auth_required: false
```

y explique el motivo.

---

# 2. DOCUMENTACIÓN NUEVA A CREAR EN DOCS

Crear el archivo:

```text
03_standards/auth/web-auth-login-standard.md
```

Debe contener:

* objetivo
* alcance
* regla obligatoria
* excepciones
* flujo frontend → gateway → auth
* variables de entorno
* rutas estándar
* manejo de sesión
* permisos
* logout
* refresh token
* errores
* checklist de cierre

---

Crear también:

```text
03_standards/auth/auth-versioning-standard.md
```

Debe contener:

* versionado de Auth
* compatibilidad hacia atrás
* versiones activas
* versiones deprecadas
* política de migración
* cómo evitar romper proyectos existentes

---

Crear también:

```text
02_projects/_ecosystem/api-version-matrix.md
```

Debe contener una tabla así:

```text
Proyecto | Frontend | Gateway | Auth Version | APIs Core | Estado | Observaciones
```

Ejemplo:

```text
LexNova | WEB.NJ.NEXT.LexNova | API.PY.DJANGO.LexNova.Gateway | Auth v1 | LexNova API, Documents API | activo | Usa login estándar
TecnoTelec | WEB.NJ.NEXT.TecnoTelec | API.PY.DJANGO.TecnoTelec.Gateway | Auth v1 | Catalog, Pricing, Sales | pendiente | Migrar cuando se implemente
```

---

# 3. FLUJO OFICIAL DE LOGIN

El frontend NO debe consumir Auth directamente.

Flujo correcto:

```text
Frontend Web
  -> Project Gateway / BFF
    -> API.PY.DJANGO.Auth
```

Prohibido:

```text
Frontend Web -> API.PY.DJANGO.Auth
Frontend Web -> Core APIs
Frontend Web -> Base de datos
```

---

# 4. RESPONSABILIDAD DEL FRONTEND

Cada proyecto web debe tener:

```text
app/
  (public)/
  (auth)/
    login/
    register/
    forgot-password/
    reset-password/
  (private)/
  (admin)/
features/
  auth/
lib/
  api/
  auth/
types/
  auth.ts
```

---

## El frontend debe encargarse de:

* mostrar formulario de login
* mostrar formulario de registro si aplica
* mostrar recuperación de contraseña
* guardar estado visual de sesión
* redirigir al usuario según permisos
* mostrar errores amigables
* ocultar opciones que el usuario no puede usar

---

## El frontend NO debe encargarse de:

* validar permisos como única barrera
* guardar secretos
* consultar base de datos
* consumir APIs core directamente
* decidir permisos reales
* crear tokens manualmente

---

# 5. RESPONSABILIDAD DEL GATEWAY

Cada proyecto web con login debe tener un Gateway/BFF.

Ejemplo:

```text
API.PY.DJANGO.LexNova.Gateway
API.PY.DJANGO.TecnoTelec.Gateway
API.PY.DJANGO.DocuCore.Gateway
```

El Gateway debe exponer endpoints estándar:

```text
POST /api/auth/login/
POST /api/auth/logout/
POST /api/auth/refresh/
GET  /api/auth/me/
GET  /api/auth/me/permissions/
POST /api/auth/register/
POST /api/auth/password/reset/
POST /api/auth/password/reset/confirm/
```

El Gateway internamente llama a Auth.

---

# 6. RESPONSABILIDAD DE AUTH

Auth es infraestructura compartida.

Auth debe manejar:

* usuarios
* roles
* permisos
* aplicaciones
* sesiones
* refresh tokens
* dispositivos
* login attempts
* auditoría
* login social
* plantillas de correo por aplicación

Auth NO pertenece a un proyecto web.

Auth NO debe tener lógica de negocio de LexNova, TecnoTelec, DocuCore o cualquier otro proyecto.

---

# 7. APPLICATION CODE

Cada proyecto web debe existir como aplicación dentro de Auth.

Ejemplos:

```text
LEXNOVA
TECNOTELEC
DOCUCORE
REFAPART
IMAGRAFITY
JOBCRON
```

Toda llamada relacionada con sesión o permisos debe incluir:

```text
X-Application-Code: <APPLICATION_CODE>
```

Ejemplo:

```text
X-Application-Code: LEXNOVA
```

---

# 8. VARIABLES DE ENTORNO OBLIGATORIAS

Todo proyecto web debe tener `.env.local.example` con:

```text
NEXT_PUBLIC_APP_NAME=
NEXT_PUBLIC_HOST=
NEXT_PUBLIC_ENVIRONMENT=
NEXT_PUBLIC_GATEWAY_BASE_URL=
NEXT_PUBLIC_APPLICATION_CODE=
```

Ejemplo LexNova:

```text
NEXT_PUBLIC_APP_NAME=LexNova
NEXT_PUBLIC_HOST=http://localhost:3002
NEXT_PUBLIC_ENVIRONMENT=local
NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:8020
NEXT_PUBLIC_APPLICATION_CODE=LEXNOVA
```

No guardar secretos en variables `NEXT_PUBLIC_`.

---

# 9. RUTAS ESTÁNDAR

Todo proyecto con Auth debe tener:

```text
/login
/register
/forgot-password
/reset-password
/logout
/dashboard
/profile
/settings
```

Si el proyecto no permite registro público, `/register` debe existir pero mostrar mensaje controlado o redireccionar según configuración.

---

# 10. SESIÓN

Crear un módulo estándar:

```text
features/auth/
  components/
  hooks/
  services/
  store/
  types.ts
```

Debe incluir:

```text
useAuth()
useSession()
usePermissions()
requireAuth()
requirePermission()
logout()
refreshSession()
```

---

# 11. PROTECCIÓN DE RUTAS

Crear mecanismo estándar para rutas privadas.

Reglas:

* usuario sin sesión → `/login`
* usuario sin permiso → `/403`
* sesión expirada → intentar refresh
* refresh fallido → logout
* usuario autenticado entrando a `/login` → redirigir a dashboard

---

# 12. PERMISOS

El frontend solo refleja permisos para experiencia visual.

La validación real debe vivir en backend.

El frontend puede usar permisos para:

* ocultar botones
* ocultar menús
* bloquear navegación visual
* mostrar mensajes

Pero el Gateway y APIs deben validar siempre.

---

# 13. LOGIN VIEJO VS LOGIN NUEVO

Cuando un proyecto viejo ya tenga login propio, NO reemplazarlo directamente sin plan.

Debe documentarse:

```text
Estado actual:
Login viejo
Login nuevo
Mixto temporal
Migrado
Sin Auth
```

Crear archivo por proyecto:

```text
02_projects/<proyecto>/security/auth-migration.md
```

Debe contener:

* login actual
* dependencias actuales
* pantallas afectadas
* endpoints actuales
* endpoint nuevo equivalente
* riesgos
* plan de migración
* rollback

---

# 14. MIGRACIÓN DE PROYECTOS VIEJOS

Para implementar Auth en un proyecto existente:

## Paso 1

Auditar si ya tiene login.

## Paso 2

Crear `auth-migration.md`.

## Paso 3

Agregar variables nuevas en `.env.local.example`.

## Paso 4

Crear `features/auth`.

## Paso 5

Conectar login contra Gateway.

## Paso 6

Conectar Gateway contra Auth.

## Paso 7

Agregar `X-Application-Code`.

## Paso 8

Validar `/me`.

## Paso 9

Validar permisos.

## Paso 10

Desactivar login viejo solo cuando el nuevo esté probado.

---

# 15. VERSIONADO DE AUTH

Auth debe versionarse.

Usar esquema:

```text
v1
v1.1
v1.2
v2
```

Regla:

* cambios compatibles: misma versión mayor
* cambios que rompen contrato: nueva versión mayor
* endpoints viejos no se eliminan sin periodo de deprecación

---

# 16. ENDPOINTS VERSIONADOS

Auth debe exponer endpoints versionados o documentar versión de contrato.

Preferido:

```text
/api/v1/auth/login/
/api/v1/auth/logout/
/api/v1/auth/refresh/
/api/v1/auth/me/
/api/v1/auth/me/permissions/
```

Si actualmente existen endpoints sin versión, mantenerlos como compatibilidad temporal.

---

# 17. COMPATIBILIDAD HACIA ATRÁS

Cuando Auth cambie:

No se debe romper ningún proyecto activo.

Debe existir tabla:

```text
Proyecto | Auth actual | Auth objetivo | Fecha migración | Responsable | Estado
```

Ejemplo:

```text
LexNova | v1 | v1 | No requiere | PENDIENTE_DE_DEFINIR | Activo
TecnoTelec | sin Auth | v1 | PENDIENTE_DE_DEFINIR | PENDIENTE_DE_DEFINIR | Pendiente
```

---

# 18. VERSIONADO DE OTRAS APIs

La misma regla aplica para:

```text
Catalog API
Pricing API
Inventory API
Sales API
Supplier API
Documents API
LexNova API
TecnoTelec API
```

Cada proyecto debe declarar qué versión usa.

Ejemplo:

```text
02_projects/<proyecto>/architecture/api-dependencies.md
```

Contenido:

```text
API | Repositorio | Versión usada | Contrato | Gateway | Estado
```

---

# 19. NO ACTUALIZAR TODOS LOS PROYECTOS A LA FUERZA

Si Auth cambia a v2, no migrar todos automáticamente.

Cada proyecto debe poder quedarse temporalmente en:

```text
Auth v1
```

mientras otros usan:

```text
Auth v2
```

El Gateway del proyecto decide qué versión consume.

---

# 20. POLÍTICA DE DEPRECACIÓN

Antes de eliminar una versión vieja:

* marcar como deprecated
* documentar proyectos afectados
* crear plan de migración
* validar pruebas
* mantener periodo de convivencia
* confirmar que ningún proyecto activo depende de esa versión

---

# 21. LOGIN VISUAL

El login debe ser estándar en lógica, pero personalizable en marca.

Compartido:

* flujo
* validaciones
* sesión
* permisos
* errores
* refresh
* logout

Personalizable:

* logo
* colores
* textos
* imagen lateral
* nombre comercial
* enlaces legales

---

# 22. PLANTILLAS DE CORREO

Auth debe usar plantillas por aplicación.

Cada proyecto debe poder tener:

* remitente
* logo
* colores
* URL de redirección
* textos propios

Sin duplicar lógica de correo en cada frontend.

---

# 23. ARCHIVOS A CREAR EN CADA PROYECTO WEB NUEVO

Cuando se cree un nuevo proyecto web, Codex debe crear:

```text
.env.local.example
features/auth/
lib/api/gateway-client.ts
lib/auth/session.ts
types/auth.ts
app/(auth)/login/page.tsx
app/(auth)/forgot-password/page.tsx
app/(auth)/reset-password/page.tsx
app/(private)/layout.tsx
app/403/page.tsx
```

---

# 24. CHECKLIST DE CIERRE

Un proyecto cumple el estándar Auth si:

```text
[ ] Tiene NEXT_PUBLIC_APPLICATION_CODE
[ ] Consume Gateway, no Auth directo
[ ] Tiene login
[ ] Tiene logout
[ ] Tiene refresh
[ ] Tiene /me
[ ] Tiene /me/permissions
[ ] Tiene protección de rutas
[ ] Tiene página 403
[ ] Tiene errores normalizados
[ ] Tiene auth-migration.md si era proyecto viejo
[ ] Está registrado en api-version-matrix.md
[ ] Declara versión de Auth usada
[ ] Declara APIs y versiones que consume
```

---

# 25. TAREA CODEX

Realizar los siguientes cambios en `MexIngSoft/Docs`:

1. Crear `03_standards/auth/web-auth-login-standard.md`.
2. Crear `03_standards/auth/auth-versioning-standard.md`.
3. Crear `02_projects/_ecosystem/api-version-matrix.md`.
4. Actualizar `03_standards/frontend/nextjs-project-standard.md` para incluir Auth obligatorio.
5. Actualizar `01_core_erp/architecture/07_project_api_pattern.md` para aclarar que Auth se consume por Gateway.
6. Agregar checklist de Auth en el estándar de cierre.
7. Crear plantilla `02_projects/_templates/auth-migration-template.md`.
8. Crear plantilla `02_projects/_templates/api-dependencies-template.md`.
9. Actualizar README principal para agregar lectura recomendada de Auth.
10. No borrar documentación existente; mover obsoletos a `_archive`.

---

# 26. RESULTADO ESPERADO

Codex debe entregar:

```text
Documentos creados
Documentos modificados
Reglas nuevas agregadas
Plantillas agregadas
Proyectos afectados
Pendientes detectados
Riesgos de migración
```

No implementar cambios destructivos.

No modificar proyectos activos sin documentar primero su plan de migración.
