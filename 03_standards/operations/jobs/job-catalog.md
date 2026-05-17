# Catalogo de jobs

## Objetivo

Registrar jobs, ETLs y procesos programados relevantes del ecosistema.

## Jobs conocidos

| Job | Proposito | Frecuencia recomendada | Dependencias | Estado |
|---|---|---|---|---|
| SYSCOM token sync | Renovar token de proveedor. | Cada 6 h | Supplier API, credenciales SYSCOM | Documentado |
| SYSCOM product sync | Descargar catalogo de productos. | Diario/incremental | Supplier API, Catalog API | Documentado |
| SYSCOM stock/price fast sync | Actualizar stock y precios. | 15 min / configurable | Supplier, Pricing, Inventory | Documentado |
| DocuCore processing job | Procesar archivo documental. | Por evento | Document API | MVP |

## Reglas

- Todo job debe tener estado, logs y politica de reintento.
- Los jobs que escriben datos deben ser idempotentes cuando sea posible.
- Los jobs pesados deben ejecutarse fuera del request HTTP.
