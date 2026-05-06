# Modelo de datos: Cart

## Schema

```text
Cart
```

## Tablas principales

```text
Cart.Carts
Cart.CartItems
Cart.CartPriceSnapshots
Cart.CartEvents
```

## Relaciones

- `Carts.CustomerId` apunta a cliente cuando exista.
- `CartItems.ProductId` apunta a `Catalog`.
- `CartPriceSnapshots` guarda calculos temporales.
- La conversion a venta crea referencia en `Sales`.

