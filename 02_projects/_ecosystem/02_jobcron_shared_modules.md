# Modulos compartidos JobCron

## Objetivo

Definir que modulos del ERP pueden reutilizar los proyectos del ecosistema.

| Modulo JobCron | Sirve para | Proyectos candidatos |
|---|---|---|
| Auth | Usuarios, roles, permisos. | Todos |
| Catalog | Productos, servicios, paquetes. | Tecno Telec, Nexora, Imagrafity, Buildora, Refakto, Nutriva, Imagiland |
| Supplier | Proveedores externos. | Tecno Telec, Buildora, Refakto, Sekura Tech |
| Pricing | Precios, margenes, impuestos. | Todos los comerciales |
| Inventory | Stock, almacenes, movimientos. | Tecno Telec, Stockara, Imagrafity, Buildora, Refakto, Nutriva |
| Sales/Quote | Cotizaciones, ordenes, pagos. | Tecno Telec, Nexora, Imagrafity, Buildora, Refakto, Festora, Lavanderia 3P, Nutriva |
| Projects | Soluciones consultivas. | Nexora, Tecno Telec, Sekura Tech, Innovation Engines Repair |
| Logistics | Envios, rutas, tracking. | Rutexa, Tecno Telec, Lavanderia 3P, Nutriva, Refakto |
| Payments | Pagos, anticipos, financiamiento. | Pagora y todos los que vendan |
| Billing | Datos fiscales, facturas, notas y documentos fiscales. | Tecno Telec, Nexora, Imagrafity, Buildora, Refakto, Nutriva |
| Cart | Carrito web e intencion de compra. | Tecno Telec, Imagrafity, Buildora, Refakto, Nutriva |
| POS | Caja, tickets y venta fisica. | Tecno Telec, Imagrafity, Lavanderia 3P, Nutriva |
| Bundles/Kits | Paquetes, soluciones y componentes. | Tecno Telec, Nexora, Buildora, Refakto, Imagrafity |
| GovernmentTender | Inteligencia y seguimiento de licitaciones. | Tecno Telec, Nexora, Sekura Tech, Innovation Engines Repair |
| ChannelAssortment | Surtido por proyecto/canal. | Tecno Telec, Phone Shop, Buildora, Refakto |
| ProductCompatibility | Compatibilidad tecnica entre productos. | Buildora, Tecno Telec, Refakto |
| Rules Engine | Decisiones configurables. | Todos |
| Reports/BI | Reportes y metricas. | Datara y todos |
| Notifications | Email, WhatsApp, SMS. | Todos |

## Regla

Un proyecto nuevo debe intentar usar modulos compartidos antes de pedir una API propia.
