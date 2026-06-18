# Tecno Telec API

## Nombre

```text
tecnotelec-api
```

## Responsabilidad

Guardar procesos, formularios, configuracion y datos exclusivos del proyecto Tecno Telec.

## Implementacion inicial

Existe como proyecto Django:

```txt
Docker.API.PY/API.PY.DJANGO.TecnoTelec
```

Puerto local Docker:

```txt
8009
```

## Endpoints iniciales

- `GET /health/`
- `GET /api/solutions/`
- `GET /api/solutions/{slug}/`
- `POST /api/leads/`
- `GET /api/project-cases/`

## Regla

El frontend no debe consumir esta API directamente. El frontend debe pasar por
`API.PY.DJANGO.Gateway`.

## Limites

Esta API no calcula precios generales, no reemplaza Catalog/Pricing/Sales y no guarda usuarios globales.
