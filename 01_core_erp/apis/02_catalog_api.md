# Catalog API

## Responsabilidad

Administrar productos internos, categorias, marcas, atributos, imagenes y kits.

## Endpoints minimos

- `GET /products`
- `GET /products/{id}`
- `GET /categories`
- `GET /brands`
- `POST /products`
- `PATCH /products/{id}`

## No debe hacer

- Descargar proveedores.
- Calcular precios finales.
- Administrar inventario propio.
