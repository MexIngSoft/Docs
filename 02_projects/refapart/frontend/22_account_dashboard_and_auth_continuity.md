# REFAPART - Cuenta cliente y continuidad Auth

## Estado

Implementado parcial operativo para MVP local.

## Alcance

Este documento aplica a:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart
```

Rutas afectadas:

```text
/cuenta
/dashboard
/login
/register
/logout
```

## Decision

`/cuenta` es el dashboard principal del cliente Refapart. No debe mostrar una
pantalla intermedia de "ver dashboard / editar perfil / configuracion".

`/dashboard` queda como alias operativo del mismo dashboard cliente para no
romper enlaces existentes.

## Implementacion en codigo

```text
features/account/components/CustomerDashboard.tsx
app/cuenta/page.tsx
app/dashboard/page.tsx
features/auth/return-to.ts
app/login/page.tsx
app/register/page.tsx
app/logout/page.tsx
components/AppShell.tsx
middleware.ts
```

## Reglas Refapart

- Login conserva `next` o `returnTo` y redirige despues de sesion correcta.
- Registro conserva `returnTo` para que el usuario vuelva al flujo comercial
  despues de verificar o iniciar sesion.
- Logout regresa a la ultima ruta publica guardada, no a login ni cuenta.
- `AppShell` guarda rutas publicas no sensibles para continuidad despues de
  logout.
- El middleware conserva query string al redirigir a login.
- `/cuenta` muestra solicitudes, cotizaciones, pedidos, favoritos, busqueda
  rapida y acceso a direcciones.

## APIs reutilizadas

```text
Gateway General -> Auth
Gateway General -> REFAPART API
Gateway General -> Address API
```

No se crea API nueva por este cambio.

## Pendientes reales

- Sustituir datos demo del dashboard por `GET /api/v1/projects/REFAPART/customer/dashboard`
  cuando el contrato quede disponible.
- Confirmar matriz final de permisos Refapart en Auth.
- Conectar eventos reales de solicitudes/cotizaciones/pedidos a JobCron cuando
  el contrato operativo quede cerrado.

## Validacion esperada

```text
npm run lint
npm run build
```

Validaciones de Gateway/Auth se ejecutan aparte desde las APIs relacionadas.
