# Estandar de alcance Auth por ruta web

## Objetivo

Evitar errores falsos de autenticacion en webs publicas. Una web puede consultar
sesion para mejorar la experiencia, pero no toda ruta debe comportarse como
privada.

## Regla principal

Cada ruta debe declarar o heredar una politica Auth:

```text
public
optional
required
```

El frontend siempre consume Auth mediante Gateway General. Auth y Gateway
mantienen la seguridad real; la politica frontend solo define experiencia,
redireccion y ruido de consola.

## Nivel A - Publico

No requiere login.

Ejemplos:

- home;
- landing pages;
- catalogo o buscador publico;
- detalle publico;
- contacto;
- registro;
- login;
- recuperacion de contrasena;
- verificacion de correo.

Comportamiento:

- si `/auth/me/` devuelve `401`, se trata como usuario anonimo;
- no se registra `console.error`;
- no se muestra pantalla de error;
- no se bloquea navegacion.

## Nivel B - Publico con sesion opcional

Funciona sin login, pero mejora si existe sesion.

Ejemplos:

- favoritos locales;
- carrito temporal;
- buscador con historial opcional;
- formulario publico con datos precargados si hay sesion;
- recomendaciones.

Comportamiento:

- puede consultar `/auth/me/`;
- `401` significa usuario anonimo;
- no se registra como error;
- solo se activan mejoras si hay sesion.

## Nivel C - Privado / protegido

Requiere login.

Ejemplos:

- dashboard;
- perfil;
- configuracion;
- panel proveedor;
- panel administrador;
- compras;
- pagos;
- cotizaciones privadas;
- historial;
- direcciones;
- facturacion;
- cambio de contrasena;
- operaciones sensibles.

Comportamiento:

- si `/auth/me/` devuelve `401`, redirigir a `/login`;
- si refresh falla, limpiar sesion y redirigir;
- si falta permiso, mostrar `/403`;
- errores reales de Gateway/Auth si deben registrarse.

## Cliente Gateway

El cliente Gateway debe soportar:

- `silentStatuses`;
- `suppressErrorLog`;
- clasificacion de errores esperados;
- clasificacion de errores reales.

Regla:

```text
401 en /auth/me/ sin sesion + ruta public/optional = estado esperado.
401 en ruta required = redireccion controlada a login.
```

## API frontend recomendada

Usar una sola entrada oficial para consultar sesion:

```ts
getSession({ mode: "public" })
getSession({ mode: "optional" })
getSession({ mode: "required" })
```

Comportamiento:

```text
public   -> 401 = anonimo, sin error de consola
optional -> 401 = anonimo, sin error de consola
required -> 401 = login requerido
```

## Componentes recomendados

```text
PublicRoute
OptionalAuthRoute
ProtectedRoute
```

`ProtectedRoute` es el unico que redirige a login ante sesion ausente.

## Registro y reenvio de verificacion

La UI puede mostrar reenvio de verificacion solo cuando:

- un registro nuevo fue recibido;
- el usuario intenta registrarse con un correo ya existente y la UI ofrece
  reenvio como accion opcional para cuentas no verificadas;
- el usuario esta en una pantalla explicita de verificacion de correo.

La UI no debe mostrar reenvio cuando:

- el error es contrasena invalida;
- el email tiene formato invalido;
- Gateway/Auth esta caido;
- CORS/red falla;
- la operacion no esta relacionada con verificacion de correo.

La UI no debe afirmar entrega final. Debe decir que se solicito o recibio la
peticion, y la entrega real se confirma en logs Auth/Proveedor.

## RefaPart

REFAPART aplica el estandar asi:

| Politica | Rutas |
|---|---|
| Publico | `/`, `/resultados`, `/pieza/[id]`, `/publicar-busqueda`, `/login`, `/register`, `/forgot-password`, `/reset-password`, `/verify-email`, `/auth/success`, `/auth/error`, `/403`, `/logout` |
| Opcional | `/favoritos`, `/carrito` |
| Protegido | `/cuenta`, `/cuenta/direcciones`, `/cuenta/facturacion`, `/dashboard`, `/profile`, `/settings`, `/change-password`, `/checkout`, `/mis-solicitudes`, `/mis-cotizaciones`, `/mis-pedidos`, `/mis-pedidos/[id]`, `/proveedor`, `/admin/refapart/*` |

## Checklist para nuevas webs

- [ ] Definir rutas publicas, opcionales y privadas.
- [ ] Usar Gateway General, no Auth directo.
- [ ] Usar una sola funcion de sesion con modo explicito.
- [ ] Silenciar `401` anonimo en rutas publicas/opcionales.
- [ ] Proteger rutas privadas con guard reutilizable.
- [ ] Redirigir privadas sin sesion a `/login`.
- [ ] Mostrar `/403` si falta permiso.
- [ ] Documentar flujo de reenvio de verificacion.
- [ ] Validar lint/build y endpoints Auth/Gateway.

## Pendientes de adopcion

Las siguientes webs deben adoptar este estandar en una corrida propia:

- JOBCRON;
- UNIVERSAL_POS;
- DOCUCORE;
- MEXINGSOF;
- TECNOTELEC;
- IMAGRAFITY;
- LEXNOVA;
- FISCORA.
