# Matriz Proyecto A APIs

## Regla principal

Los proyectos consumen APIs existentes mediante Gateway General.

No deben crear APIs nuevas si una API compartida ya cubre la responsabilidad.

Una API especializada solo se permite cuando exista logica exclusiva del
dominio, datos propios, reglas propias, formularios propios o integraciones
exclusivas que no pertenezcan a una API compartida.

## JobCron

Consume:

- Gateway General
- Auth
- FeatureVisibility
- Catalog
- Inventory
- Pricing
- Supplier
- Procurement
- Sales
- Search
- Document
- Fiscal
- ETL
- APIs operativas propias de JobCron solo si aplica

Responsabilidad:

ERP administrador del ecosistema.

## Refapart

Consume:

- Gateway General
- Auth
- Search
- Supplier
- Catalog
- Inventory
- Pricing
- Procurement
- Sales
- Address
- API especializada Refapart solo si aplica

Responsabilidad:

Busqueda, solicitud, cotizacion, venta y seguimiento basico de refacciones.

Refapart no debe tener Gateway propio.

## TecnoTelec

Consume:

- Gateway General
- Auth
- Catalog
- Inventory
- Pricing
- Supplier
- Procurement
- Sales
- API especializada TecnoTelec solo si aplica

Responsabilidad:

Operacion comercial de productos TecnoTelec.

TecnoTelec no debe tener Gateway propio.

## LexNova

Consume:

- Gateway General
- Auth
- Document
- Search
- API especializada LexNova solo si aplica

Responsabilidad:

Operacion documental y legal.

## DocuCore

Consume:

- Gateway General
- Auth
- Document
- Search
- API especializada DocuCore solo si aplica

Responsabilidad:

Gestion documental reutilizable.

## Fiscora

Consume:

- Gateway General
- Auth
- Fiscal
- Document
- Search
- API especializada Fiscora solo si aplica

Responsabilidad:

Flujos fiscales y documentales.

## Imagrafity

Consume:

- Gateway General
- Auth
- Catalog
- Pricing
- Search
- API especializada Imagrafity solo si aplica

Responsabilidad:

Catalogo y operacion comercial de servicios graficos.
