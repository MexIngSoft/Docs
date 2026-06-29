# Mapa tecnico de acciones de codigo REFAPART

## Estado

ACTIVE_MVP

## Objetivo

Dar una ruta unica para encontrar las acciones principales de REFAPART en web,
Gateway, Auth, Address y API de dominio.

## Mapas relacionados

- `Docs/02_projects/refapart/frontend/code-actions-map.md`
- `Docs/02_projects/refapart/api/code-actions-map.md`

## Regla principal

REFAPART Web consume el Gateway General. No consume Auth, Address, JobCron,
Core ERP ni base de datos directamente.

```text
WEB.NJ.NEXT.RefaPart -> API.PY.DJANGO.Gateway -> API destino
```

## Acciones principales

| Codigo de accion | Nombre visible | Tipo | Proyecto | Modulo | Frontend ruta | Frontend archivo | Servicio frontend | Gateway route | API destino | Endpoint API | Metodo HTTP | Permiso requerido | Modelos/tablas afectadas | Estados UI | Errores esperados | Validacion minima | Documento canonico relacionado | Estado | Ultima revision |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `REFAPART.AUTH.REGISTER` | Registro de cliente | form | REFAPART | Auth | `/register` | `app/register/page.tsx` | `features/auth/services/auth-service.ts` | `/auth/register/` | `API.PY.DJANGO.Auth` | `/api/users/` via Gateway | POST | Publico | `"Auth"."UserAccounts"`, `"Auth"."EmailDeliveryLogs"` | loading / error / success / existing-email | email already used, password invalid, Gateway unavailable, SES failed | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.LOGIN` | Login | form | REFAPART | Auth | `/login` | `app/login/page.tsx` | `features/auth/services/auth-service.ts` | `/auth/login/` | `API.PY.DJANGO.Auth` | Auth JWT login via Gateway | POST | Publico | `"Auth"."UserAccounts"`, sesiones/tokens Auth | loading / error / success | invalid credentials, user not verified, Gateway unavailable | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.LOGOUT` | Logout | service | REFAPART | Auth | `/logout` | `app/logout/page.tsx` | `features/auth/services/auth-service.ts` | `/auth/logout/` | `API.PY.DJANGO.Auth` | Auth logout via Gateway | POST | Usuario autenticado | sesiones/tokens Auth | loading / success / error | session expired, Gateway unavailable | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.ACTIVATE_ACCOUNT` | Activar cuenta | form | REFAPART | Auth | `/verify-email` | `app/verify-email/page.tsx` | `features/auth/services/auth-service.ts` | `/auth/activate/` | `API.PY.DJANGO.Auth` | Djoser activation via Gateway | POST | Publico con token | `"Auth"."UserAccounts"` | loading / error / success | token invalid, token expired, uid invalid | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.RESEND_ACTIVATION` | Reenviar verificacion | button | REFAPART | Auth | `/register`, `/auth/success` | `app/register/page.tsx` | `features/auth/services/auth-service.ts` | `/auth/email/verification/resend/` | `API.PY.DJANGO.Auth` | `/api/users/resend_activation/` via Gateway | POST | Publico con email | `"Auth"."EmailDeliveryLogs"` | loading / warning / error / success | cooldown, rate limit, SES failed, email not found | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.FORGOT_PASSWORD` | Solicitar recuperacion | form | REFAPART | Auth | `/forgot-password` | `app/forgot-password/page.tsx` | `features/auth/services/auth-service.ts` | `/auth/password/reset/` | `API.PY.DJANGO.Auth` | Djoser password reset via Gateway | POST | Publico | `"Auth"."EmailDeliveryLogs"` | loading / error / success | email invalid, SES failed, Gateway unavailable | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.RESET_PASSWORD` | Confirmar nueva contrasena | form | REFAPART | Auth | `/reset-password` | `app/reset-password/page.tsx` | `features/auth/services/auth-service.ts` | `/auth/password/reset/confirm/` | `API.PY.DJANGO.Auth` | Djoser reset confirm via Gateway | POST | Publico con token | `"Auth"."UserAccounts"`, `"Auth"."PasswordHistory"` | loading / error / success | token invalid, password invalid, uid invalid | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.CHANGE_PASSWORD` | Cambiar contrasena | form | REFAPART | Auth | `/change-password` | `app/change-password/page.tsx` | `features/auth/services/auth-service.ts` | `/auth/password/change/` | `API.PY.DJANGO.Auth` | Djoser password change via Gateway | POST | Usuario autenticado | `"Auth"."UserAccounts"`, `"Auth"."PasswordHistory"` | loading / error / success | current password invalid, password invalid, session expired | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.ME` | Sesion actual | service | REFAPART | Auth | Todas | `features/auth/store/AuthProvider.tsx` | `features/auth/services/auth-service.ts` | `/auth/me/` | `API.PY.DJANGO.Auth` | Usuario actual via Gateway | GET | Opcional/protegido segun ruta | `"Auth"."UserAccounts"` | loading / anonymous / success / error | 401 anonimo esperado, Gateway unavailable | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.AUTH.PERMISSIONS` | Permisos actuales | service | REFAPART | Auth | Rutas protegidas | `features/auth/store/AuthProvider.tsx` | `features/auth/services/auth-service.ts` | `/auth/me/permissions/` | `API.PY.DJANGO.Auth` | Permisos via Gateway | GET | Usuario autenticado | `"Auth"."UserRoles"` | loading / forbidden / success / error | 401, 403, Gateway unavailable | NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO | `security/auth-migration.md` | vigente | 2026-06-27 |
| `REFAPART.QUOTE.CREATE_REQUEST` | Publicar solicitud de pieza | form | REFAPART | Cotizacion | `/publicar-busqueda` | `app/publicar-busqueda/page.tsx` | `lib/api/refapart.ts -> refapartApi.createRequest` | `/projects/REFAPART/requests` | `API.PY.DJANGO.RefaPart` | `marketplace.views.requests_create` | POST | Publico / opcional usuario | `RefaPartPartRequest`, `RefaPartAuditLog` | loading / error / success | validation error, Gateway unavailable | `npm run lint`, `npm run build`, `python manage.py check` | `api-contracts.md` | vigente | 2026-06-29 |
| `REFAPART.QUOTE.SEARCH_PART` | Buscar refaccion | form | REFAPART | Busqueda | `/`, `/resultados` | `app/page.tsx`, `app/resultados/page.tsx` | `lib/api/refapart.ts -> refapartApi.search` | `/projects/REFAPART/search` | `API.PY.DJANGO.RefaPart` | `marketplace.views.search` | POST | Publico | `RefaPartSearchQueryLog`, `RefaPartPartRequest` si no hay resultado | loading / empty / error / success | search validation error, Gateway unavailable | `npm run lint`, `npm run build`, `python manage.py check` | `api-contracts.md` | vigente | 2026-06-29 |
| `REFAPART.QUOTE.SEND_TO_SUPPLIERS` | Enviar solicitud a proveedores internos | endpoint | REFAPART | Operacion interna | `/admin/refapart/part-requests/[id]/suppliers` | `app/admin/refapart/part-requests/[id]/suppliers/page.tsx` | `lib/api/refapart.ts -> refapartApi.supplierMessage` | `/projects/REFAPART/admin/part-requests/{id}/supplier-message` | `API.PY.DJANGO.RefaPart` | `marketplace.views.supplier_message` | POST | `CanContactSuppliers` / rol `REFAPART_ADMIN` | `RefaPartSupplierMessage`, `RefaPartAuditLog` | loading / error / success | supplier missing, request not found | `npm run lint`, `npm run build`, `python manage.py check` | `api-contracts.md` | vigente | 2026-06-29 |
| `REFAPART.SUPPLIER.INTERNAL_RESPONSE` | Registrar oferta de proveedor | form | REFAPART | Proveedores internos | `/admin/refapart/part-requests/[id]/quote` | `app/admin/refapart/part-requests/[id]/quote/page.tsx` | `lib/api/refapart.ts -> refapartApi.addOffer` | `/projects/REFAPART/admin/part-requests/{id}/offers` | `API.PY.DJANGO.RefaPart` | `marketplace.views.offers` | POST | `CanRegisterSupplierResponse` / rol `REFAPART_ADMIN` | `RefaPartSupplierPartOffer`, `RefaPartPartRequest`, `RefaPartAuditLog` | loading / error / success | supplier invalid, request not found, validation error | `npm run lint`, `npm run build`, `python manage.py check` | `api-contracts.md` | vigente | 2026-06-29 |
| `REFAPART.ADDRESS.SEARCH` | Buscar direccion | service | REFAPART | Address | `/cuenta/direcciones`, `/checkout` | `app/cuenta/direcciones/page.tsx`, `app/checkout/page.tsx` | PENDIENTE_DE_DEFINIR: UI aun no consume selector real | `/core/address/api/address/suggest?postalCode=` | `API.PY.DJANGO.Address` | `/api/address/suggest?postalCode=` | GET | Usuario autenticado en rutas cuenta; opcional en checkout | Address API; snapshots locales permitidos | loading / empty / error / success | postal code not found, Gateway unavailable | `docker compose config --quiet`; pendiente UI real | `integrations/00_address_api_usage.md` | pendiente | 2026-06-29 |
| `REFAPART.PAYMENT.REQUEST` | Solicitar pago | integration | REFAPART | Payments | `/checkout` | `app/checkout/page.tsx` | PENDIENTE_DE_DEFINIR: no existe contrato Payments aprobado | PENDIENTE_DE_DEFINIR | Payments API futura | PENDIENTE_DE_DISEÑO_PRIORITARIO | POST | Usuario autenticado o checkout controlado | `RefaPartOrder`, futuro Payment | loading / error / success | provider unavailable, payment rejected | Bloqueado por contrato/owner/proveedor | `business/02_payment_policy.md` | pendiente | 2026-06-29 |

## Pendientes Refapart derivados

- Auth: datos reales de prueba y matriz final de permisos por rol.
- Address: ruta Gateway confirmada como `/core/address/api/address/suggest?postalCode=`,
  pero falta conectar selector real en UI antes de marcar `REFAPART.ADDRESS.SEARCH`
  como vigente.
- SES: validar entrega real fuera de esta corrida; este agent prohibe probar servicios.
- Payments: definir contrato, API responsable, proveedor e integracion antes de activar.
- DB: validar migraciones contra los campos pendientes del documento `database.md`.
- Payments: congelado hasta definir contrato, API responsable, proveedor,
  owner operativo y reglas de conciliacion.
