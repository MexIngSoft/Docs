Sí. Te dejo el **agente completo para Codex**. Debe migrar la arquitectura hacia un solo Gateway central sin romper proyectos activos.

Base: Docs ya define que el frontend debe pasar por Gateway/BFF y no consumir APIs core directamente.

# AGENTE CODEX — MIGRACIÓN A GATEWAY CENTRAL

## Nombre del agente

`agent_XX_gateway_central_migration.md`

## Objetivo

Migrar la arquitectura actual de múltiples Gateways por proyecto hacia un Gateway central único:

```text
API.PY.DJANGO.Gateway
```

Este Gateway será la entrada estándar para todos los proyectos web.

---

# 1. ARQUITECTURA OBJETIVO

La arquitectura final debe quedar así:

```text
WEB.NJ.NEXT.<Proyecto>
        ↓
API.PY.DJANGO.Gateway
        ↓
API.PY.DJANGO.<Proyecto> opcional
        ↓
APIs Core ERP
        ↓
API.PY.DJANGO.Auth
```

Ejemplo:

```text
WEB.NJ.NEXT.LexNova
        ↓
API.PY.DJANGO.Gateway
        ↓
API.PY.DJANGO.LexNova
        ↓
API.PY.DJANGO.Auth
```

Para proyectos comerciales:

```text
WEB.NJ.NEXT.Refapart
        ↓
API.PY.DJANGO.Gateway
        ↓
API.PY.DJANGO.Refapart
        ↓
Catalog / Inventory / Pricing / Supplier / Auth
```

---

# 2. REGLA PRINCIPAL

A partir de esta migración:

```text
Todo proyecto web debe consumir API.PY.DJANGO.Gateway.
```

Queda prohibido que un frontend consuma directamente:

```text
API.PY.DJANGO.Auth
API.PY.DJANGO.Catalog
API.PY.DJANGO.Inventory
API.PY.DJANGO.Pricing
API.PY.DJANGO.Supplier
API.PY.DJANGO.Sales
API.PY.DJANGO.<Proyecto>
```

---

# 3. NOMBRE OFICIAL

El Gateway central debe llamarse:

```text
API.PY.DJANGO.Gateway
```

No usar:

```text
API.PY.DJANGO.PlatformGateway
API.PY.DJANGO.PublicGateway
API.PY.DJANGO.JobCron.Gateway
```

Motivo:

```text
Gateway = entrada central
JobCron = ERP administrador
Auth = identidad
APIs Core = módulos compartidos
APIs Proyecto = reglas propias
```

---

# 4. RESPONSABILIDADES DEL GATEWAY CENTRAL

El Gateway central debe manejar:

```text
Autenticación
Logout
Refresh token
/me
/me/permissions
Validación de X-Application-Code
Routing por proyecto
Routing por versión de API
Rate limit
Normalización de errores
Correlation ID
Logs técnicos
Auditoría técnica
Headers estándar
Compatibilidad temporal con rutas legacy
```

---

# 5. LO QUE NO DEBE HACER EL GATEWAY

El Gateway central NO debe contener:

```text
Reglas de negocio permanentes
Tablas propias de proyectos
Precios
Inventario
Ventas
Procesos legales
Procesos documentales
Reglas comerciales específicas
ETLs
Lógica de proveedores
```

Eso debe vivir en:

```text
API.PY.DJANGO.<Proyecto>
```

o en:

```text
APIs Core ERP
```

---

# 6. ESTRUCTURA DEL REPOSITORIO GATEWAY

Crear o validar:

```text
API.PY.DJANGO.Gateway/
  README.md
  requirements.txt
  .env.local.example
  manage.py

  config/
    settings.py
    urls.py
    asgi.py
    wsgi.py

  apps/
    gateway_core/
    project_router/
    auth_proxy/
    permission_proxy/
    api_registry/
    versioning/
    observability/
    rate_limit/
    error_handler/
    health/

  clients/
    auth_client.py
    project_api_client.py
    core_api_client.py

  routes/
    auth_urls.py
    project_urls.py
    health_urls.py

  tests/
    test_auth_proxy.py
    test_project_router.py
    test_api_registry.py
    test_versioning.py
```

---

# 7. VARIABLES DE ENTORNO DEL GATEWAY

Crear `.env.local.example` con:

```env
DJANGO_ENV=local
SECRET_KEY=
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1

AUTH_API_BASE_URL=
AUTH_API_VERSION=v1

DEFAULT_TIMEOUT_SECONDS=15

GATEWAY_NAME=API.PY.DJANGO.Gateway
GATEWAY_VERSION=v1

ENABLE_LEGACY_GATEWAY_ROUTES=True
ENABLE_RATE_LIMIT=True
ENABLE_REQUEST_LOGGING=True
```

---

# 8. REGISTRO DE PROYECTOS

Crear registro central:

```text
config/project_registry.yaml
```

Ejemplo:

```yaml
LEXNOVA:
  enabled: true
  frontend: WEB.NJ.NEXT.LexNova
  project_api: API.PY.DJANGO.LexNova
  project_api_base_url: http://lexnova-api:8000
  auth_version: v1
  core_apis:
    auth: v1
    documents: v1

TECNOTELEC:
  enabled: true
  frontend: WEB.NJ.NEXT.TecnoTelec
  project_api: API.PY.DJANGO.TecnoTelec
  project_api_base_url: http://tecnotelec-api:8000
  auth_version: v1
  core_apis:
    auth: v1
    catalog: v1
    inventory: v1
    pricing: v1
    supplier: v1

DOCUCORE:
  enabled: true
  frontend: WEB.NJ.NEXT.DocuCore
  project_api: API.PY.DJANGO.DocuCore
  project_api_base_url: http://docucore-api:8000
  auth_version: v1
  core_apis:
    auth: v1
    documents: v1
```

---

# 9. RUTAS ESTÁNDAR DEL GATEWAY

Implementar:

```text
GET  /health/
GET  /api/health/

POST /api/auth/login/
POST /api/auth/logout/
POST /api/auth/refresh/
GET  /api/auth/me/
GET  /api/auth/me/permissions/
POST /api/auth/register/
POST /api/auth/password/reset/
POST /api/auth/password/reset/confirm/

ANY /api/projects/<application_code>/*
ANY /api/core/<api_name>/*
```

---

# 10. APPLICATION CODE

Todo proyecto debe enviar:

```http
X-Application-Code: <PROJECT_CODE>
```

Ejemplos:

```http
X-Application-Code: LEXNOVA
X-Application-Code: TECNOTELEC
X-Application-Code: DOCUCORE
X-Application-Code: REFAPART
X-Application-Code: IMAGRAFITY
```

Si falta `X-Application-Code`, responder:

```json
{
  "error": "APPLICATION_CODE_REQUIRED",
  "message": "X-Application-Code is required."
}
```

---

# 11. COMPATIBILIDAD CON GATEWAYS VIEJOS

No borrar Gateways viejos inmediatamente.

Primero marcarlos como:

```text
deprecated
```

Después:

```text
disabled
```

Finalmente:

```text
archived
```

Estados permitidos:

```text
active
deprecated
disabled
archived
```

---

# 12. MIGRACIÓN SIN ROMPER PROYECTOS

La migración debe hacerse por fases.

## Fase 1

Crear `API.PY.DJANGO.Gateway`.

## Fase 2

Crear rutas compatibles para cada proyecto.

## Fase 3

Actualizar cada frontend para usar:

```env
NEXT_PUBLIC_GATEWAY_BASE_URL=
```

apuntando al Gateway central.

## Fase 4

Mantener Gateway viejo como fallback.

## Fase 5

Probar proyecto completo.

## Fase 6

Marcar Gateway viejo como deprecated.

## Fase 7

Después de validación, marcarlo como disabled.

## Fase 8

Archivar o eliminar solo cuando ningún proyecto lo use.

---

# 13. DOCUMENTACIÓN A CREAR EN DOCS

Crear:

```text
03_standards/gateway/central-gateway-standard.md
03_standards/gateway/gateway-migration-standard.md
03_standards/gateway/gateway-routing-standard.md
03_standards/gateway/legacy-gateway-deprecation-standard.md
```

Actualizar:

```text
01_core_erp/architecture/07_project_api_pattern.md
03_standards/frontend/nextjs-project-standard.md
02_projects/_ecosystem/api-version-matrix.md
```

Crear plantilla:

```text
02_projects/_templates/gateway-migration-template.md
```

---

# 14. DOCUMENTACIÓN POR PROYECTO

Cada proyecto debe tener:

```text
02_projects/<proyecto>/architecture/gateway-migration.md
```

Debe registrar:

```text
Gateway anterior
Gateway nuevo
Estado
Fecha de migración
Riesgos
Rollback
Variables modificadas
APIs usadas
Versión Auth usada
```

---

# 15. FRONTENDS A ACTUALIZAR

Actualizar todos los proyectos web existentes:

```text
WEB.NJ.NEXT.LexNova
WEB.NJ.NEXT.TecnoTelec
WEB.NJ.NEXT.DocuCore
WEB.NJ.NEXT.Refapart
WEB.NJ.NEXT.Imagrafity
WEB.NJ.NEXT.JobCron
```

Cada uno debe usar:

```env
NEXT_PUBLIC_GATEWAY_BASE_URL=http://gateway:8000
NEXT_PUBLIC_APPLICATION_CODE=<PROJECT_CODE>
```

---

# 16. MATRIZ DE GATEWAY

Crear o actualizar:

```text
02_projects/_ecosystem/gateway-matrix.md
```

Formato:

```text
Proyecto | Frontend | Gateway actual | Gateway objetivo | Estado | Fecha | Observaciones
```

Ejemplo:

```text
LexNova | WEB.NJ.NEXT.LexNova | API.PY.DJANGO.LexNova.Gateway | API.PY.DJANGO.Gateway | deprecated | PENDIENTE_DE_DEFINIR | Migrar variable NEXT_PUBLIC_GATEWAY_BASE_URL
```

---

# 17. VERSIONADO

El Gateway central debe soportar versionado.

Ejemplo:

```text
/api/v1/auth/login/
/api/v1/projects/lexnova/cases/
/api/v1/core/catalog/products/
```

Mantener rutas sin versión solo como compatibilidad temporal.

---

# 18. LOGS OBLIGATORIOS

Cada request debe registrar:

```text
timestamp
correlation_id
request_id
application_code
user_id
method
path
target_api
target_version
status_code
duration_ms
error_code
```

---

# 19. ERRORES NORMALIZADOS

Formato estándar:

```json
{
  "error": "ERROR_CODE",
  "message": "Human readable message.",
  "correlation_id": "uuid",
  "details": {}
}
```

---

# 20. HEALTH CHECKS

Implementar:

```text
GET /health/
GET /api/health/
GET /api/health/auth/
GET /api/health/projects/
```

---

# 21. RATE LIMIT

Aplicar rate limit por:

```text
IP
ApplicationCode
UserId
Endpoint
```

---

# 22. SEGURIDAD

El Gateway debe:

```text
Validar origen
Validar application code
No exponer secretos
No devolver trazas internas
No permitir llamadas a APIs no registradas
No permitir rutas core directas sin autorización
```

---

# 23. ROL DE AUTH

Auth sigue siendo API independiente.

El Gateway solo actúa como proxy/orquestador.

No copiar modelos de Auth dentro del Gateway.

---

# 24. ROL DE JOBCron

JobCron no debe convertirse en Gateway.

JobCron sigue siendo:

```text
ERP administrador
Panel operativo
Administrador de módulos
Administrador de configuración
```

Gateway es:

```text
Entrada central de proyectos
```

---

# 25. REGLA PARA PROYECTOS NUEVOS

Todo proyecto nuevo debe nacer así:

```text
WEB.NJ.NEXT.<Proyecto>
        ↓
API.PY.DJANGO.Gateway
        ↓
API.PY.DJANGO.<Proyecto> opcional
        ↓
APIs Core
```

No crear Gateway propio por defecto.

---

# 26. EXCEPCIÓN PARA GATEWAY PROPIO

Solo se permite Gateway propio si existe justificación documentada:

```text
alto aislamiento
regulación especial
alto volumen
orquestación crítica
integración exclusiva
seguridad especial
```

Debe registrarse en:

```text
02_projects/<proyecto>/decisions/
```

---

# 27. CHECKLIST FINAL

La migración se considera correcta si:

```text
[ ] Existe API.PY.DJANGO.Gateway
[ ] Cada frontend usa NEXT_PUBLIC_GATEWAY_BASE_URL
[ ] Cada frontend usa NEXT_PUBLIC_APPLICATION_CODE
[ ] Auth pasa por Gateway
[ ] APIs Core pasan por Gateway
[ ] Gateway viejo está marcado deprecated
[ ] Existe matriz de Gateway
[ ] Existe matriz de APIs por proyecto
[ ] Existe rollback documentado
[ ] Logs incluyen correlation_id
[ ] Health checks funcionan
[ ] No hay frontend consumiendo APIs core directamente
```

---

# 28. RESULTADO ESPERADO

Al finalizar, Codex debe entregar:

```text
Documentos creados
Documentos modificados
Repositorios afectados
Gateways legacy detectados
Gateways marcados deprecated
Proyectos migrados
Proyectos pendientes
Riesgos
Rollback
Checklist final
```

No eliminar Gateways viejos sin validación.

No romper proyectos activos.

No cambiar reglas de negocio.

No mover lógica de proyecto al Gateway central.

Priorizar compatibilidad, trazabilidad y migración gradual.

La clave es esta: **no se dejan inservibles de golpe**; primero se marcan como `deprecated`, después `disabled`, y al final `archived`. Así evitas romper LexNova, TecnoTelec, DocuCore o cualquier web que todavía esté apuntando a un Gateway viejo.
