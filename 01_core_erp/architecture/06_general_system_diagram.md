# Diagrama general del sistema ERP

## Vista logica

```text
Frontend / Canales
        |
Project Gateway / BFF
        |
        +-- Project Domain API
        |
        +-- Auth
        +-- Cart
        +-- POS
        +-- Projects
        +-- Rules Engine
        +-- Catalog
        +-- Supplier
        +-- Inventory
        +-- Pricing
        +-- Logistics
        +-- Procurement
        +-- Sales
        +-- Billing
        +-- Notifications
        +-- GovernmentTender
```

## Separacion conceptual

```text
Cart          = intencion de compra web
POS           = venta fisica rapida
Projects      = solucion consultiva
Pricing       = precios, margenes e impuestos
Rules Engine  = decisiones configurables
Sales         = cotizacion, venta, pago y estado comercial
Billing       = documentos fiscales
Logistics     = costo, tiempo y seguimiento de entrega
```

## Orden recomendado de construccion

Para venta en linea:

```text
Pricing
Cart
Sales
Logistics
Rules Engine basico
```

Para consultoria/proyectos:

```text
Projects
Pricing
Sales
Logistics
Rules Engine basico
```

Para operacion fisica:

```text
Inventory
Pricing
Sales
POS
Billing
```

## Regla

Cada proyecto debe tener su gateway/BFF cuando tenga web, mobile o admin propio. Si el proyecto tiene procesos o tablas propias, tambien debe tener una API de dominio del proyecto.

El nucleo ERP debe conservar responsabilidades de dominio separadas.
