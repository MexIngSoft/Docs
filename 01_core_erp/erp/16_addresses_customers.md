# Clientes y direcciones

## Objetivo

Estandarizar los datos minimos de cliente y direccion para ventas, envios, proyectos y facturacion.

## Cliente

```text
Customer
- Id
- Type
- Name
- Email
- Phone
- TaxProfileId NULL
- CreatedAt
```

## Direccion

```text
CustomerAddress
- Id
- CustomerId
- AddressType
- Street
- ExteriorNumber
- InteriorNumber NULL
- Neighborhood
- City
- State
- PostalCode
- Country
- References NULL
- Latitude NULL
- Longitude NULL
- IsDefault
```

## Tipos de direccion

```text
SHIPPING
BILLING
INSTALLATION
WAREHOUSE
BRANCH
```

## Reglas

- `Logistics` requiere direccion de entrega o instalacion.
- `Billing` requiere perfil fiscal cuando se facture.
- `Projects` puede requerir direccion de instalacion distinta a entrega.

