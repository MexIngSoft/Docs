# Diccionario global

| Termino oficial | No usar | Definicion | Modulo |
|---|---|---|---|
| Product | Producto proveedor como final | Producto interno vendible normalizado. | catalog |
| SupplierProduct | Product interno | Producto tal como llega desde proveedor externo. | supplier |
| Quote | Presupuesto informal | Documento previo a venta con productos, precios, reglas y condiciones. | quote/sales |
| QuoteItem | Linea temporal | Partida de una cotizacion con snapshot de precio. | quote/sales |
| Order | Quote | Pedido confirmado despues de aceptar cotizacion o compra. | sales |
| OrderItem | QuoteItem | Partida de una orden confirmada. | sales |
| Customer | Usuario tecnico | Cliente comercial o prospecto. | sales/auth |
| Supplier | Provider tecnico | Empresa o fuente comercial proveedora. | supplier |
| Provider | Supplier generico | Conector tecnico a fuente externa. | supplier |
| Price | Cost | Precio comercial calculado. | pricing |
| Cost | Price | Costo base o costo real. | pricing/supplier |
| Stock | SupplierStock | Inventario propio controlado por Inventory. | inventory |
| SupplierStock | Stock propio | Disponibilidad reportada por proveedor. | supplier |
| Rule | If disperso | Regla configurable de negocio. | rules-engine |
| Solution | Product bundle informal | Solucion comercial/tecnica vendible por necesidad. | projects/catalog |
| Project | Quote | Diseno consultivo de solucion para cliente. | projects |
| Cart | Order | Intencion de compra web antes de venta formal. | cart |
| POS | Sales | Punto de venta fisico, caja, tickets y cortes. | pos |
| Checkout | Payment | Flujo de confirmacion de datos, precio, envio y pago. | frontend/sales |
| Shipment | Delivery text | Envio formal con carrier, tracking y estado. | logistics |
| Billing | Sales | Datos fiscales, facturas, notas y documentos fiscales. | billing |
| Notification | Log | Mensaje enviado por evento de negocio. | notifications |
| Bundle | Producto suelto | Conjunto vendible de componentes, servicios o materiales. | catalog/projects |
| Kit | Bundle generico | Conjunto tecnico requerido para instalar o entregar una solucion. | catalog/projects |
| GovernmentTender | Sales | Oportunidad de licitacion publica o privada. | government-tender |
| ChannelAssortment | Catalog completo | Regla que decide si un producto se muestra, cotiza, vende, oculta o bloquea por proyecto/canal. | catalog/projects |
| ProductCompatibility | Texto de ficha tecnica | Relacion tecnica estructurada entre productos o categorias. | catalog/rules-engine |
| Buildora | Escoge tu PC como proyecto separado | Proyecto formal para configurador y venta de PCs/equipos a medida. | project |
| Phone Shop | Tecno Telec telefonos | Canal/proyecto especializado en telefonia y accesorios. | project |
