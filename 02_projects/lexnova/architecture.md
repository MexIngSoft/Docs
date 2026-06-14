# LexNova architecture

## Estado

ACTIVE

## Objetivo

Definir la arquitectura canonica de LexNova para que la web no consuma Auth ni
APIs core directamente.

## Audiencia y lenguaje

`Gateway`, `BFF`, `Auth`, `API`, `proxy`, puertos y nombres de repositorio son
definiciones tecnicas para desarrollo, operacion y documentacion interna.

No deben aparecer como lenguaje visible para cliente, usuario final, pantallas
publicas, mensajes comerciales ni errores funcionales comunes. En experiencia
de usuario deben traducirse a terminos de producto:

| Termino tecnico interno | Lenguaje visible recomendado |
|---|---|
| Gateway/BFF | Servicio seguro de Lex Nova Tech |
| Auth | Cuenta, identidad o sesion |
| API/endpoint/proxy | Servicio, conexion o proceso interno |
| Gateway no disponible | No se pudo conectar con el servicio de acceso |
| Error de Auth/Gateway | No se pudo validar la sesion |

## Regla principal

LexNova debe usar gateway/BFF propio:

```text
WEB.NJ.NEXT.LexNova
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.LexNova
  -> Core ERP APIs
```

Auth es una API core y solo debe ser consumida por el gateway:

```text
WEB.NJ.NEXT.LexNova
  -> API.PY.DJANGO.Gateway
  -> API.PY.DJANGO.Auth
```

No permitido:

```text
WEB.NJ.NEXT.LexNova -> API.PY.DJANGO.Auth
WEB.NJ.NEXT.LexNova -> API.PY.DJANGO.LexNova
WEB.NJ.NEXT.LexNova -> Core ERP APIs
```

## Repositorios requeridos

| Capa | Repositorio |
|---|---|
| Web | `WEB.NJ.NEXT.LexNova` |
| Gateway central | `API.PY.DJANGO.Gateway` |
| Domain API | `API.PY.DJANGO.LexNova` |
| Auth Core | `API.PY.DJANGO.Auth` |

## Responsabilidades del gateway

- Punto unico de entrada para la web LexNova.
- Proxies de autenticacion hacia Auth.
- Consulta de permisos con `application_code=LEXNOVA`.
- Orquestacion de casos, documentos, participantes y analisis.
- Normalizacion de errores para frontend.
- Ocultar contratos internos de Auth y de APIs core.

## Responsabilidades de la API de dominio

`API.PY.DJANGO.LexNova` conserva reglas y datos propios de LegalTech:

- Casos.
- Expedientes.
- Documentos legales propios.
- Participantes por caso.
- Analisis y resultados juridicos.
- Configuracion propia de LexNova.

## Responsabilidades de Auth

`API.PY.DJANGO.Auth` conserva identidad reutilizable:

- Usuarios.
- Sesiones.
- Tokens.
- Roles globales y por aplicacion.
- Permisos efectivos.
- Auditoria de acceso.

Auth no debe guardar casos, documentos legales ni preferencias de negocio de
LexNova.

## Contrato frontend

La web debe configurar:

```text
NEXT_PUBLIC_LEXNOVA_GATEWAY_BASE_URL=http://localhost:8025/api/v1/projects/LEXNOVA
```

El cliente HTTP del frontend debe construir llamadas relativas al gateway. Las
rutas de auth visibles en la web son rutas del gateway, aunque el gateway las
reenviara a Auth internamente.

Nota local Docker: `Docker.WEB.NJ` comparte un contenedor para varias webs y
puede tener `NEXT_PUBLIC_GATEWAY_BASE_URL` apuntando al gateway de otro
proyecto. LexNova debe usar `NEXT_PUBLIC_LEXNOVA_GATEWAY_BASE_URL` para evitar
que el navegador intente resolver hostnames internos de Docker como
`api-backend-python`.

## Flujo de sesion frontend

La web no debe considerar una sesion valida solo porque exista estado persistido
en `localStorage`. El estado `Auth.isAuthenticated` es derivado y debe
confirmarse contra el gateway.

Reglas:

- Al cargar la aplicacion, verificar sesion con
  `POST /api/lexnova/auth/jwt/verify/`.
- Si el access token expiro, intentar renovar con
  `POST /api/lexnova/auth/jwt/refresh/`.
- Si verify y refresh fallan, limpiar `Auth` y permisos locales.
- No persistir `Auth` en Redux Persist; una sesion previa de otro proyecto o
  una cookie vieja no debe mandar automaticamente al dashboard.
- La ruta `/auth/login` debe estar disponible aunque exista una cookie `access`;
  la redireccion al dashboard solo ocurre despues de verificar sesion real.
- Los errores de login deben mostrar una causa accionable para el usuario:
  credenciales invalidas, cuenta inactiva, servicio de acceso no disponible,
  inicio de sesion no disponible o error interno. El detalle `gateway/Auth`
  queda reservado para logs y diagnostico tecnico.

## Puerto local

```text
API.PY.DJANGO.Gateway -> 8025
API.PY.DJANGO.LexNova -> 8003
API.PY.DJANGO.Auth -> 8000
WEB.NJ.NEXT.LexNova -> 3002
```

## Dependencias locales

El orden operativo y la matriz de relacion entre proyectos estan documentados
en:

```text
Docs/02_projects/lexnova/local-dependency-runbook.md
```

Regla de cierre: no validar solo la web. Cualquier cambio que toque login,
permisos, casos, documentos o resultados debe validar la cadena:

```text
PostgreSQL -> Auth -> LexNova API -> LexNova Gateway -> LexNova Web
```

## Estado de implementacion

Se creo un MVP local de `API.PY.DJANGO.LexNova.Gateway` para cerrar el limite
arquitectonico. El gateway expone:

- `GET /api/lexnova/health/`
- `GET /api/lexnova/dashboard/summary/`
- `/api/lexnova/auth/*`
- `/api/lexnova/users/*`
- `/api/lexnova/access/*`
- `/api/lexnova/cases/*`
- `/api/lexnova/documents/*`

## Pendientes

- Crear/publicar el repositorio remoto
  `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.Gateway.git` si aun no
  existe.
- Endurecer el proxy de cookies/tokens segun el contrato final de Auth.
- Agregar endpoints especificos para participantes y analisis cuando la API de
  dominio exponga contratos estables.
