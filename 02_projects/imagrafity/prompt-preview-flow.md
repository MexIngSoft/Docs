# Flujo de prompts y preview Imagrafity

## Estado

ACTIVE

## Objetivo

Definir la regla obligatoria para prompts de personalizacion: ningun prompt
puede considerarse terminado sin una vista previa asociada al producto.

## Flujo obligatorio

```text
Seleccionar producto
-> Editar prompt
-> Guardar cambios
-> Visualizar resultado sobre el producto
-> Comparar versiones
-> Aplicar al producto
-> Agregar al carrito
```

## Prompts por producto

Cada producto debe tener minimo tres prompts configurables:

| Prompt | Tipo | Uso |
|---|---|---|
| Diseno base | `base_design` | Define el estilo inicial del diseno. |
| Variacion creativa | `creative_variation` | Genera alternativas visuales. |
| Ajuste final para produccion | `production_adjustment` | Prepara el resultado para impresion o sublimacion. |

## Modelo de datos

| Entidad | Tabla | Uso |
|---|---|---|
| `ProductPrompt` | `"Imagrafity"."ProductPrompts"` | Prompt editable por producto. |
| `PromptPreview` | `"Imagrafity"."PromptPreviews"` | Resultado visual generado desde un prompt. |

Campos principales de `ProductPrompt`:

- `product_id`
- `name`
- `prompt_type`
- `prompt_text`
- `negative_prompt`
- `is_active`
- `sort_order`

Campos principales de `PromptPreview`:

- `product_id`
- `prompt_id`
- `prompt_text`
- `negative_prompt`
- `result_payload`
- `preview_payload`
- `status`

## Contrato funcional

Un preview debe guardar:

- prompt utilizado;
- producto afectado;
- imagen o mockup del producto;
- zona editable;
- colores disponibles;
- resultado generado o placeholder;
- indicador de revision visual requerida.

## Reglas de UX

- Cada prompt tiene accion `Visualizar`.
- La vista previa se muestra sobre el mockup del producto.
- No debe enviarse a produccion sin preview.
- No debe agregarse al carrito sin aplicar un diseno al producto.
- El historial debe permitir comparar versiones.

## Admin

Los prompts deben editarse desde una zona administrativa futura:

```text
Admin -> Productos -> Editar producto -> Prompts
Admin -> IA -> Prompts por producto
```

Hasta que exista admin autenticado, los endpoints del MVP permiten crear y
listar prompts para desarrollo local.

## Pendientes

- Roles y permisos de admin.
- Historial completo de versiones.
- Moderacion de prompts.
- Motor IA real.
- Render final para produccion.
