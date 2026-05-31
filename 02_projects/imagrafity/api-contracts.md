# Contratos API Imagrafity

## Estado

ACTIVE

## Base URLs locales

```text
Gateway: http://localhost:8018/api/imagrafity
API:     http://localhost:8019/api/imagrafity
```

El frontend debe consumir solo el Gateway.

## Endpoints Gateway

| Metodo | Ruta | Uso |
|---|---|---|
| GET | `/health/` | Salud del Gateway. |
| GET | `/categories/` | Categorias de productos personalizables. |
| GET | `/products/` | Productos personalizables. |
| GET | `/products/<uuid:id>/` | Detalle de producto. |
| GET | `/products/<uuid:id>/prompts/` | Prompts activos del producto. |
| POST | `/products/<uuid:id>/prompts/` | Crear prompt editable para el producto. |
| POST | `/products/<uuid:id>/prompt-previews/` | Crear preview del prompt sobre producto. |
| GET | `/templates/` | Plantillas creativas. |
| GET | `/designs/` | Disenos guardados. |
| POST | `/designs/` | Crear diseno. |
| GET | `/orders/` | Ordenes de produccion. |
| POST | `/orders/` | Crear orden de produccion. |

## Producto personalizable

```json
{
  "sku": "IMG-TSHIRT-AURORA",
  "name": "Playera Aurora Neon",
  "category_slug": "ropa-moda",
  "category_name": "Ropa y moda",
  "description": "Playera negra personalizable con arte frontal.",
  "base_price": "249.00",
  "print_price": "99.00",
  "public_price": "348.00",
  "production_days": 3,
  "supported_print_areas": ["frente", "espalda"],
  "available_colors": ["Negro", "Blanco"],
  "preview_layers": { "shape": "shirt", "primaryArea": "frente" },
  "image_url": "/products/playera-aurora-neon.png",
  "gallery_images": ["/products/playera-aurora-neon.png"],
  "tags": ["mas vendido", "regalo", "editor online"],
  "badges": ["Mas vendido", "Personalizable"],
  "customization_mode": "self_service",
  "stock_available": 42,
  "commercial_availability": "Disponible en oficina",
  "erp_sources": {
    "catalog": "ERP Catalog",
    "pricing": "ERP Pricing",
    "inventory": "ERP Inventory"
  },
  "prompts": [
    {
      "name": "Diseno base",
      "prompt_type": "base_design",
      "prompt_text": "Crear un diseno moderno para Playera Aurora Neon...",
      "negative_prompt": "Evitar texto ilegible y baja resolucion.",
      "is_active": true,
      "sort_order": 10
    }
  ]
}
```

`public_price`, `stock_available` y `commercial_availability` deben provenir
de los modulos ERP de Pricing e Inventory. `base_price` y `print_price`
permanecen como referencia del producto personalizable, pero no deben usarse
como fuente principal de precio comercial si existe precio ERP.

## Crear prompt de producto

```http
POST /api/imagrafity/products/<uuid:id>/prompts/
```

```json
{
  "name": "Diseno base",
  "prompt_type": "base_design",
  "prompt_text": "Crear diseno urbano neon para una taza blanca.",
  "negative_prompt": "Evitar marcas registradas y baja resolucion.",
  "is_active": true,
  "sort_order": 10
}
```

## Crear preview de prompt

```http
POST /api/imagrafity/products/<uuid:id>/prompt-previews/
```

```json
{
  "prompt": "uuid-opcional",
  "prompt_text": "Crear una taza negra con dragon azul neon.",
  "negative_prompt": "Evitar texto ilegible."
}
```

Respuesta MVP:

```json
{
  "status": "preview_ready",
  "result_payload": {
    "engine": "placeholder-preview",
    "message": "Preview generated over product mockup. AI rendering is pending provider integration."
  },
  "preview_payload": {
    "product_image_url": "/products/taza-cosmos-11oz.png",
    "overlay_label": "Diseno aplicado",
    "primary_area": "envolvente",
    "requires_visual_review": true
  }
}
```

La respuesta actual no genera arte IA real. Deja persistido el preview
placeholder y la regla de revision visual para que el flujo no salte directo a
produccion.

## Crear diseno

```http
POST /api/imagrafity/designs/
```

```json
{
  "product": "uuid",
  "template": "uuid",
  "customer_email": "cliente@example.com",
  "name": "Mi diseno",
  "design_payload": {
    "headline": "Tu idea aqui",
    "colors": ["#00E5FF", "#FF007C"]
  },
  "preview_payload": {
    "shape": "shirt"
  }
}
```

## Crear orden

```http
POST /api/imagrafity/orders/
```

```json
{
  "design": "uuid",
  "quantity": 1,
  "notes": "Validar color antes de imprimir"
}
```

La API calcula `unit_price`, `total_price` y asigna estado
`production_pending`. Si el producto tiene precio ERP vigente, `unit_price`
se toma desde Pricing; si no existe, usa el fallback `base_price + print_price`.

## Errores normalizados

```json
{
  "error": {
    "code": "IMAGRAFITY_API_UNAVAILABLE",
    "message": "detalle tecnico controlado"
  }
}
```

## Pendientes

- Versionado formal del contrato.
- Autenticacion y permisos por rol.
- Contrato de upload y validacion de imagenes.
- Integracion completa con Sales, Billing y Logistics.
- Versionado y reglas avanzadas de listas de precio ERP.
- Integracion con proveedor IA para previews reales.
- Permisos de administracion para editar prompts.
