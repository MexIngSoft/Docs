# Estandar de Navbar Tecno Telec

## Objetivo

Definir la Navbar oficial de Tecno Telec para una web consultiva, escalable y compatible con el ecosistema JobCron.

La Navbar no debe tratar a Tecno Telec como marketplace generico. Debe priorizar soluciones, diagnostico, catalogo consultivo y contacto humano.

## Diagnostico actual

La maqueta actual ya tiene `SiteHeader`, `publicNavigation` y enlaces marcados como pendientes. Cumple como boceto inicial, pero todavia requiere:

- Estado activo por ruta.
- Drawer mobile funcional.
- Busqueda consultiva.
- Menu de cuenta autenticada.
- Separacion clara entre navegacion publica, cliente y administracion.
- Iconografia por enlace.
- Accesibilidad completa de menus.

## Regla principal

El frontend consume solo `TecnoTelec Gateway API`.

```txt
Web Tecno Telec
  -> TecnoTelec Gateway API
  -> Core APIs necesarias
  -> TecnoTelec API solo configuracion propia
  -> JobCron administra todo
```

La Navbar no debe llamar directamente a `Catalog`, `Pricing`, `Inventory`, `Sales` o `Supplier`.

## Estructura visual

Desktop:

```txt
Logo Tecno Telec
Soluciones
Proyectos
Catalogo
Diagnostico
Asesoria
Contacto
Cuenta
CTA: Comienza tu diagnostico
```

Mobile:

```txt
Logo
Boton menu
CTA compacto: Diagnostico
Drawer:
  Soluciones
  Proyectos
  Catalogo
  Diagnostico
  Contacto
  Cuenta
  WhatsApp
```

## Rutas e iconos recomendados

| Nombre | Ruta | Icono lucide-react | Publico | Privado | Mobile | Estado |
|---|---|---|---:|---:|---:|---|
| Inicio | `/` | `Home` | Si | Si | Si | Implementado |
| Soluciones | `/soluciones` | `Network` | Si | Si | Si | Implementado |
| Catalogo | `/catalogo` | `Boxes` | Si | Si | Si | Implementado |
| Diagnostico | `/cotizador` | `ClipboardList` | Si | Si | Si | Implementado |
| Contacto | `/contacto` | `MessageCircle` | Si | Si | Si | Implementado |
| Cuenta | `/portal` | `UserRound` | No | Si | Si | Parcial |
| Login | `/login` | `LogIn` | Si | No | Si | Implementado |
| Admin | `/admin` | `Settings` | No | Rol admin | No | Placeholder |
| Carrito | `/carrito` | `ShoppingCart` | Si | Si | Si | Pendiente |
| Checkout | `/checkout` | `CreditCard` | Si | Si | Si | Pendiente |

## Arquitectura recomendada

```txt
components/navigation/
  Navbar.tsx
  NavbarLogo.tsx
  NavbarLinks.tsx
  NavbarActions.tsx
  NavbarSearch.tsx
  NavbarUserMenu.tsx
  NavbarMobile.tsx
  NavbarMegaMenu.tsx
  navbar.config.ts
  types.ts
```

La configuracion debe vivir fuera del componente:

```ts
export const navbarConfig = [
  {
    title: "Soluciones",
    href: "/soluciones",
    icon: Network,
    public: true,
    private: true,
    mobile: true,
  },
];
```

## Reglas de diseno

| Elemento | Regla |
|---|---|
| Color primario | `#0070de` |
| Altura desktop | 72 a 80 px |
| Altura mobile | 64 px |
| Logo | 32 a 40 px de alto |
| Iconos | 18 a 20 px |
| Bordes | `#dbe3ef` |
| Sombra | Sutil, solo al hacer sticky |
| Radio | 8 px maximo |
| Z-index | Mayor a contenido, menor a modales |
| Breakpoint mobile | Menor a 900 px |
| Dark mode | Preparado, no obligatorio para MVP |

## Accesibilidad

- Boton mobile con `aria-label`.
- Drawer con `aria-expanded`.
- Enlace activo con `aria-current="page"`.
- Focus visible en enlaces y botones.
- Cierre con Escape.
- Cierre al hacer click fuera.
- Tamano tactil minimo de 44 px.
- Contraste suficiente entre texto, fondo y borde.

## Supuestos temporales

- La cuenta de usuario usa `/portal` como destino privado inicial.
- `Carrito` y `Checkout` quedan visibles solo cuando el flujo ecommerce se active.
- El CTA principal sigue siendo `Comienza tu diagnostico`.
- La busqueda global se limita inicialmente a catalogo y soluciones.

## Contradicciones detectadas

No se detecta contradiccion con la arquitectura actual. La unica diferencia es de prioridad: algunos agentes mencionan compra directa, pero la documentacion vigente define primero catalogo consultivo y cotizacion.

## Preguntas para aclarar

- Confirmar si la Navbar privada sera una variante del header publico o un dashboard shell independiente.
- Confirmar si el carrito se mostrara antes de tener checkout real.
- Confirmar fuente final de marca.

## Checklist de implementacion

- Crear `components/navigation`.
- Migrar `SiteHeader` hacia componentes modulares.
- Usar `navbar.config.ts`.
- Agregar estado activo.
- Agregar drawer mobile funcional.
- Agregar menu de cuenta.
- Marcar enlaces pendientes sin romper rutas.
- Mantener todos los consumos via Gateway.
