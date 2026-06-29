# Mapa frontend de acciones de codigo REFAPART

## Estado

ACTIVE_MVP

## Proyecto web

```text
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart
```

## Acciones frontend

| Codigo de accion | Ruta | Archivo | Servicio/hook | Gateway | Estado | Notas |
|---|---|---|---|---|---|---|
| `REFAPART.AUTH.REGISTER` | `/register` | `app/register/page.tsx` | `features/auth/services/auth-service.ts -> register` | `/auth/register/` | vigente | Envia `ApplicationCode=REFAPART` y `X-Application-Code`. |
| `REFAPART.AUTH.LOGIN` | `/login` | `app/login/page.tsx` | `features/auth/services/auth-service.ts -> login` | `/auth/login/` | vigente | Login via Gateway, no Auth directo. |
| `REFAPART.AUTH.LOGOUT` | `/logout` | `app/logout/page.tsx` | `features/auth/services/auth-service.ts -> logout` | `/auth/logout/` | vigente | Limpia sesion via Gateway. |
| `REFAPART.AUTH.ACTIVATE_ACCOUNT` | `/verify-email` | `app/verify-email/page.tsx` | `features/auth/services/auth-service.ts -> verifyEmail` | `/auth/activate/` | vigente | Usa uid/token. |
| `REFAPART.AUTH.RESEND_ACTIVATION` | `/register`, `/auth/success` | `app/register/page.tsx` | `features/auth/services/auth-service.ts -> resendVerificationEmail` | `/auth/email/verification/resend/` | vigente | Solo debe mostrarse en cuenta creada o correo existente no verificado. |
| `REFAPART.AUTH.FORGOT_PASSWORD` | `/forgot-password` | `app/forgot-password/page.tsx` | `features/auth/services/auth-service.ts -> requestPasswordReset` | `/auth/password/reset/` | vigente | No afirma entrega final del correo. |
| `REFAPART.AUTH.RESET_PASSWORD` | `/reset-password` | `app/reset-password/page.tsx` | `features/auth/services/auth-service.ts -> confirmPasswordReset` | `/auth/password/reset/confirm/` | vigente | Usa uid/token. |
| `REFAPART.AUTH.CHANGE_PASSWORD` | `/change-password` | `app/change-password/page.tsx` | `features/auth/services/auth-service.ts -> changePassword` | `/auth/password/change/` | vigente | Ruta protegida. |
| `REFAPART.AUTH.ME` | Todas | `features/auth/store/AuthProvider.tsx` | `features/auth/services/auth-service.ts -> getSession` | `/auth/me/` | vigente | `401` anonimo es esperado en rutas publicas/opcionales. |
| `REFAPART.AUTH.PERMISSIONS` | Rutas protegidas | `features/auth/store/AuthProvider.tsx` | `features/auth/services/auth-service.ts -> getSession` | `/auth/me/permissions/` | vigente | Permisos definitivos pendientes de matriz por rol. |
| `REFAPART.QUOTE.SEARCH_PART` | `/`, `/resultados` | `app/page.tsx`, `app/resultados/page.tsx` | `lib/api/refapart.ts -> refapartApi.search` | `/projects/REFAPART/search` | vigente | Buscar piezas y registrar demanda si no hay resultados. |
| `REFAPART.QUOTE.CREATE_REQUEST` | `/publicar-busqueda` | `app/publicar-busqueda/page.tsx` | `lib/api/refapart.ts -> refapartApi.createRequest` | `/projects/REFAPART/requests` | vigente | Solicitud publica de pieza. |
| `REFAPART.ADDRESS.SEARCH` | `/cuenta/direcciones`, `/checkout` | `app/cuenta/direcciones/page.tsx`, `app/checkout/page.tsx` | PENDIENTE_DE_DEFINIR: selector Address no conectado en UI | `/core/address/api/address/suggest?postalCode=` | pendiente | Ruta Gateway confirmada; falta consumo real desde formulario. |
| `REFAPART.PAYMENT.REQUEST` | `/checkout` | `app/checkout/page.tsx` | PENDIENTE_DE_DEFINIR: contrato Payments no aprobado | PENDIENTE_DE_DEFINIR | pendiente | Payments futuro, no integrar proveedor directo. |

## Cliente Gateway

Archivo:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart/lib/api/gateway-client.ts
```

Reglas:

- Base publica: `NEXT_PUBLIC_GATEWAY_BASE_URL`.
- Aplicacion: `NEXT_PUBLIC_APPLICATION_CODE=REFAPART`.
- Header obligatorio: `X-Application-Code`.
- En produccion no exponer detalles tecnicos internos.

## Pendientes

- Separar servicios frontend de dominio para busqueda, solicitudes, checkout,
  direcciones y admin si hoy viven dentro de paginas.
- Confirmar permisos finales para rutas admin.
- Conectar selector real de Address en `/checkout` y `/cuenta/direcciones`.
