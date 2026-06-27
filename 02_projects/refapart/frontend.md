# Frontend REFAPART

## Proyecto

```text
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart
```

## Puerto

```text
3008
```

## Stack

- Next.js 15.
- React.
- TypeScript.
- App Router.
- Tailwind CSS como estandar visual principal.
- CSS propio minimo para variables globales, resets, estilos base y
  compatibilidad temporal durante la migracion por pantallas.
- `lucide-react` para iconografia.

## Rutas MVP

| Ruta | Uso | Auth |
|---|---|---|
| `/` | Home con buscador principal, categorias, resultados destacados y CTA de solicitud. | Publico |
| `/resultados` | Resultados filtrables por busqueda, categoria, marca, condicion y orden. | Publico |
| `/pieza/[id]` | Detalle de pieza con compatibilidad, precio, garantia y CTA. | Publico |
| `/publicar-busqueda` | Formulario UI para solicitar una pieza no encontrada. | Publico |
| `/favoritos` | Favoritos locales del navegador. | Opcional |
| `/cuenta` | Cuenta cliente protegida por Auth. | Protegido |
| `/proveedor` | Placeholder funcional para proveedor. | Protegido |
| `/login` | Login central Auth con marca REFAPART. | Publico |
| `/register` | Registro de cliente. | Publico |
| `/forgot-password` | Solicitud de recuperacion. | Publico |
| `/reset-password` | Confirmacion de nueva contrasena. | Publico |
| `/change-password` | Cambio de contrasena autenticado. | Protegido |
| `/verify-email` | Verificacion de correo con uid/token via Gateway. | Publico |
| `/auth/success` | Resultado Auth exitoso. | Publico |
| `/auth/error` | Resultado Auth con error recuperable. | Publico |
| `/dashboard` | Resumen privado de actividad. | Protegido |
| `/profile` | Perfil de usuario autenticado. | Protegido |
| `/settings` | Preferencias privadas. | Protegido |
| `/403` | Acceso denegado. | Publico |

## Rutas cliente requeridas para cierre operativo

| Ruta | Uso | Estado |
|---|---|---|
| `/mis-solicitudes` | Solicitudes de piezas del cliente. | EXISTE_EN_CODIGO / Protegido |
| `/mis-cotizaciones` | Cotizaciones recibidas y estado. | EXISTE_EN_CODIGO / Protegido |
| `/mis-pedidos` | Pedidos creados desde cotizaciones aceptadas. | EXISTE_EN_CODIGO / Protegido |
| `/checkout` | Confirmacion de cotizacion/pedido manual. | EXISTE_EN_CODIGO / Protegido |
| `/carrito` | Carrito local para piezas publicables. | EXISTE_EN_CODIGO / Opcional |
| `/cuenta/direcciones` | Direcciones usando Address API. | EXISTE_EN_CODIGO / Protegido |
| `/cuenta/facturacion` | Preparacion fiscal futura. | EXISTE_EN_CODIGO / Protegido |
| `/mis-pedidos/[id]` | Detalle de pedido y tracking visible. | EXISTE_EN_CODIGO / Protegido |

## Rutas admin requeridas

| Ruta | Uso | Documento |
|---|---|---|
| `/admin/refapart` | Dashboard operativo. | EXISTE_EN_CODIGO |
| `/admin/refapart/dashboard` | Alias de dashboard operativo. | EXISTE_EN_CODIGO |
| `/admin/refapart/part-requests` | Bandeja de solicitudes. | EXISTE_EN_CODIGO |
| `/admin/refapart/part-requests/[id]` | Detalle operativo de solicitud. | EXISTE_EN_CODIGO |
| `/admin/refapart/part-requests/[id]/suppliers` | Proveedores sugeridos/contactados. | EXISTE_EN_CODIGO |
| `/admin/refapart/part-requests/[id]/quote` | Generacion de cotizacion. | EXISTE_EN_CODIGO |
| `/admin/refapart/suppliers` | Gestion de proveedores. | EXISTE_EN_CODIGO |
| `/admin/refapart/products` | Productos publicables. | EXISTE_EN_CODIGO |
| `/admin/refapart/search-logs` | Logs de busqueda. | EXISTE_EN_CODIGO |
| `/admin/refapart/demand` | Demanda no satisfecha. | EXISTE_EN_CODIGO |
| `/admin/refapart/quotes` | Cotizaciones. | EXISTE_EN_CODIGO |
| `/admin/refapart/orders` | Pedidos. | EXISTE_EN_CODIGO |
| `/admin/refapart/logistics` | Logistica. | EXISTE_EN_CODIGO |
| `/admin/refapart/audit` | Auditoria. | EXISTE_EN_CODIGO |
| `/admin/refapart/settings` | Configuracion operativa. | EXISTE_EN_CODIGO |

## Regla visual

Debe parecer plataforma premium automotriz y de uso rapido, no una tienda
generica de descuentos. La proporcion visual objetivo es:

```text
70% blanco
20% negro/grafito
10% rojo REFAPART
```

## Assets

Los assets activos de marca viven en el proyecto web. Las fuentes recibidas
para el cambio de logo 2026-06-13 quedaron archivadas en:

```text
Docs/_archive/assets/refapart/2026-06-13-logo-refresh
```

Los archivos publicos que debe usar la interfaz son:

```text
public/brand/refapart-icon.png
public/brand/refapart-icon-wide.png
public/brand/refapart-logo-dark.png
public/brand/refapart-logo-with-tagline.png
public/brand/refapart-logo-usage-guide.png
```

Los assets anteriores `refapart-logo-usage-dark.png` y
`refapart-logo-usage-transparent.png` fueron retirados del proyecto web para no
mezclar identidades visuales.

## Tailwind CSS

REFAPART adopta Tailwind CSS para nuevas interfaces y migraciones visuales. La
configuracion debe vivir en:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart/tailwind.config.js
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart/postcss.config.js
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart/app/globals.css
```

Reglas especificas:

- Los tokens Tailwind deben resolver contra las variables CSS de identidad
  REFAPART.
- La Home publica es la primera pantalla migrada al nuevo estandar.
- Las rutas admin y privadas se migran por modulo, sin eliminar CSS legacy que
  aun este en uso.
- No se cambia consumo de APIs: todo sigue pasando por Gateway central.

## Sistema Auth UI

Las rutas Auth usan un sistema visual compartido en:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart/features/auth/components/AuthUi.tsx
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart/public/images/auth-road.svg
```

Reglas:

- Registro no redirige silenciosamente despues de crear cuenta.
- Registro muestra cuenta recibida y evita afirmar entrega de correo hasta que
  Auth/SES confirme el envio real en `"Auth"."EmailDeliveryLogs"`.
- Errores de red/Auth usan mensajes accionables, no `Failed to fetch` crudo.
- Reenvio de verificacion se usa mediante Gateway General en
  `/api/v1/auth/email/verification/resend/`.
- Todas las llamadas Auth pasan por Gateway central.
- Los textos publicos no exponen proveedor final, proveedor tecnico ni
  operacion interna.
- Las rutas publicas y opcionales no registran `console.error` cuando
  `/auth/me/` devuelve `401` por usuario anonimo.
- Las rutas protegidas usan `ProtectedRoute` y redirigen a `/login` cuando no
  existe sesion.
- `middleware.ts` evita renderizar rutas privadas sin cookie `access` o
  `refresh`.
- Si el correo ya esta registrado, `/register` muestra login y reenvio de
  verificacion solo como accion opcional para cuentas no verificadas.
- Otras webs del ecosistema quedan pendientes de adoptar el estandar
  `Docs/03_standards/auth/web-auth-route-scope-standard.md`.

## Backend

Catalogo, busqueda, demanda y operacion se consumen desde la API REFAPART a
traves del Gateway central en `8025`. La web nunca consume Auth, APIs Core ni
la API REFAPART directamente.
