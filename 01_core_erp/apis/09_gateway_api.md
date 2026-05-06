# Tecno Telec Gateway API

## Nombre

```text
tecnotelec-gateway-api
```

## Responsabilidad

Servir como API Gateway y BFF para el frontend web.

## Endpoints sugeridos

- `GET /health/`
- `GET /public/solutions`
- `GET /public/solutions/{slug}`
- `POST /quote/start`
- `POST /quote/evaluate`
- `POST /contact/lead`
- `POST /cart/items`
- `POST /checkout`
- `GET /account/projects`

## Implementacion inicial

Existe como proyecto Django:

```txt
Docker.API.PY/API.PY.DJANGO.TecnoTelec.Gateway
```

Puerto local Docker:

```txt
8008
```

Nginx expone el Gateway bajo:

```txt
/api/gateway/
```

## Regla

El gateway orquesta; no reemplaza las APIs internas.

## Regla de Pricing

El Gateway no debe calcular precios finales ni guardar reglas permanentes de margen, impuesto o descuento.

Para precios debe:

1. Identificar contexto de canal y comprador.
2. Solicitar producto a `catalog-api`.
3. Solicitar precio a `pricing-api`.
4. Adaptar la respuesta para el frontend.

La logica de precio vive en `pricing-api`. Reglas complejas pueden vivir en `rules-engine-api`.
