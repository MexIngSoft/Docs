# Matriz Proyecto A APIs

## Regla Principal

Los proyectos consumen APIs existentes mediante Gateway General.

No deben crear APIs nuevas si una API compartida ya cubre la responsabilidad.

Una API especializada solo se permite cuando exista logica exclusiva del
dominio, datos propios, reglas propias, formularios propios o integraciones
exclusivas que no pertenezcan a una API compartida.

## JobCron

Consume Gateway General, Auth, FeatureVisibility, Catalog, Inventory, Pricing, Supplier, Procurement, Sales, Search, Document, Fiscal, ETL y APIs operativas propias de JobCron.

Responsabilidad: ERP administrador del ecosistema.

## RefaPart

Consume Gateway General, Auth, Search, Supplier, Catalog, Inventory, Pricing, Procurement, Sales, Address y API especializada solo si aplica.

Responsabilidad: busqueda, solicitud, cotizacion, venta y seguimiento basico de refacciones.

No debe tener Gateway propio.

## TecnoTelec

Consume Gateway General, Auth, Catalog, Inventory, Pricing, Supplier, Procurement, Sales y API especializada solo si aplica.

Responsabilidad: operacion comercial de productos TecnoTelec.

## LexNova

Consume Gateway General, Auth, Document, Search y API especializada solo si aplica.

Responsabilidad: operacion documental y legal.

## DocuCore

Consume Gateway General, Auth, Document, Search y API especializada solo si aplica.

Responsabilidad: gestion documental reutilizable.

## Fiscora

Consume Gateway General, Auth, Fiscal, Document y Search.

Responsabilidad: flujos fiscales y documentales.

## Imagrafity

Consume Gateway General, Auth, Catalog, Pricing, Search y API especializada solo si aplica.

Responsabilidad: catalogo y operacion comercial de servicios graficos.
