# Auditoria UI Auth REFAPART

## Alcance

Auditoria visual y funcional de las pantallas Auth REFAPART contra la identidad
visual vigente y el estandar de feedback Auth.

## Context Pack

- Proyecto: `02_projects/refapart`
- Frontend: `WEB.NJ.NEXT.RefaPart`
- Auth: Gateway General + Auth API
- Estandares aplicados:
  - `Docs/03_standards/auth/auth-feedback-standard.md`
  - `Docs/03_standards/auth/auth-frontend-error-handling-standard.md`
  - `Docs/03_standards/auth/auth-email-notification-standard.md`
  - `Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md`
  - `Docs/03_standards/frontend/ui-ux-standard.md`
  - `Docs/03_standards/frontend/nextjs-project-standard.md`

## Pantallas revisadas

| Ruta | Estado | Resultado |
|---|---|---|
| `/login` | AJUSTADA | Usa layout Auth premium REFAPART y mensajes claros. |
| `/register` | AJUSTADA | Ya no redirige silenciosamente; muestra pantalla de cuenta creada y correo enviado. |
| `/forgot-password` | AJUSTADA | Usa layout Auth y mensaje seguro sin revelar existencia de correo. |
| `/reset-password` | AJUSTADA | Valida uid/token y muestra exito/error visible. |
| `/change-password` | CREADA | Ruta creada con formulario y feedback Auth. |
| `/verify-email` | CREADA | Ruta creada para activacion con uid/token via Gateway. |
| `/auth/success` | CREADA | Pantalla generica de exito Auth. |
| `/auth/error` | CREADA | Pantalla generica de error Auth. |
| `/logout` | AJUSTADA | Muestra loader Auth al cerrar sesion. |
| `/403` | AJUSTADA | Usa resultado Auth con warning y CTA seguros. |

## Assets visuales creados

| Asset | Uso |
|---|---|
| `public/images/auth-road.svg` | Fondo Auth premium con carretera, luces y acento rojo REFAPART. |

El asset es parte del proyecto web y no es temporal de agent.

## Componentes creados

```text
features/auth/components/AuthUi.tsx
```

Componentes:

- `AuthLayout`
- `AuthBackground`
- `AuthBrandPanel`
- `AuthCard`
- `AuthHeader`
- `AuthInput`
- `AuthButton`
- `AuthLink`
- `AuthAlert`
- `AuthSuccess`
- `AuthError`
- `AuthWarning`
- `AuthInfo`
- `AuthLoader`
- `AuthResultScreen`
- `AuthResendEmail`
- `AuthFooter`

## Textos publicos ajustados

Se retiraron textos publicos que exponian proveedor, operacion interna o flujo
tecnico en:

- Home
- HeroSearch legacy
- resultados sin coincidencias
- publicar busqueda
- detalle de pieza
- detalle de pedido
- entrada futura operativa

Las rutas admin conservan lenguaje operativo porque pertenecen a operacion
interna.

## Brechas reales

| Brecha | Estado | Motivo |
|---|---|---|
| Confirmar entrega real de correo | IMPLEMENTADO PARCIAL | Auth registra logs extendidos en `"Auth"."EmailDeliveryLogs"` con proveedor, request/correlation id, estado, error code, payload sanitizado y timestamps. La entrega SES real depende de credenciales/productivo. |
| Reenvio de verificacion | IMPLEMENTADO | Gateway expone `POST /api/v1/auth/email/verification/resend/` y alias `POST /auth/email/resend-verification`, reutilizando Auth/Djoser `POST /api/users/resend_activation/`. REFAPART consume la ruta desde registro. |
| SES real productivo | DOCUMENTADO | El checklist SES, errores operativos y reglas de log quedan definidos por el estandar global. |
| Confirmacion visual 95-100% contra maqueta | PARCIAL | Se aplico identidad visual Auth; requiere comparacion visual final contra imagen fuente. |

## Decision

REFAPART Auth usa un sistema visual propio alineado con la Home premium:

- fondo oscuro automotriz;
- tarjeta blanca;
- logo REFAPART;
- CTA rojo;
- estados explicitos;
- mensajes sin detalle interno;
- consumo de Auth solo por Gateway.

La validacion runtime de reenvio ya cuenta con ruta Gateway y consumo REFAPART.
La validacion SES productiva queda condicionada a credenciales, dominio,
DKIM/SPF/Return Path, region, cuotas y sandbox deshabilitado.

## Correccion Docker Gateway SSR

REFAPART debe mantener dos URLs para Gateway:

- Navegador: `NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:8025/api/v1`.
- SSR/Next server en Docker:
  `GATEWAY_INTERNAL_BASE_URL=http://api-multiproyecto:8025/api/v1`.

El error `Gateway network error` con causa `ECONNREFUSED 127.0.0.1:8025`
indica que Next server intento conectar a `localhost` desde dentro del
contenedor web. En Docker, `localhost` apunta al contenedor web y no al
Gateway. La web debe resolver la URL interna solo cuando `typeof window ===
"undefined"` y conservar la URL publica para el navegador.

## Decision AGENTS-012

El bloqueo documental de reenvio, estados finos, SES y errores de correo queda
resuelto por:

```text
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
```

Para produccion, REFAPART no debe mostrar al usuario detalles tecnicos como
Docker, CORS, Gateway interno, Auth interno, SES, SMTP, variables de entorno,
SQL, stack traces ni payloads. Para desarrollo, puede mostrar panel tecnico
sanitizado con `error_code`, `correlation_id`, endpoint Gateway, estado HTTP,
preflight y pista de correccion.

El pendiente visual de comparacion contra maqueta no bloquea el cierre
documental de AGENTS-012.
