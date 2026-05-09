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

## Pendientes

- Definir permisos por rol.
- Definir registro publico o solo por invitacion.
- Definir acceso de comprador especial.
