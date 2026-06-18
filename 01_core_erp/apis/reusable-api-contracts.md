# Contratos reutilizables de APIs

## Objetivo

Consolidar las APIs reutilizables y sus fronteras para evitar duplicar
responsabilidades en APIs especializadas.

## Regla principal

Toda necesidad funcional debe mapearse primero a una API reutilizable. Una API
especializada solo existe si la responsabilidad no encaja en una API compartida
vigente.

## APIs compartidas

| API | Responsabilidad | Contrato esperado |
|---|---|---|
| Auth | Identidad, usuarios, roles, permisos, sesiones y tokens | PENDIENTE_DE_DEFINIR |
| Gateway General | Entrada central, sesion, routing, permisos de frontera y errores | PENDIENTE_DE_DEFINIR |
| Catalog | Productos, categorias, marcas, imagenes, variantes y estado de producto | PENDIENTE_DE_DEFINIR |
| Inventory | Almacenes, ubicaciones, stock, movimientos, lotes, series y ajustes | PENDIENTE_DE_DEFINIR |
| Pricing | Listas, precios, descuentos, impuestos, margenes y promociones | PENDIENTE_DE_DEFINIR |
| Supplier | Proveedores, contactos, direcciones, productos de proveedor y contratos | PENDIENTE_DE_DEFINIR |
| Procurement | Ordenes de compra, recepciones, facturas de compra y devoluciones | PENDIENTE_DE_DEFINIR |
| Sales | Clientes, cotizaciones, ordenes de venta, facturas, pagos y devoluciones | PENDIENTE_DE_DEFINIR |
| Search | Indices y busqueda transversal | PENDIENTE_DE_DEFINIR |
| Document | Archivos, evidencias, procesamiento documental y artefactos | PENDIENTE_DE_DEFINIR |
| Fiscal | Datos y procesos fiscales compartidos | PENDIENTE_DE_DEFINIR |
| Address | Direcciones y catalogo geografico | PENDIENTE_DE_DEFINIR |
| Notification | Notificaciones y plantillas | PENDIENTE_DE_DEFINIR |
| FeatureVisibility | Visibilidad de modulos, features y capacidades | PENDIENTE_DE_DEFINIR |
| ETL | Jobs de carga, transformacion y sincronizacion | PENDIENTE_DE_DEFINIR |

## API especializada

Se permite solo cuando hay:

- logica exclusiva del dominio;
- datos propios que no pertenecen a una API compartida;
- reglas propias;
- formularios propios;
- integraciones exclusivas;
- estados internos que no deben reutilizarse globalmente.

## Gateway/BFF

No se crea Gateway/BFF por proyecto. El Gateway General:

- recibe solicitudes de frontend;
- valida sesion y permisos;
- enruta a APIs compartidas y especializadas cuando apliquen;
- normaliza errores;
- oculta contratos internos.

## Reglas de comunicacion

```text
Frontend
-> API.PY.DJANGO.Gateway
-> APIs compartidas
-> API especializada solo si aplica
-> PostgreSQL
```

No permitido:

- Frontend directo a API compartida.
- Frontend directo a base de datos.
- Proyecto A directo a base de datos de Proyecto B.
- API especializada duplicando Auth, Catalog, Inventory, Pricing, Supplier,
  Procurement, Sales, Search, Document, Fiscal, Address, Notification,
  FeatureVisibility o ETL.

## Validacion antes de implementar

1. Revisar `01_core_erp/apis/00_api_index.md`.
2. Revisar `00_audit/reusable-api-map.md`.
3. Revisar `03_standards/architecture/api-gateway-standard.md`.
4. Documentar endpoints reales o usar `PENDIENTE_DE_DEFINIR`.
