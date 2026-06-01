# Modulos ERP

| Modulo | Responsabilidad | No debe hacer |
|---|---|---|
| Auth | Usuarios, roles, permisos, sesiones. | Reglas de catalogo o ventas. |
| Supplier | Proveedores, sync, datos externos, RawData. | Vender o calcular precio final. |
| Catalog | Productos internos, categorias, marcas, atributos. | Descargar proveedores. |
| Pricing | Listas, margenes, impuestos, precios finales. | Administrar stock. |
| Costing | Costos reales/estimados, gastos asignados, costos financieros y rentabilidad base. | Decidir precio comercial final. |
| Inventory | Almacenes, stock propio, movimientos, reservas. | Confundir stock proveedor con stock propio. |
| Quote | Cotizaciones y snapshots comerciales. | Mover inventario directo. |
| Sales | Ordenes, pagos, estados comerciales. | Disenar soluciones tecnicas. |
| Projects | Soluciones por necesidad, paquetes, formularios. | Confirmar ventas finales. |
| Cart | Intencion de compra web. | Ser orden formal. |
| POS | Venta fisica rapida y caja. | Reemplazar Sales como libro comercial. |
| Logistics | Costos, tiempos, carriers, tracking. | Reservar stock. |
| Rules Engine | Decisiones configurables. | Guardar productos o cobrar. |
| GovernmentTender | Inteligencia y seguimiento de licitaciones. | Enviar propuestas automaticamente sin confirmacion oficial. |
| Billing | Datos fiscales, facturacion, notas y relacion fiscal con ventas. | Calcular precios o mover inventario. |
| Notifications | Eventos, mensajes, plantillas y reintentos de comunicacion. | Bloquear ventas o pagos. |
| Documents | Archivos, anexos y evidencias. | Decidir viabilidad comercial. |
| ExecutionResourceManager | Eventos de ejecucion, costos internos, creditos cobrados, fallback, ahorro operativo y carga por proyecto. | Procesar archivos, ejecutar OCR o decidir precio final por si solo. |
| ChannelAssortment | Publicacion por proyecto/canal. | Descargar proveedores o normalizar productos. |
| ProductCompatibility | Compatibilidad tecnica entre productos. | Vender o cotizar por si mismo. |

## Modelos funcionales complementarios

- `07_cart_model.md`
- `08_pos_model.md`
- `09_system_states.md`
- `10_roles_permissions.md`
- `11_costs_profitability.md`
- `12_billing_returns.md`
- `13_error_consistency.md`
- `14_async_jobs_notifications.md`
- `15_bundles_kits.md`
- `16_addresses_customers.md`
- `17_government_tender.md`
- `18_government_tender_adoption.md`
- `19_supplier_catalog_strategy.md`
- `20_channel_assortment.md`
- `21_product_compatibility.md`
- `22_pricing_costing_future_map.md`
- `24_execution_resource_manager.md`
