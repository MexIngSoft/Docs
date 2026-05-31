# Arquitectura Imagrafity

## Estado

ACTIVE

## Objetivo

Definir la arquitectura MVP de Imagrafity como plataforma de personalizacion
creativa con catalogo, editor, preview, cotizacion y orden de produccion.

## Frontera canonica

```text
WEB.NJ.NEXT.Imagrafity
-> API.PY.DJANGO.Imagrafity.Gateway
-> API.PY.DJANGO.Imagrafity
-> Core ERP / JobCron / integraciones futuras
```

## Componentes

| Capa | Ruta | Puerto | Responsabilidad |
|---|---|---:|---|
| Frontend | `Docker.WEB.NJ/WEB.NJ.NEXT.Imagrafity` | `3006` | Catalogo, editor visual, preview, cotizacion y seguimiento inicial. |
| Gateway | `Docker.API.PY/API.PY.DJANGO.Imagrafity.Gateway` | `8018` | Frontera BFF, proxy seguro, normalizacion de errores y consumo unico por frontend. |
| API | `Docker.API.PY/API.PY.DJANGO.Imagrafity` | `8019` | Dominio de personalizacion, productos, plantillas, disenos y ordenes. |

## Dependencias futuras

| Necesidad | Responsable futuro |
|---|---|
| Catalogo base compartido | Core Catalog |
| Pricing avanzado, margenes e impuestos | Core Pricing |
| Clientes, checkout y facturacion | Core Sales / Billing |
| Produccion operativa | Imagrafity + JobCron |
| Envios | Core Logistics |
| Archivos y arte subido por usuario | Document API / Storage |

## Decision MVP

Se implementa un catalogo inicial con fallback documentado para permitir que la
web funcione aun si el Gateway no esta levantado. El flujo productivo real queda
pendiente porque faltan proveedor de impresion, costos, margenes y politica de
derechos de autor.

## Fuera de alcance

- Pagos reales.
- Autenticacion y roles.
- Upload de archivos.
- Produccion fisica automatizada.
- Integracion con proveedores de impresion.
- Facturacion y envios.
