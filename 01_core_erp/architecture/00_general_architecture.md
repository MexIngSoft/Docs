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

## Repositorios

Cada API Django debe vivir como repositorio independiente con nomenclatura:

```text
API.PY.DJANGO.NombreProyecto
```

Docker solo orquesta.
