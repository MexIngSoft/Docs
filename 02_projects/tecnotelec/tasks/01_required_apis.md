# APIs requeridas

| API | Existe | Estado | Responsabilidad | Endpoints faltantes | Prioridad |
|---|---|---|---|---|---|
| auth-api | SI | BASE AMPLIADA | Usuarios, roles, permisos por aplicacion, sesiones, dispositivos, tokens hasheados, MFA base y auditoria. | Matriz concreta de permisos Tecno Telec/JobCron y flujos publicos de MFA/recuperacion. | ALTA |
| catalog-api | SI | PARCIAL | Productos internos. | Productos, categorias, marcas, kits. | ALTA |
| supplier-api | SI | AVANZADO | Proveedores y sync. | Endpoints internos documentados. | ALTA |
| pricing-api | SI | PARCIAL | Precios y listas. | calculate, listas, reglas descuento. | ALTA |
| quote-api | NO | FALTA | Cotizaciones y snapshots. | Todos. | ALTA |
| sales-api | SI | PARCIAL | Ordenes, pagos, ventas. | Ordenes, pagos, devoluciones. | ALTA |
| logistics-api | NO | FALTA | Envios, costos, tracking. | Todos. | MEDIA |
| rules-engine-api | NO | FALTA | Decisiones de negocio. | Todos. | ALTA |
| tecnotelec-gateway-api | SI | DRAFT | Gateway/BFF web. | Conectar orquestacion real con Catalog, Pricing, TecnoTelec API y Quote/Sales. | ALTA |
| tecnotelec-api | SI | DRAFT | Procesos y tablas propias de Tecno Telec. | Conectar persistencia administrativa, permisos internos y contratos finales con Gateway. | ALTA |
| projects-api | NO | FALTA | Cotizador consultivo. | Todos. | ALTA |
| cart-api | NO | FALTA | Carrito web. | Todos. | MEDIA |
| pos-api | NO | FALTA | Punto de venta fisico. | Todos. | BAJA |
| government-tender-api | NO | FUTURO | Licitaciones. | Todos. | BAJA |
| channel-assortment | NO | FALTA | Definir que productos se muestran en Tecno Telec. | Politicas por categoria/canal. | ALTA |
| product-compatibility | NO | FUTURO | Compatibilidad tecnica de componentes. | Reglas para soluciones y configuradores. | MEDIA |
