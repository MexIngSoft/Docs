# Adopcion de eventos Auth web

## Objetivo

Registrar el estado real de adopcion del estandar:

```text
Docs/03_standards/auth/web-auth-event-standard.md
```

La validacion se ejecuta con:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs/scripts/validate-web-auth-events.ps1
```

## Resultado actual

| Proyecto | Estado | Motivo |
|---|---|---|
| REFAPART | COMPLETO | Tiene cliente Gateway, feature Auth y todas las rutas canonicas/aliases requeridas. |
| MEXINGSOF | PENDIENTE | No tiene cliente Gateway Auth ni feature Auth; no debe copiar rutas sin definir si tendra login/panel con usuarios. |
| TECNOTELEC | PENDIENTE | Solo tiene `/login` como alias visual. Falta cliente Gateway Auth, feature Auth y decision de MVP privado/cotizador/admin. |
| JOBCRON | PENDIENTE | Solo tiene `/login` visual. Falta implementar flujo real contra Gateway/Auth antes de panel productivo. |
| LEXNOVA | PARCIAL | Tiene rutas canónicas tipo referencia, pero falta alinearlas al cliente Gateway/feature Auth estandar y agregar `/auth/success`, `/auth/error`, `/logout`, `/403`. |
| DOCUCORE | PENDIENTE | No tiene rutas Auth completas ni cliente Gateway Auth. |
| FISCORA | PENDIENTE | No tiene rutas Auth completas ni cliente Gateway Auth. |
| IMAGRAFITY | PENDIENTE | No tiene rutas Auth completas ni cliente Gateway Auth. |

## Decision

LexNova sirve como referencia de cobertura visual de eventos, pero no como
fuente unica de implementacion. El estandar canonico queda en
`web-auth-event-standard.md`.

No se deben crear pantallas Auth completas en MEXINGSOF, TECNOTELEC o JOBCRON
sin cerrar antes:

- si existe registro publico o solo login privado;
- `ApplicationCode` oficial;
- permisos/roles;
- rutas Gateway/Auth permitidas;
- branding y mensajes del proyecto;
- validacion de CORS y `X-Application-Code`;
- si Google/Facebook quedan habilitados o solo reservados.

## REFAPART aplicado

REFAPART queda como primer proyecto alineado:

```text
app/auth/login/page.tsx
app/auth/register/page.tsx
app/auth/forgot-password/page.tsx
app/auth/resend/page.tsx
app/auth/reset/[uid]/[token]/page.tsx
app/activation/[uid]/[token]/page.tsx
app/auth/google/page.tsx
app/auth/facebook/page.tsx
app/auth/success/page.tsx
app/auth/error/page.tsx
app/logout/page.tsx
app/403/page.tsx
```

Las rutas historicas de REFAPART siguen vigentes como compatibilidad:

```text
/login
/register
/forgot-password
/reset-password
/verify-email
```

## Siguiente orden recomendado

1. JOBCRON: implementar Auth real para panel administrativo.
2. TECNOTELEC: decidir MVP privado y permisos antes de registro/cotizador.
3. MEXINGSOF: definir si tendra panel con usuarios o solo formularios publicos.
4. LEXNOVA: migrar cliente Auth a Gateway General estandar y cerrar rutas faltantes.

## Incidente login REFAPART 2026-06-29

Se detecto que un intento de login con contrasena incorrecta podia mostrar un
mensaje de cuenta no activa. Ese comportamiento queda prohibido para todas las
webs.

Decision:

- En `/auth/login`, cualquier error ambiguo de credenciales, cuenta inactiva o
  cuenta inexistente debe mostrarse como `Correo o contrasena incorrectos.`.
- No se debe mostrar reenvio de verificacion desde un fallo ambiguo de login.
- El reenvio vive en `/auth/resend`, registro recibido o pantalla explicita de
  verificacion.
- Los errores esperados de formulario (`400`/`401`) no deben disparar overlay de
  `console.error` en desarrollo.
