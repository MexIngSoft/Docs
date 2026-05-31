# Editor de personalizacion Imagrafity

## Estado

ACTIVE

## Objetivo

Definir el editor de personalizacion de Imagrafity como una capacidad propia
del proyecto, conectada al ERP y preparada para evolucionar de editor 2D a
preview 3D y produccion.

## Decision tecnica

Imagrafity no debe construir un editor visual desde cero ni depender de un SaaS
cerrado como base principal.

La ruta tecnica aprobada es:

| Fase | Base recomendada | Uso |
|---|---|---|
| Editor 2D | Konva.js + React/Next.js | Canvas, texto, imagenes, capas, posicion y escala. |
| Preview 3D | Three.js | Vista giratoria de tazas, playeras, termos y objetos. |
| IA generativa | Proveedor por definir | Generacion de arte desde prompts. |
| Produccion | ERP Imagrafity + JobCron | Ordenes, archivos, trazabilidad y estados. |

## Regla principal

El producto debe verse antes que la herramienta. El usuario personaliza sobre un
producto real o mockup operativo, no sobre una imagen aislada.

```text
Producto -> Editor -> Preview sobre producto -> Aplicar -> Carrito -> Orden
```

## Alcance MVP

- Catalogo de productos personalizables desde ERP.
- Tres prompts editables por producto.
- Preview 2D placeholder sobre el mockup del producto.
- Guardado de prompts y previews en base de datos.
- Flujo visible en web para explicar editar, visualizar y aplicar.

## Fuera de alcance del MVP

- Motor IA real.
- Upload de archivos de cliente.
- Editor Konva completo.
- Render 3D con Three.js.
- Exportacion final para sublimacion/corte.
- Checkout real, pagos y facturacion.

## Regla de integracion ERP

El editor no decide datos comerciales. Debe leer:

- producto desde Catalog ERP;
- precio desde Pricing ERP;
- inventario desde Inventory ERP;
- reglas de personalizacion desde Imagrafity API;
- ordenes y produccion desde ERP/JobCron cuando existan.

## Estados obligatorios

| Estado | Uso |
|---|---|
| `prompt_editing` | El usuario o admin edita instrucciones. |
| `preview_ready` | Existe una vista previa sobre el producto. |
| `applied_to_product` | El diseno fue aplicado al producto. |
| `ready_for_cart` | El producto personalizado puede pasar al carrito. |
| `production_pending` | La orden espera produccion. |

## Pendientes

- Seleccionar proveedor IA.
- Definir storage para imagenes generadas.
- Definir medidas reales por zona imprimible.
- Crear editor Konva real.
- Crear preview 3D con Three.js.
- Definir exportacion productiva.
