# Estandar de continuidad de cuenta y autenticacion web

## Objetivo

Evitar que una web comercial pierda el contexto del usuario cuando registra,
inicia sesion, verifica correo, recupera contrasena o cierra sesion.

Aplica a toda web Next.js que use Auth por Gateway General.

## Regla principal

El usuario debe volver al flujo comercial que estaba usando, salvo que ese
flujo sea privado, inseguro o no exista.

## Rutas de cuenta

La ruta principal de usuario debe ser un dashboard util. Si el proyecto usa
`/dashboard`, `/cuenta` puede quedar como alias de compatibilidad, pero nunca
debe mostrar una pantalla intermedia para elegir entre dashboard, perfil o
configuracion.

Permitido:

- resumen de solicitudes, cotizaciones, pedidos, favoritos y direcciones;
- enlaces secundarios a perfil, configuracion y seguridad;
- avisos de verificacion o acciones pendientes.

No permitido:

- selector de perfil sin contenido operativo;
- modal de decision sin informacion util;
- redireccion automatica a login despues de logout.

## Parametros de continuidad

Los frontends deben reconocer al menos:

```text
next
returnTo
```

Los proyectos pueden guardar contexto no sensible adicional:

```text
lastSearch
lastProduct
lastQuote
lastRequest
sourcePage
```

## Prioridad de retorno

1. `next` o `returnTo` explicito y sanitizado.
2. Ultima ruta publica guardada.
3. Dashboard principal del proyecto (`/dashboard` o la ruta canonica definida).
4. Home comercial `/`.

## Sanitizacion obligatoria

Un destino de retorno solo es valido si:

- empieza con `/`;
- no empieza con `//`;
- no apunta a rutas Auth como `/login`, `/register`, `/forgot-password`,
  `/reset-password`, `/verify-email`, `/logout`, `/auth/*` o `/activation/*`;
- no apunta a una ruta privada despues de cerrar sesion.

## Registro

Despues de crear cuenta:

- no afirmar que el correo fue entregado si el backend solo acepto la solicitud;
- mostrar estado de cuenta recibida o correo ya registrado;
- permitir reenvio solo por Gateway General;
- conservar `returnTo` para volver al flujo despues de verificar o iniciar
  sesion.

## Login

Despues de login correcto:

- recargar sesion contra Gateway General;
- validar que el navegador conservo cookies;
- redirigir al destino sanitizado;
- si no hay destino, ir a `/cuenta`.

Si las credenciales son invalidas, el mensaje publico debe ser generico:

```text
Correo o contrasena incorrectos.
```

No debe mostrarse como cuenta inactiva si la contrasena es incorrecta.

Durante el envio del formulario:

- bloquear campos y boton para evitar doble submit;
- mostrar estado visual de validacion;
- si Gateway tarda mas de unos segundos, indicar que la validacion sigue en
  proceso sin perder `next`/`returnTo`;
- conservar logs tecnicos solo en modo desarrollo.

## Logout

Despues de logout:

- limpiar sesion local;
- conservar solo contexto publico no sensible;
- redirigir a la ultima ruta publica o `/`;
- nunca redirigir a `/login`, `/cuenta` o ruta privada.

## Configuracion local

Cada web debe declarar en `next.config.ts` sus `allowedDevOrigins` para los
hosts/puertos documentados en Docker. Esto evita diferencias entre navegadores,
Gateway y dev server durante pruebas locales.

## Documentacion por proyecto

Cada proyecto que adopte este estandar debe documentar:

- ruta del dashboard principal;
- rutas Auth disponibles;
- `NEXT_PUBLIC_APPLICATION_CODE`;
- Gateway base;
- pendientes de API o permisos;
- validaciones ejecutadas.
