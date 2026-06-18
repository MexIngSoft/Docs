# REFAPART MVP Gap Report

## Estado

PARTIAL

## Context Pack

`CP-07 - Proyecto completo`

## Componentes documentales verificados

| Documento | Estado |
|---|---|
| `README.md` | EXISTE |
| `architecture.md` | EXISTE |
| `api-contracts.md` | EXISTE |
| `database.md` | EXISTE |
| `frontend.md` | EXISTE |
| `visual-identity.md` | EXISTE |
| `local-runbook.md` | EXISTE |
| `repositories.md` | EXISTE |

## Componentes tecnicos verificados

| Componente | Ruta | Estado |
|---|---|---|
| Web REFAPART | `Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart` | EXISTE |
| Gateway central | `Docker.API.PY/API.PY.DJANGO.Gateway` | EXISTE |
| API REFAPART canonica | `Docker.API.PY/API.PY.DJANGO.RefaPart` | EXISTE |
| API REFAPART variante documentada | `Docker.API.PY/API.PY.DJANGO.Refapart` | EXISTE |
| Auth | `Docker.API.PY/API.PY.DJANGO.Auth` | EXISTE |
| Address | `Docker.API.PY/API.PY.DJANGO.Address` | EXISTE |

## Brechas reales

| Area | Brecha | Estado |
|---|---|---|
| Permisos | Matriz completa mas alla de `CUSTOMER`. | PENDIENTE |
| Pagos | Pasarela productiva, estados y conciliacion. | PENDIENTE_DE_DEFINIR |
| Garantias/devoluciones | Politica publicable y reglas internas. | PENDIENTE_DE_DEFINIR |
| Proveedores | Autorizacion, bloqueo, contacto y auditoria operativa. | PENDIENTE |
| Logistica | Seguimiento productivo profundo e incidencias. | PENDIENTE |
| Eventos JobCron | Eventos salientes y entrantes productivos. | PENDIENTE |
| Datos reales | Dataset de piezas, proveedores, precios, fotos y compatibilidades. | PENDIENTE_DE_DEFINIR |
| Admin | Panel operativo completo de solicitudes, proveedores, cotizaciones, pedidos y logistica. | PENDIENTE |
| Auditoria | Cambios de proveedores, precios, cotizadores y pedidos. | PENDIENTE |
| Notificaciones | WhatsApp/email productivos al cliente. | PENDIENTE_DE_DEFINIR |

## Riesgos

- Marcar pantallas como funcionales sin ruta Gateway registrada.
- Exponer costos, margenes o telefono real del proveedor al cliente.
- Duplicar busqueda, pricing, logistica o Auth fuera de la API responsable.

## Evidencia focalizada de codigo

| Area | Evidencia | Resultado |
|---|---|---|
| Web cliente | Rutas `mis-solicitudes`, `mis-cotizaciones`, `mis-pedidos`, `checkout` y `carrito`. | EXISTE_EN_CODIGO |
| Web admin | Rutas `admin/refapart`, solicitudes, proveedores, productos, busquedas, demanda, cotizaciones, pedidos, logistica y auditoria. | EXISTE_EN_CODIGO |
| API modelos | `Product`, `SearchQuery`, `PartRequest`, `Supplier`, `SupplierOffer`, `Quote`, `Order`, `SupplierMessage`, `LogisticsTask`, `AuditLog`. | EXISTE_EN_CODIGO |
| API endpoints | Productos, busqueda, solicitudes, checkout, admin solicitudes, proveedores, productos, search logs, quotes, orders, logistics, audit y dashboard. | EXISTE_EN_CODIGO |

La evidencia anterior confirma existencia de codigo, no reemplaza pruebas
runtime ni validacion Docker.

## Validacion pendiente

- PENDIENTE_DE_DEFINIR: validacion Docker completa con engine disponible.
- PENDIENTE_DE_DEFINIR: pruebas runtime de Web, Gateway, Auth, Address y API REFAPART.
