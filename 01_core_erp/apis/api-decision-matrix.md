# Matriz de decision API

## Objetivo

Evitar APIs duplicadas y obligar a mapear cada necesidad contra una API
reutilizable antes de crear o modificar una API especializada.

## Matriz

| Necesidad | API correcta | Crear nueva API | Motivo |
|---|---|---|---|
| Usuarios, roles, permisos, sesiones | Auth | No | Identidad compartida. |
| Routing, proxy, frontera frontend | Gateway General | No | Entrada unica del ecosistema. |
| Productos, categorias, marcas | Catalog | No | Catalogo reutilizable. |
| Stock, almacenes, movimientos | Inventory | No | Inventario compartido. |
| Precios, descuentos, margenes | Pricing | No | Reglas comerciales compartidas. |
| Proveedores, contactos, productos proveedor | Supplier | No | Dominio proveedor. |
| Compras, recepciones, devoluciones proveedor | Procurement | No | Abastecimiento. |
| Ventas, cotizaciones, ordenes, pagos | Sales | No | Salida comercial. |
| Busqueda | Search | No | Busqueda transversal. |
| Documentos, archivos, OCR, artefactos | Document | No | Gestion documental reusable. |
| Notificaciones | Notification | No | Comunicacion reusable. |
| Visibilidad de modulos | FeatureVisibility | No | Control reusable de capacidades. |
| Importaciones y sync | ETL | No | Procesos de carga y transformacion. |
| Datos fiscales compartidos | Fiscal | No | Fiscalidad reusable. |
| Direcciones y regiones | Address | No | Catalogo geografico compartido. |
| Logica exclusiva Refapart | API especializada | Solo si aplica | Negocio especifico fuera de APIs compartidas. |
| Logica exclusiva LexNova | API especializada | Solo si aplica | Dominio legal especifico. |
| Logica exclusiva Fiscora | API especializada | Solo si aplica | Producto fiscal especifico fuera de Fiscal compartida. |
| Logica exclusiva Imagrafity | API especializada | Solo si aplica | Personalizacion especifica. |

## Regla de cierre

Si el caso puede resolverse con una API compartida, no se crea API nueva. Si
falta contrato real, usar `PENDIENTE_DE_DEFINIR`.
