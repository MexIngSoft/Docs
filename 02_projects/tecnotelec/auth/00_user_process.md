# Proceso de usuarios Tecno Telec

## Regla de prioridad

Usuarios van despues de:

1. Catalogo.
2. Detalle.
3. Pricing.
4. Cotizacion.
5. JobCron basico.

No construir usuarios antes del flujo comercial minimo.

## Roles

- `VISITOR`.
- `CUSTOMER`.
- `SPECIAL_BUYER`.
- `ADVISOR`.
- `ADMIN`.
- `SUPPORT`.

## Funciones futuras

- Guardar favoritos.
- Ver cotizaciones.
- Ver historial.
- Pedir seguimiento.
- Actualizar datos.
- Repetir solicitud.

## Frontera

Auth API es responsable de identidad, tokens y permisos base. Gateway valida token y adapta permisos para Web. TecnoTelec API no guarda passwords ni emite tokens.

Auth debe recibir o derivar `ApplicationCode=TECNOTELEC` para resolver permisos
por aplicacion. Datos fiscales, razon social, direcciones, sucursales,
contactos y preferencias comerciales no pertenecen a Auth; deben vivir en
Customer/Sales/TecnoTelec segun corresponda.

## Estado Auth implementado

- `ApplicationCode=TECNOTELEC` puede enviarse en login o consulta de permisos.
- Auth registra intento de login, dispositivo, sesion, refresh token hasheado y
  auditoria de acceso en login JWT exitoso.
- Login social con Google/Facebook queda normalizado en tablas custom Auth:
  `SocialProviders`, `UserSocialAccounts` y `SocialLoginAttempts`.
- Correos de activacion, recuperacion y cambios de cuenta pueden usar plantilla
  por `ApplicationCode=TECNOTELEC`.
- Los permisos efectivos pueden filtrarse por aplicacion desde
  `/api/access/me/permissions/?application_code=TECNOTELEC`.

## Pendientes Tecno Telec

- Definir permisos por rol.
- Definir registro publico o solo por invitacion.
- Definir acceso de comprador especial.
- Definir uso de dispositivos confiables, MFA y recuperacion de cuenta en la
  experiencia publica.
