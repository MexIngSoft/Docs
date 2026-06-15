# Mapa de responsabilidades API

| Dominio | Responsable | No debe absorber |
|---|---|---|
| Identidad | Auth | Logica comercial o datos de proyecto. |
| Entrada web | Gateway central | Persistencia y reglas permanentes de negocio. |
| Producto | API propia del proyecto | Tablas internas de otros proyectos. |
| Catalogo | Catalog | Stock, precio final o credenciales de proveedor. |
| Existencias | Inventory | Catalogo externo bruto. |
| Precios | Pricing | Compras o ventas. |
| Compras | Procurement | Venta al cliente. |
| Ventas/cotizacion Core | Sales | Sincronizacion externa. |
| Proveedores | Supplier | Producto web especifico. |
| ERP administrador | JobCron | Logica exclusiva de una web. |
| Integracion SYSCOM | Supplier como ejecutor; `04_integrations/syscom` como contrato | Convertirse en dominio interno. |
