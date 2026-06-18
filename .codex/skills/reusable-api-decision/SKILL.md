---
title: Reusable API Decision Skill
domain: Codex
status: ACTIVE
priority: P1
owner: Equipo documental
name: reusable-api-decision
description: Decide si una necesidad debe usar una API compartida existente o justificar una API especializada.
---

# Reusable API Decision Skill

## Leer primero

- `Docs/01_core_erp/apis/reusable-api-contracts.md`
- `Docs/00_audit/reusable-api-map.md`
- `Docs/01_core_erp/architecture/project-api-dependency-matrix.md`
- `Docs/03_standards/architecture/api-gateway-standard.md`

## Regla

No crear API nueva si una API compartida cubre la responsabilidad.

## Mapeo

| Necesidad | API reutilizable |
|---|---|
| Identidad, usuarios, roles, permisos, sesiones | Auth |
| Routing, frontera, sesion, permisos de entrada | Gateway General |
| Productos, marcas, categorias, variantes | Catalog |
| Stock, almacenes, movimientos | Inventory |
| Precios, descuentos, impuestos, margenes | Pricing |
| Proveedores y contratos | Supplier |
| Compras y recepciones | Procurement |
| Clientes, cotizaciones, ventas, pagos | Sales |
| Busqueda transversal | Search |
| Archivos, evidencias, artefactos | Document |
| Notificaciones y plantillas | Notification |
| Visibilidad de modulos y capacidades | FeatureVisibility |
| Sync, importacion, exportacion | ETL |
| Datos y procesos fiscales | Fiscal |
| Direcciones y catalogo geografico | Address |

## API especializada

Solo se justifica si la responsabilidad no encaja en ninguna API compartida
vigente y existe logica exclusiva de dominio, datos propios, permisos propios,
formularios propios o integracion exclusiva.

## Salida obligatoria

- API reutilizable elegida.
- Motivo.
- API especializada requerida o no.
- Documentos leidos.
- Validaciones.
- Faltantes con `PENDIENTE_DE_DEFINIR`.
