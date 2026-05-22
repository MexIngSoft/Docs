# LexNova local dependency runbook

## Estado

ACTIVE

## Objetivo

Documentar las relaciones operativas que LexNova necesita para funcionar en
local y establecer el orden estandar de arranque, validacion y diagnostico.

## Relacion entre proyectos

LexNova no funciona como una web aislada. La cadena local obligatoria es:

```text
WEB.NJ.NEXT.LexNova
  -> API.PY.DJANGO.LexNova.Gateway
  -> API.PY.DJANGO.Auth
  -> API.PY.DJANGO.LexNova
  -> PostgreSQL
```

Responsabilidades:

| Proyecto | Puerto | Uso |
|---|---:|---|
| `Docker.DB.PG` | `5432` | PostgreSQL local para Auth, LexNova y schemas de soporte. |
| `API.PY.DJANGO.Auth` | `8000` | Usuarios, tokens, sesiones, roles, permisos y semilla LexNova. |
| `API.PY.DJANGO.LexNova` | `8003` | Casos, procedimientos, documentos, evidencia y analisis legal. |
| `API.PY.DJANGO.LexNova.Gateway` | `8017` | BFF obligatorio para la web; proxy de Auth y API de dominio. |
| `WEB.NJ.NEXT.LexNova` | `3002` | Web oficial local. Puede usarse `3003` si `3002` esta ocupado. |

## Variables obligatorias

Frontend:

```text
NEXT_PUBLIC_LEXNOVA_GATEWAY_BASE_URL=http://localhost:8017/api/lexnova
```

`NEXT_PUBLIC_GATEWAY_BASE_URL` puede existir por compatibilidad con otros
frontends del contenedor compartido. LexNova no debe depender de esa variable si
apunta a `api-backend-python`, `:8008` u otro gateway de proyecto.

Gateway:

```text
AUTH_API_BASE_URL=http://localhost:8000
LEXNOVA_API_BASE_URL=http://localhost:8003
LEXNOVA_APPLICATION_CODE=LEXNOVA
CORS_ALLOWED_ORIGINS=http://localhost:3002,http://localhost:3003,http://127.0.0.1:3002,http://127.0.0.1:3003,http://lexnova.localhost
```

Docker multiproyecto debe mantener los mismos origenes CORS para que la web en
puerto alterno no falle con `TypeError: Failed to fetch`.

## Orden estandar de arranque

Arranque focalizado con solo LexNova + Fiscora:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-LexNovaFiscora.ps1 -Build
```

Desde la raiz del workspace:

```powershell
docker compose -f Docker.DB.PG\docker-compose.yml up -d
docker compose -f Docker.API.PY\docker-compose.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.yml up -d --build
```

Para desarrollo directo de la web:

```powershell
cd Docker.WEB.NJ\WEB.NJ.NEXT.LexNova
npm run dev -- -p 3002
```

Si `3002` esta ocupado:

```powershell
npm run dev -- -p 3003
```

## Validacion minima

Antes de probar login:

```powershell
Invoke-WebRequest http://localhost:8017/api/lexnova/health/
Invoke-WebRequest http://localhost:3002/auth/login
```

Si la web corre en `3003`:

```powershell
Invoke-WebRequest http://localhost:3003/auth/login
```

Validar preflight CORS cuando aparezca `Failed to fetch`:

```powershell
Invoke-WebRequest `
  -Method OPTIONS `
  -Uri http://localhost:8017/api/lexnova/auth/jwt/create/ `
  -Headers @{
    Origin = "http://localhost:3003"
    "Access-Control-Request-Method" = "POST"
  }
```

La respuesta debe incluir `Access-Control-Allow-Origin` con el origen de la web.

## Diagnostico de login

| Sintoma | Causa probable | Accion |
|---|---|---|
| `Failed to fetch` | Gateway apagado o CORS no permite el puerto web. | Validar `8017`, CORS y reiniciar `api-multiproyecto`. |
| `Gateway no disponible` | `API.PY.DJANGO.LexNova.Gateway` no esta corriendo. | Levantar `Docker.API.PY` o revisar logs. |
| `Credenciales incorrectas` | Password/correo invalidos o semilla no aplicada. | Revisar `auth-seed.md` y migraciones de Auth. |
| Redireccion inesperada al dashboard | Estado local viejo o cookie vieja. | Verificar sesion contra Gateway y limpiar almacenamiento local si persiste. |
| `403` en API de dominio | Endpoint protegido sin token valido. | Probar primero login y permisos via Gateway. |

## Regla de cierre

Un cambio de LexNova que toque web, login, casos, documentos o permisos no esta
cerrado hasta validar la cadena completa:

```text
PostgreSQL -> Auth -> LexNova API -> LexNova Gateway -> LexNova Web
```

Si alguna dependencia no esta disponible, el resultado debe documentar cual
quedo fuera y por que.
