# Indice de APIs

| API | Estado | Responsabilidad | Prioridad |
|---|---|---|---|
| auth-api | EXISTE | Usuarios, roles, permisos. | ALTA |
| catalog-api | EXISTE/PARCIAL | Productos internos. | ALTA |
| supplier-api | EXISTE | Proveedores y sync. | ALTA |
| pricing-api | EXISTE/PARCIAL | Precios, margenes, impuestos. | ALTA |
| cost-api | FUTURO | Costos reales/estimados, asignacion de gastos y rentabilidad base. | MEDIA |
| quote-api | FALTA | Cotizaciones y snapshots. | ALTA |
| sales-api | EXISTE/PARCIAL | Ordenes, pagos, ventas. | ALTA |
| logistics-api | FALTA | Envios, costos, tracking. | MEDIA |
| rules-engine-api | FALTA | Decisiones de negocio. | ALTA |
| tecnotelec-gateway-api | DRAFT | Gateway/BFF web. | ALTA |
| tecnotelec-api | DRAFT | Procesos, formularios y configuracion propia de Tecno Telec. | ALTA |
| projects-api | FALTA | Soluciones y proyectos. | ALTA |
| cart-api | FALTA | Carrito web. | MEDIA |
| pos-api | FALTA | Punto de venta fisico. | BAJA |
| government-tender-api | FALTA | Licitaciones y oportunidades publicas. | BAJA |
| billing-api | FALTA | Datos fiscales, facturacion, notas y documentos fiscales. | MEDIA |
| notifications-api | FALTA | Eventos, mensajes y reintentos de notificacion. | MEDIA |
| documents-api | FALTA | Archivos, anexos, evidencias y relaciones documentales. | MEDIA |

## Regla de separacion

```text
Cart API      = intencion de compra web
POS API       = venta fisica rapida
Projects API  = solucion consultiva
Sales API     = cotizacion, venta, pagos y estado comercial
Pricing API   = listas de precios, margenes e impuestos
Cost API      = costos reales/estimados y base de rentabilidad
Rules API     = decisiones configurables
Billing API   = datos y documentos fiscales
Documents API = anexos, evidencias y archivos por contexto
```
