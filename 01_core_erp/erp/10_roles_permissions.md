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
- Auth separa identidad de datos comerciales: datos fiscales, razon social,
  direcciones, sucursales y preferencias de cliente pertenecen a Customer,
  Tenant, Organization o al dominio correspondiente.
- Las tablas propias de identidad, roles, permisos y acceso viven en el schema
  `"Auth"`.
- Las tablas que no pertenezcan a identidad/acceso no deben guardarse en
  `"Auth"`; se mantienen en `public` solo si son tecnicas compartidas o en el
  schema de su API propietaria.
- Las APIs de dominio validan permisos antes de ejecutar acciones sensibles.
- Los permisos deben ser auditables.
- Un rol puede variar por proyecto, pero los nombres base deben mantenerse.
- Los permisos se expresan como `Module + Action`, con `Code` estable para
  consumo desde Gateway y frontend.
- `UserPermissions` solo debe usarse para excepciones explicitas; la regla base
  debe venir de `RolePermissions`.
- La autorizacion debe poder resolverse por aplicacion mediante
  `ApplicationCode`, para que un usuario tenga roles distintos por sistema.

## Escritura recomendada de permisos

```text
<modulo>.<accion>
```

Ejemplos:

```text
pricing.view_internal_cost
pricing.approve_discount
quotes.create
quotes.convert_to_sale
inventory.adjust_stock
documents.view_fiscal
```

Los codigos deben ser estables, en minusculas y orientados a acciones. Evitar
permisos ambiguos como `admin`, `full_access` o `special` sin modulo.

## Modelo objetivo

```text
Application -> Module -> Permission -> Action
```

Ejemplo:

```text
TECNOTELEC
  catalog.product.view
  catalog.product.update
  pricing.view_internal_cost

LEXNOVA
  cases.case.view
  cases.case.assign
  cases.case.close
```

El frontend puede reflejar permisos para experiencia de usuario, pero la
validacion obligatoria vive en Gateway/API.

## Pendientes

```text
PENDIENTE_DE_DEFINIR:
- Matriz final de permisos por rol.
- Modelo multiempresa definitivo.
- Politica de delegacion y aprobaciones.
- Alcance final RBAC/ABAC por tenant, empresa, proyecto y aplicacion.
```
