# Modulos compartidos JobCron

## Objetivo

Definir que modulos del ERP pueden reutilizar los proyectos del ecosistema.

| Modulo JobCron | Sirve para | Proyectos candidatos |
|---|---|---|
| Auth | Usuarios, roles, permisos. | Todos |
| Catalog | Productos, servicios, paquetes. | Tecno Telec, Nexora, Imagrafity, Buildora, REFAPART, Nutriva, Imagiland |
| Supplier | Proveedores externos. | Tecno Telec, Buildora, REFAPART, Sekura Tech |
| Pricing | Precios, margenes, impuestos. | Todos los comerciales |
| Inventory | Stock, almacenes, movimientos. | Tecno Telec, Stockara, Imagrafity, Buildora, REFAPART, Nutriva |
| Sales/Quote | Cotizaciones, ordenes, pagos. | Tecno Telec, Nexora, Imagrafity, Buildora, REFAPART, Festora, Lavanderia 3P, Nutriva |
| Projects | Soluciones consultivas. | Nexora, Tecno Telec, Sekura Tech, Innovation Engines Repair |
| Logistics | Envios, rutas, tracking. | Rutexa, Tecno Telec, Lavanderia 3P, Nutriva, REFAPART |
| Payments | Pagos, anticipos, financiamiento. | Pagora y todos los que vendan |
| Billing | Datos fiscales, facturas, notas y documentos fiscales. | Tecno Telec, Nexora, Imagrafity, Buildora, REFAPART, Nutriva |
| Cart | Carrito web e intencion de compra. | Tecno Telec, Imagrafity, Buildora, REFAPART, Nutriva |
| POS | Caja, tickets y venta fisica. | Tecno Telec, Imagrafity, Lavanderia 3P, Nutriva |
| Bundles/Kits | Paquetes, soluciones y componentes. | Tecno Telec, Nexora, Buildora, REFAPART, Imagrafity |
| GovernmentTender | Inteligencia y seguimiento de licitaciones. | Tecno Telec, Nexora, Sekura Tech, Innovation Engines Repair |
| ChannelAssortment | Surtido por proyecto/canal. | Tecno Telec, Phone Shop, Buildora, REFAPART |
| ProductCompatibility | Compatibilidad tecnica entre productos. | Buildora, Tecno Telec, REFAPART |
| Rules Engine | Decisiones configurables. | Todos |
| Reports/BI | Reportes y metricas. | Datara y todos |
| Notifications | Email, WhatsApp, SMS. | Todos |

## Regla

Un proyecto nuevo debe intentar usar modulos compartidos antes de justificar
una API especializada. No se crea una API por proyecto como patron general.
