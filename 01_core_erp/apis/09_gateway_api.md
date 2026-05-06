# Tecno Telec Gateway API

## Nombre

```text
tecnotelec-gateway-api
```

## Responsabilidad

Servir como API Gateway y BFF para el frontend web.

## Endpoints sugeridos

- `GET /public/solutions`
- `GET /public/solutions/{slug}`
- `POST /quote/start`
- `POST /quote/evaluate`
- `POST /cart/items`
- `POST /checkout`
- `GET /account/projects`

## Regla

El gateway orquesta; no reemplaza las APIs internas.
