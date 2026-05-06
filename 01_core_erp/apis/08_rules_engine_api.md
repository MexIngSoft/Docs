# Rules Engine API

## Responsabilidad

Evaluar reglas de negocio para precios, descuentos, stock, logistica, proyectos y aprobaciones.

## Endpoints propuestos

- `POST /rules/evaluate`
- `GET /rules`
- `POST /rules`
- `PATCH /rules/{id}`
- `DELETE /rules/{id}`

## Request evaluate

```json
{
  "context_type": "PROJECT_QUOTE",
  "tenant_id": "uuid",
  "items": [
    {
      "product_id": "uuid",
      "quantity": 4
    }
  ],
  "strategy": "BALANCED"
}
```

## Response evaluate

```json
{
  "approved": true,
  "requires_review": false,
  "applied_rules": ["STANDARD_MARGIN"]
}
```
