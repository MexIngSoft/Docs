# Arquitectura REFAPART

## Objetivo

Separar la experiencia comercial de REFAPART de la operacion profunda de
JobCron.

## Regla principal

```text
REFAPART Web
-> API.PY.DJANGO.Gateway
-> REFAPART API
-> JobCron / Core ERP / integraciones
```

El frontend no debe consumir JobCron, Core ERP ni base de datos directamente.

## Responsabilidades

| Capa | Responsabilidad |
|---|---|
| REFAPART Web | UX comercial, busqueda, resultados, favoritos, solicitud y seguimiento visible. |
| Gateway central | Sesion, permisos de frontera, routing, normalizacion de respuestas y proxy seguro. |
| REFAPART API | Clientes, busquedas, cotizaciones visibles, pedidos, pagos y tracking publico. |
| JobCron | Proveedores, costos, compras internas, WhatsApp proveedor, logistica profunda, comisiones, auditoria y jobs. |

## Flujo comercial

1. Cliente busca una pieza o publica una solicitud.
2. REFAPART registra `search_request`.
3. REFAPART emite `search.requested` hacia JobCron.
4. JobCron filtra proveedores compatibles y gestiona contacto interno.
5. JobCron responde con cotizacion publicable.
6. REFAPART muestra precio final, garantia, fotos y tiempo estimado.
7. Cliente acepta y paga a REFAPART.
8. JobCron ejecuta compra, recoleccion, envio y eventos publicos.
9. REFAPART muestra seguimiento al cliente.

## Datos que no deben cruzar a UI publica

- Costo real del proveedor.
- Margen REFAPART.
- Telefono real del proveedor.
- Notas internas.
- Auditoria.
- Automatizaciones y errores tecnicos.

## Decision MVP actual

Auth y las funciones comerciales se publican exclusivamente mediante
`API.PY.DJANGO.Gateway`. `API.PY.DJANGO.RefaPart` implementa catalogo,
busqueda tolerante a errores, demanda, proveedores, ofertas, cotizacion y
pedido. `API.PY.DJANGO.Address` concentra el catalogo normalizado de
direcciones.

El Gateway especifico anterior queda retirado y no forma parte del runtime
canonico. Pagos, logistica profunda y eventos asincronos hacia JobCron siguen
pendientes de integracion productiva.
