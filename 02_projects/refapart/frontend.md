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
- CSS propio del proyecto.
- `lucide-react` para iconografia.

## Rutas MVP

| Ruta | Uso |
|---|---|
| `/` | Home con buscador principal, categorias, resultados destacados y CTA de solicitud. |
| `/resultados` | Resultados filtrables por busqueda, categoria, marca, condicion y orden. |
| `/pieza/[id]` | Detalle de pieza con compatibilidad, precio, garantia y CTA. |
| `/publicar-busqueda` | Formulario UI para solicitar una pieza no encontrada. |
| `/favoritos` | Favoritos locales del navegador. |
| `/cuenta` | Placeholder funcional de cuenta cliente. |
| `/proveedor` | Placeholder funcional para proveedor. |

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

## Backend

El MVP visual no conecta backend. La variable futura queda documentada en
`.env.local.example`.
