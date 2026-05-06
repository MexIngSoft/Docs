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
```

## Comunicacion con APIs

El frontend debe consumir solo el gateway/BFF del proyecto.

```text
Frontend -> Project Gateway/BFF -> Project API + Core ERP APIs
```

No permitido:

```text
Frontend -> Core ERP API
Frontend -> Supplier API
Frontend -> Pricing API
Frontend -> Database
```

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

- La sesion debe resolverse contra el gateway/auth.
- Los permisos se deben validar en backend y reflejar en frontend solo para experiencia de usuario.
- El frontend nunca debe ser la unica barrera de seguridad.

## Errores, logs y auditoria

- Errores de API deben normalizarse en un adapter.
- Mostrar mensajes claros al usuario sin exponer trazas internas.
- Registrar conversiones, fallas de formulario y acciones criticas cuando el proyecto lo requiera.

## Diseno

- Cada proyecto debe documentar su sistema visual.
- Componentes compartidos deben ser agnosticos de marca.
- Componentes de marca viven en el proyecto.
- El frontend debe priorizar flujos reales antes que landing pages decorativas.

## Criterio de cierre

Un frontend queda estandarizado cuando:

- Tiene nombre canonico.
- Tiene repositorio propio o puede separarse sin friccion.
- Tiene `.env.local.example`.
- Consume solo su gateway.
- Tiene rutas y layouts documentados.
- Tiene README con arranque local.
- Tiene reglas de UI, auth, permisos y errores documentadas.
