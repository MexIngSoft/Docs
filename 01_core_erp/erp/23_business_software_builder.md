# Business Software Builder

## Objetivo

Documentar la vision del ERP como plataforma modular capaz de recomendar y
armar software segun el giro de negocio, sin convertir cada cliente en un
desarrollo aislado desde cero.

El flujo conceptual es:

```text
Cliente / negocio
-> diagnostico de necesidades
-> seleccion de modulos
-> configuracion de reglas
-> activacion de features
-> despliegue de web, app o panel
```

## Capas

| Capa | Responsabilidad |
|---|---|
| ERP Core | Auth, clientes, productos, inventario, ventas, compras, pagos, facturacion, documentos, reportes y jobs. |
| Modulos por giro | Rutas, expedientes, citas, entregas, almacenes, produccion, servicios, licitaciones u otros dominios especificos. |
| Configurador inteligente | Diagnostica necesidades, recomienda modulos y prepara configuracion inicial. |
| FeatureAvailability | Controla que queda visible, interno, beta, pendiente o deshabilitado. |

## Diagnostico inicial

El configurador debe poder preguntar:

```text
Que vendes?
Tienes inventario?
Entregas a domicilio?
Manejas rutas?
Das credito?
Manejas proveedores?
Necesitas facturar?
Tienes vendedores?
Necesitas app movil?
Quieres tienda en linea?
```

Con esas respuestas se genera una recomendacion:

```json
{
  "business_type": "venta_distribucion_huevo",
  "recommended_modules": [
    "customers",
    "products",
    "inventory",
    "sales",
    "routes",
    "payments",
    "suppliers",
    "reports"
  ]
}
```

## Regla de implementacion

No se debe crear una API nueva por cada negocio si el caso puede resolverse con
modulos core configurables. Solo se crea modulo propio cuando existan reglas,
datos o procesos que no pertenezcan al nucleo reutilizable.

## Pendientes

- Definir catalogo inicial de giros de negocio.
- Definir matriz modulo-necesidad.
- Definir donde vive el diagnostico: JobCron, Core ERP o modulo dedicado.
- Definir si el configurador genera tareas, semillas, permisos o plantillas de
  despliegue.
