# Modelo de carrito web

## Objetivo

`Cart` representa la intencion de compra en canales digitales. No es una venta, no congela inventario de forma definitiva y no emite factura.

## Responsabilidad

- Guardar productos agregados por cliente o sesion anonima.
- Mantener cantidades, direccion tentativa y metodo de entrega esperado.
- Pedir a `Pricing` el calculo temporal de precio.
- Pedir a `Inventory` disponibilidad preliminar.
- Pedir a `Logistics` costo y tiempo estimado de envio.
- Convertirse en cotizacion o venta mediante `Sales`.

## No debe hacer

- Crear ordenes de venta formales.
- Modificar stock definitivo.
- Guardar precios como verdad comercial permanente.
- Aplicar reglas de negocio complejas sin `Rules Engine`.

## Entidades base

```text
Cart
- Id
- CustomerId NULL
- SessionId NULL
- Status
- Currency
- PriceListId NULL
- ShippingAddressId NULL
- CreatedAt
- UpdatedAt
- ExpiresAt
```

```text
CartItem
- Id
- CartId
- ProductId
- Quantity
- UnitPricePreview
- DiscountPreview
- TaxPreview
- TotalPreview
- AvailabilityStatus
```

## Estados

```text
ACTIVE
PRICE_CHANGED
WAITING_STOCK
READY_TO_CHECKOUT
CONVERTED_TO_QUOTE
CONVERTED_TO_ORDER
ABANDONED
EXPIRED
```

## Conversion

El carrito solo puede convertirse a venta mediante `Sales API`. Si requiere revision humana, debe convertirse primero a cotizacion.

