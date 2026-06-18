# REFAPART Supplier Quotation Panel

## Objetivo

Registrar contacto con proveedores, respuestas, ofertas y cotizaciones sin
exponer datos internos al cliente.

## WhatsApp proveedor

Formato de link:

```text
https://wa.me/52{SupplierPhone}?text={EncodedMessage}
```

## Mensaje base

```text
Hola, lo contactamos de REFAPART.

Estamos buscando esta pieza para un cliente:

Pieza: {PartName}
Auto: {Brand} {Model} {Year}
Lado/posicion: {Side} {Position}
Motor/version: {Engine} {Version}
Ciudad destino: {CustomerCity}

La tiene en existencia?

Si la tiene, por favor indiquenos:
1. Precio
2. Estado de la pieza
3. Fotos
4. Garantia
5. Ubicacion
6. Tiempo de entrega

Gracias.
```

## Estados de contacto

| Estado |
|---|
| NotContacted |
| MessagePrepared |
| MessageSent |
| WaitingResponse |
| Answered |
| HasPart |
| DoesNotHavePart |
| NeedsMoreData |
| Discarded |

## Cotizacion cliente

Debe incluir folio, pieza, auto, condicion, fotos publicables, precio final,
envio, garantia, vigencia, tiempo estimado, notas y estado.
