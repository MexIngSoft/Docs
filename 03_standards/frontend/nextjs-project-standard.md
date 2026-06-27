# Estandar de proyecto Next.js

## Objetivo

Todo proyecto web Next.js debe poder vivir dentro del Docker frontend durante desarrollo y separarse despues como repositorio independiente sin reescribir su arquitectura.

## Nomenclatura

La carpeta raiz del proyecto web debe seguir este patron:

```text
WEB.NJ.NEXT.NombreProyecto
```

Reglas:

- `WEB`: tipo de proyecto visible para usuario.
- `NJ`: tecnologia Node.js.
- `NEXT`: framework.
- `NombreProyecto`: nombre corto, claro y en PascalCase.

Ejemplos:

```text
WEB.NJ.NEXT.TecnoTelec
WEB.NJ.NEXT.PhoneShop
WEB.NJ.NEXT.JobCron
```

## Repositorio

- Cada frontend debe poder ser repositorio Git independiente.
- `Docker.WEB.NJ` es orquestador local, no dueno del codigo de negocio de cada frontend.
- El orquestador puede montar varios proyectos para desarrollo, pero cada proyecto debe conservar su `.git`, `package.json`, `.env.local.example` y documentacion propia.

## Estructura base

```text
WEB.NJ.NEXT.NombreProyecto/
  app/
  components/
  features/
  hooks/
  lib/
  public/
  styles/
  types/
  .env.local.example
  .gitignore
  package.json
  README.md
```

Uso esperado:

| Carpeta | Uso |
|---|---|
| `app` | Rutas, layouts y paginas de Next.js. |
| `components` | Componentes UI reutilizables del proyecto. |
| `features` | Modulos funcionales por dominio: auth, quotes, dashboard, etc. |
| `hooks` | Hooks compartidos del proyecto. |
| `lib` | Clientes API, helpers, configuracion y adapters. |
| `public` | Assets publicos propios del proyecto. |
| `styles` | Estilos globales y tokens si aplican. |
| `types` | Tipos compartidos TypeScript. |

## Variables de entorno

Cada proyecto debe incluir:

```text
.env.local
.env.local.example
```

Reglas:

- `.env.local` es local y no debe subirse a Git.
- `.env.local.example` si debe subirse y documentar variables requeridas sin secretos reales.
- Las variables publicas deben iniciar con `NEXT_PUBLIC_`.
- Secretos, tokens privados y llaves internas no deben exponerse al navegador.

Variables minimas:

```text
NEXT_PUBLIC_APP_NAME=
NEXT_PUBLIC_HOST=
NEXT_PUBLIC_GATEWAY_BASE_URL=
NEXT_PUBLIC_ENVIRONMENT=
NEXT_PUBLIC_APPLICATION_CODE=
```

`NEXT_PUBLIC_APPLICATION_CODE` es obligatorio cuando el proyecto usa Auth. Si
el proyecto no requiere login, debe documentar `auth_required: false` en su
documentacion canonica.

## Comunicacion con APIs

El frontend debe consumir solo el Gateway central.

```text
Frontend -> API.PY.DJANGO.Gateway -> Project API + Core ERP APIs
```

No permitido:

```text
Frontend -> Core ERP API
Frontend -> Supplier API
Frontend -> Pricing API
Frontend -> Database
```

## Mapa de acciones

Cada frontend con flujos funcionales debe mantener sus acciones documentadas
en:

```text
Docs/02_projects/<proyecto>/technical/code-actions-map.md
Docs/02_projects/<proyecto>/frontend/code-actions-map.md
```

Cada accion que consuma datos debe indicar ruta visual, archivo, servicio,
Gateway, API destino, permisos, estados UI y errores esperados.

## Rutas y layouts

- Las rutas publicas deben separarse de rutas privadas.
- Las rutas admin deben estar protegidas por rol.
- El layout publico no debe cargar dependencias pesadas del dashboard.
- El dashboard debe tener layout propio con navegacion lateral o superior segun el caso.

Estructura sugerida:

```text
app/
  (public)/
  (auth)/
  (client)/
  (admin)/
  api/
```

## Estado y datos

- El estado global solo debe usarse para sesion, preferencias, carrito/resumen y notificaciones.
- Datos de servidor deben consultarse mediante servicios en `lib/api` o capa equivalente.
- Evitar duplicar logica de negocio que pertenezca al gateway, project API o core ERP.

## Autenticacion y permisos

- La sesion debe resolverse contra `API.PY.DJANGO.Gateway`.
- Todo proyecto web nuevo debe incluir login estandar, salvo excepcion
  documentada con `auth_required: false`.
- El flujo obligatorio es `Frontend -> API.PY.DJANGO.Gateway -> Auth`; el
  frontend no debe consumir `API.PY.DJANGO.Auth` directamente.
- Las llamadas de sesion/permisos deben poder incluir `X-Application-Code`.
- Los permisos se deben validar en backend y reflejar en frontend solo para experiencia de usuario.
- El frontend nunca debe ser la unica barrera de seguridad.

Referencia canonica:

```text
Docs/03_standards/auth/web-auth-login-standard.md
```

## Errores, logs y auditoria

- Errores de API deben normalizarse en un adapter.
- Mostrar mensajes claros al usuario sin exponer trazas internas.
- Registrar conversiones, fallas de formulario y acciones criticas cuando el proyecto lo requiera.

## Diseno

- Cada proyecto debe documentar su sistema visual.
- Componentes compartidos deben ser agnosticos de marca.
- Componentes de marca viven en el proyecto.
- El frontend debe priorizar flujos reales antes que landing pages decorativas.

## Estilos y Tailwind CSS

Tailwind CSS queda adoptado como estandar visual recomendado para webs Next.js
modernas del ecosistema cuando el producto sea marketplace, SaaS, ERP,
dashboard, e-commerce tecnico o interfaz operativa con crecimiento visual alto.

Base recomendada:

```text
tailwindcss: 3.4.18
postcss: 8.5.6
autoprefixer: 10.4.22
@tailwindcss/forms: 0.5.10
@tailwindcss/typography: 0.5.19
@tailwindcss/aspect-ratio: 0.4.2
tailwind-merge: 3.3.1
```

Reglas:

- La migracion se hace por pantallas, no con refactor masivo ciego.
- `tailwind.config.js` debe mapear tokens del proyecto a variables CSS
  existentes cuando sea posible.
- `app/globals.css` conserva variables, resets minimos y estilos base
  compatibles con pantallas todavia no migradas.
- CSS propio queda permitido para variables globales, resets, estilos base,
  compatibilidad temporal y casos especiales no cubiertos por utilidades.
- Las nuevas interfaces deben preferir utilidades Tailwind y componentes
  extraidos en `components` o `features`.
- No se debe instalar Tailwind en APIs ni usarlo como excusa para cambiar
  contratos, rutas, Gateway, Auth o reglas de negocio.

## Criterio de cierre

Un frontend queda estandarizado cuando:

- Tiene nombre canonico.
- Tiene repositorio propio o puede separarse sin friccion.
- Tiene `.env.local.example`.
- Consume solo el Gateway General.
- Tiene rutas y layouts documentados.
- Tiene README con arranque local.
- Tiene reglas de UI, auth, permisos y errores documentadas.
- Tiene mapa de acciones de codigo inicial o una excepcion documentada.
- Tiene Tailwind configurado o una excepcion documentada con causa real.
- Si usa Auth, esta registrado en
  `Docs/02_projects/_ecosystem/api-version-matrix.md`.
