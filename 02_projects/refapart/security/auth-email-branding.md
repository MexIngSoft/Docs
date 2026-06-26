# Branding de correos Auth REFAPART

## Estado

ACTIVO

## Objetivo

Definir la identidad visual de correos transaccionales Auth para REFAPART.

## Configuracion base local

```text
ApplicationCode=REFAPART
CommercialName=REFAPART
SenderEmail=cash.1dip1@gmail.com
SenderName=REFAPART
RedirectBaseUrl=http://localhost:3008
LogoUrl=http://localhost:3008/brand/refapart-logo-dark.png
PrimaryColor=#E10600
```

El remitente puede cambiar por ambiente en produccion desde configuracion Auth.

## Identidad visual

- Fondo: negro/grafito o blanco segun plantilla.
- CTA: rojo REFAPART `#E10600`.
- Logo: `public/brand/refapart-logo-dark.png`.
- Tono: claro, confiable, automotriz y directo.
- Footer: nombre REFAPART y aviso de seguridad.

## Plantillas requeridas

| Accion | Estado |
|---|---|
| Registro / activacion | Preparada por Auth. |
| Bienvenida | PENDIENTE_DE_DEFINIR si se activa como envio separado. |
| Olvide mi contrasena | Preparada por Auth. |
| Confirmacion de reset | PENDIENTE_DE_DEFINIR si se activa como envio separado. |
| Cambio de password | Preparada por Auth si Djoser dispara confirmacion. |
| Login alert | PENDIENTE_DE_DEFINIR hasta cerrar politica de riesgo. |

## Prohibiciones

- No usar plantilla generica si existe plantilla REFAPART activa.
- No exponer secretos ni credenciales Amazon SES en frontend.
- No cambiar proveedor de correo desde la web.
