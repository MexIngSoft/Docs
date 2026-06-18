# REFAPART Quote To Order Flow

## Objetivo

Convertir oferta interna validada en cotizacion visible y luego en pedido.

## Flujo

1. Registrar respuesta de proveedor.
2. Crear `SupplierOffer`.
3. Calcular precio final.
4. Crear `Quote` en estado `Draft`.
5. Enviar cotizacion al cliente.
6. Cliente acepta o rechaza.
7. Si acepta, convertir a `Order`.
8. Registrar auditoria.

## Calculo de precio

```text
CostoProveedor
+ CostoRecoleccion
+ CostoEnvio
+ Comision REFAPART
+ Margen
+ AjusteManual
= PrecioFinalCliente
```

## Estados de cotizacion

| Estado |
|---|
| Draft |
| Sent |
| Accepted |
| Rejected |
| Expired |
| ConvertedToOrder |
