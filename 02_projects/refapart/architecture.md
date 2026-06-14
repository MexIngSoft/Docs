# Arquitectura REFAPART

## Objetivo

Separar la experiencia comercial de REFAPART de la operacion profunda de
JobCron.

## Regla principal

```text
REFAPART Web
-> REFAPART Gateway/BFF
-> REFAPART API
-> JobCron / Core ERP / integraciones
```

El frontend no debe consumir JobCron, Core ERP ni base de datos directamente.

## Responsabilidades

| Capa | Responsabilidad |
|---|---|
| REFAPART Web | UX comercial, busqueda, resultados, favoritos, solicitud y seguimiento visible. |
| REFAPART Gateway | Sesion, permisos de frontera, agregacion, normalizacion de respuestas y proxy seguro. |
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

La primera implementacion web usa datos mock locales para validar interfaz. No
simula backend real ni promete pagos, inventario o proveedor final como
funcionalidad productiva.
