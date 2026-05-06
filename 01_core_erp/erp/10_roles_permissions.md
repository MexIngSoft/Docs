# Roles y permisos

## Objetivo

Separar identidad, permisos y autorizaciones para operar el ERP con control por empresa, proyecto y modulo.

## Roles base

```text
ADMIN
MANAGER
SALES_REP
CASHIER
TECHNICIAN
WAREHOUSE_OPERATOR
PURCHASING_AGENT
ACCOUNTING
CUSTOMER
AUDITOR
```

## Permisos criticos

- Ver costos reales.
- Ver precios especiales.
- Crear cotizaciones.
- Autorizar descuentos.
- Convertir cotizacion a venta.
- Cancelar venta.
- Ejecutar devolucion.
- Ajustar inventario.
- Abrir y cerrar caja.
- Ver documentos fiscales.
- Participar en analisis de licitaciones.

## Reglas

- `Auth API` administra usuarios, roles, sesiones y permisos.
- Las APIs de dominio validan permisos antes de ejecutar acciones sensibles.
- Los permisos deben ser auditables.
- Un rol puede variar por proyecto, pero los nombres base deben mantenerse.

## Pendientes

```text
PENDIENTE_DE_DEFINIR:
- Matriz final de permisos por rol.
- Modelo multiempresa definitivo.
- Politica de delegacion y aprobaciones.
```

