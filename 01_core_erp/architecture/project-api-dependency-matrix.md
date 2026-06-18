# Matriz Proyecto A APIs

## Regla Principal

Los proyectos consumen APIs existentes mediante Gateway General.

No deben crear APIs nuevas si una API compartida ya cubre la responsabilidad.

## JobCron

Consume Gateway General, Auth, FeatureVisibility, Catalog, Inventory, Pricing, Supplier, Procurement, Sales, Search, Document, Fiscal, ETL y APIs operativas propias de JobCron.

Responsabilidad: ERP administrador del ecosistema.

## RefaPart

Consume Gateway General, Auth, Search, Supplier, Catalog, Inventory, Pricing, Procurement, Sales, Address y su API de dominio RefaPart.

Responsabilidad: busqueda, solicitud, cotizacion, venta y seguimiento basico de refacciones.

No debe tener Gateway propio.

## TecnoTelec

Consume Gateway General, Auth, Catalog, Inventory, Pricing, Supplier, Procurement, Sales y su API de dominio TecnoTelec.

Responsabilidad: operacion comercial de productos TecnoTelec.

## LexNova

Consume Gateway General, Auth, Document, Search y APIs legales de dominio.

Responsabilidad: operacion documental y legal.

## DocuCore

Consume Gateway General, Auth, Document, Search y APIs documentales.

Responsabilidad: gestion documental reutilizable.

## Fiscora

Consume Gateway General, Auth, Fiscal, Document y Search.

Responsabilidad: flujos fiscales y documentales.

## Imagrafity

Consume Gateway General, Auth, Catalog, Pricing, Search y su API de dominio.

Responsabilidad: catalogo y operacion comercial de servicios graficos.
