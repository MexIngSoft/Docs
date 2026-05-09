# Estrategia de placeholders frontend

## Objetivo

Evitar que la Web Tecno Telec, JobCron u otros frontends rompan layout por falta de imagen o asset visual.

## Reglas

1. Si producto no tiene imagen, usar placeholder de producto.
2. Si categoria no tiene imagen, usar placeholder de categoria.
3. Si solucion no tiene imagen, usar placeholder de solucion.
4. Si usuario no tiene foto, usar avatar generico.
5. Si banner no existe, usar bloque neutro.
6. Nunca romper layout por falta de imagen.
7. Nunca usar imagenes externas aleatorias.
8. Todo placeholder debe estar en assets locales.
9. Si no existe imagen 360, ocultar seccion.
10. Si no existe galeria, usar imagen principal.
11. Si no existe imagen principal, usar placeholder.

## Rutas sugeridas

```text
public/placeholders/product.svg
public/placeholders/category.svg
public/placeholders/solution.svg
public/placeholders/user.svg
public/placeholders/banner.svg
public/placeholders/empty-state.svg
```

Se permite SVG para placeholders genericos porque son assets locales, ligeros y no dependen de imagenes externas aleatorias.

## Estados relacionados

- `NO_IMAGE`.
- `NO_GALLERY`.
- `NO_360_IMAGE`.
- `EMPTY_STATE`.

## Pendiente

Crear paquete compartido de assets si varios frontends necesitan los mismos placeholders.
