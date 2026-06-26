# Identidad visual REFAPART

## Nombre visible

```text
REFAPART
```

## Concepto

Marca nacional premium para localizar autopartes y refacciones dificiles con
proveedores verificados.

## Paleta

| Token | Color | Uso |
|---|---|---|
| Negro premium | `#0A0A0A` | Header, footer, fondos de contraste. |
| Grafito | `#171717` | Superficies oscuras. |
| Titanio | `#B8BDC7` | Bordes, iconos, detalles metalicos. |
| Plata claro | `#E5E7EB` | Separadores y texto suave. |
| Rojo REFAPART | `#E10600` | CTA y estados criticos, maximo 15%. |
| Verde disponibilidad | `#16A34A` | Disponible, verificado, activo. |

## Tipografia

- Principal: Montserrat o fallback sans-serif.
- Secundaria: Inter o fallback sans-serif.

## Logo

Identidad vigente desde 2026-06-13:

- `refapart-icon.png`: escudo `R` para favicon, header y superficies compactas.
- `refapart-logo-dark.png`: logo sin lema para composiciones donde el texto ya
  esta explicado por la UI.
- `refapart-logo-with-tagline.png`: logo con lema para hero o puntos de mayor
  reconocimiento de marca.
- `refapart-logo-usage-guide.png`: referencia visual de usos aprobados.
- `refapart-icon-wide.png`: variante fuente archivada para adaptaciones futuras.

Uso esperado:

- Header desktop: alto maximo `48px`.
- Header mobile: alto maximo `36px`.
- Favicon/icono: usar escudo `R`.
- Fondos claros: preferir composicion horizontal o escudo con texto.
- Fondos oscuros: usar logo oscuro completo cuando haya suficiente espacio.

## UX

- Accion primaria siempre visible en mobile.
- Busqueda principal en primer viewport.
- Badges claros: `Disponible`, `Garantia`, `Envio`, `Revisado por REFAPART`.
- No mostrar proveedor final ni telefono externo al cliente.
- Las pantallas Auth usan fondo automotriz oscuro, tarjeta blanca, logo
  REFAPART y CTA rojo para mantenerse alineadas con la Home premium.

## Implementacion visual

- Tailwind CSS es la base recomendada para nuevas pantallas REFAPART.
- Los colores de Tailwind deben mapearse a la paleta documentada en este
  archivo.
- CSS global propio se limita a variables, resets, tipografia base,
  compatibilidad temporal y casos visuales que Tailwind no cubra de forma
  clara.
- La migracion visual se hace por pantalla y debe validar responsive, build y
  lint antes de considerar una vista cerrada.
