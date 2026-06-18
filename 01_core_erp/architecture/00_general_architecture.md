# Arquitectura general

## Objetivo

Definir la arquitectura general del ERP modular y su uso por proyectos web, moviles o administrativos.

## Arquitectura objetivo

```text
Web/Mobile/Admin del proyecto
  -> API.PY.DJANGO.Gateway
  -> APIs compartidas
  -> API especializada solo si aplica
  -> PostgreSQL
```

## Patron por proyecto

Todo proyecto debe seguir el patron documentado en `07_project_api_pattern.md`.

```text
Frontend del proyecto
  -> Gateway central modular
  -> APIs compartidas reutilizables
  -> API especializada solo si aplica y solo cuando exista logica exclusiva del dominio
```

El frontend no debe consumir directamente APIs core.
No debe crearse una API por proyecto como patron general.

## APIs internas

- auth-api.
- catalog-api.
- supplier-api.
- pricing-api.
- quote-api.
- sales-api.
- logistics-api.
- rules-engine-api.
- projects-api.
- cart-api.
- pos-api.
- documents-api.
- notifications-api.
- government-tender-api.

## Base de datos

PostgreSQL debe usar schemas separados por dominio cuando aplique:

- Auth.
- Catalog.
- Supplier.
- Pricing.
- Inventory.
- Quote.
- Sales.
- Logistics.
- Rules.
- Projects.
- Cart.

## Repositorios de APIs

Las APIs Django se organizan por responsabilidad, no por cada proyecto web.

APIs compartidas obligatorias o reutilizables:

- `API.PY.DJANGO.Auth`.
- `API.PY.DJANGO.Gateway`.
- `API.PY.DJANGO.Catalog`.
- `API.PY.DJANGO.Inventory`.
- `API.PY.DJANGO.Pricing`.
- `API.PY.DJANGO.Supplier`.
- `API.PY.DJANGO.Procurement`.
- `API.PY.DJANGO.Sales`.
- `API.PY.DJANGO.Search`.
- `API.PY.DJANGO.Document`.
- `API.PY.DJANGO.Notification`.
- `API.PY.DJANGO.FeatureVisibility`.
- `API.PY.DJANGO.ETL`.

APIs especializadas:

Solo se crean cuando exista logica exclusiva del dominio, datos propios,
formularios propios, reglas propias o integraciones exclusivas que no
pertenezcan a una API compartida.

Ejemplos permitidos si aplican:

- `API.PY.DJANGO.Refapart`.
- `API.PY.DJANGO.LexNova`.
- `API.PY.DJANGO.Fiscora`.
- `API.PY.DJANGO.TecnoTelec`.

No se debe crear una API por proyecto como patron general.

Si una funcionalidad ya pertenece a una API compartida, no se crea una API
nueva.

Docker solo orquesta.
